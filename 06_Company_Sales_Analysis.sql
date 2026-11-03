CREATE DATABASE IF NOT EXISTS SalesDB;
USE SalesDB;

CREATE TABLE Sales (
    sale_id INT PRIMARY KEY,
    salesperson VARCHAR(50),
    region VARCHAR(30),
    product VARCHAR(40),
    quantity INT,
    unit_price DECIMAL(9,2),
    sale_date DATE
);

INSERT INTO Sales VALUES
(1,'Aarav','South','Laptop',2,55000,'2026-01-05'),
(2,'Diya','West','Phone',3,22000,'2026-01-06'),
(3,'Kabir','North','Tablet',4,18000,'2026-01-08'),
(4,'Anaya','South','Phone',2,22000,'2026-01-10'),
(5,'Ishaan','East','Laptop',1,55000,'2026-01-12'),
(6,'Diya','West','Tablet',5,18000,'2026-01-15'),
(7,'Aarav','South','Phone',4,22000,'2026-01-18'),
(8,'Kabir','North','Laptop',1,55000,'2026-01-20');

SELECT region, SUM(quantity * unit_price) AS revenue
FROM Sales GROUP BY region ORDER BY revenue DESC;
SELECT salesperson, COUNT(*) AS sales_count FROM Sales GROUP BY salesperson;
SELECT product, SUM(quantity) AS total_units FROM Sales GROUP BY product;
SELECT AVG(unit_price) AS average_price, MAX(unit_price) AS highest_price,
       MIN(unit_price) AS lowest_price FROM Sales;
SELECT region, SUM(quantity * unit_price) AS revenue
FROM Sales GROUP BY region HAVING revenue > 50000;
