-- ==========================================================
-- কাস্টম ব্যানার ইমেজের জন্য নতুন টেবিল ও নিরাপত্তা নিয়ম
-- (তোমার নিজের ডিজাইন করা ব্যানার ছবি আপলোড করার জন্য, যেমন Daraz এর
--  "সেরা সব টিভিতে" স্টাইলের ব্যানার)
-- Supabase এর SQL Editor এ পুরোটা একবারে Run করো
-- ==========================================================

create table if not exists banners (
  id bigint generated always as identity primary key,
  image_url text not null,
  link_category text,
  active boolean not null default true,
  created_at timestamptz not null default now()
);

alter table banners enable row level security;

-- সবাই শুধু active ব্যানার দেখতে পারবে
create policy "public read active banners"
on banners for select
to public
using (active = true);

-- লগইন করা এডমিন সব ব্যানার দেখতে পারবে
create policy "admin read all banners"
on banners for select
to authenticated
using (true);

-- শুধু এডমিন ব্যানার যোগ/আপডেট/ডিলিট করতে পারবে
create policy "admin can insert banners"
on banners for insert
to authenticated
with check (true);

create policy "admin can update banners"
on banners for update
to authenticated
using (true)
with check (true);

create policy "admin can delete banners"
on banners for delete
to authenticated
using (true);
