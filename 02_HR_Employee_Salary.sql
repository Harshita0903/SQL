CREATE DATABASE IF NOT EXISTS HRDatabase;
USE HRDatabase;

CREATE TABLE Employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50) NOT NULL,
    department VARCHAR(30),
    job_role VARCHAR(40),
    salary DECIMAL(10,2),
    joining_date DATE
);

INSERT INTO Employees VALUES
(1,'Rohan','Finance','Analyst',42000,'2023-02-10'),
(2,'Meera','HR','Executive',35000,'2022-07-15'),
(3,'Arjun','IT','Developer',58000,'2021-11-20'),
(4,'Sara','Finance','Manager',72000,'2020-04-05'),
(5,'Dev','IT','Tester',40000,'2024-01-12'),
(6,'Nisha','Marketing','Executive',38000,'2023-08-18'),
(7,'Vikram','HR','Manager',65000,'2019-06-25'),
(8,'Tara','IT','Developer',61000,'2022-03-14');

SELECT * FROM Employees;
SELECT * FROM Employees WHERE salary > 40000 ORDER BY salary DESC;
SELECT department, COUNT(*) AS employee_count FROM Employees GROUP BY department;
SELECT department, AVG(salary) AS average_salary FROM Employees GROUP BY department;
SELECT department, MAX(salary) AS highest_salary, MIN(salary) AS lowest_salary
FROM Employees GROUP BY department;
SELECT department, SUM(salary) AS total_payroll
FROM Employees GROUP BY department HAVING SUM(salary) > 70000;
UPDATE Employees SET salary = salary + 3000 WHERE employee_id = 2;
