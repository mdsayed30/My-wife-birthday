-- Anusha Birthday V40 — Supabase setup for the existing Chapter 13 gallery sync
-- BEFORE RUNNING: replace every OWNER_EMAIL_HERE with the exact email you will use
-- to sign in to the Owner Mode. Do not put a password, secret key, or service_role key here.

create table if not exists public.gallery_state (
  id integer primary key check (id = 1),
  rev bigint not null default 0,
  data jsonb not null default '{"v":2,"items":[]}'::jsonb,
  updated_at timestamptz not null default now()
);

insert into public.gallery_state (id, rev, data)
values (1, 0, '{"v":2,"items":[]}'::jsonb)
on conflict (id) do nothing;

alter table public.gallery_state enable row level security;
revoke all on table public.gallery_state from anon, authenticated;
grant select on table public.gallery_state to anon, authenticated;
grant update on table public.gallery_state to authenticated;

drop policy if exists "Public can read gallery state" on public.gallery_state;
create policy "Public can read gallery state"
on public.gallery_state for select to anon, authenticated
using (id = 1);

drop policy if exists "Owner can update gallery state" on public.gallery_state;
create policy "Owner can update gallery state"
on public.gallery_state for update to authenticated
using (id = 1 and (auth.jwt() ->> 'email') = 'OWNER_EMAIL_HERE')
with check (id = 1 and (auth.jwt() ->> 'email') = 'OWNER_EMAIL_HERE');

-- Public read access is required for the visitor site to display gallery media.
insert into storage.buckets (id, name, public, file_size_limit)
values ('gallery', 'gallery', true, 52428800)
on conflict (id) do update set public = true, file_size_limit = 52428800;

drop policy if exists "Public can read birthday gallery files" on storage.objects;
create policy "Public can read birthday gallery files"
on storage.objects for select to anon, authenticated
using (bucket_id = 'gallery');

drop policy if exists "Owner can upload birthday gallery files" on storage.objects;
create policy "Owner can upload birthday gallery files"
on storage.objects for insert to authenticated
with check (
  bucket_id = 'gallery'
  and (auth.jwt() ->> 'email') = 'OWNER_EMAIL_HERE'
  and (storage.foldername(name))[1] in ('photos', 'videos')
);

drop policy if exists "Owner can update birthday gallery files" on storage.objects;
create policy "Owner can update birthday gallery files"
on storage.objects for update to authenticated
using (bucket_id = 'gallery' and (auth.jwt() ->> 'email') = 'OWNER_EMAIL_HERE')
with check (bucket_id = 'gallery' and (auth.jwt() ->> 'email') = 'OWNER_EMAIL_HERE');

drop policy if exists "Owner can delete birthday gallery files" on storage.objects;
create policy "Owner can delete birthday gallery files"
on storage.objects for delete to authenticated
using (bucket_id = 'gallery' and (auth.jwt() ->> 'email') = 'OWNER_EMAIL_HERE');

-- Important: this SQL only enables the existing Chapter 13 gallery sync.
-- It does not make all chapter text/settings or browser-local voice recordings cloud-synced.
