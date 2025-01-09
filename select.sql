-- Active: 1727920009057@@127.0.0.1@5432@test@public
SELECT * FROM categories;

-- Aliasing column name
SELECT description as des FROM categories;

-- ordering 
SELECT * FROM categories ORDER BY category_id ASC;

-- DISTINCT
SELECT DISTINCT city FROM customers

SELECT * FROM customers 
    WHERE country = 'Mexico' OR postal_code ='05021';

SELECT * FROM products;

-- funtions
SELECT UPPER(product_name) as "upper_product_name"  FROM products ;
SELECT LENGTH(product_name) as "product_name_length"  FROM products;
SELECT round(price) as "round_price"  FROM products;

SELECT COUNT(*) FROM products;
SELECT avg(price) FROM products;