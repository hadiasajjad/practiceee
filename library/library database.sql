CREATE TABLE Books (
    book_id INTEGER PRIMARY KEY,
    title TEXT NOT NULL,
    author_id INTEGER NOT NULL,
    publisher_id INTEGER NOT NULL,
    publication_date TEXT NOT NULL,
    isbn TEXT NOT NULL
);

CREATE TABLE Authors (
    author_id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    birth_year INTEGER NOT NULL
);

CREATE TABLE Publishers (
    publisher_id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    address TEXT NOT NULL
);


CREATE TABLE Loans (
    loan_id INTEGER PRIMARY KEY,
    book_id INTEGER NOT NULL,
    loan_date TEXT NOT NULL,
    return_date TEXT NOT NULL,
    borrower_name TEXT NOT NULL,
    borrower_address TEXT NOT NULL
);
INSERT INTO Authors (author_id, name, birth_year)
VALUES
    (1,'J.K. Rowling', 1965),
    (2,'Stephen King', 1947),
    (3,'Agatha Christie', 1890);

-- Insert sample data into the Publishers table
INSERT INTO Publishers (name, address)
VALUES
    ('Bloomsbury', 'London, UK'),
    ('Penguin Random House', 'New York, NY, USA'),
    ('HarperCollins', 'London, UK');

-- Insert sample data into the Books table
INSERT INTO Books (title, author_id, publisher_id, publication_date, isbn)
VALUES
    ('Harry Potter and the Philosopher''s Stone', 1, 1, '1997-06-26', '0747532699'),
    ('Harry Potter and the Chamber of Secrets', 1, 1, '1998-07-02', '0747538484'),
    ('The Shining', 2, 2, '1977-01-28', '0385121679'),
    ('Murder on the Orient Express', 3, 3, '1934-01-01', '0062073497');

-- Insert sample data into the Loans table
INSERT INTO Loans (book_id, loan_date, return_date, borrower_name, borrower_address)
VALUES
    (1, '2022-01-01', '2022-01-15', 'John Smith', '123 Main St.'),
    (2, '2022-02-01', '2022-02-15', 'Jane Doe', '456 Maple Ave.'),
    (3, '2022-03-01', '2022-03-15', 'Bob Johnson', '789 Oak St.'),
    (4, '2022-04-01', '2022-04-15', 'Mary Brown', '321 Elm St.');
SELECT b.title
FROM Books b
JOIN Publishers p ON b.publisher_id = p.publisher_id
WHERE p.name = 'Bloomsbury';
SELECT b.title, l.borrower_name, l.borrower_address
FROM Books b
JOIN Loans l ON b.book_id = l.book_id
WHERE l.loan_date = '2022-02-01';
SELECT b.title, l.borrower_name, l.borrower_address
FROM Books b
JOIN Loans l ON b.book_id = l.book_id
WHERE l.return_date IS NULL;
SELECT a.name, COUNT(*) AS num_books
FROM Books b
JOIN Authors a ON b.author_id = a.author_id
GROUP BY a.author_id
ORDER BY num_books DESC
LIMIT 1;
SELECT p.name, COUNT(*) AS num_books
FROM Books b
JOIN Publishers p ON b.publisher_id = p.publisher_id
GROUP BY p.publisher_id
ORDER BY num_books DESC
LIMIT 1;