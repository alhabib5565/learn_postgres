-- Active: 1727920009057@@127.0.0.1@5432@ph@public

CREATE TABLE "user" (
    id SERIAL PRIMARY KEY,
    username VARCHAR(50)
);

CREATE TABLE post (
    id SERIAL PRIMARY KEY,
    title TEXT,
    user_id INT REFERENCES "user"(id)
);

DROP Table post;

INSERT INTO "user" (username)
VALUES 
('john_doe'),
('jane_smith'),
('michael_brown');

INSERT INTO post (title, user_id)
VALUES 
-- ('Understanding SQL Basics', 1),
-- ('Advanced SQL Joins', 1),
-- ('How to Use PostgreSQL', 2),
-- ('Database Design Principles', 3),
('Getting Started with SQL', 26);

SELECT * FROM post;