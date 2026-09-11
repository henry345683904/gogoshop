begin;

alter table public.orders add column if not exists pos_payment_method text
  check (pos_payment_method in ('eftpos', 'cash'));

-- Keep stock, voucher and loyalty updates in the original order transaction.
create or replace function public.create_pos_order_with_payment(
  p_items jsonb,
  p_payment_method text default 'eftpos',
  p_customer_barcode text default null,
  p_customer_voucher_id uuid default null,
  p_order_note text default null,
  p_manual_discount_type text default null,
  p_manual_discount_value numeric default 0
)
returns public.orders
language plpgsql
security definer set search_path = public
as $$
declare
  v_order public.orders;
begin
  if not public.is_admin() or exists (
    select 1 from public.profiles where id = auth.uid() and admin_role = 'online_manager'
  ) then raise exception 'Offline administrator access required'; end if;
  if p_payment_method is null or p_payment_method not in ('eftpos', 'cash') then
    raise exception 'Select EFTPOS or CASH';
  end if;
  v_order := public.create_pos_order(p_items, p_customer_barcode, p_customer_voucher_id,
    p_order_note, p_manual_discount_type, p_manual_discount_value);
  update public.orders set pos_payment_method = p_payment_method
    where id = v_order.id returning * into v_order;
  return v_order;
end;
$$;
revoke all on function public.create_pos_order_with_payment(jsonb,text,text,uuid,text,text,numeric) from public, anon;
grant execute on function public.create_pos_order_with_payment(jsonb,text,text,uuid,text,text,numeric) to authenticated;
notify pgrst, 'reload schema';
commit;
