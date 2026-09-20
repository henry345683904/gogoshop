-- Run in SQL Editor. All test changes are rolled back.
begin;
do $$
declare
  online_id text;
  offline_id text;
  original_category text;
  offline_before text;
  offline_after text;
  test_key text := '__category_test_' || txid_current();
begin
  perform set_config('request.jwt.claim.sub',(select id::text from public.profiles where is_admin=true limit 1),true);
  select id,category into online_id,original_category from public.products
    where sales_channel='online' and deleted_at is null and coalesce(category,'')<>'' limit 1;
  select id into offline_id from public.products where sales_channel='offline' limit 1;
  select md5(string_agg(to_jsonb(p)::text,'' order by id)) into offline_before from public.products p where sales_channel='offline';
  perform public.edit_online_category('create',test_key,test_key);
  perform public.edit_online_category('assign',test_key,null,array[online_id,offline_id]);
  assert (select category=original_category||'||'||test_key from public.products where id=online_id), 'Membership addition failed';
  perform public.edit_online_category('assign',test_key,null,array[online_id]);
  assert (select category=original_category||'||'||test_key from public.products where id=online_id), 'Duplicate membership';
  perform public.edit_online_category('assign',test_key,null,'{}',array[online_id]);
  assert (select category=original_category from public.products where id=online_id), 'Membership removal lost other categories';
  perform public.edit_online_category('assign',test_key,null,array[online_id]);
  perform public.edit_online_category('rename',test_key,test_key||'_renamed');
  assert (select category=original_category||'||'||test_key||'_renamed' from public.products where id=online_id), 'Rename failed';
  perform public.edit_online_category('delete',test_key||'_renamed');
  assert (select category=original_category from public.products where id=online_id), 'Delete lost other categories';
  perform public.edit_online_category('assign',test_key||'_inferred',null,'{}','{}',
    jsonb_build_array(jsonb_build_object('id',online_id,'expected',original_category,'category',original_category||'||'||test_key||'_inferred')));
  assert (select category=original_category||'||'||test_key||'_inferred' from public.products where id=online_id), 'Inferred category update failed';
  begin
    perform public.edit_online_category('assign',test_key||'_stale',null,'{}','{}',
      jsonb_build_array(jsonb_build_object('id',online_id,'expected',original_category,'category',test_key)));
    raise exception 'Stale edit was allowed';
  exception when raise_exception then
    if sqlerrm <> 'Product categories changed. Close and reopen the editor.' then raise; end if;
  end;
  select md5(string_agg(to_jsonb(p)::text,'' order by id)) into offline_after from public.products p where sales_channel='offline';
  assert offline_before is not distinct from offline_after, 'Offline products changed';
  perform set_config('request.jwt.claim.sub','',true);
  begin
    perform public.edit_online_category('create',test_key||'_denied',test_key||'_denied');
    raise exception 'Unauthenticated write was allowed';
  exception when raise_exception then
    if sqlerrm <> 'Administrator access required' then raise; end if;
  end;
end;
$$;
select 'PASS: create, add, duplicate, remove, rename, delete, inferred categories, stale edits, offline isolation, authentication' as result;
rollback;
