-- Public, read-only offline catalog. Never expose procurement or customer fields.
create or replace function public.get_offline_showcase()
returns jsonb language sql stable security definer set search_path=public
as $$
select coalesce(jsonb_agg(jsonb_build_object(
  'id',id,'title',title,'title_zh',title_zh,'title_en',title_en,
  'category',category,'price',price,'sku',sku,'image',image,'images',images,
  'available',stock>0
) order by updated_at desc,id),'[]'::jsonb)
from public.products
where sales_channel='offline' and deleted_at is null
  and coalesce(tags,'') <> '__gogoshop_purged__';
$$;
revoke all on function public.get_offline_showcase() from public;
grant execute on function public.get_offline_showcase() to anon,authenticated;
