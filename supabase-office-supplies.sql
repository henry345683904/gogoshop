begin;

update public.products
set category = 'office-supplies'
where deleted_at is null
  and id = any(array[
    'cil-20608',
    'cil-22409',
    'cil-22862',
    'cil-60283',
    'cil-bf-zh-841',
    'cil-bo13376',
    'cil-bo13383',
    'cil-bo27687',
    'cil-bo27694'
  ]);

commit;

select id, sku, title, category
from public.products
where deleted_at is null
  and id = any(array[
    'cil-20608',
    'cil-22409',
    'cil-22862',
    'cil-60283',
    'cil-bf-zh-841',
    'cil-bo13376',
    'cil-bo13383',
    'cil-bo27687',
    'cil-bo27694'
  ])
order by sku;
