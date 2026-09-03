-- Restricted online-store manager role for GO GO SHOP.
-- This role can manage only products and media assigned to the online channel.

begin;

alter table public.profiles
  add column if not exists admin_role text not null default 'customer';

update public.profiles
set admin_role = case
  when is_admin = true then 'full_admin'
  when admin_role in ('customer', 'online_manager', 'full_admin') then admin_role
  else 'customer'
end;

alter table public.profiles drop constraint if exists profiles_admin_role_check;
alter table public.profiles add constraint profiles_admin_role_check
  check (admin_role in ('customer', 'online_manager', 'full_admin'));

comment on column public.profiles.admin_role is
  'customer = storefront account; online_manager = online products only; full_admin = store owner';

create or replace function public.is_online_manager()
returns boolean
language sql
stable
security definer
set search_path = public
as $$
  select exists (
    select 1
    from public.profiles
    where id = auth.uid()
      and admin_role = 'online_manager'
      and is_admin = false
  );
$$;

create or replace function public.can_manage_online_products()
returns boolean
language sql
stable
security definer
set search_path = public
as $$
  select public.is_admin() or public.is_online_manager();
$$;

revoke all on function public.is_online_manager() from public, anon;
revoke all on function public.can_manage_online_products() from public, anon;
grant execute on function public.is_online_manager() to authenticated;
grant execute on function public.can_manage_online_products() to authenticated;

drop policy if exists "products online manager read" on public.products;
create policy "products online manager read" on public.products
  for select to authenticated
  using (public.is_online_manager() and sales_channel = 'online');

drop policy if exists "products online manager insert" on public.products;
create policy "products online manager insert" on public.products
  for insert to authenticated
  with check (public.is_online_manager() and sales_channel = 'online');

drop policy if exists "products online manager update" on public.products;
create policy "products online manager update" on public.products
  for update to authenticated
  using (public.is_online_manager() and sales_channel = 'online')
  with check (public.is_online_manager() and sales_channel = 'online');

drop policy if exists "products online manager delete" on public.products;
create policy "products online manager delete" on public.products
  for delete to authenticated
  using (public.is_online_manager() and sales_channel = 'online');

do $$
begin
  if to_regclass('public.product_media') is not null then
    alter table public.product_media
      add column if not exists sales_channel text not null default 'offline';

    update public.product_media pm
    set sales_channel = 'online'
    where exists (
      select 1
      from public.products p
      where p.sales_channel = 'online'
        and (
          trim(p.image) = pm.url
          or exists (
            select 1
            from jsonb_array_elements_text(
              case when jsonb_typeof(p.images) = 'array' then p.images else '[]'::jsonb end
            ) as product_image(url)
            where trim(product_image.url) = pm.url
          )
        )
    );

    alter table public.product_media drop constraint if exists product_media_sales_channel_check;
    alter table public.product_media add constraint product_media_sales_channel_check
      check (sales_channel in ('offline', 'online'));

    create index if not exists product_media_sales_channel_created_idx
      on public.product_media (sales_channel, created_at desc);

    drop policy if exists "product media online manager read" on public.product_media;
    create policy "product media online manager read" on public.product_media
      for select to authenticated
      using (public.is_online_manager() and sales_channel = 'online');

    drop policy if exists "product media online manager insert" on public.product_media;
    create policy "product media online manager insert" on public.product_media
      for insert to authenticated
      with check (public.is_online_manager() and sales_channel = 'online');

    drop policy if exists "product media online manager update" on public.product_media;
    create policy "product media online manager update" on public.product_media
      for update to authenticated
      using (public.is_online_manager() and sales_channel = 'online')
      with check (public.is_online_manager() and sales_channel = 'online');

    drop policy if exists "product media online manager delete" on public.product_media;
    create policy "product media online manager delete" on public.product_media
      for delete to authenticated
      using (public.is_online_manager() and sales_channel = 'online');
  end if;
end;
$$;

drop policy if exists "product media storage online manager insert" on storage.objects;
create policy "product media storage online manager insert" on storage.objects
  for insert to authenticated
  with check (
    bucket_id = 'product-media'
    and public.is_online_manager()
    and name like 'online-products/%'
  );

drop policy if exists "product media storage online manager update" on storage.objects;
create policy "product media storage online manager update" on storage.objects
  for update to authenticated
  using (
    bucket_id = 'product-media'
    and public.is_online_manager()
    and name like 'online-products/%'
  )
  with check (
    bucket_id = 'product-media'
    and public.is_online_manager()
    and name like 'online-products/%'
  );

drop policy if exists "product media storage online manager delete" on storage.objects;
create policy "product media storage online manager delete" on storage.objects
  for delete to authenticated
  using (
    bucket_id = 'product-media'
    and public.is_online_manager()
    and name like 'online-products/%'
  );

-- Assign the restricted role only when this Auth user already exists. No password
-- is created or changed by this migration.
insert into public.profiles (id, email, full_name, is_admin, admin_role)
select
  u.id,
  coalesce(u.email, ''),
  coalesce(u.raw_user_meta_data ->> 'full_name', u.raw_user_meta_data ->> 'name', ''),
  false,
  'online_manager'
from auth.users u
where lower(u.email) = 'sales@gogoshop.co.nz'
on conflict (id) do update set
  email = excluded.email,
  is_admin = false,
  admin_role = 'online_manager',
  updated_at = now();

notify pgrst, 'reload schema';

commit;

select
  p.id,
  p.email,
  p.is_admin,
  p.admin_role,
  (p.admin_role = 'online_manager' and p.is_admin = false) as restricted_online_manager
from public.profiles p
where lower(p.email) = 'sales@gogoshop.co.nz';
