-- 1. Create tables
create table if not exists designs (
  id uuid primary key default gen_random_uuid(),
  code text unique not null,
  name text not null,
  metal text not null check (metal in ('Gold','Silver')),
  category text not null,
  purity text,
  est_weight text,
  length text,
  note text,
  image_path text not null,
  is_sold boolean not null default false,
  created_at timestamptz not null default now()
);

create table if not exists rates (
  id int primary key default 1 check (id = 1),
  gold22 text, gold24 text, silver text,
  updated_at timestamptz default now()
);

insert into rates (id) values (1) on conflict (id) do nothing;

-- 2. Enable Row Level Security (RLS)
alter table designs enable row level security;
alter table rates enable row level security;

-- 3. Grant table permissions to PostgREST roles (anon & authenticated)
grant usage on schema public to anon, authenticated;
grant select on table public.designs to anon;
grant all on table public.designs to authenticated;
grant select on table public.rates to anon;
grant all on table public.rates to authenticated;

-- 4. Row Level Security policies
drop policy if exists "public sees live designs" on designs;
create policy "public sees live designs" on designs for select to anon using (not is_sold);

drop policy if exists "family sees all" on designs;
create policy "family sees all" on designs for select to authenticated using (true);

drop policy if exists "family adds" on designs;
create policy "family adds" on designs for insert to authenticated with check (true);

drop policy if exists "family edits" on designs;
create policy "family edits" on designs for update to authenticated using (true);

drop policy if exists "family deletes" on designs;
create policy "family deletes" on designs for delete to authenticated using (true);

drop policy if exists "public sees rates" on rates;
create policy "public sees rates" on rates for select using (true);

drop policy if exists "family edits rates" on rates;
create policy "family edits rates" on rates for update to authenticated using (true);

-- 5. Storage bucket & policies
insert into storage.buckets (id, name, public) values ('designs','designs', true) on conflict (id) do nothing;

drop policy if exists "family uploads photos" on storage.objects;
create policy "family uploads photos" on storage.objects for insert to authenticated with check (bucket_id = 'designs');

drop policy if exists "family deletes photos" on storage.objects;
create policy "family deletes photos" on storage.objects for delete to authenticated using (bucket_id = 'designs');
