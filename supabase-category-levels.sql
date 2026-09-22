begin;
alter table public.online_category_settings add column if not exists parent_key text;
-- Preserve existing main categories; remove only additional memberships.
update public.products set category=split_part(category,'||',1),updated_at=now()
where sales_channel='online' and category like '%||%';
create or replace function public.create_online_subcategory(p_key text,p_parent text,p_zh text,p_en text)
returns void language plpgsql security definer set search_path=public as $$
begin
  if not exists(select 1 from profiles where id=auth.uid() and (is_admin or admin_role in ('full_admin','online_manager'))) then
    raise exception 'Administrator access required';
  end if;
  perform pg_advisory_xact_lock(hashtext('gogoshop-online-categories'));
  if p_parent is not null then
    if not exists(select 1 from online_category_settings where key=p_parent and not deleted and parent_key is null) then
      raise exception 'Select an active primary category';
    end if;
  end if;
  perform public.save_online_category_names(p_key,p_zh,p_en,true);
  update online_category_settings set parent_key=p_parent where key=p_key;
end $$;
revoke all on function public.create_online_subcategory(text,text,text,text) from public,anon;
grant execute on function public.create_online_subcategory(text,text,text,text) to authenticated;
insert into public.online_category_settings(key,deleted)
select distinct split_part(category,'||',1),false from public.products
where sales_channel='online' and category<>'' and category !~ '^online[-_ ]'
on conflict do nothing;
commit;
