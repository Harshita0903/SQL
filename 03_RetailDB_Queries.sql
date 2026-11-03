CREATE DATABASE IF NOT EXISTS RetailDB;
USE RetailDB;

CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(60) NOT NULL,
    category VARCHAR(30) NOT NULL,
    price DECIMAL(8,2) NOT NULL,
    stock INT DEFAULT 0
);

INSERT INTO Products VALUES
(1,'Wireless Mouse','Electronics',799,40),
(2,'Keyboard','Electronics',1299,25),
(3,'Notebook','Stationery',80,150),
(4,'Water Bottle','Lifestyle',499,60),
(5,'USB Drive','Electronics',599,35),
(6,'Pen Pack','Stationery',120,100),
(7,'Desk Lamp','Lifestyle',899,20),
(8,'Office Chair','Furniture',5499,12),
(9,'Study Table','Furniture',7999,8),
(10,'Headphones','Electronics',1999,18);

SELECT * FROM Products;
SELECT * FROM Products WHERE category = 'Electronics';
SELECT * FROM Products WHERE price BETWEEN 500 AND 2000;
SELECT category, COUNT(*) AS product_count FROM Products GROUP BY category;
SELECT category, MAX(price) AS highest_price, MIN(price) AS lowest_price
FROM Products GROUP BY category;
SELECT * FROM Products ORDER BY price DESC;
UPDATE Products SET stock = stock + 10 WHERE product_id = 5;
