
SELECT amount
    FROM orders
WHERE orders.customer_id =
      (SELECT orders.id
       FROM orders
       WHERE orders.customer_id = (SELECT users.customer_id
                                   FROM users
                                   WHERE users.login = 'rus')
         AND orders.date >= '2006-07-01'
         AND orders.date <= '2006-09-20');

UPDATE orders
    SET amount = orders.amount*0.9
        WHERE orders.customer_id =
(SELECT orders.id
    FROM orders
        WHERE orders.customer_id = (SELECT users.customer_id
                                         FROM users
                                            WHERE users.login = '')
        AND orders.date >= '2006-07-01'
        AND orders.date <= '2006-09-20');

DELETE
    FROM order_items
    WHERE order_items.order_id =
        (SELECT order_items.order_id
            FROM (SELECT *
                  FROM orders
                  WHERE orders.customer_id = (SELECT users.customer_id
                                              FROM users
                                              WHERE users.login = 'user2')
                 ) t,
                order_items
            WHERE order_items.quantity =
                 (SELECT MIN(quantity)
                    FROM order_items
                        WHERE order_items.order_id IN
                (SELECT orders.id
                 FROM orders
                 WHERE orders.customer_id = (SELECT users.customer_id
                                             FROM users
                                             WHERE users.login = 'user2')
                ))
            AND order_items.order_id = t.id

            );


SELECT *
FROM order_items
WHERE order_items.order_id =
      (SELECT order_items.order_id
       FROM (SELECT *
             FROM orders
             WHERE orders.customer_id = (SELECT users.customer_id
                                         FROM users
                                         WHERE users.login = 'user2')
            ) t,
            order_items
       WHERE order_items.quantity =
             (SELECT MIN(quantity)
              FROM order_items
              WHERE order_items.order_id IN
                    (SELECT orders.id
                     FROM orders
                     WHERE orders.customer_id = (SELECT users.customer_id
                                                 FROM users
                                                 WHERE users.login = 'user2')
                    ))
         AND order_items.order_id = t.id

      )LIMIT 1;

DELETE
    FROM orders
WHERE orders.amount <1500
AND orders.customer_id = 2;

SELECT orders.*, sub_total.s AS sub_total
FROM firsova.orders orders
         JOIN (
    SELECT oi.order_id, SUM(oi.quantity * b.price) s
    FROM firsova.order_items oi
             JOIN firsova.books b ON b.isbn = oi.isbn
    WHERE oi.order_id IN (SELECT orders.id
                         FROM orders
                         WHERE orders.customer_id =
                               (SELECT users.customer_id
                                FROM users
                                WHERE users.login = 'user2'))
    GROUP BY oi.order_id
) sub_total ON sub_total.order_id = orders.id
WHERE orders.amount != sub_total.s;

SELECT * FROM orders WHERE customer_id = 2;

UPDATE orders
SET amount = orders.amount*0.9
WHERE orders.customer_id IN
      (SELECT o.customer_id
       FROM (SELECT * FROM orders) as o
       WHERE o.customer_id = (SELECT users.customer_id
                                   FROM users
                                   WHERE users.login = 'user2')
         AND o.date >= '2006-07-01'
         AND o.date <= '2006-09-20');