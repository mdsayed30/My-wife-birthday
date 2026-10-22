-- =====================================================================
-- Anusha Birthday V41 — Supabase setup (safe to run more than once)
-- ONLY ONE EDIT NEEDED: in step 1 below, on the line marked "THE ONE LINE YOU EDIT",
-- replace the placeholder text between the quotes with the exact email of your Owner login user.
-- Create that user first: Authentication > Users > Add user.
-- Never put a password, secret key or service_role key in this file.
-- =====================================================================

-- 1) WHO IS THE OWNER (matched by user id, not by editable text) ---------
create table if not exists public.owners (
  user_id uuid primary key references auth.users(id) on delete cascade
);
alter table public.owners enable row level security;
revoke all on table public.owners from anon, authenticated;   -- nobody can read/write it from the website

create or replace function public.is_owner()
returns boolean
language sql stable security definer
set search_path = public
as $$ select exists (select 1 from public.owners where user_id = auth.uid()) $$;
revoke all on function public.is_owner() from public;
grant execute on function public.is_owner() to anon, authenticated;

-- >>> THE ONE LINE YOU EDIT <<<
insert into public.owners (user_id)
select id from auth.users where email = 'OWNER_EMAIL_HERE'
on conflict do nothing;

do $$
begin
  if not exists (select 1 from public.owners) then
    raise exception 'No owner registered. Create the Owner user in Authentication > Users first, put its exact email in the marked line of step 1, then run again.';
  end if;
end $$;

-- 2) GALLERY LIST (photos / videos / captions / dates / messages / order) --
create table if not exists public.gallery_state (
  id integer primary key check (id = 1),
  rev bigint not null default 0,
  data jsonb not null default '{"v":2,"items":[]}'::jsonb,
  updated_at timestamptz not null default now()
);
insert into public.gallery_state (id, rev, data)
values (1, 0, '{"v":2,"items":[]}'::jsonb) on conflict (id) do nothing;
alter table public.gallery_state enable row level security;
revoke all on table public.gallery_state from anon, authenticated;
grant select on table public.gallery_state to anon, authenticated;
grant update on table public.gallery_state to authenticated;
drop policy if exists "Public can read gallery state" on public.gallery_state;
create policy "Public can read gallery state" on public.gallery_state
  for select to anon, authenticated using (id = 1);
drop policy if exists "Owner can update gallery state" on public.gallery_state;
create policy "Owner can update gallery state" on public.gallery_state
  for update to authenticated
  using (id = 1 and public.is_owner()) with check (id = 1 and public.is_owner());

-- 3) SITE SETTINGS (owner voice message + website song) -------------------
create table if not exists public.site_settings (
  id integer primary key check (id = 1),
  rev bigint not null default 0,
  data jsonb not null default '{}'::jsonb,
  updated_at timestamptz not null default now()
);
insert into public.site_settings (id, rev, data)
values (1, 0, '{}'::jsonb) on conflict (id) do nothing;
alter table public.site_settings enable row level security;
revoke all on table public.site_settings from anon, authenticated;
grant select on table public.site_settings to anon, authenticated;
grant update on table public.site_settings to authenticated;
drop policy if exists "Public can read site settings" on public.site_settings;
create policy "Public can read site settings" on public.site_settings
  for select to anon, authenticated using (id = 1);
drop policy if exists "Owner can update site settings" on public.site_settings;
create policy "Owner can update site settings" on public.site_settings
  for update to authenticated
  using (id = 1 and public.is_owner()) with check (id = 1 and public.is_owner());

-- 4) STORAGE: "gallery" bucket = public media (photos, videos, owner voice/song)
insert into storage.buckets (id, name, public, file_size_limit)
values ('gallery', 'gallery', true, 52428800)
on conflict (id) do update set public = true, file_size_limit = 52428800;

-- remove the old policies (including the old public "list everything" one)
drop policy if exists "Public can read birthday gallery files"   on storage.objects;
drop policy if exists "Owner can upload birthday gallery files"  on storage.objects;
drop policy if exists "Owner can update birthday gallery files"  on storage.objects;
drop policy if exists "Owner can delete birthday gallery files"  on storage.objects;
-- (public files are still served by their direct links; the bucket can no longer be listed by visitors)

create policy "Owner can read birthday gallery files" on storage.objects
  for select to authenticated using (bucket_id = 'gallery' and public.is_owner());
create policy "Owner can upload birthday gallery files" on storage.objects
  for insert to authenticated
  with check (bucket_id = 'gallery' and public.is_owner()
              and (storage.foldername(name))[1] in ('photos', 'videos', 'site'));
create policy "Owner can update birthday gallery files" on storage.objects
  for update to authenticated
  using (bucket_id = 'gallery' and public.is_owner())
  with check (bucket_id = 'gallery' and public.is_owner());
create policy "Owner can delete birthday gallery files" on storage.objects
  for delete to authenticated using (bucket_id = 'gallery' and public.is_owner());

-- 5) STORAGE: "voice" bucket = PRIVATE recordings from Anusha ------------
insert into storage.buckets (id, name, public, file_size_limit, allowed_mime_types)
values ('voice', 'voice', false, 10485760,
  array['audio/webm','audio/ogg','audio/opus','audio/mp4','audio/mpeg','audio/mp3','audio/x-m4a','audio/m4a',
        'audio/mp4a-latm','audio/aac','audio/wav','audio/x-wav','audio/wave','audio/3gpp','audio/3gpp2',
        'audio/amr','audio/flac','video/webm','video/mp4'])
on conflict (id) do update set public = false, file_size_limit = 10485760,
  allowed_mime_types = excluded.allowed_mime_types;

drop policy if exists "Anyone can upload Anusha recordings" on storage.objects;
drop policy if exists "Owner can read Anusha recordings"    on storage.objects;
drop policy if exists "Owner can delete Anusha recordings"  on storage.objects;

-- Anusha's phone (not signed in) may ONLY ADD files into ch5/ and ch10/. It can never read, list, change or delete.
create policy "Anyone can upload Anusha recordings" on storage.objects
  for insert to anon, authenticated
  with check (bucket_id = 'voice' and (storage.foldername(name))[1] in ('ch5', 'ch10'));
create policy "Owner can read Anusha recordings" on storage.objects
  for select to authenticated using (bucket_id = 'voice' and public.is_owner());
create policy "Owner can delete Anusha recordings" on storage.objects
  for delete to authenticated using (bucket_id = 'voice' and public.is_owner());

-- Done. Next: Authentication > Sign In / Providers > turn OFF "Allow new users to sign up".
