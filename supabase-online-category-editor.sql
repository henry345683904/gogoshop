begin;
create table if not exists public.online_category_settings (
  key text primary key,
  deleted boolean not null default false
);
alter table public.online_category_settings enable row level security;
drop policy if exists online_category_read on public.online_category_settings;
create policy online_category_read on public.online_category_settings for select to anon, authenticated using (true);
grant select on public.online_category_settings to anon, authenticated;

drop function if exists public.edit_online_category(text,text,text,text[],text[]);
create or replace function public.edit_online_category(
  p_action text, p_key text, p_name text default null,
  p_add text[] default '{}', p_remove text[] default '{}', p_changes jsonb default '[]'
) returns integer language plpgsql security definer set search_path = public as $$
declare
  v_name text := trim(coalesce(p_name,''));
  v_count integer := 0;
  v_change jsonb;
  v_previous text;
begin
  if not exists (select 1 from public.profiles where id = auth.uid()
    and (is_admin = true or admin_role = 'online_manager')) then
    raise exception 'Administrator access required';
  end if;
  if p_key is null or trim(p_key) = '' or length(p_key) > 100 or position('||' in p_key) > 0 then
    raise exception 'Invalid category';
  end if;
  if p_action in ('create','rename') and (v_name = '' or length(v_name) > 100
    or position('||' in v_name) > 0 or lower(v_name) = 'all' or v_name ~* '^online[-_ ]') then
    raise exception 'Invalid category name';
  end if;
  perform pg_advisory_xact_lock(hashtext('gogoshop-online-categories'));
  if p_action in ('create','rename') then
    if exists(select 1 from public.online_category_settings where key=v_name and not deleted)
      or exists(select 1 from public.products where sales_channel='online' and deleted_at is null
        and v_name=any(string_to_array(coalesce(category,''),'||'))) then
      raise exception 'Category already exists';
    end if;
    insert into public.online_category_settings(key,deleted) values(v_name,false)
      on conflict(key) do update set deleted=false;
  end if;
  -- Apply only category edits calculated from the displayed (including inferred)
  -- memberships. Reject stale forms instead of overwriting another admin's work.
  for v_change in select value from jsonb_array_elements(p_changes) loop
    select category into v_previous from public.products where id=v_change->>'id'
      and sales_channel='online' and deleted_at is null for update;
    if not found then raise exception 'Online product no longer available'; end if;
    if coalesce(v_previous,'') <> coalesce(v_change->>'expected','') then
      raise exception 'Product categories changed. Close and reopen the editor.';
    end if;
    if coalesce(v_change->>'category','')='' then raise exception 'Category cannot be empty'; end if;
    update public.products set category=v_change->>'category',updated_at=now() where id=v_change->>'id';
  end loop;
  if p_action in ('rename','delete') then
    if p_key='other' then raise exception 'The fallback category cannot be renamed or deleted'; end if;
    update public.products p set category = coalesce(nullif((
      select string_agg(k,'||' order by first_pos) from (
        select k,min(pos) first_pos from (
          select case when old_key=p_key then case when p_action='rename' then v_name else null end else old_key end k,pos
          from unnest(string_to_array(coalesce(p.category,''),'||')) with ordinality t(old_key,pos)
        ) replaced where k is not null and k<>'' group by k
      ) distinct_keys
    ),''),'other'), updated_at=now()
    where p.sales_channel='online' and p.deleted_at is null
      and p_key=any(string_to_array(coalesce(p.category,''),'||'));
    get diagnostics v_count = row_count;
    insert into public.online_category_settings(key,deleted) values(p_key,true)
      on conflict(key) do update set deleted=true;
  elsif p_action='assign' then
    if exists(select 1 from public.online_category_settings where key=p_key and deleted) then
      raise exception 'Category was deleted; reload the category list';
    end if;
    update public.products p set category=concat_ws('||',nullif(p.category,''),p_key),updated_at=now()
      where p.sales_channel='online' and p.deleted_at is null and p.id=any(p_add)
      and not p_key=any(string_to_array(coalesce(p.category,''),'||'));
    get diagnostics v_count = row_count;
    update public.products p set category=coalesce(nullif(array_to_string(array_remove(string_to_array(coalesce(p.category,''),'||'),p_key),'||'),''),'other'),updated_at=now()
      where p.sales_channel='online' and p.deleted_at is null and p.id=any(p_remove)
      and p_key=any(string_to_array(coalesce(p.category,''),'||'));
    insert into public.online_category_settings(key,deleted) values(p_key,false) on conflict do nothing;
  elsif p_action<>'create' then
    raise exception 'Invalid category action';
  end if;
  return v_count;
end;
$$;
revoke all on function public.edit_online_category(text,text,text,text[],text[],jsonb) from public;
grant execute on function public.edit_online_category(text,text,text,text[],text[],jsonb) to authenticated;
commit;
