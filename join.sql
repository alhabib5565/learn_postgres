-- Active: 1727920009057@@127.0.0.1@5432@ph@public

SELECT * FROM "user";
SELECT * FROM post;

SELECT title, username FROM post AS p
JOIN "user" AS u ON p.id = u.id