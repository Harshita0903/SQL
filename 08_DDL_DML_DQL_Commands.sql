CREATE DATABASE IF NOT EXISTS CommandPracticeDB;
USE CommandPracticeDB;

-- DDL: CREATE
CREATE TABLE LibraryBooks (
    book_id INT PRIMARY KEY,
    book_title VARCHAR(80) NOT NULL,
    author VARCHAR(60),
    price DECIMAL(7,2),
    available_copies INT DEFAULT 0
);

-- DML: INSERT
INSERT INTO LibraryBooks VALUES
(1,'The Alchemist','Paulo Coelho',399,5),
(2,'Wings of Fire','A. P. J. Abdul Kalam',299,8),
(3,'Atomic Habits','James Clear',599,4),
(4,'Ikigai','Hector Garcia',350,6),
(5,'Rich Dad Poor Dad','Robert Kiyosaki',450,3);

-- DQL: SELECT
SELECT * FROM LibraryBooks;
SELECT book_title, price FROM LibraryBooks WHERE price < 400 ORDER BY price;

-- DML: UPDATE and DELETE
UPDATE LibraryBooks SET available_copies = 10 WHERE book_id = 2;
DELETE FROM LibraryBooks WHERE book_id = 5;

-- DDL: ALTER
ALTER TABLE LibraryBooks ADD COLUMN publisher VARCHAR(50);
ALTER TABLE LibraryBooks DROP COLUMN publisher;

-- Aggregate functions
SELECT COUNT(*) AS total_books, AVG(price) AS average_price FROM LibraryBooks;
