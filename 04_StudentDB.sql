CREATE DATABASE IF NOT EXISTS StudentDB;
USE StudentDB;

CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50) NOT NULL,
    city VARCHAR(30) DEFAULT 'Bengaluru',
    age INT,
    course VARCHAR(30),
    marks INT
);

INSERT INTO Students VALUES
(1,'Aditi','Bengaluru',19,'BBA Fintech',86),
(2,'Rahul','Mysuru',20,'BCom',74),
(3,'Sneha','Bengaluru',19,'BBA Fintech',92),
(4,'Karan','Chennai',21,'BCA',58),
(5,'Pooja','Hyderabad',20,'BBA',81),
(6,'Manav','Bengaluru',22,'BCom',67),
(7,'Ira','Pune',19,'BCA',95),
(8,'Neil','Mysuru',20,'BBA',49),
(9,'Riya','Chennai',21,'BBA Fintech',77),
(10,'Advik','Bengaluru',20,'BCA',88);

SELECT student_name, marks FROM Students WHERE marks > 60 ORDER BY marks DESC;
SELECT city, COUNT(*) AS total_students, AVG(marks) AS average_marks
FROM Students GROUP BY city;
SELECT * FROM Students WHERE marks >= 80;
SELECT course, MAX(marks) AS top_score FROM Students GROUP BY course;
UPDATE Students SET marks = 90 WHERE student_id = 2;
