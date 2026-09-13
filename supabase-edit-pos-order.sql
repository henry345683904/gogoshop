begin;

alter table public.orders add column if not exists edit_version integer not null default 0;
create table if not exists public.pos_order_edits (
  id bigint generated always as identity primary key,
  order_id uuid not null references public.orders(id),
  edited_by uuid not null references auth.users(id),
  edited_at timestamptz not null default now(),
  before_order jsonb not null,
  before_items jsonb not null,
  after_items jsonb not null
);
alter table public.pos_order_edits enable row level security;
revoke all on public.pos_order_edits from anon, authenticated;

create or replace function public.edit_pos_order(
  p_order_id uuid, p_items jsonb, p_discount numeric, p_expected_version integer
) returns public.orders
language plpgsql security definer set search_path = public
as $$
declare
  v_order public.orders%rowtype;
  v_product public.products%rowtype;
  v_item jsonb;
  v_before jsonb;
  v_subtotal numeric := 0;
  v_count integer := 0;
  v_quantity integer;
  v_old_quantity integer;
  v_price numeric;
  v_total numeric;
  v_points integer;
begin
  if not public.is_admin() or exists (
    select 1 from public.profiles where id = auth.uid() and admin_role = 'online_manager'
  ) then raise exception 'Offline administrator access required'; end if;
  select * into v_order from public.orders where id = p_order_id for update;
  if not found then raise exception 'Order not found'; end if;
  if v_order.order_source <> 'pos' or v_order.payment_provider = 'stripe'
    or v_order.status <> 'confirmed' or v_order.deleted_at is not null
    or v_order.payment_status = 'refunded' then
    raise exception 'Only active confirmed offline orders can be edited';
  end if;
  if p_expected_version is distinct from v_order.edit_version then
    raise exception 'Order changed. Reload the order before editing.';
  end if;
  if p_items is null or jsonb_typeof(p_items) <> 'array' then raise exception 'Invalid items'; end if;
  if jsonb_array_length(p_items) not between 1 and 500 then raise exception 'Order requires 1 to 500 items'; end if;
  if p_discount is null or p_discount < 0 or p_discount > 99999999.99 or p_discount::text = 'NaN'
    or p_discount <> round(p_discount, 2) then raise exception 'Invalid discount'; end if;
  if (select count(distinct x->>'product_id') from jsonb_array_elements(p_items) x) <> jsonb_array_length(p_items)
    then raise exception 'Duplicate or missing products'; end if;
  select coalesce(jsonb_agg(to_jsonb(i) order by i.id),'[]') into v_before
    from public.order_items i where order_id = p_order_id;
  if exists (select 1 from public.order_items where order_id = p_order_id and product_id is null)
    then raise exception 'A historical product was permanently deleted. Restore its reference before editing.'; end if;

  -- Lock the union in a stable order, then apply only the quantity differences.
  perform id from public.products where id in (
    select product_id from public.order_items where order_id = p_order_id
    union select x->>'product_id' from jsonb_array_elements(p_items) x
  ) order by id for update;
  for v_item in select x from jsonb_array_elements(p_items) x loop
    if coalesce(v_item->>'quantity','') !~ '^[1-9][0-9]{0,5}$' then raise exception 'Invalid quantity'; end if;
    v_quantity := (v_item->>'quantity')::integer;
    v_price := (v_item->>'unit_price')::numeric;
    if v_price is null or v_price < 0 or v_price > 999999.99 or v_price::text = 'NaN'
      or v_price <> round(v_price,2) then raise exception 'Invalid unit price'; end if;
    select * into v_product from public.products where id = v_item->>'product_id';
    if not found or v_product.sales_channel <> 'offline' then raise exception 'Offline product not found'; end if;
    select coalesce(sum(quantity),0) into v_old_quantity from public.order_items
      where order_id = p_order_id and product_id = v_product.id;
    if v_product.deleted_at is not null and v_quantity > v_old_quantity then raise exception 'Cannot add a deleted product'; end if;
    if v_product.stock + v_old_quantity < v_quantity then raise exception 'Insufficient stock: %',v_product.title; end if;
    v_subtotal := v_subtotal + v_price * v_quantity;
    v_count := v_count + v_quantity;
  end loop;
  if p_discount > v_subtotal then raise exception 'Discount exceeds subtotal'; end if;
  if v_order.customer_voucher_id is not null and (p_discount <> v_order.discount_amount or v_subtotal <> v_order.subtotal) then
    raise exception 'Voucher order: preserve subtotal and discount, or handle the voucher separately.';
  end if;
  v_total := v_subtotal - p_discount;
  v_points := case when exists(select 1 from public.profiles where id=v_order.user_id and not is_admin)
    then round(v_total)::integer else 0 end;
  for v_product in select * from public.products where id in (
    select product_id from public.order_items where order_id = p_order_id
    union select x->>'product_id' from jsonb_array_elements(p_items) x
  ) order by id loop
    select coalesce(sum(quantity),0) into v_old_quantity from public.order_items where order_id=p_order_id and product_id=v_product.id;
    select coalesce(sum((x->>'quantity')::integer),0) into v_quantity from jsonb_array_elements(p_items) x where x->>'product_id'=v_product.id;
    update public.products set stock=stock+v_old_quantity-v_quantity,
      sales=greatest(0,sales-v_old_quantity+v_quantity), updated_at=now() where id=v_product.id;
  end loop;
  delete from public.order_items where order_id=p_order_id;
  insert into public.order_items(order_id,product_id,product_title,unit_price,quantity,item_note)
    select p_order_id,p.id,p.title,(x->>'unit_price')::numeric,(x->>'quantity')::integer,left(coalesce(x->>'item_note',''),500)
    from jsonb_array_elements(p_items) x join public.products p on p.id=x->>'product_id';
  update public.profiles set total_spent=greatest(0,total_spent-v_order.total+v_total),
    points=greatest(0,points-v_order.points_awarded+v_points),updated_at=now()
    where id=v_order.user_id and not is_admin;
  insert into public.pos_order_edits(order_id,edited_by,before_order,before_items,after_items)
    values(p_order_id,auth.uid(),to_jsonb(v_order),v_before,p_items);
  update public.orders set subtotal=v_subtotal,discount_amount=p_discount,total=v_total,
    item_count=v_count,points_awarded=v_points,edit_version=edit_version+1
    where id=p_order_id returning * into v_order;
  return v_order;
end;
$$;
revoke all on function public.edit_pos_order(uuid,jsonb,numeric,integer) from public,anon;
grant execute on function public.edit_pos_order(uuid,jsonb,numeric,integer) to authenticated;
notify pgrst, 'reload schema';
commit;
