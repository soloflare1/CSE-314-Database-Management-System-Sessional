DROP DATABASE IF EXISTS university;
CREATE DATABASE university;
USE university;

DROP TABLE IF EXISTS student;
CREATE TABLE student(
   id INT PRIMARY KEY,
   name VARCHAR(200),
   dept VARCHAR(200),
   age INT
);

INSERT INTO student(id, name, dept, age)
VALUES
(1, 'Jiangly',"CSE",20),
(2, 'tourist', "EEE",21),
(3, 'Petr', "CSE", 20),
(4, 'Benq',"CSE",22),
(5, 'Errichto',"BBA", 19),
(6, 'alice',"BBA", 19);

SELECT * FROM student
WHERE dept = 'CSE' AND age > 20;

SELECT name,dept FROM student
WHERE dept = 'CSE' AND age > 20;

SELECT name,dept FROM student
WHERE dept IN ('CSE', 'EEE');

SELECT name,age FROM student
WHERE age BETWEEN 20 AND 22;

SELECT name FROM student
WHERE name LIKE 'A%';

SELECT name FROM student
WHERE name LIKE '_____';




