create table designs (
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
create table rates (
  id int primary key default 1 check (id = 1),
  gold22 text, gold24 text, silver text,
  updated_at timestamptz default now()
);
insert into rates (id) values (1);
alter table designs enable row level security;
alter table rates enable row level security;
create policy "public sees live designs" on designs for select to anon using (not is_sold);
create policy "family sees all" on designs for select to authenticated using (true);
create policy "family adds" on designs for insert to authenticated with check (true);
create policy "family edits" on designs for update to authenticated using (true);
create policy "family deletes" on designs for delete to authenticated using (true);
create policy "public sees rates" on rates for select using (true);
create policy "family edits rates" on rates for update to authenticated using (true);
insert into storage.buckets (id, name, public) values ('designs','designs', true);
create policy "family uploads photos" on storage.objects for insert to authenticated with check (bucket_id = 'designs');
create policy "family deletes photos" on storage.objects for delete to authenticated using (bucket_id = 'designs');
