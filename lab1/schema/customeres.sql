CREATE TABLE IF NOT EXISTS lab1.customers
(
    id SERIAL PRIMARY KEY ,
    name VARCHAR(60) NOT NULL ,
    address VARCHAR(100) NOT NULL,
    city VARCHAR(30)
);