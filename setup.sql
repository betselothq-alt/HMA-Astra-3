-- HMA Astra Club - Supabase setup additions
-- Run this after the main HMA Astra schema/policies.

alter table public.courses
  add column if not exists instructor text;

alter table public.sessions
  add column if not exists end_at timestamptz;

create or replace function public.handle_new_user()
returns trigger
language plpgsql
security definer
set search_path = public
as $$
begin
  insert into public.profiles (id, full_name, email, role)
  values (
    new.id,
    coalesce(new.raw_user_meta_data->>'full_name', split_part(new.email, '@', 1)),
    new.email,
    'Member'
  )
  on conflict (id) do nothing;
  return new;
end;
$$;

drop trigger if exists on_auth_user_created on auth.users;

create trigger on_auth_user_created
after insert on auth.users
for each row
execute function public.handle_new_user();

-- After your first account is registered, change YOUR_EMAIL to your admin email
-- and run this once to make yourself the club Admin.
-- update public.profiles set role = 'Admin' where email = 'YOUR_EMAIL';
