-- 🧠 Day 8 — Window Functions Practice Set
-- 🧩 1.প্রতিটা customer কতগুলো rental করেছে সেটা বের করো এবং rank করো (সবচেয়ে বেশি rental → rank 1)।

SELECT customer_id, COUNT(*), RANK() OVER (
        ORDER BY COUNT(*)
    )
FROM rental
GROUP BY
    customer_id;
--explation: rental gula at 1st group kore nilam customer er upor base kore. tarpor ekek jon koita kore rental korchen tar upor base kore ranking korlam;

-- 2. প্রতিটা city অনুযায়ী total rental amount বের করো এবং rank দেখাও (সবচেয়ে বেশি → 1)।
SELECT city, sum(rental_rate), RANK() OVER (
        ORDER BY SUM(rental_rate) ASC
    )
FROM
    rental
    JOIN customer USING (customer_id)
    JOIN address USING (address_id)
    JOIN city USING (city_id)
    JOIN inventory USING (inventory_id)
    JOIN film USING (film_id)
GROUP BY
    city_id;

--3. film table থেকে length অনুযায়ী প্রতিটা film-কে rank করো এবং top 5 film দেখাও।
SELECT *, RANK() OVER (
        ORDER BY "length" DESC
    )
FROM film
LIMIT 5;

-- 4 প্রতিটা category অনুযায়ী film গুলোকে length অনুসারে সাজিয়ে rank করো।
SELECT *, RANK() OVER (
        PARTITION BY
            category_id
        ORDER BY "length" ASC
    )
FROM
    film_category
    JOIN film USING (film_id)
    JOIN category USING (category_id);

-- 5. payment টেবিলে প্রতিটা customer-এর payment history দেখাও, এবং আগের payment amount টা (previous payment) হিসেবে দেখাও।
SELECT *, LAG(amount) OVER ( PARTITION BY customer_id ) FROM payment;

-- 🧩 6.

-- payment টেবিলে প্রতিটা customer-এর current এবং next payment amount দেখাও।

-- 🧩 7.

-- film table-এ length অনুসারে film গুলোকে 4 ভাগে ভাগ করো (quartile ranking)।

-- 🧩 8.

-- প্রতিটা customer-এর total payment এবং cumulative sum (running total) দেখাও।

-- 🧩 9.

-- প্রতিটা store অনুযায়ী average rental duration বের করো। তারপর দেখাও কোন film গুলোর duration সেই average-এর উপরে আছে।

-- 🧩 10.

-- payment টেবিলে প্রতিটা দিন অনুযায়ী মোট payment দেখাও এবং পাশাপাশি আগের দিনের তুলনায় পার্থক্য (difference) দেখাও।