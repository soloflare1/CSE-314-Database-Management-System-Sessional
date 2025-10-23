CREATE DATABASE IF NOT EXISTS university;
USE university;

DROP TABLE IF EXISTS enrollments;
DROP TABLE IF EXISTS student;

CREATE TABLE student (
    student_id INT PRIMARY KEY,
    name VARCHAR(200),
    dept VARCHAR(200)
);

INSERT INTO student (student_id, name, dept)
VALUES
   (1, 'Jiangly', 'CSE'),
   (2, 'tourist', 'EEE'),
   (3, 'Petr', 'CSE'),
   (4, 'Benq', 'CE'),
   (5, 'Errichto', 'EEE'),
   (6, 'Radewoosh', 'CSE'),
   (7, 'Tomek', 'EEE');

SELECT * FROM student;

CREATE TABLE enrollments (
    student_id INT,
    course_id INT,
    grade CHAR(3),
    PRIMARY KEY(student_id, course_id),
    FOREIGN KEY(student_id) REFERENCES student(student_id)
);
SELECT * FROM enrollments;

INSERT INTO enrollments (student_id, course_id, grade)
VALUES
   (1, 101, 'A+'),
   (2, 102, 'A+'),
   (3, 103, 'A'),
   (5, 101, 'A'),
   (3, 101, 'A+');

-- INNER JOIN
SELECT s.student_id, s.name, e.course_id
FROM student AS s
INNER JOIN enrollments AS e
ON s.student_id = e.student_id;

-- LEFT JOIN
SELECT s.student_id, s.name, e.course_id
FROM student AS s
LEFT JOIN enrollments AS e
ON s.student_id = e.student_id;

-- RIGHT JOIN
SELECT s.student_id, s.name, e.course_id
FROM student AS s
RIGHT JOIN enrollments AS e
ON s.student_id = e.student_id;

-- FULL OUTER JOIN simulation
SELECT s.student_id, s.name, e.course_id
FROM student AS s
LEFT JOIN enrollments AS e
ON s.student_id = e.student_id
UNION
SELECT s.student_id, s.name, e.course_id
FROM student AS s
RIGHT JOIN enrollments AS e
ON s.student_id = e.student_id;

-- Students enrolled in course 101
SELECT s.name, e.course_id
FROM student AS s
INNER JOIN enrollments AS e
ON s.student_id = e.student_id
WHERE e.course_id = 101;

-- Students not enrolled in any course
SELECT s.student_id, s.name, e.course_id
FROM student AS s
LEFT JOIN enrollments AS e
ON s.student_id = e.student_id
WHERE e.course_id IS NULL;
