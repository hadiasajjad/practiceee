import mysql.connector

# Establish a connection to the database
conn = mysql.connector.connect(
  host="localhost",
  user="root",
  password="password",
  database="library"
)
# Create the Books table
conn.cursor().execute("""
    CREATE TABLE Books (
        book_id INT PRIMARY KEY AUTO_INCREMENT,
        title VARCHAR(255) NOT NULL,
        author_id INT NOT NULL,
        publisher_id INT NOT NULL,
        publication_date DATE NOT NULL,
        isbn VARCHAR(13) NOT NULL
    )
""")

# Create the Authors table
conn.cursor().execute("""
    CREATE TABLE Authors (
        author_id INT PRIMARY KEY AUTO_INCREMENT,
        name VARCHAR(255) NOT NULL,
        birth_year INT NOT NULL
    )
""")

# Create the Publishers table
conn.cursor().execute("""
    CREATE TABLE Publishers (
        publisher_id INT PRIMARY KEY AUTO_INCREMENT,
        name VARCHAR(255) NOT NULL,
        address VARCHAR(255) NOT NULL
    )
""")

# Create the Loans table
conn.cursor().execute("""
    CREATE TABLE Loans (
        loan_id INT PRIMARY KEY AUTO_INCREMENT,
        book_id INT NOT NULL,
        loan_date DATE NOT NULL,
        return_date DATE NOT NULL,
        borrower_name VARCHAR(255) NOT NULL,
        borrower_address VARCHAR(255) NOT NULL
    )
""")
# Insert sample data into the Authors tables
conn.cursor().execute("""
    INSERT INTO Authors (name, birth_year)
    VALUES
        ('J.K. Rowling', 1965),
        ('Stephen King', 1947),
        ('Agatha Christie', 1890)
""")

# Insert sample data into the Publishers table
conn.cursor().execute("""
    INSERT INTO Publishers (name, address)
    VALUES
        ('Bloomsbury', 'London, UK'),
        ('Penguin Random House', 'New York, NY, USA'),
        ('HarperCollins', 'London, UK')
""")

# Insert sample data into the Books table
conn.cursor().execute("""
    INSERT INTO Books (title, author_id, publisher_id, publication_date, isbn)
    VALUES
        ('Harry Potter and the Philosopher''s Stone', 1, 1, '1997-06-26', '0747532699'),
        ('Harry Potter and the Chamber of Secrets', 1, 1, '1998-07-02', '0747538484'),
        ('The Shining', 2, 2, '1977-01-28', '0385121679'),
        ('Murder on the Orient Express', 3, 3, '1934-01-01', '0062073497')
""")

# Insert sample data into the Loans table
conn.cursor().execute("""
    INSERT INTO Loans (book_id, loan_date, return_date, borrower_name, borrower_address)
    VALUES
        (1, '2022-01-01', '2022-01-15', 'John Smith', '123 Main St.'),
        (2, '2022-02-01', '2022-02-15', 'Jane Doe', '456 Maple Ave.'),
        (3, '2022-03-01', '2022-03-15', 'Bob Johnson', '789 Oak St.'),
        (4, '2022-04-01', '2022-04-15', 'Sarah Lee', '321 Elm St.')
""")