-- Active: 1760457924579@@127.0.0.1@5432@dvdrental@public

-- 🗓 Day 4 — Subquery, View, Functions (৫টি problem)
-- লক্ষ্য: subquery, view তৈরি, extract/date function ইত্যাদি।

--1. এমন সব film দেখাও যাদের length average length এর চেয়ে বেশি।
SELECT title, "length"
FROM film
WHERE
    "length" > (
        SELECT avg(length)
        FROM film
    );
--2. এমন সব customer দেখাও যারা সবচেয়ে বেশি rental করেছে।
SELECT count(customer.customer_id), customer_id
FROM rental
    JOIN customer ON rental.customer_id = customer.customer_id
GROUP BY
    customer.customer_id
ORDER BY count DESC
LIMIT 10;
--3. rental table থেকে প্রতিদিনের মোট revenue বের করো (GROUP BY rental_date::date)।
SELECT
    sum(amount),
    rental_date::date as date_of_rent
FROM rental
    JOIN payment USING (rental_id)
GROUP BY
    date_of_rent;
--4. একটা view তৈরি করো: customer_rentals_view — যেখানে থাকবে customer name ও তার rental count।
CREATE VIEW customer_rentals_view as
SELECT first_name, last_name, count(*)
FROM customer
    JOIN rental USING (customer_id)
GROUP BY
    customer_id;

SELECT * FROM customer_rentals_view;
--5. সেই view থেকে শুধু top 5 customer বের করো যাদের rental সবচেয়ে বেশি।
SELECT * FROM customer_rentals_view ORDER BY count DESC LIMIT 5;