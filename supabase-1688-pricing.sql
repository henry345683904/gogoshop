begin;

update public.products
set
  cost_per_item = round(source_price * 4, 2),
  price = round(source_price * 1.5 * 1.15, 2),
  updated_at = now()
where source_currency = 'CNY'
  and source_price > 0;

commit;
