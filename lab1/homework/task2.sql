-- 1 На заказы, сделанные в период с 01.07.2006 по 20.09.2006 сделать скидку 10%
SELECT (orders.amount * 0.9), orders.date, orders.amount
    FROM lab1.orders orders
    WHERE orders.date >= '2006-07-01'
        AND orders.date <= '2006-09-20';

-- 2  Удалить книгу, которая продается меньше всего (по кол-ву продаваемых экземпляров)
SELECT * FROM lab1.order_items
WHERE isbn = (
    SELECT isbn
    FROM lab1.order_items
    GROUP BY isbn
    HAVING COUNT(*) = (
        SELECT MIN(quantity)
        FROM (
                 SELECT COUNT(*) as quantity
                 FROM lab1.order_items
                 GROUP BY isbn
             ) subquery
    )
);

-- Задание 3. Определить правильность суммы заказа, если неверно, то вывести заказ.
SELECT * FROM lab1.orders orders
        WHERE orders.amount !=
              (SELECT SUM(oi.quantity * b.price) FROM lab1.order_items oi
                    JOIN lab1.books b on b.isbn = oi.isbn
                    WHERE oi.order_id = 1 -- orders.id
                    GROUP BY oi.order_id );