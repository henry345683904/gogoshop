-- CIL / Cinevan invoice 213397.
-- Existing SKU/barcode rows receive the invoice quantity and image. A new
-- SKU creates an unpublished draft. The invoice marker makes this migration
-- safe to run again without adding the same stock twice.

begin;

with invoice_rows (sku, barcode, title, invoice_price, discount_percent, net_price, stock, amount, category, image_path) as (
  values
    ('17858',   '1234560178582', 'Super Glue (20g)',                                      1.25, 15, 1.06, 12, 12.75, 'office-supplies',    'assets/cil/213397/17858.jpg'),
    ('20329',   '1234560203291', 'Price Tag Machine (Assorted color) / 打价机',             4.75, 15, 4.04,  1,  4.04, 'office-supplies',    'assets/cil/213397/20329.jpg'),
    ('20799',   '1234560207992', '10 rolls White Price Tag (500pcs)',                      1.69, 15, 1.44, 10, 14.36, 'office-supplies',    'assets/cil/213397/20799.jpg'),
    ('52836',   '1234560528363', 'Soft Toy (40cm)',                                        9.49,  0, 9.49,  2, 18.98, 'blind-box-plush',    'assets/cil/213397/52836.jpg'),
    ('J50004',  '1234568500040', 'Soft Toy (40cm)',                                        5.75,  0, 5.75,  1,  5.75, 'blind-box-plush',    'assets/cil/213397/J50004.jpg'),
    ('JX50079', '1234568500798', 'Squishy Toy Butter',                                     1.95,  0, 1.95, 12, 23.40, 'blind-box-plush',    'assets/cil/213397/JX50079.jpg'),
    ('JX50131', '1234568501313', 'Soft Toy (28cm)',                                        5.15,  0, 5.15,  6, 30.90, 'blind-box-plush',    'assets/cil/213397/JX50131.jpg')
), prepared as (
  select
    'cil-' || regexp_replace(lower(sku), '[^a-z0-9]+', '-', 'g') as id,
    sku, barcode, title, invoice_price, discount_percent, net_price, stock,
    amount, category, image_path,
    jsonb_build_object(
      'invoice_number', '213397',
      'invoice_date', '2026-08-30',
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
      @> jsonb_build_array(jsonb_build_object('invoice_number', '213397'))
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
  'CIL, imported, invoice-213397, draft',
  'https://www.cilimports.co.nz/dealer/invoice.aspx?213397',
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

-- Verification: seven invoice identifiers, 44 invoice units, image paths,
-- and the NET PRICE x 1.15 cost formula should be represented after execution.
with invoice_rows (sku, barcode, net_price, quantity, image_path) as (
  values
    ('17858',   '1234560178582', 1.06, 12, 'assets/cil/213397/17858.jpg'),
    ('20329',   '1234560203291', 4.04,  1, 'assets/cil/213397/20329.jpg'),
    ('20799',   '1234560207992', 1.44, 10, 'assets/cil/213397/20799.jpg'),
    ('52836',   '1234560528363', 9.49,  2, 'assets/cil/213397/52836.jpg'),
    ('J50004',  '1234568500040', 5.75,  1, 'assets/cil/213397/J50004.jpg'),
    ('JX50079', '1234568500798', 1.95, 12, 'assets/cil/213397/JX50079.jpg'),
    ('JX50131', '1234568501313', 5.15,  6, 'assets/cil/213397/JX50131.jpg')
), matched as (
  select r.*, p.id, p.stock, p.price, p.published, p.cost_per_item, p.image,
    coalesce(p.source_attributes, '[]'::jsonb)
      @> jsonb_build_array(jsonb_build_object('invoice_number', '213397')) as marked
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
  count(*) filter (where marked and image = image_path) as image_rows,
  count(*) filter (where marked and price = 0 and published = false) as unpublished_price_zero_rows
from matched;

select sku, barcode, title, category, price, cost_per_item, stock, published, image, images
from public.products
where lower(trim(sku)) = any(array['17858','20329','20799','52836','j50004','jx50079','jx50131'])
   or trim(barcode) = any(array['1234560178582','1234560203291','1234560207992','1234560528363','1234568500040','1234568500798','1234568501313'])
order by lower(sku);
