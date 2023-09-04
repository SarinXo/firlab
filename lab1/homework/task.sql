-- 1.	Выведите ФИО клиентов, живущих в Рузаевке:
SELECT DISTINCT name
FROM lab1.customers
WHERE city = 'Рузаевка';

-- 2.	Выведите ISBN книг заказа 5, количество которых больше 1
SELECT isbn
FROM lab1.order_items
WHERE order_id = 5
  AND quantity > 1;

-- 3.	Выведите названия книг, цена которых менее 300 рублей:
SELECT title
FROM lab1.books
WHERE price < 300;

-- 4.	Выведите номера заказов на итоговую сумму от 1000 до 3000 рублей:
SELECT id
FROM lab1.orders
WHERE amount < 3000
  AND amount > 1000;

-- 5.	Выведите номера и даты заказов, сделанных летом (используйте операцию OR для соединения номеров летних месяцев):
SELECT id, date
FROM lab1.orders
WHERE extract(MONTH FROM date) <= 8
  AND extract(MONTH FROM date) >= 6;

-- 6.	Выведите элементы заказов в порядке возрастания количества книг:
SELECT *
FROM lab1.order_items
ORDER BY quantity;

-- 7.	Выведите элементы заказа с номером 5 в порядке возрастания количества книг:
SELECT *
FROM lab1.order_items
WHERE order_id = 5
ORDER BY quantity;

-- 8.	Выведите города и ФИО клиентов, причем названия городов расположите по алфавиту и внутри каждого города ФИО клиентов по алфавиту:
SELECT DISTINCT city, name
FROM lab1.customers
ORDER BY city, name;

-- 9.	Вывести дату самого последнего заказа:
SELECT MAX(date) FROM lab1.orders;

-- 10.	Вывести количество клиентов по городам:
SELECT city, COUNT(DISTINCT name) FROM lab1.customers
GROUP BY city
ORDER BY city;

-- 11.	Вывести количество заказов по каждому клиенту:
SELECT customer_id, COUNT(DISTINCT id) FROM lab1.orders GROUP BY customer_id;

-- 12.	вывести количество заказанных книг по каждому isbn:
SELECT isbn, SUM(DISTINCT quantity)
FROM lab1.order_items
GROUP BY isbn;

-- 13.	вывести фио клиентов, заказавших одну и ту же книгу оптом (в количестве более 10):
SELECT name, quantity
FROM lab1.customers
         JOIN lab1.orders o ON customers.id = o.customer_id
         JOIN lab1.order_items oi ON o.id = oi.order_id
WHERE oi.quantity > 10
GROUP BY name, quantity
ORDER BY quantity DESC;

-- 14.	вывести фамилии авторов и названия книг, заказанных жителями рузаевки:
SELECT b.author, title
FROM lab1.customers c
         JOIN lab1.orders o ON c.id = o.customer_id
         JOIN lab1.order_items oi ON o.id = oi.order_id
         JOIN lab1.books b ON b.isbn = oi.isbn
WHERE c.city = 'рузаевка';

-- 15.	вывести фио первого заказчика:
SELECT name
FROM lab1.customers
WHERE id = (SELECT o.customer_id
                FROM lab1.orders o
                WHERE date = (SELECT min(date) FROM lab1.orders));

--16.	Вывести ФИО клиента, заказавшего наибольшее количество одной и той же книги:
SELECT lab1.customers.name, lab1.books.title, lab1.order_items.quantity FROM lab1.order_items
        JOIN lab1.books ON lab1.order_items.isbn = lab1.books.isbn
        JOIN lab1.orders ON lab1.order_items.order_id = lab1.orders.id
        JOIN lab1.customers ON lab1.orders.customer_id = lab1.customers.id
WHERE lab1.order_items.quantity = (SELECT MAX(quantity) FROM lab1.order_items);



--17. Вывести номер месяца, в котором был сделан заказ на наибольшую сумму
SELECT extract(MONTH FROM date)
FROM lab1.orders
WHERE amount = (SELECT MAX(amount) FROM lab1.orders)