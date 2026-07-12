-- এই একটা লাইন Supabase এর SQL Editor এ Run করো (একবারই লাগবে)
-- এটা "products" টেবিলে সেলারের দেওয়া Quantity সংরক্ষণের জন্য একটা নতুন কলাম যোগ করবে

alter table products add column if not exists requested_stock integer;
