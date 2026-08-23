begin;

update public.products
set
  cost_per_item = round(source_price / 4, 2),
  updated_at = now()
where source_price > 0;

commit;
