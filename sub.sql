-- Active: 1760457924579@@127.0.0.1@5432@ph@public
id SERIAL PRIMARY KEY, -- প্রতিটি প্রোডাক্টের ইউনিক আইডি
name VARCHAR(100) NOT NULL, -- প্রোডাক্টের নাম
price DECIMAL(10, 2) NOT NULL, -- প্রোডাক্টের মূল্য
stock INT NOT NULL -- প্রোডাক্টের স্টকে থাকা পরিমাণ
;

INSERT INTO
    products (name, price, stock)
VALUES ('Laptop', 80000.00, 50),
    ('Smartphone', 40000.00, 100),
    ('Tablet', 25000.00, 30),
    ('Monitor', 15000.00, 75),
    ('Keyboard', 2000.00, 150);

CREATE TABLE orders (
    id SERIAL PRIMARY KEY, -- প্রতিটি অর্ডারের ইউনিক আইডি
    product_id INT NOT NULL, -- প্রোডাক্ট আইডি (যে প্রোডাক্ট অর্ডার করা হয়েছে)
    quantity INT NOT NULL, -- অর্ডার করা প্রোডাক্টের পরিমাণ
    order_date DATE NOT NULL, -- অর্ডার করার তারিখ
    total_price DECIMAL(10, 2) NOT NULL -- অর্ডারের মোট মূল্য
);

INSERT INTO
    orders (
        product_id,
        quantity,
        order_date,
        total_price
    )
VALUES (1, 2, '2024-01-01', 160000.00),
    (2, 1, '2024-01-02', 40000.00),
    (3, 3, '2024-01-03', 75000.00),
    (4, 5, '2024-01-04', 75000.00),
    (5, 10, '2024-01-05', 20000.00);

SELECT * FROM products;

SELECT * FROM orders;

-- সেইসব প্রোডাক্টের নাম বের করো যেগুলোর দাম যেকোনো একটি অর্ডারের মোট মূল্য এর চেয়ে কম।
SELECT *
FROM products
WHERE
    price < (
        SELECT total_price
        FROM orders
        LIMIT 1
    );

-- সেইসব প্রোডাক্টের নাম বের করো যেগুলোর জন্য অন্তত একটি অর্ডার করা হয়েছে।
SELECT name
FROM products
WHERE
    EXISTS (
        SELECT 1
        FROM orders
        WHERE
            products.id = orders.product_id
    );

SELECT * FROM employees;

SELECT * FROM employees
WHERE department_id = (
    SELECT department_id FROM departments;

);

SELECT department_id FROM departments;