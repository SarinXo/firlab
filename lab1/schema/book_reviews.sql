CREATE TABLE IF NOT EXISTS lab1.book_reviews
(
    isbn VARCHAR(13) NOT NULL
        REFERENCES lab1.books(isbn) ON DELETE CASCADE,
    review TEXT
);