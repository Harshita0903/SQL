CREATE DATABASE IF NOT EXISTS EcommerceDB;
USE EcommerceDB;

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50) NOT NULL,
    email VARCHAR(80) UNIQUE,
    city VARCHAR(30)
);

CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(60) NOT NULL,
    category VARCHAR(30),
    price DECIMAL(9,2)
);

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    order_status VARCHAR(20),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

CREATE TABLE OrderItems (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

INSERT INTO Customers VALUES
(1,'Aanya','aanya@example.com','Bengaluru'),
(2,'Vivaan','vivaan@example.com','Mumbai'),
(3,'Myra','myra@example.com','Delhi'),
(4,'Reyansh','reyansh@example.com','Pune');

INSERT INTO Products VALUES
(101,'Smart Watch','Electronics',3499),
(102,'Backpack','Fashion',1499),
(103,'Coffee Mug','Home',399),
(104,'Bluetooth Speaker','Electronics',2299),
(105,'Running Shoes','Fashion',2999);

INSERT INTO Orders VALUES
(1001,1,'2026-02-01','Delivered'),
(1002,2,'2026-02-03','Shipped'),
(1003,1,'2026-02-08','Delivered'),
(1004,3,'2026-02-10','Pending'),
(1005,4,'2026-02-12','Delivered');

INSERT INTO OrderItems VALUES
(1,1001,101,1),(2,1001,103,2),(3,1002,102,1),
(4,1003,104,1),(5,1004,105,1),(6,1005,103,3);

SELECT o.order_id, c.customer_name, o.order_date, o.order_status
FROM Orders o JOIN Customers c ON o.customer_id = c.customer_id;

SELECT p.product_name, SUM(oi.quantity) AS units_sold
FROM OrderItems oi JOIN Products p ON oi.product_id = p.product_id
GROUP BY p.product_name ORDER BY units_sold DESC;

SELECT c.city, COUNT(o.order_id) AS total_orders
FROM Customers c LEFT JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.city;
