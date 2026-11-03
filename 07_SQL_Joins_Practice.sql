CREATE DATABASE IF NOT EXISTS JoinPracticeDB;
USE JoinPracticeDB;

CREATE TABLE Departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(40)
);

CREATE TABLE Staff (
    staff_id INT PRIMARY KEY,
    staff_name VARCHAR(50),
    department_id INT,
    salary DECIMAL(10,2),
    FOREIGN KEY (department_id) REFERENCES Departments(department_id)
);

INSERT INTO Departments VALUES
(1,'Finance'),(2,'Human Resources'),(3,'Information Technology'),(4,'Marketing');

INSERT INTO Staff VALUES
(101,'Rhea',1,45000),(102,'Kunal',2,39000),(103,'Sana',3,62000),
(104,'Aman',3,58000),(105,'Tia',1,49000);

-- INNER JOIN: matching records only
SELECT s.staff_name, d.department_name, s.salary
FROM Staff s INNER JOIN Departments d
ON s.department_id = d.department_id;

-- LEFT JOIN: all departments' staff matches, where available
SELECT d.department_name, s.staff_name
FROM Departments d LEFT JOIN Staff s
ON d.department_id = s.department_id;

-- Highest salary in each department
SELECT d.department_name, MAX(s.salary) AS highest_salary
FROM Departments d JOIN Staff s ON d.department_id = s.department_id
GROUP BY d.department_name;
