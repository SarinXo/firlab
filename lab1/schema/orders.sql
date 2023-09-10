CREATE TABLE IF NOT EXISTS lab1.orders
(
    id SERIAL PRIMARY KEY ,
    customer_id int NOT NULL
        REFERENCES lab1.customers(id) ON DELETE CASCADE,
    amount NUMERIC(8, 2),
    date DATE NOT NULL
);