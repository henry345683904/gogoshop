-- Animal quantities and the POS order commit or roll back together.
begin;
create or replace function public.create_pos_order_with_animals(
  p_items jsonb, p_payment_method text default 'eftpos',
  p_customer_barcode text default null, p_customer_voucher_id uuid default null,
  p_order_note text default null, p_manual_discount_type text default null,
  p_manual_discount_value numeric default 0
) returns public.orders language plpgsql security definer set search_path=public as $$
declare
  item jsonb; allocation jsonb; variant jsonb; variants jsonb;
  product public.products; result public.orders;
  allocated integer; requested integer; position integer; animal_note text;
  normalized_items jsonb := '[]'::jsonb;
begin
  if not public.is_admin() or exists(select 1 from public.profiles where id=auth.uid() and admin_role='online_manager') then
    raise exception 'Offline administrator access required';
  end if;
  if jsonb_typeof(p_items) is distinct from 'array' then raise exception 'Invalid items'; end if;
  for item in select value from jsonb_array_elements(p_items) order by value->>'product_id' loop
    select * into product from public.products where id=item->>'product_id' and sales_channel='offline' and deleted_at is null for update;
    if not found then raise exception 'Product unavailable'; end if;
    if trim(coalesce(product.sku,''))='2003' or trim(coalesce(to_jsonb(product)->>'item_code',''))='2003' then
      variants := product.source_variants;
      if jsonb_typeof(variants) is distinct from 'array' or jsonb_array_length(variants)<>11 then raise exception 'Configure all 11 animal stocks in admin first'; end if;
      if jsonb_typeof(item->'animal_allocations') is distinct from 'array' then raise exception 'Select animals'; end if;
      allocated:=0; animal_note:='';
      if (select count(*)<>count(distinct value->>'key') from jsonb_array_elements(item->'animal_allocations')) then raise exception 'Duplicate animal selection'; end if;
      for allocation in select value from jsonb_array_elements(item->'animal_allocations') loop
        requested:=(allocation->>'quantity')::integer;
        if requested is null or requested<=0 then raise exception 'Invalid animal quantity'; end if;
        position:=null;
        select ordinality::integer-1,value into position,variant from jsonb_array_elements(variants) with ordinality
          where value->>'animalKey'=allocation->>'key';
        if position is null then raise exception 'Unknown animal'; end if;
        if coalesce((variant->>'stock')::integer,0)<requested then raise exception 'Insufficient stock: %',variant->>'name'; end if;
        variants:=jsonb_set(variants,array[position::text,'stock'],to_jsonb((variant->>'stock')::integer-requested));
        allocated:=allocated+requested;
        animal_note:=concat_ws(', ',nullif(animal_note,''),(variant->>'name')||' x'||requested);
      end loop;
      if allocated<>(item->>'quantity')::integer or allocated=0 then raise exception 'Animal quantities must match item quantity'; end if;
      update public.products set source_variants=variants where id=product.id;
      item:=jsonb_set(item,'{note}',to_jsonb(left(concat_ws(' | ',animal_note,nullif(item->>'note','')),500)));
    end if;
    normalized_items:=normalized_items||jsonb_build_array(item);
  end loop;
  result:=public.create_pos_order_with_payment(normalized_items,p_payment_method,p_customer_barcode,p_customer_voucher_id,p_order_note,p_manual_discount_type,p_manual_discount_value);
  return result;
end; $$;
revoke all on function public.create_pos_order_with_animals(jsonb,text,text,uuid,text,text,numeric) from public,anon;
grant execute on function public.create_pos_order_with_animals(jsonb,text,text,uuid,text,text,numeric) to authenticated;
notify pgrst,'reload schema';
commit;
