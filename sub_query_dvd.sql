-- Active: 1760457924579@@127.0.0.1@5432@dvdrental@public
SELECT country_id FROM country WHERE country = 'United States';

SELECT city
FROM city
WHERE
    country_id = (
        SELECT country_id
        FROM country
        WHERE
            country = 'United States'
    )
ORDER BY city;

-- First, retrieve film_id of the film with the category Action:
SELECT film_id
FROM film_category
WHERE
    category_id = (
        SELECT category_id
        FROM category
        WHERE
            name = 'Action'
    );

SELECT film_id
FROM film_category
    JOIN category USING (category_id)
WHERE
    "name" = 'Action';

SELECT *
FROM film
WHERE
    film_id IN (
        SELECT film_id
        FROM film_category
            JOIN category USING (category_id)
        WHERE
            "name" = 'Action'
    )
ORDER BY film_id;