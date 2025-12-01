DROP DATABASE university;
CREATE DATABASE university;
USE university;

CREATE TABLE students(
     student_id INT PRIMARY KEY,
     name VARCHAR(50),
     dept VARCHAR(50)
);

CREATE TABLE courses(
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100),
    credit INT CHECK (credit BETWEEN 1 AND 3)
);

CREATE TABLE enrollments(
     student_id INT,
     course_id INT,
     grade CHAR(2),
     score INT,
     PRIMARY KEY (student_id,course_id),
     
     FOREIGN KEY (student_id)
     REFERENCES students(student_id),
     
     FOREIGN KEY (course_id)
     REFERENCES courses(course_id)
);

INSERT INTO students
VALUES
(1, 'Jiangly',"CSE"),
(2, 'tourist', "EEE"),
(3, 'Petr', "CSE"),
(4, 'Benq',"CSE"),
(5, 'Errichto',"BBA");

INSERT INTO courses
VALUES
(101, 'DBMS', 3),
(102, 'DSA', 3),
(103, 'OS', 3);

INSERT INTO enrollments
VALUES
(1, 101, 'A+', 95),
(1, 102, 'A', 90),
(2, 103, 'B+', 82),
(3, 101, 'A', 93),
(4, 103, 'B', 75),
(5, 101, 'A', 89);

