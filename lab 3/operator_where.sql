-- Problem No.: 2
-- Problem Statement:
-- Create a university database to store student details (ID, name, marks, CGPA, city) and run queries to filter students by marks and city


DROP DATABASE IF EXISTS university;
CREATE DATABASE university;
USE university;
DROP TABLE IF EXISTS student;
CREATE TABLE student(
    student_id INT PRIMARY KEY,
    name VARCHAR(200),
    marks double,
    CGPA double,
    city varchar(200)
);

INSERT INTO student
VALUES
(1, 'Jiangly', 100, 4.00,"Cumilla"),
(2, 'tourist', 99, 4.00, "Dhaka"),
(3, 'Petr', 90, 3.95, "Cumilla"),
(4, 'Benq', 80, 3.92, "CTG"),
(5, 'Errichto', 87, 3.90, "Cox's Bazar");

SELECT * FROM student;

SELECT * FROM student
WHERE marks + 10 > 100;

SELECT * FROM student
WHERE marks = 100;

SELECT * FROM student
WHERE marks BETWEEN 90 AND 100;

SELECT * FROM student
WHERE marks BETWEEN 70 AND 80;


SELECT * FROM student
WHERE city IN ('Cumilla', 'Dhaka');

SELECT * FROM student
WHERE city NOT IN  ('Cumilla', 'Dhaka');


