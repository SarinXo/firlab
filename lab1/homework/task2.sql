-- 1 На заказы, сделанные в период с 01.07.2006 по 20.09.2006 сделать скидку 10%
UPDATE lab1.orders orders
    SET amount = orders.amount*0.9
    WHERE orders.date >= '2006-07-01'
        AND orders.date <= '2006-09-20';

SELECT orders.date, orders.amount
    FROM lab1.orders orders
    WHERE orders.date >= '2006-07-01'
        AND orders.date <= '2006-09-20';

-- 2  Удалить книгу, которая продается меньше всего (по кол-ву продаваемых экземпляров)
DELETE FROM lab1.books WHERE isbn = (
 SELECT s.isbn
    FROM(
        SELECT isbn, SUM(quantity) AS q
        FROM lab1.order_items
        GROUP BY isbn
    ) AS s
    WHERE s.q =(
        SELECT MIN(q)
        FROM (
            SELECT SUM(quantity) AS q
                FROM lab1.order_items
                GROUP BY isbn
        ) AS i
     )
);

-- Задание 3. Определить правильность суммы заказа, если неверно, то вывести заказ.
SELECT * FROM lab1.orders orders
        WHERE orders.amount !=(
            SELECT SUM(oi.quantity * b.price)
            FROM lab1.order_items oi
            JOIN lab1.books b on b.isbn = oi.isbn
                WHERE oi.order_id = orders.id
                GROUP BY oi.order_id );