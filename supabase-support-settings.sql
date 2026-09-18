begin;
create table if not exists public.support_settings (
 id boolean primary key default true check(id),
 settings jsonb not null,
 updated_at timestamptz not null default now()
);
insert into public.support_settings(id,settings) values(true,'{
 "greeting_enabled":true,
 "greeting_zh":"您好，欢迎来到 GO GO SHOP！有什么可以帮到您？您可以在这里留言，客服看到后会回复您，也可以通过以下方式联系我们。",
 "greeting_en":"Hello, welcome to GO GO SHOP! How can we help you? Leave a message here and our team will reply when available, or contact us using the details below.",
 "auto_enabled":false,"auto_minutes":30,
 "auto_zh":"您好，您的消息已收到！客服会尽快回复您，感谢您的耐心等待。",
 "auto_en":"Thanks for your message! Our team will reply as soon as possible. Thank you for your patience.",
 "wechat":"GoGoShop_NZ","whatsapp":"","wechat_qr":"","whatsapp_qr":"","social_label":"","social_url":"","social_qr":""
}'::jsonb) on conflict(id) do nothing;
alter table public.support_settings enable row level security;
revoke all on public.support_settings from anon,authenticated;
grant select on public.support_settings to anon,authenticated;
drop policy if exists support_settings_public_read on public.support_settings;
create policy support_settings_public_read on public.support_settings for select to anon,authenticated using(true);
create or replace function public.support_save_settings(p_settings jsonb) returns void
language plpgsql security definer set search_path=public as $$
declare k text; v text;
begin
 if not public.support_is_staff() then raise exception 'Access denied'; end if;
 if jsonb_typeof(p_settings)<>'object' or p_settings is null then raise exception 'Invalid settings'; end if;
 if jsonb_typeof(p_settings->'greeting_enabled') is distinct from 'boolean' or jsonb_typeof(p_settings->'auto_enabled') is distinct from 'boolean' then raise exception 'Invalid switches'; end if;
 if jsonb_typeof(p_settings->'auto_minutes') is distinct from 'number' or (p_settings->>'auto_minutes')::numeric not between 1 and 1440 then raise exception 'Invalid reply interval'; end if;
 foreach k in array array['greeting_zh','greeting_en','auto_zh','auto_en','wechat','whatsapp','wechat_qr','whatsapp_qr','social_label','social_url','social_qr'] loop
  if jsonb_typeof(p_settings->k) is distinct from 'string' then raise exception 'Invalid field: %',k; end if;
  v:=p_settings->>k;
  if char_length(v)>2000 then raise exception 'Field too long: %',k; end if;
  if k in ('wechat_qr','whatsapp_qr','social_qr','social_url') and v<>'' and v!~'^https://[^ /]+[^ ]*$' then raise exception 'HTTPS URL required'; end if;
 end loop;
 if p_settings->>'whatsapp'<>'' and p_settings->>'whatsapp'!~'^[+][1-9][0-9]{6,14}$' then raise exception 'Use international WhatsApp number'; end if;
 if (p_settings->>'auto_enabled')::boolean and (trim(p_settings->>'auto_zh')='' or trim(p_settings->>'auto_en')='') then raise exception 'Both auto replies are required'; end if;
 if (p_settings->>'greeting_enabled')::boolean and (trim(p_settings->>'greeting_zh')='' or trim(p_settings->>'greeting_en')='') then raise exception 'Both greetings are required'; end if;
 update public.support_settings set settings=p_settings,updated_at=now() where id=true;
end $$;
revoke all on function public.support_save_settings(jsonb) from public,anon;
grant execute on function public.support_save_settings(jsonb) to authenticated;
alter table public.support_messages add column if not exists is_auto boolean not null default false;
create or replace function public.support_auto_reply() returns trigger
language plpgsql security definer set search_path=public as $$
declare s jsonb; reply text;
begin
 if new.from_staff then return new; end if;
 select settings into s from public.support_settings where id=true;
 if not coalesce((s->>'auto_enabled')::boolean,false) then return new; end if;
 if exists(select 1 from public.support_messages where customer_id=new.customer_id and is_auto and created_at>now()-make_interval(mins=>(s->>'auto_minutes')::int)) then return new; end if;
 reply:=case when current_setting('app.support_language',true)='zh' then s->>'auto_zh' else s->>'auto_en' end;
 if nullif(trim(reply),'') is null then return new; end if;
 insert into public.support_messages(customer_id,sender_id,from_staff,is_auto,body,request_id)
 values(new.customer_id,new.sender_id,true,true,reply,gen_random_uuid());
 return new;
end $$;
drop trigger if exists support_auto_reply_trigger on public.support_messages;
create trigger support_auto_reply_trigger after insert on public.support_messages for each row execute function public.support_auto_reply();
create or replace function public.support_send(p_customer uuid,p_body text,p_request uuid,p_language text) returns bigint
language plpgsql security definer set search_path=public as $$
begin
 perform set_config('app.support_language',case when p_language='zh' then 'zh' else 'en' end,true);
 return public.support_send(p_customer,p_body,p_request);
end $$;
revoke all on function public.support_send(uuid,text,uuid,text),public.support_auto_reply() from public,anon;
grant execute on function public.support_send(uuid,text,uuid,text) to authenticated;
insert into storage.buckets(id,name,public,file_size_limit,allowed_mime_types)
values('support-media','support-media',true,5242880,array['image/png','image/jpeg','image/webp']) on conflict(id) do nothing;
drop policy if exists support_media_insert on storage.objects;
create policy support_media_insert on storage.objects for insert to authenticated with check(bucket_id='support-media' and public.support_is_staff());
drop policy if exists support_media_read on storage.objects;
create policy support_media_read on storage.objects for select to anon,authenticated using(bucket_id='support-media');
commit;
