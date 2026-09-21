begin;
create or replace function public.admin_customer_accounts(p_offset integer default 0)
returns table(id uuid,email text,full_name text,points bigint,total_spent numeric,
  created_at timestamptz,updated_at timestamptz,is_admin boolean,last_sign_in_at timestamptz)
language plpgsql security definer set search_path=public as $$
declare online_only boolean;
begin
  select p.admin_role='online_manager' into online_only from public.profiles p
  where p.id=auth.uid() and (p.is_admin or p.admin_role in ('full_admin','online_manager'));
  if not found then raise exception 'Administrator access required' using errcode='42501'; end if;
  return query
  select u.id,coalesce(nullif(p.email,''),u.email,''),
    coalesce(nullif(p.full_name,''),u.raw_user_meta_data->>'full_name',u.raw_user_meta_data->>'name',''),
    case when online_only then coalesce(s.points,0) else coalesce(p.points,0)::bigint end,
    case when online_only then coalesce(s.spent,0) else coalesce(p.total_spent,0) end,
    u.created_at,p.updated_at,coalesce(p.is_admin,false),u.last_sign_in_at
  from auth.users u left join public.profiles p on p.id=u.id
  left join lateral (
    select sum(o.total) spent,sum(o.points_awarded)::bigint points from public.orders o
    where online_only and o.user_id=u.id and o.order_source='online'
      and o.status='confirmed' and o.payment_status<>'refunded' and o.deleted_at is null
  ) s on true
  where not coalesce(u.is_anonymous,false)
  order by u.created_at desc,u.id
  limit 500 offset greatest(coalesce(p_offset,0),0);
end $$;
revoke all on function public.admin_customer_accounts(integer) from public,anon;
grant execute on function public.admin_customer_accounts(integer) to authenticated;
commit;
