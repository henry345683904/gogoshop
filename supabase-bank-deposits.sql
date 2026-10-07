-- Shared offline cash deposits, restricted to full administrators.
begin;
create table if not exists public.bank_deposits (
  id text primary key,
  amount numeric(12,2) not null check (amount > 0),
  date date not null,
  created_by uuid not null default auth.uid() references auth.users(id),
  created_at timestamptz not null default now(),
  deleted_at timestamptz
);
alter table public.bank_deposits enable row level security;
revoke all on public.bank_deposits from anon, authenticated;
grant select, insert on public.bank_deposits to authenticated;
grant update (deleted_at) on public.bank_deposits to authenticated;
drop policy if exists bank_deposits_full_admin on public.bank_deposits;
create policy bank_deposits_full_admin on public.bank_deposits
  for all to authenticated
  using (exists (select 1 from public.profiles p where p.id = auth.uid() and p.is_admin = true))
  with check (exists (select 1 from public.profiles p where p.id = auth.uid() and p.is_admin = true));
commit;
