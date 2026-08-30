-- Fix product costs by procurement currency.
-- 1688 prices are CNY and use source_price / 4 as an estimated NZD cost.
-- CIL / Cinevan prices are already NZD and use source_price * 1.15 GST-inclusive.
begin;

with classified as (
  select
    id,
    case
      when upper(trim(coalesce(source_currency, ''))) = 'NZD'
        or source_url ilike '%cilimports%'
        or source_url ilike '%cinevan%'
        or vendor ilike '%cinevan%'
        or vendor ilike '%cil imports%'
        or tags ilike '%cil%'
        or tags ilike '%cinevan%'
      then 'NZD'
      else 'CNY'
    end as procurement_currency
  from public.products
  where source_price > 0
)
update public.products p
set
  source_currency = c.procurement_currency,
  cost_per_item = case
    when c.procurement_currency = 'NZD'
      then round(p.source_price * 1.15, 2)
    else round(p.source_price / 4, 2)
  end,
  updated_at = now()
from classified c
where p.id = c.id;

commit;
