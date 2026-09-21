begin;
alter table public.online_category_settings add column if not exists name_zh text;
alter table public.online_category_settings add column if not exists name_en text;
create or replace function public.save_online_category_names(
  p_key text, p_name_zh text, p_name_en text, p_create boolean default false
) returns void language plpgsql security definer set search_path=public as $$
declare
  zh text := trim(coalesce(p_name_zh,''));
  en text := trim(coalesce(p_name_en,''));
begin
  if not exists(select 1 from public.profiles where id=auth.uid()
    and (is_admin=true or admin_role='online_manager')) then
    raise exception 'Administrator access required';
  end if;
  if coalesce(trim(p_key),'')='' or p_key='All' or length(p_key)>100
    or position('||' in p_key)>0 then raise exception 'Invalid category'; end if;
  if zh='' or en='' or length(zh)>100 or length(en)>100 then
    raise exception 'Enter both Chinese and English names (maximum 100 characters each)';
  end if;
  perform pg_advisory_xact_lock(hashtext('gogoshop-online-categories'));
  if exists(select 1 from public.online_category_settings where key=p_key and deleted) then
    raise exception 'Category was deleted. Reopen the editor.';
  end if;
  if p_create and (exists(select 1 from public.online_category_settings where key=p_key)
    or exists(select 1 from public.products where sales_channel='online'
      and p_key=any(string_to_array(coalesce(category,''),'||')))) then
    raise exception 'Category already exists';
  end if;
  if exists(select 1 from public.online_category_settings where key<>p_key and not deleted
    and (lower(name_zh)=lower(zh) or lower(name_en)=lower(en))) then
    raise exception 'Category name already exists';
  end if;
  insert into public.online_category_settings(key,deleted,name_zh,name_en) values(p_key,false,zh,en)
    on conflict(key) do update set name_zh=excluded.name_zh,name_en=excluded.name_en;
end;
$$;
revoke all on function public.save_online_category_names(text,text,text,boolean) from public;
grant execute on function public.save_online_category_names(text,text,text,boolean) to authenticated;
commit;
