-- CIL / Cinevan invoice 213455.
-- Existing SKU/barcode rows receive the invoice quantity and latest cost.
-- New SKUs are created as unpublished drafts. The invoice marker keeps this
-- migration idempotent so rerunning it does not add the stock twice.

begin;

-- A historical product kept the generated id cil-c4 after its SKU was changed
-- to JX50148. Repair the first attempted import if it matched that stale id.
update public.products
set
  stock = greatest(stock - 36, 0),
  cost_per_item = round(1.50 * 1.15, 2),
  source_price = 1.50,
  source_currency = 'NZD',
  source_url = 'https://www.cilimports.co.nz/dealer/invoice.aspx?213409',
  source_attributes = coalesce((
    select jsonb_agg(entry order by ordinal)
    from jsonb_array_elements(coalesce(source_attributes, '[]'::jsonb))
      with ordinality as history(entry, ordinal)
    where entry->>'invoice_number' <> '213455'
  ), '[]'::jsonb),
  updated_at = now()
where id = 'cil-c4'
  and lower(trim(sku)) <> 'c4'
  and coalesce(source_attributes, '[]'::jsonb)
    @> jsonb_build_array(jsonb_build_object('invoice_number', '213455'));

with invoice_rows (sku, barcode, title, invoice_price, discount_percent, net_price, stock, amount, category, image_path) as (
  values
    ('c4',      '',              'Temporary Item',                                  6.00, 0, 6.00, 36, 216.00, 'office-supplies', ''),
    ('JX50080', '1234568500804', 'Squishy Toy Butter (Large)',                      4.95, 0, 4.95, 12,  59.40, 'blind-box-plush', 'assets/cil/213455/JX50080.jpg'),
    ('JX50083', '1234568500835', 'Squishy Toy (Chocolate)',                         1.85, 0, 1.85, 12,  22.20, 'blind-box-plush', 'assets/cil/213455/JX50083.jpg'),
    ('JX50127', '1234568501276', 'Squishy Toys (5.5*5.5*7cm)',                      2.85, 0, 2.85, 24,  68.40, 'blind-box-plush', 'assets/cil/213455/JX50127.jpg'),
    ('JX50181', '1234568501818', 'Squishy Toy Butter Stick (Large, 12pcs/box)',     4.95, 0, 4.95, 12,  59.40, 'blind-box-plush', 'assets/cil/213455/JX50181.jpg')
), prepared as (
  select
    case
      when lower(trim(sku)) = 'c4' then 'cil-inv213455-c4'
      else 'cil-' || regexp_replace(lower(sku), '[^a-z0-9]+', '-', 'g')
    end as id,
    sku, barcode, title, invoice_price, discount_percent, net_price, stock,
    amount, category, image_path,
    jsonb_build_object(
      'invoice_number', '213455',
      'invoice_date', '2026-08-31',
      'invoice_price', invoice_price,
      'discount_percent', discount_percent,
      'net_price', net_price,
      'quantity', stock,
      'amount', amount,
      'image_path', nullif(image_path, '')
    ) as invoice_metadata
  from invoice_rows
), existing_update as (
  update public.products p
  set
    stock = p.stock + r.stock,
    cost_per_item = round(r.net_price * 1.15, 2),
    source_price = r.net_price,
    source_currency = 'NZD',
    source_url = 'https://www.cilimports.co.nz/dealer/invoice.aspx?213455',
    image = case when r.image_path <> '' then r.image_path else p.image end,
    images = case when r.image_path <> '' then jsonb_build_array(r.image_path) else p.images end,
    source_attributes = case
      when jsonb_typeof(p.source_attributes) = 'array'
        then p.source_attributes || jsonb_build_array(r.invoice_metadata)
      else jsonb_build_array(r.invoice_metadata)
    end,
    updated_at = now()
  from prepared r
  where (
    lower(trim(p.sku)) = lower(trim(r.sku))
    or (
      nullif(trim(r.barcode), '') is not null
      and nullif(trim(p.barcode), '') = trim(r.barcode)
    )
  )
    and not (
      coalesce(p.source_attributes, '[]'::jsonb)
      @> jsonb_build_array(jsonb_build_object('invoice_number', '213455'))
    )
  returning p.id
)
insert into public.products (
  id, title, title_en, title_zh, category,
  description, description_en, description_zh,
  price, compare_at_price, cost_per_item, stock, sales, published,
  image, images, vendor, sku, barcode, tags,
  source_url, source_currency, source_price, source_variants, source_attributes,
  deleted_at, deleted_was_published, updated_at
)
select
  r.id,
  r.title,
  r.title,
  '',
  r.category,
  r.title,
  r.title,
  '',
  0,
  0,
  round(r.net_price * 1.15, 2),
  r.stock,
  0,
  false,
  r.image_path,
  case when r.image_path <> '' then jsonb_build_array(r.image_path) else '[]'::jsonb end,
  'Cinevan International Ltd',
  r.sku,
  r.barcode,
  'CIL, imported, invoice-213455, draft',
  'https://www.cilimports.co.nz/dealer/invoice.aspx?213455',
  'NZD',
  r.net_price,
  '[]'::jsonb,
  jsonb_build_array(r.invoice_metadata),
  null,
  false,
  now()
from prepared r
where not exists (
  select 1
  from public.products p
  where p.id = r.id
     or lower(trim(p.sku)) = lower(trim(r.sku))
     or (
       nullif(trim(r.barcode), '') is not null
       and nullif(trim(p.barcode), '') = trim(r.barcode)
     )
);

commit;

-- Verification: five invoice identifiers, 96 invoice units, four image paths,
-- and the NET PRICE x 1.15 cost formula should be represented after execution.
with invoice_rows (sku, barcode, net_price, quantity, image_path) as (
  values
    ('c4',      '',              6.00, 36, ''),
    ('JX50080', '1234568500804', 4.95, 12, 'assets/cil/213455/JX50080.jpg'),
    ('JX50083', '1234568500835', 1.85, 12, 'assets/cil/213455/JX50083.jpg'),
    ('JX50127', '1234568501276', 2.85, 24, 'assets/cil/213455/JX50127.jpg'),
    ('JX50181', '1234568501818', 4.95, 12, 'assets/cil/213455/JX50181.jpg')
), matched as (
  select r.*, p.id, p.stock, p.price, p.published, p.cost_per_item,
    p.source_price, p.source_currency, p.image,
    coalesce(p.source_attributes, '[]'::jsonb)
      @> jsonb_build_array(jsonb_build_object('invoice_number', '213455')) as marked
  from invoice_rows r
  left join public.products p
    on p.id = case
      when lower(trim(r.sku)) = 'c4' then 'cil-inv213455-c4'
      else 'cil-' || regexp_replace(lower(r.sku), '[^a-z0-9]+', '-', 'g')
    end
    or lower(trim(p.sku)) = lower(trim(r.sku))
    or (nullif(trim(r.barcode), '') is not null and nullif(trim(p.barcode), '') = trim(r.barcode))
)
select
  count(*) filter (where id is not null and marked) as imported_rows,
  sum(quantity) as invoice_units,
  count(*) filter (
    where marked
      and cost_per_item = round(net_price * 1.15, 2)
      and source_price = net_price
      and source_currency = 'NZD'
  ) as cost_formula_rows,
  count(*) filter (where marked and (image = image_path or image_path = '')) as image_rows
from matched;

select sku, barcode, title, category, price, cost_per_item, source_price,
  source_currency, stock, published, image, images
from public.products
where lower(trim(sku)) = any(array['c4','jx50080','jx50083','jx50127','jx50181'])
   or trim(barcode) = any(array['1234568500804','1234568500835','1234568501276','1234568501818'])
order by lower(sku);
