-- Active: 1760457924579@@127.0.0.1@5432@dvdrental@public
CREATE TABLE product_groups (
    group_id serial PRIMARY KEY,
    group_name VARCHAR(255) NOT NULL
);

CREATE TABLE products (
    product_id serial PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    price DECIMAL(11, 2),
    group_id INT NOT NULL,
    FOREIGN KEY (group_id) REFERENCES product_groups (group_id)
);

INSERT INTO
    product_groups (group_name)
VALUES ('Smartphone'),
    ('Laptop'),
    ('Tablet');

INSERT INTO
    products (product_name, group_id, price)
VALUES ('Microsoft Lumia', 1, 200),
    ('HTC One', 1, 400),
    ('Nexus', 1, 500),
    ('iPhone', 1, 900),
    ('HP Elite', 2, 1200),
    ('Lenovo Thinkpad', 2, 700),
    ('Sony VAIO', 2, 700),
    ('Dell Vostro', 2, 800),
    ('iPad', 3, 700),
    ('Kindle Fire', 3, 150),
    ('Samsung Galaxy Tab', 3, 200);

SELECT avg(price) FROM products;

SELECT group_name, AVG(price)
FROM products
    INNER JOIN product_groups USING (group_id)
GROUP BY
    group_name;

SELECT
    product_name,
    price,
    group_name,
    AVG(price) OVER (
        PARTITION BY
            group_name
    )
FROM products
    INNER JOIN product_groups USING (group_id);

SELECT DISTINCT
    price,
    dense_rank
FROM (
        SELECT price, dense_rank() OVER (
                ORDER BY price DESC
            )
        FROM products
    )

SELECT
    *,
    LAG(amount, 1) OVER (
        PARTITION BY
            customer_id
        ORDER BY payment_id
    ) AS pve_amount,
    amount - LAG(amount, 1) OVER (
        PARTITION BY
            customer_id
        ORDER BY payment_id
    ) AS pve_amount
FROM payment
ORDER BY customer_id, payment_date
LIMIT 20;