-- Attach the verified CIL product images for invoice 213271.
-- The paths are relative to the GO GO SHOP GitHub Pages root.
begin;

with image_rows (sku, barcode, image_path) as (
  values
    ('14400-1', '5007495', 'assets/cil/213271/14400-1.jpg'),
    ('17376', '1234560173761', 'assets/cil/213271/17376.jpg'),
    ('18921', '1234560189212', 'assets/cil/213271/18921.jpg'),
    ('20298', '1234560202980', 'assets/cil/213271/20298.jpg'),
    ('20610', '1234560206100', 'assets/cil/213271/20610.jpg'),
    ('20714', '1234560207145', 'assets/cil/213271/20714.jpg'),
    ('HB-A02029', '1234561020293', 'assets/cil/213271/HB-A02029.jpg')
)
update public.products p
set
  image = r.image_path,
  images = jsonb_build_array(r.image_path),
  updated_at = now()
from image_rows r
where lower(trim(p.sku)) = lower(trim(r.sku))
   or trim(p.barcode) = trim(r.barcode);

commit;

-- Verification: all seven invoice products should point to a local JPEG.
with image_rows (sku, barcode, image_path) as (
  values
    ('14400-1', '5007495', 'assets/cil/213271/14400-1.jpg'),
    ('17376', '1234560173761', 'assets/cil/213271/17376.jpg'),
    ('18921', '1234560189212', 'assets/cil/213271/18921.jpg'),
    ('20298', '1234560202980', 'assets/cil/213271/20298.jpg'),
    ('20610', '1234560206100', 'assets/cil/213271/20610.jpg'),
    ('20714', '1234560207145', 'assets/cil/213271/20714.jpg'),
    ('HB-A02029', '1234561020293', 'assets/cil/213271/HB-A02029.jpg')
), matched as (
  select r.*, p.id, p.image, p.images
  from image_rows r
  left join public.products p
    on lower(trim(p.sku)) = lower(trim(r.sku))
    or trim(p.barcode) = trim(r.barcode)
)
select
  count(*) filter (where id is not null) as matched_rows,
  count(*) filter (where image = image_path) as main_image_rows,
  count(*) filter (where images @> jsonb_build_array(image_path)) as gallery_image_rows
from matched;

select sku, barcode, title, image, images
from public.products
where lower(trim(sku)) = any(array['14400-1','17376','18921','20298','20610','20714','hb-a02029'])
   or trim(barcode) = any(array['5007495','1234560173761','1234560189212','1234560202980','1234560206100','1234560207145','1234561020293'])
order by lower(sku);
