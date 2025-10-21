-- Active: 1760457924579@@127.0.0.1@5432@ph@public

SELECT * FROM "user";

INSERT INTO "user" (username) VALUES ('habib');

SELECT * FROM post;

SELECT * FROM "user" INNER JOIN "post" ON post.id = "user".id;

SELECT p.title, p.id, u.username
FROM post p
    JOIN "user" u ON u.id = p.id;

SELECT * FROM "user" left JOIN post ON "user".id = post.user_id;