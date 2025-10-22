-- Active: 1760457924579@@127.0.0.1@5432@dvdrental@public

-- 🗓 Day 2 — Aggregate Functions & Grouping (৫টি problem)
-- 1. প্রতিটা category অনুযায়ী film এর সংখ্যা দেখাও।
SELECT count(category_id)
FROM film
    join film_category USING (film_id)
GROUP BY
    category_id;
-- 2. প্রতিটা customer কতগুলো rental করেছে, সেই সংখ্যা বের করো।
SELECT count(*)
FROM rental
    JOIN customer USING (customer_id)
GROUP BY
    customer_id;
-- 3. rental table থেকে মোট revenue (amount) বের করো।
SELECT sum(amount) FROM rental JOIN payment USING (customer_id);
-- 4. প্রতিটা city অনুযায়ী কতজন customer আছে, সেটা দেখাও।
SELECT city_id, count(city_id)
from customer
    JOIN address USING (address_id)
GROUP BY
    city_id;
-- 5. শুধু সেই city গুলো দেখাও যেগুলায় customer সংখ্যা ৫-এর বেশি।
SELECT city_id, count(city_id) AS c
from customer
    JOIN address USING (address_id)
GROUP BY
    city_id
HAVING
    count(city_id) > 5;

SELECT customer_id, sum(amount)
FROM payment
GROUP BY
    customer_id
HAVING
    sum(amount) > 200;

SELECT *
FROM store
    JOIN address USING (address_id)
    JOIN customer USING (address_id);