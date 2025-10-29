-- Active: 1760457924579@@127.0.0.1@5432@dvdrental@public

-- 🗓 Day 6 — Data Modification (INSERT, UPDATE, DELETE) (৫টি problem)
-- লক্ষ্য: DML command প্র্যাকটিস করা।

--1. নতুন একটা customer যোগ করো (dummy data দিয়ে)।
INSERT INTO
    customer (
        store_id,
        first_name,
        last_name,
        email,
        address_id,
        active
    )
VALUES (
        1,
        'John',
        'Doe',
        'john.doe@example.com',
        5,
        1
    );
--2. সেই customer-এর email address আপডেট করো।
UPDATE customer
SET
    email = 'all@gmail.com'
WHERE
    email = 'john.doe@example.com'
RETURNING
    *;

--3. customer delete করো যার rental সংখ্যা = 0।
DELETE FROM customer
WHERE
    customer_id NOT IN (
        SELECT customer_id
        FROM rental
        GROUP BY
            customer_id
    )
RETURNING
    *;
-- my logic for 3: ami sub query diye age rental table e jei user gula exit kore tader id gula ber koralam ebong tar por customer table er jei customer_id gula subquery er result e nai tarai kuno rental kore nai. tader delete kore dilam.

--5. সব film যেগুলার rental rate 0.99 — তাদের rental_rate ১.৯৯ করো।
SELECT * FROM film WHERE rental_rate BETWEEN 0.99 AND 1.99;

SELECT
    column_name,
    data_type,
    is_nullable,
    column_default
FROM information_schema.columns
WHERE
    table_name = 'customer'