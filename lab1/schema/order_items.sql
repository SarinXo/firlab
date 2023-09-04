CREATE TABLE IF NOT EXISTS lab1.order_items
(
    order_id INT NOT NULL
        REFERENCES lab1.orders(id) ON DELETE CASCADE,
    isbn VARCHAR(13) NOT NULL
        REFERENCES lab1.books(isbn) ON DELETE CASCADE,
    quantity SMALLINT,

    PRIMARY KEY (order_id, isbn)
);