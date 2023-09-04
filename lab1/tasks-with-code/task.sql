-- информация о таблицах
SELECT * FROM information_schema.tables where table_schema='lab1';

-- информация о таблице
SELECT * FROM information_schema.columns
WHERE table_name = 'orders';

SELECT *
FROM lab1.orders
WHERE customer_id = 5;

SELECT *
FROM lab1.orders
WHERE amount > 1000;

SELECT *
FROM lab1.orders
WHERE customer_id = 5
  AND amount > 1000;

SELECT *
FROM lab1.orders
WHERE extract(MONTH FROM date) = 7;

SELECT title
FROM lab1.books
WHERE title LIKE ('MySQL %');

SELECT title
FROM lab1.books
WHERE title NOT LIKE ('%для чайников%');

SELECT id, date
FROM lab1.orders
ORDER BY date;

