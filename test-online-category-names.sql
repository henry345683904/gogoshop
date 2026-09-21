begin;
do $$
declare
  test_key text := '__names_test_'||txid_current();
  before_hash text;
  after_hash text;
begin
  perform set_config('request.jwt.claim.sub',(select id::text from public.profiles where is_admin=true limit 1),true);
  select md5(string_agg(to_jsonb(p)::text,'' order by id)) into before_hash from public.products p;
  perform public.save_online_category_names(test_key,'测试分类','Test category',true);
  perform public.save_online_category_names(test_key,'修改分类','Updated category');
  assert (select name_zh='修改分类' and name_en='Updated category' from public.online_category_settings where key=test_key), 'Names not saved';
  select md5(string_agg(to_jsonb(p)::text,'' order by id)) into after_hash from public.products p;
  assert before_hash=after_hash, 'Products changed while saving category names';
  perform set_config('request.jwt.claim.sub','',true);
  begin
    perform public.save_online_category_names(test_key,'未授权','Unauthorized');
    raise exception 'Unauthenticated write allowed';
  exception when raise_exception then
    if sqlerrm<>'Administrator access required' then raise; end if;
  end;
end;
$$;
select 'PASS: bilingual create/update, unchanged products, authentication' as result;
rollback;
