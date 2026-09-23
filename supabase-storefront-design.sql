-- Shared storefront design so published changes appear on every device.
create table if not exists public.storefront_settings (
  id text primary key,
  design jsonb not null default '{}'::jsonb,
  updated_at timestamptz not null default now(),
  updated_by uuid references auth.users(id)
);
alter table public.storefront_settings enable row level security;
revoke all on table public.storefront_settings from anon, authenticated;

create or replace function public.get_storefront_design()
returns jsonb language sql stable security definer set search_path=public
as $$ select coalesce((select design from public.storefront_settings where id='online'),'{}'::jsonb); $$;

create or replace function public.save_storefront_design(p_design jsonb)
returns jsonb language plpgsql security definer set search_path=public
as $$
begin
  if not exists(select 1 from public.profiles where id=auth.uid() and (is_admin or admin_role in ('full_admin','online_manager'))) then
    raise exception 'Administrator access required';
  end if;
  insert into public.storefront_settings(id,design,updated_at,updated_by)
  values('online',coalesce(p_design,'{}'::jsonb),now(),auth.uid())
  on conflict(id) do update set design=excluded.design,updated_at=excluded.updated_at,updated_by=excluded.updated_by;
  return p_design;
end $$;

revoke all on function public.get_storefront_design() from public;
grant execute on function public.get_storefront_design() to anon, authenticated;
revoke all on function public.save_storefront_design(jsonb) from public, anon;
grant execute on function public.save_storefront_design(jsonb) to authenticated;
