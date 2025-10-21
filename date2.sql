-- Active: 1760457924579@@127.0.0.1@5432@ph@public

SELECT CURRENT_DATE;

SELECT current_time;

SELECT current_timestamp;

SELECT CURRENT_TIMESTAMP::date;

SELECT CURRENT_TIMESTAMP::time;

SELECT to_char(CURRENT_TIMESTAMP, 'yyyy-HH');

SELECT CURRENT_DATE - INTERVAL '2 days';

SELECT age (CURRENT_DATE, '2005-04-17');

SELECT extract( YEAR FROM current_date );

SELECT * FROM products;

SELECT extract(
        YEAR
        from current_date
    ) as YEAR, extract(
        MONTH
        from current_date
    ) as MONTH;

SELECT EXTRACT(
        HOUR
        FROM current_time
    ) as h, extract(
        MINUTE
        FROM CURRENT_TIME
    ) as m;

SELECT * FROM employees;