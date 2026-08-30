-- CIL / Cinevan invoice 213409.
-- Existing SKU/barcode rows receive the invoice quantity and image. A new
-- SKU creates an unpublished draft. The invoice marker makes this migration
-- safe to run again without adding the same stock twice.

begin;

with invoice_rows (sku, barcode, title, invoice_price, discount_percent, net_price, stock, amount, category, image_path, retail_price) as (
  values
    ('16127',   '1234560161270', 'Clear Double-Sided Tape (13mm*10m)',                         1.15, 15, 0.98, 12, 11.73, 'office-supplies', 'assets/cil/213409/16127.jpg',   0),
    ('22861',   '1234560228614', 'Calculator (CL816)',                                         2.45, 15, 2.08,  4,  8.33, 'office-supplies', 'assets/cil/213409/22861.jpg',   0),
    ('A01560',  '1234561015602', 'Foldable Non-woven Storage Box (30*40*25cm, Black)',          5.45, 15, 4.63,  2,  9.26, 'office-supplies', 'assets/cil/213409/A01560.jpg', 5.45),
    ('c4',      '',             'Temporary Item',                                                1.50,  0, 1.50, 12, 18.00, 'office-supplies', '',                              0),
    ('JX50166', '1234568501665', 'Soft Toy (35cm)',                                             4.85,  0, 4.85,  2,  9.70, 'blind-box-plush', 'assets/cil/213409/JX50166.jpg', 0),
    ('JX50180', '1234568501801', 'Squishy Toy Butter Stick (Small, 12pcs/box)',                 1.95,  0, 1.95, 12, 23.40, 'blind-box-plush', 'assets/cil/213409/JX50180.jpg', 0)
), prepared as (
  select
    'cil-' || regexp_replace(lower(sku), '[^a-z0-9]+', '-', 'g') as id,
    sku, barcode, title, invoice_price, discount_percent, net_price, stock,
    amount, category, image_path, retail_price,
    jsonb_build_object(
      'invoice_number', '213409',
      'invoice_date', '2026-08-30',
      'invoice_price', invoice_price,
      'discount_percent', discount_percent,
      'net_price', net_price,
      'quantity', stock,
      'amount', amount,
      'retail_price', nullif(retail_price, 0),
      'image_path', nullif(image_path, '')
    ) as invoice_metadata
  from invoice_rows
), existing_update as (
  update public.products p
  set
    stock = p.stock + r.stock,
    cost_per_item = round(r.net_price * 1.15, 2),
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
    p.id = r.id
    or lower(trim(p.sku)) = lower(trim(r.sku))
    or (
      nullif(trim(r.barcode), '') is not null
      and nullif(trim(p.barcode), '') = trim(r.barcode)
    )
  )
    and not (
      coalesce(p.source_attributes, '[]'::jsonb)
      @> jsonb_build_array(jsonb_build_object('invoice_number', '213409'))
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
  'CIL, imported, invoice-213409, draft',
  'https://www.cilimports.co.nz/dealer/invoice.aspx?213409',
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

-- Verification: six invoice identifiers, 44 invoice units, image paths,
-- and the NET PRICE x 1.15 cost formula should be represented after execution.
with invoice_rows (sku, barcode, net_price, quantity, image_path) as (
  values
    ('16127',   '1234560161270', 0.98, 12, 'assets/cil/213409/16127.jpg'),
    ('22861',   '1234560228614', 2.08,  4, 'assets/cil/213409/22861.jpg'),
    ('A01560',  '1234561015602', 4.63,  2, 'assets/cil/213409/A01560.jpg'),
    ('c4',      '',              1.50, 12, ''),
    ('JX50166', '1234568501665', 4.85,  2, 'assets/cil/213409/JX50166.jpg'),
    ('JX50180', '1234568501801', 1.95, 12, 'assets/cil/213409/JX50180.jpg')
), matched as (
  select r.*, p.id, p.stock, p.price, p.published, p.cost_per_item, p.image,
    coalesce(p.source_attributes, '[]'::jsonb)
      @> jsonb_build_array(jsonb_build_object('invoice_number', '213409')) as marked
  from invoice_rows r
  left join public.products p
    on p.id = 'cil-' || regexp_replace(lower(r.sku), '[^a-z0-9]+', '-', 'g')
    or lower(trim(p.sku)) = lower(trim(r.sku))
    or (nullif(trim(r.barcode), '') is not null and nullif(trim(p.barcode), '') = trim(r.barcode))
)
select
  count(*) filter (where id is not null and marked) as imported_rows,
  sum(quantity) as invoice_units,
  count(*) filter (where marked and cost_per_item = round(net_price * 1.15, 2)) as cost_formula_rows,
  count(*) filter (where marked and (image = image_path or image_path = '')) as image_rows,
  count(*) filter (where marked and price = 0 and published = false) as unpublished_price_zero_rows
from matched;

select sku, barcode, title, category, price, cost_per_item, stock, published, image, images
from public.products
where lower(trim(sku)) = any(array['16127','22861','a01560','c4','jx50166','jx50180'])
   or trim(barcode) = any(array['1234560161270','1234560228614','1234561015602','1234568501665','1234568501801'])
order by lower(sku);
