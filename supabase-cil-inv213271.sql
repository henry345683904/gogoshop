-- CIL / Cinevan invoice 213271.
-- The invoice contains seven office-supply products and 44 units.
-- Existing SKU/barcode rows receive the invoice quantity; a new SKU creates
-- an unpublished draft. The invoice marker makes this migration idempotent.
-- The printed subtotal is 180.17 while the displayed line amounts sum to
-- 180.18; the line amounts below are preserved exactly as printed.
begin;

with invoice_rows (sku, barcode, title, invoice_price, discount_percent, net_price, stock, amount) as (
  values
    ('14400-1', '5007495', 'Pegboard Shelf Hook (Whole Box, 30cm)', 100.00, 0, 100.00, 1, 100.00),
    ('17376', '1234560173761', 'Office Scissors (6.5 inch)', 1.05, 15, 0.89, 6, 5.36),
    ('18921', '1234560189212', '2pcs Art Knife Combination', 1.30, 15, 1.10, 6, 6.63),
    ('20298', '1234560202980', 'Note Pad (7.6*7.6cm)', 1.15, 15, 0.98, 12, 11.73),
    ('20610', '1234560206100', 'Tape Dispenser / Tape Holder', 1.97, 15, 1.67, 6, 10.05),
    ('20714', '1234560207145', 'Learner Sign (15*15cm)', 1.05, 15, 0.89, 12, 10.71),
    ('HB-A02029', '1234561020293', '4 Tier Storage/Display Rack (72*34*159cm, Black)', 42.00, 15, 35.70, 1, 35.70)
), prepared as (
  select
    'cil-' || regexp_replace(lower(sku), '[^a-z0-9]+', '-', 'g') as id,
    sku,
    barcode,
    title,
    invoice_price,
    discount_percent,
    net_price,
    stock,
    amount,
    jsonb_build_object(
      'invoice_number', '213271',
      'invoice_date', '2026-08-26',
      'invoice_price', invoice_price,
      'discount_percent', discount_percent,
      'net_price', net_price,
      'quantity', stock,
      'amount', amount
    ) as invoice_metadata
  from invoice_rows
), existing_update as (
  update public.products p
  set
    stock = p.stock + r.stock,
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
    or trim(p.barcode) = trim(r.barcode)
  )
    and not (
      coalesce(p.source_attributes, '[]'::jsonb)
      @> jsonb_build_array(jsonb_build_object('invoice_number', '213271'))
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
  'office-supplies',
  r.title,
  r.title,
  '',
  0,
  0,
  round(r.net_price * 1.15, 2),
  r.stock,
  0,
  false,
  '',
  '[]'::jsonb,
  'Cinevan International Ltd',
  r.sku,
  r.barcode,
  'CIL, imported, invoice-213271, draft',
  'https://www.cilimports.co.nz/dealer/invoice.aspx?213271',
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
     or trim(p.barcode) = trim(r.barcode)
);

commit;

-- Verification: all seven invoice identifiers, 44 invoice units, and the
-- NET PRICE x 1.15 cost formula should be represented after execution.
with invoice_rows (sku, barcode, net_price, quantity) as (
  values
    ('14400-1', '5007495', 100.00, 1),
    ('17376', '1234560173761', 0.89, 6),
    ('18921', '1234560189212', 1.10, 6),
    ('20298', '1234560202980', 0.98, 12),
    ('20610', '1234560206100', 1.67, 6),
    ('20714', '1234560207145', 0.89, 12),
    ('HB-A02029', '1234561020293', 35.70, 1)
), matched as (
  select
    r.*,
    p.id,
    p.stock,
    p.price,
    p.published,
    p.cost_per_item,
    p.category,
    coalesce(p.source_attributes, '[]'::jsonb)
      @> jsonb_build_array(jsonb_build_object('invoice_number', '213271')) as marked
  from invoice_rows r
  left join public.products p
    on p.id = 'cil-' || regexp_replace(lower(r.sku), '[^a-z0-9]+', '-', 'g')
    or lower(trim(p.sku)) = lower(trim(r.sku))
    or trim(p.barcode) = trim(r.barcode)
)
select
  count(*) filter (where id is not null and marked) as imported_rows,
  sum(quantity) as invoice_units,
  count(*) filter (where marked and category = 'office-supplies') as office_supply_rows,
  count(*) filter (where marked and price = 0 and published = false) as unpublished_price_zero_rows,
  count(*) filter (where marked and cost_per_item = round(net_price * 1.15, 2)) as cost_formula_rows
from matched;

select
  sku,
  barcode,
  title,
  category,
  price,
  cost_per_item,
  stock,
  published,
  image
from public.products
where lower(trim(sku)) = any(array['14400-1','17376','18921','20298','20610','20714','hb-a02029'])
   or trim(barcode) = any(array['5007495','1234560173761','1234560189212','1234560202980','1234560206100','1234560207145','1234561020293'])
order by lower(sku);
