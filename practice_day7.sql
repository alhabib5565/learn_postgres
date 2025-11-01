-- Active: 1760457924579@@127.0.0.1@5432@dvdrental@public

-- 🗓 Day 7 — Constraints, Indexes, Keys (৫টি problem)
-- লক্ষ্য: data integrity ও performance বোঝা।

--1. একটা নতুন টেবিল তৈরি করো যেখানে primary key থাকবে।
CREATE TABLE accounts (user_id SERIAL PRIMARY KEY);

--2. সেই টেবিলের একটা column-এ foreign key constraint যোগ করো।
ALTER TABLE accounts ADD COLUMN customer_id INT;

ALTER TABLE accounts
ADD CONSTRAINT fk_accounts_customer FOREIGN KEY (customer_id) REFERENCES customer (customer_id);
-- একটা column unique করো (e.g., email)।
ALTER TABLE accounts
ADD CONSTRAINT unique_customer_id UNIQUE (customer_id);
-- একটা INDEX তৈরি করো film.title column-এর ওপর এবং EXPLAIN দিয়ে পার্থক্য দেখো।
CREATE INDEX index_film_title ON film (title);
--joihon ei query ta run hobe tokhon postresql film theke title gula extact kore index_film_title ei index er vitor insert korbe. ami thik bolchi kina? jodi amar doarona thik hoi tahole ami jodi index create korar por film e data insert kori tokhon oisob notun film er taile gula ki index e insert hobe? jodi insert na hoi tahole toh notun row er indexing kaj korbe na
SELECT indexdef FROM pg_indexes WHERE indexname = 'index_film_title';

SELECT
    address_id,
    address,
    district,
    phone
FROM address
WHERE
    phone = '223664661973';

CREATE INDEX idx_address_phone ON address (phone);

EXPLAIN
SELECT
    address_id,
    address,
    district,
    phone
FROM address
WHERE
    phone = '223664661973';