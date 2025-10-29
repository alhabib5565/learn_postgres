-- Active: 1760457924579@@127.0.0.1@5432@dvdrental@public

-- 🗓 Day 7 — Constraints, Indexes, Keys (৫টি problem)
-- লক্ষ্য: data integrity ও performance বোঝা।

--1. একটা নতুন টেবিল তৈরি করো যেখানে primary key থাকবে।
CREATE TABLE accounts (user_id SERIAL PRIMARY KEY);

--2. সেই টেবিলের একটা column-এ foreign key constraint যোগ করো।
ALTER TABLE accounts
ADD COLUMN customer_id INT REFERENCES ()
-- একটা column unique করো (e.g., email)।

-- একটা CHECK constraint যোগ করো (যেমন age > 0)।

-- একটা INDEX তৈরি করো film.title column-এর ওপর এবং EXPLAIN দিয়ে পার্থক্য দেখো।