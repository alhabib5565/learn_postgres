-- Active: 1760457924579@@127.0.0.1@5432@dvdrental@public

-- 🗓 Day 3 — Joins (৫টি problem)
-- লক্ষ্য: INNER, LEFT JOIN, একাধিক table combine করা।

-- 1.customer-এর নাম ও তাদের city দেখাও।
SELECT first_name, last_name, city
FROM customer
    JOIN address USING (address_id)
    JOIN city USING (city_id);
-- 2.প্রতিটা film-এর title ও category name দেখাও।
SELECT title, name
FROM
    film
    JOIN film_category USING (film_id)
    JOIN category USING (category_id);
-- 3.প্রতিটা rental-এর সাথে সেই customer-এর নাম দেখাও।
SELECT * FROM rental JOIN customer USING (customer_id);
-- 4.যেসব film rent হয়েছে, কিন্তু “inventory” তে আর available নেই — সেইগুলা বের করো।
select *
FROM film
    JOIN inventory ON film.film_id != inventory.film_id
    JOIN rental USING (inventory_id);
-- 5.সব film দেখাও সাথে actor-এর নামসহ (film_actor join করে)।
SELECT *
FROM film
    JOIN film_actor USING (film_id)
    JOIN actor USING (actor_id);