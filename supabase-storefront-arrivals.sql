-- Public-safe arrival metadata; keep the existing compact catalog contract intact.
begin;
create or replace function public.get_storefront_catalog_v2()
returns setof jsonb
language sql stable security definer
set search_path = public
as $$
  select to_jsonb(c) || jsonb_build_object(
    'created_at', to_jsonb(p)->>'created_at',
    'is_new_arrival',
      coalesce(p.tags, '') ~* '(^|[,;|[:space:]])(new|new-arrival|新品|新到)([,;|[:space:]]|$)'
      or coalesce((to_jsonb(p)->>'created_at')::timestamptz >= now() - interval '30 days', false)
  )
  from public.get_storefront_catalog() c
  join public.products p on p.id = c.id
  where p.sales_channel = 'online' and p.published = true
    and p.deleted_at is null
  order by p.updated_at desc nulls last, p.id;
$$;
revoke all on function public.get_storefront_catalog_v2() from public;
grant execute on function public.get_storefront_catalog_v2() to anon, authenticated;
commit;
