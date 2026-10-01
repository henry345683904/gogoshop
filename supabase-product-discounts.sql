-- Product-level discounts used by the admin quick-edit controls.
-- Values are percentages from 0 to 100. A value of 0 means no discount.
alter table public.products
  add column if not exists discount_percent numeric(5,2) not null default 0;

update public.products
set discount_percent = least(100, greatest(0, discount_percent))
where discount_percent is distinct from least(100, greatest(0, discount_percent));

alter table public.products
  drop constraint if exists products_discount_percent_range;

alter table public.products
  add constraint products_discount_percent_range
  check (discount_percent >= 0 and discount_percent <= 100);

notify pgrst, 'reload schema';
