CREATE DATABASE IF NOT EXISTS BankingDB;
USE BankingDB;

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(60) NOT NULL,
    city VARCHAR(40),
    phone VARCHAR(15) UNIQUE
);

CREATE TABLE Accounts (
    account_id INT PRIMARY KEY,
    customer_id INT NOT NULL,
    account_type VARCHAR(20) NOT NULL,
    balance DECIMAL(12,2) DEFAULT 0,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

CREATE TABLE Transactions (
    transaction_id INT PRIMARY KEY,
    account_id INT NOT NULL,
    transaction_type VARCHAR(20),
    amount DECIMAL(12,2) NOT NULL,
    transaction_date DATE,
    FOREIGN KEY (account_id) REFERENCES Accounts(account_id)
);

INSERT INTO Customers VALUES
(1,'Aarav Mehta','Bengaluru','9876500001'),
(2,'Diya Sharma','Mumbai','9876500002'),
(3,'Kabir Rao','Delhi','9876500003'),
(4,'Anaya Iyer','Chennai','9876500004'),
(5,'Ishaan Das','Pune','9876500005');

INSERT INTO Accounts VALUES
(101,1,'Savings',25000),(102,2,'Current',80000),
(103,3,'Savings',12000),(104,4,'Salary',45000),(105,5,'Savings',32000);

INSERT INTO Transactions VALUES
(1001,101,'Deposit',5000,'2026-01-05'),
(1002,102,'Withdrawal',7000,'2026-01-06'),
(1003,103,'Deposit',2500,'2026-01-08'),
(1004,104,'Deposit',10000,'2026-01-10'),
(1005,105,'Withdrawal',3000,'2026-01-12');

-- View all customers and their accounts
SELECT c.customer_name, a.account_type, a.balance
FROM Customers c JOIN Accounts a ON c.customer_id = a.customer_id;

-- Find accounts with balance above 30000
SELECT * FROM Accounts WHERE balance > 30000;

-- Total balance by account type
SELECT account_type, SUM(balance) AS total_balance
FROM Accounts GROUP BY account_type;
