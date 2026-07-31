-- Run once in Supabase Dashboard > SQL Editor to enable in-store POS orders.

alter table public.products add column if not exists barcode text not null default '';
create unique index if not exists products_barcode_unique_idx
  on public.products (barcode) where nullif(trim(barcode), '') is not null;
create index if not exists products_sku_idx on public.products (sku);

alter table public.orders add column if not exists order_source text not null default 'online';
alter table public.orders drop constraint if exists orders_order_source_check;
alter table public.orders add constraint orders_order_source_check
  check (order_source in ('online', 'pos'));

create or replace function public.create_pos_order(p_items jsonb)
returns public.orders
language plpgsql
security definer set search_path = public
as $$
declare
  v_admin uuid := auth.uid();
  v_order public.orders%rowtype;
  v_order_number text;
  v_total numeric(12,2) := 0;
  v_item_count integer := 0;
  v_item jsonb;
  v_product public.products%rowtype;
  v_quantity integer;
begin
  if not public.is_admin() then raise exception 'Administrator access required'; end if;
  if p_items is null or jsonb_typeof(p_items) <> 'array' or jsonb_array_length(p_items) = 0 then
    raise exception 'Cart is empty';
  end if;

  -- Product rows are locked until the complete sale is committed. Nothing is
  -- deducted while the cashier is still building the cart.
  for v_item in
    select jsonb_build_object(
      'product_id', item ->> 'product_id',
      'quantity', sum(greatest(1, coalesce((item ->> 'quantity')::integer, 1)))
    )
    from jsonb_array_elements(p_items) as entries(item)
    group by item ->> 'product_id'
  loop
    v_quantity := (v_item ->> 'quantity')::integer;
    select * into v_product from public.products
      where id = v_item ->> 'product_id' and deleted_at is null
      for update;
    if not found then raise exception 'Product unavailable: %', v_item ->> 'product_id'; end if;
    if v_product.stock < v_quantity then raise exception 'Insufficient stock for %', v_product.title; end if;
    v_total := v_total + (v_product.price * v_quantity);
    v_item_count := v_item_count + v_quantity;
  end loop;

  v_order_number := 'POS-' || to_char(clock_timestamp(), 'YYMMDDHH24MISS') || '-' || upper(substr(gen_random_uuid()::text, 1, 4));
  insert into public.orders (
    order_number, user_id, status, total, item_count, points_awarded,
    payment_provider, payment_status, paid_at, confirmed_at, confirmed_by, order_source
  ) values (
    v_order_number, v_admin, 'confirmed', round(v_total, 2), v_item_count, 0,
    'manual', 'paid', now(), now(), v_admin, 'pos'
  ) returning * into v_order;

  for v_item in
    select jsonb_build_object(
      'product_id', item ->> 'product_id',
      'quantity', sum(greatest(1, coalesce((item ->> 'quantity')::integer, 1)))
    )
    from jsonb_array_elements(p_items) as entries(item)
    group by item ->> 'product_id'
  loop
    v_quantity := (v_item ->> 'quantity')::integer;
    select * into v_product from public.products where id = v_item ->> 'product_id';
    insert into public.order_items (order_id, product_id, product_title, unit_price, quantity)
    values (v_order.id, v_product.id, v_product.title, v_product.price, v_quantity);
    update public.products
      set stock = stock - v_quantity,
          sales = sales + v_quantity,
          updated_at = now()
      where id = v_product.id;
  end loop;

  return v_order;
end;
$$;

revoke all on function public.create_pos_order(jsonb) from public, anon;
grant execute on function public.create_pos_order(jsonb) to authenticated;
