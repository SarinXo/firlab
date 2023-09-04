CREATE TABLE IF NOT EXISTS lab1.books
(
    isbn VARCHAR(13) NOT NULL PRIMARY KEY,
    author VARCHAR(50),
    title VARCHAR(100),
    price NUMERIC(6, 2)
);