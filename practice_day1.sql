-- Active: 1760457924579@@127.0.0.1@5432@dvdrental@public

-- 🗓 Day 1 — Basic SELECT, WHERE, ORDER BY (৫টি problem)

-- 1. সব customers-এর নাম (first_name, last_name) দেখাও।
SELECT first_name, last_name FROM customer;

-- 2. শুধু সেই customers দেখাও যাদের country = 'Canada'.
SELECT *
FROM
    customer
    JOIN address ON customer.address_id = address.address_id
    JOIN city ON city.city_id = address.city_id
    JOIN country ON country.country_id = city.country_id
WHERE
    country = 'Canada';
--problem 2: same table multiple time repeat hocche.

-- 3. সব film-এর title আর length দেখাও, length অনুসারে descending সাজাও।
SELECT title, "length" FROM film ORDER BY "length" DESC;

-- 4. যেসব film-এর length 100–120 মিনিটের মধ্যে, শুধু সেগুলো দেখাও।SELECT title, "length"
SELECT title, "length"
FROM film
WHERE
    "length" >= 100
    AND "length" <= 120
ORDER BY "length";

-- 5. সব actor-এর নাম দেখাও, কিন্তু শুধু প্রথম 10 জন।
SELECT * FROM actor LIMIT 10;