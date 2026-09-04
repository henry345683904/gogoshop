-- Restore the original Online Shop categories without touching offline products.
-- The source category is preserved in source_attributes by the catalogue import.

begin;

with category_map(source_category, category) as (
  values
    ('清洁洗护', 'online-cleaning-care'),
    ('健康护理', 'online-health-personal-care'),
    ('家居和装饰', 'online-home-decor'),
    ('宠物用品', 'online-pet-supplies'),
    ('烘焙用具', 'online-bakeware'),
    ('厨具餐具', 'online-kitchenware-tableware'),
    ('一次性用品', 'online-disposable-supplies'),
    ('潮流玩具', 'online-trending-toys'),
    ('玩具潮玩', 'online-toys-collectibles'),
    ('收纳整理', 'online-storage-organisation'),
    ('沙滩戏水', 'online-beach-water-play'),
    ('园艺工具', 'online-gardening-tools'),
    ('五金日杂', 'online-hardware-household'),
    ('汽车用品', 'online-automotive'),
    ('手机配件', 'online-phone-accessories'),
    ('露营和户外', 'online-camping-outdoors'),
    ('运动户外', 'online-sports-outdoors'),
    ('影音设备', 'online-audio-video'),
    ('数码配件', 'online-digital-accessories'),
    ('文具笔具', 'online-stationery-writing'),
    ('电池与插排', 'online-batteries-power-boards'),
    ('包袋配饰', 'online-bags-accessories'),
    ('礼品包装', 'online-gift-packaging'),
    ('清洁厨具', 'online-kitchen-cleaning'),
    ('胶带纸品', 'online-tape-paper-products'),
    ('节日生日', 'online-party-celebrations'),
    ('日用百货', 'online-everyday-essentials'),
    ('服装配饰', 'online-clothing-accessories'),
    ('运动装备', 'online-sports-equipment'),
    ('厨房好物', 'online-kitchen-essentials')
), source_categories as (
  select
    p.id,
    attributes.value ->> 'source_category' as source_category
  from public.products p
  cross join lateral jsonb_array_elements(
    case
      when jsonb_typeof(p.source_attributes) = 'array' then p.source_attributes
      else '[]'::jsonb
    end
  ) as attributes(value)
  where p.sales_channel = 'online'
    and p.id like 'online-kdh-%'
    and p.deleted_at is null
    and attributes.value ->> 'source_category' is not null
), updated as (
  update public.products p
  set
    category = category_map.category,
    updated_at = now()
  from source_categories
  join category_map
    on category_map.source_category = source_categories.source_category
  where p.id = source_categories.id
  returning p.id
)
select count(*)::int as updated_products
from updated;

commit;

-- Verification: online rows should now use all 30 source categories, while the
-- offline count and rows remain outside this update scope.
select
  count(*) filter (
    where sales_channel = 'offline'
      and deleted_at is null
  )::int as offline_products,
  count(*) filter (
    where sales_channel = 'online'
      and deleted_at is null
  )::int as online_products,
  count(distinct category) filter (
    where sales_channel = 'online'
      and deleted_at is null
  )::int as online_category_count,
  count(*) filter (
    where sales_channel = 'online'
      and category = 'online-other'
      and deleted_at is null
  )::int as online_other_products
from public.products;

select
  category,
  count(*)::int as products
from public.products
where sales_channel = 'online'
  and deleted_at is null
group by category
order by category;
