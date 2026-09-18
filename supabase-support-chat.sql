-- Customer support: authenticated customers and authorized online staff only.
begin;
create table if not exists public.support_messages (
  id bigint generated always as identity primary key,
  customer_id uuid not null references auth.users(id) on delete cascade,
  sender_id uuid not null references auth.users(id),
  from_staff boolean not null default false,
  body text not null check (char_length(body) between 1 and 2000),
  created_at timestamptz not null default now(),
  read_at timestamptz,
  request_id uuid not null unique
);
create index if not exists support_messages_customer_id_idx on public.support_messages(customer_id,id desc);
create or replace function public.support_is_staff() returns boolean
language sql stable security definer set search_path = public
as $$ select exists(select 1 from public.profiles p where p.id=auth.uid()
  and (p.is_admin is true or p.admin_role='online_manager')) $$;
alter table public.support_messages enable row level security;
revoke all on public.support_messages from anon, authenticated;
grant select on public.support_messages to authenticated;
drop policy if exists support_read on public.support_messages;
create policy support_read on public.support_messages for select to authenticated
using(customer_id=auth.uid() or public.support_is_staff());
create or replace function public.support_send(p_customer uuid, p_body text, p_request uuid)
returns bigint language plpgsql security definer set search_path = public as $$
declare staff boolean := public.support_is_staff(); result bigint;
begin
  if auth.uid() is null then raise exception 'Sign in required'; end if;
  if p_customer is null or (p_customer<>auth.uid() and not staff) then raise exception 'Access denied'; end if;
  if char_length(trim(p_body)) not between 1 and 2000 then raise exception 'Invalid message'; end if;
  perform pg_advisory_xact_lock(hashtextextended(auth.uid()::text,0));
  if (select count(*) from public.support_messages where sender_id=auth.uid() and created_at>now()-interval '1 minute') >= 20 then
    raise exception 'Too many messages. Please wait a minute.';
  end if;
  insert into public.support_messages(customer_id,sender_id,from_staff,body,request_id)
    values(p_customer,auth.uid(),staff,trim(p_body),p_request)
    on conflict(request_id) do nothing returning id into result;
  return result;
end $$;
create or replace function public.support_mark_read(p_customer uuid) returns void
language plpgsql security definer set search_path=public as $$
declare staff boolean := public.support_is_staff();
begin
  if auth.uid() is null or (p_customer<>auth.uid() and not staff) then raise exception 'Access denied'; end if;
  update public.support_messages set read_at=now() where customer_id=p_customer and read_at is null and from_staff<>staff;
end $$;
create or replace function public.support_inbox()
returns table(customer_id uuid, customer_name text, last_body text, last_at timestamptz, unread bigint)
language sql stable security definer set search_path=public as $$
  select m.customer_id, coalesce(nullif(p.full_name,''),p.email,'Customer'),m.body,m.created_at,
    (select count(*) from public.support_messages u where u.customer_id=m.customer_id and not u.from_staff and u.read_at is null)
  from (select distinct on(customer_id) * from public.support_messages order by customer_id,id desc) m
  left join public.profiles p on p.id=m.customer_id
  where public.support_is_staff() order by m.created_at desc limit 100
$$;
revoke all on function public.support_is_staff(),public.support_send(uuid,text,uuid),public.support_mark_read(uuid),public.support_inbox() from public,anon;
grant execute on function public.support_is_staff(),public.support_send(uuid,text,uuid),public.support_mark_read(uuid),public.support_inbox() to authenticated;
commit;
