-- Day 5 — Subquery, EXISTS, IN, ANY, ALL (৫টি problem)
--লক্ষ্য: nested query বোঝা, filtering by subquery.

--1. এমন সব film দেখাও যাদের length সেই film-এর average length এর চেয়ে বেশি।
SELECT title, "length"
FROM film
WHERE
    "length" > (
        SELECT AVG("length")
        FROM film
    );

--2. এমন সব customer দেখাও যারা অন্তত ১টা rental করেছে।
SELECT *
FROM customer
    JOIN rental USING (customer_id)
ORDER BY customer_id;
--jehetu customer rental korlei tar id rental table pawa jabe. tai ami inner join use kore jader rent ache tader nicchi
--3. এমন সব film দেখাও যেগুলা কোনো customer এখনো rent করেনি।
SELECT *
FROM film f
WHERE
    f.film_id NOT IN (
        SELECT inventory.film_id
        FROM rental
            JOIN inventory USING (inventory_id)
    );
--4. এমন সব actor দেখাও যারা Comedy category-এর film-এ অভিনয় করেছে।
SELECT *
FROM
    film_category
    JOIN category USING (category_id)
    JOIN film USING (film_id)
    JOIN film_actor USING (film_id)
    JOIN actor USING (actor_id)
WHERE
    name = 'Comedy';
-- ami eikhae ki vull korchi?
--5. এমন সব film দেখাও যাদের rental rate > average rental rate of all films।
SELECT *
FROM film
WHERE
    rental_rate > (
        SELECT AVG(rental_rate)
        FROM film
    );