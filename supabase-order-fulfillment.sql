-- Run once after supabase-vouchers.sql. Delivery eligibility and fees are
-- calculated in the database so checkout totals cannot be changed by clients.

begin;

alter table public.orders
  add column if not exists fulfillment_method text not null default 'pickup';

alter table public.orders
  add column if not exists fulfillment_configured boolean not null default false;

alter table public.orders
  add column if not exists delivery_fee numeric(12,2) not null default 0;

alter table public.orders
  add column if not exists delivery_distance_km numeric(7,3);

alter table public.orders
  add column if not exists delivery_address text not null default '';

alter table public.orders
  add column if not exists delivery_phone text not null default '';

alter table public.orders
  add column if not exists pickup_location text not null default 'Flat Bush';

alter table public.orders drop constraint if exists orders_fulfillment_method_check;
alter table public.orders add constraint orders_fulfillment_method_check
  check (fulfillment_method in ('pickup', 'delivery'));

alter table public.orders drop constraint if exists orders_delivery_fee_check;
alter table public.orders add constraint orders_delivery_fee_check
  check (delivery_fee in (0, 5));

alter table public.orders drop constraint if exists orders_delivery_distance_check;
alter table public.orders add constraint orders_delivery_distance_check
  check (delivery_distance_km is null or delivery_distance_km between 0 and 12);

alter table public.orders drop constraint if exists orders_fulfillment_details_check;
alter table public.orders add constraint orders_fulfillment_details_check
  check (
    fulfillment_configured = false
    or (
      fulfillment_method = 'pickup'
      and delivery_fee = 0
      and delivery_distance_km is null
      and delivery_address = ''
      and delivery_phone = ''
      and nullif(trim(pickup_location), '') is not null
    )
    or (
      fulfillment_method = 'delivery'
      and delivery_distance_km is not null
      and nullif(trim(delivery_address), '') is not null
      and nullif(trim(delivery_phone), '') is not null
    )
  );

-- Keep orders.subtotal as the merchandise subtotal when a delivery fee changes
-- orders.total. This replaces the voucher trigger function without changing
-- its existing insert/update behavior for orders that have no delivery fee.
create or replace function public.ensure_order_subtotal()
returns trigger
language plpgsql
set search_path = public
as $$
begin
  if tg_op = 'INSERT' then
    new.subtotal := coalesce(new.subtotal, new.total);
  elsif new.subtotal is null
    or (
      coalesce(new.discount_amount, 0) = 0
      and new.voucher_id is null
      and coalesce(new.delivery_fee, 0) = 0
    ) then
    new.subtotal := new.total;
  end if;
  return new;
end;
$$;

drop function if exists public.create_payment_order(jsonb, uuid, text, text, text, numeric, numeric);
create function public.create_payment_order(
  p_items jsonb,
  p_customer_voucher_id uuid,
  p_fulfillment_method text,
  p_delivery_address text,
  p_delivery_phone text,
  p_customer_lat numeric,
  p_customer_lng numeric
)
returns uuid
language plpgsql
security definer set search_path = public
as $$
declare
  v_user uuid := auth.uid();
  v_order_id uuid;
  v_order public.orders%rowtype;
  v_method text := lower(trim(coalesce(p_fulfillment_method, '')));
  v_address text := trim(coalesce(p_delivery_address, ''));
  v_phone text := trim(coalesce(p_delivery_phone, ''));
  v_distance double precision;
  v_haversine double precision;
  v_delivery_fee numeric(12,2) := 0;
  v_pickup_lat constant double precision := -36.9661534;
  v_pickup_lng constant double precision := 174.9127100;
  v_earth_radius_km constant double precision := 6371.0088;
begin
  if v_user is null then raise exception 'Authentication required'; end if;
  if v_method not in ('pickup', 'delivery') then raise exception 'Choose delivery or pickup'; end if;

  v_order_id := public.create_payment_order(p_items, p_customer_voucher_id);
  select * into v_order
  from public.orders
  where id = v_order_id and user_id = v_user
  for update;
  if not found then raise exception 'Unable to create order'; end if;

  if v_method = 'delivery' then
    if char_length(v_address) < 5 or char_length(v_address) > 500 then
      raise exception 'Enter a valid delivery address';
    end if;
    if char_length(v_phone) < 5 or char_length(v_phone) > 80 then
      raise exception 'Enter a valid delivery phone number';
    end if;
    if p_customer_lat is null or p_customer_lng is null
      or p_customer_lat < -90 or p_customer_lat > 90
      or p_customer_lng < -180 or p_customer_lng > 180 then
      raise exception 'A valid customer location is required for delivery';
    end if;

    v_haversine :=
      power(sin(radians((v_pickup_lat - p_customer_lat::double precision) / 2)), 2)
      + cos(radians(p_customer_lat::double precision)) * cos(radians(v_pickup_lat))
      * power(sin(radians((v_pickup_lng - p_customer_lng::double precision) / 2)), 2);
    v_distance := v_earth_radius_km * 2 * asin(sqrt(least(1.0, greatest(0.0, v_haversine))));

    if v_distance > 12 then
      raise exception 'Delivery is only available within 12 km of Flat Bush';
    end if;

    -- The free-delivery threshold uses the merchandise total after vouchers.
    v_delivery_fee := case when v_order.total >= 80 then 0 else 5 end;
  else
    v_address := '';
    v_phone := '';
    v_distance := null;
  end if;

  update public.orders
  set fulfillment_method = v_method,
      fulfillment_configured = true,
      delivery_fee = v_delivery_fee,
      delivery_distance_km = case when v_distance is null then null else round(v_distance::numeric, 3) end,
      delivery_address = v_address,
      delivery_phone = v_phone,
      pickup_location = 'Flat Bush',
      total = round(total + v_delivery_fee, 2)
  where id = v_order_id and user_id = v_user;

  return v_order_id;
end;
$$;

revoke all on function public.create_payment_order(jsonb, uuid, text, text, text, numeric, numeric) from public, anon;
grant execute on function public.create_payment_order(jsonb, uuid, text, text, text, numeric, numeric) to authenticated;

commit;
