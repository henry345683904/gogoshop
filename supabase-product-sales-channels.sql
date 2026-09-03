-- Split products into mutually exclusive in-store and online sales channels.
-- On the first run, all existing products become offline products and are
-- hidden from the public storefront. Re-running this migration preserves any
-- products that were later moved to the online channel.

begin;

do $$
declare
  sales_channel_already_exists boolean;
begin
  select exists (
    select 1
    from information_schema.columns
    where table_schema = 'public'
      and table_name = 'products'
      and column_name = 'sales_channel'
  ) into sales_channel_already_exists;

  if not sales_channel_already_exists then
    alter table public.products add column sales_channel text;
    update public.products
    set sales_channel = 'offline',
        published = false,
        updated_at = now();
  end if;
end;
$$;

update public.products
set sales_channel = 'offline',
    published = false,
    updated_at = now()
where sales_channel is null
   or sales_channel not in ('offline', 'online');

update public.products
set published = false,
    updated_at = now()
where sales_channel = 'offline'
  and published = true;

alter table public.products alter column sales_channel set default 'offline';
alter table public.products alter column sales_channel set not null;
alter table public.products alter column published set default false;

alter table public.products drop constraint if exists products_sales_channel_check;
alter table public.products add constraint products_sales_channel_check
  check (sales_channel in ('offline', 'online'));

alter table public.products drop constraint if exists products_offline_not_published_check;
alter table public.products add constraint products_offline_not_published_check
  check (sales_channel = 'online' or published = false);

create index if not exists products_sales_channel_idx
  on public.products(sales_channel, published, updated_at desc)
  where deleted_at is null;

comment on column public.products.sales_channel is
  'offline = Go Go Shop POS/in-store only; online = public web store only';

create or replace function public.enforce_order_item_sales_channel()
returns trigger
language plpgsql
set search_path = public
as $$
declare
  v_order_source text;
  v_sales_channel text;
begin
  if new.product_id is null then return new; end if;

  select order_source into v_order_source
  from public.orders
  where id = new.order_id;

  select sales_channel into v_sales_channel
  from public.products
  where id = new.product_id;

  if v_order_source = 'pos' and v_sales_channel <> 'offline' then
    raise exception 'Online products cannot be sold through the in-store POS';
  end if;
  if coalesce(v_order_source, 'online') <> 'pos' and v_sales_channel <> 'online' then
    raise exception 'Offline products cannot be added to online orders';
  end if;
  return new;
end;
$$;

drop trigger if exists enforce_order_item_sales_channel_trigger on public.order_items;
create trigger enforce_order_item_sales_channel_trigger
  before insert or update of order_id, product_id on public.order_items
  for each row execute procedure public.enforce_order_item_sales_channel();

drop function if exists public.get_storefront_products();
create function public.get_storefront_products()
returns table (
  id text,
  title text,
  title_en text,
  title_zh text,
  category text,
  description text,
  description_en text,
  description_zh text,
  price numeric,
  compare_at_price numeric,
  stock integer,
  published boolean,
  sales_channel text,
  image text,
  images jsonb
)
language sql
stable
security definer
set search_path = public
as $$
  select
    products.id,
    coalesce(nullif(products.title_en, ''), products.title),
    products.title_en,
    products.title_zh,
    products.category,
    case when products.id like '1688-%' then '' else products.description end,
    products.description_en,
    products.description_zh,
    products.price,
    products.compare_at_price,
    products.stock,
    products.published,
    products.sales_channel,
    products.image,
    products.images
  from public.products
  where products.deleted_at is null
    and products.sales_channel = 'online'
    and products.published = true
    and coalesce(products.tags, '') <> '__gogoshop_purged__'
  order by products.updated_at desc, products.id;
$$;

drop function if exists public.get_storefront_catalog();
create function public.get_storefront_catalog()
returns table (
  id text,
  title text,
  title_en text,
  title_zh text,
  category text,
  price numeric,
  compare_at_price numeric,
  stock integer,
  published boolean,
  sales_channel text,
  image text,
  sku text,
  barcode text
)
language sql
stable
security definer
set search_path = public
as $$
  select
    products.id,
    coalesce(nullif(products.title_en, ''), products.title),
    products.title_en,
    products.title_zh,
    products.category,
    products.price,
    products.compare_at_price,
    products.stock,
    products.published,
    products.sales_channel,
    products.image,
    products.sku,
    products.barcode
  from public.products
  where products.deleted_at is null
    and products.sales_channel = 'online'
    and products.published = true
    and coalesce(products.tags, '') <> '__gogoshop_purged__'
  order by products.updated_at desc, products.id;
$$;

drop function if exists public.get_storefront_product_detail(text);
create function public.get_storefront_product_detail(p_product_id text)
returns table (
  id text,
  title text,
  title_en text,
  title_zh text,
  category text,
  description text,
  description_en text,
  description_zh text,
  price numeric,
  compare_at_price numeric,
  stock integer,
  published boolean,
  sales_channel text,
  image text,
  images jsonb,
  sku text,
  barcode text
)
language sql
stable
security definer
set search_path = public
as $$
  select
    products.id,
    coalesce(nullif(products.title_en, ''), products.title),
    products.title_en,
    products.title_zh,
    products.category,
    case when products.id like '1688-%' then '' else products.description end,
    products.description_en,
    products.description_zh,
    products.price,
    products.compare_at_price,
    products.stock,
    products.published,
    products.sales_channel,
    products.image,
    products.images,
    products.sku,
    products.barcode
  from public.products
  where products.id = p_product_id
    and products.deleted_at is null
    and products.sales_channel = 'online'
    and products.published = true
    and coalesce(products.tags, '') <> '__gogoshop_purged__';
$$;

revoke all on function public.get_storefront_products() from public;
grant execute on function public.get_storefront_products() to anon, authenticated;
revoke all on function public.get_storefront_catalog() from public;
grant execute on function public.get_storefront_catalog() to anon, authenticated;
revoke all on function public.get_storefront_product_detail(text) from public;
grant execute on function public.get_storefront_product_detail(text) to anon, authenticated;

notify pgrst, 'reload schema';

commit;
