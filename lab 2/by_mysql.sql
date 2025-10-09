CREATE DATABASE university5;

USE university5;

CREATE TABLE student(
      id INT PRIMARY KEY,
     name VARCHAR(100),
     dob DATE,
     dept VARCHAR(200)
);

SELECT *
FROM student;

# +----+-------+------------+------+
# | id | name  | dob        | dept |
# +----+-------+------------+------+
# |  1 | Alice | 2005-05-10 | CSE  |
# |  2 | Bob   | 2000-04-11 | CSE  |
# +----+-------+------------+------+

CREATE TABLE course(
     course_id INT PRIMARY KEY,
     title VARCHAR(100),
     credit INT
);

CREATE TABLE enrollment (
   student_id INT,
   course_id INT,
   grade CHAR(2),
   PRIMARY KEY (student_id, course_id),
   FOREIGN KEY (student_id) REFERENCES student(id),
   FOREIGN KEY (course_id) REFERENCES course(course_id) 
);

INSERT INTO course
VALUES
(101, 'DBMS', 3),
(102, 'OS', 3);

INSERT INTO enrollment
VALUES
(1,101,'A'),
(2,102,'A');

SELECT * 
FROM course;
# +-----------+-------+--------+
# | course_id | title | credit |
# +-----------+-------+--------+
# |       101 | DBMS  |      3 |
# |       102 | OS    |      3 |
# +-----------+-------+--------+

SELECT * 
FROM enrollment;

# +------------+-----------+-------+
# | student_id | course_id | grade |
# +------------+-----------+-------+
# |          1 |       101 | A     |
# |          2 |       102 | A     |
# +------------+-----------+-------+
ALTER TABLE course 
ADD instructor VARCHAR(100);

UPDATE student 
SET name = 'Alice Jon'
WHERE id = 1;

DELETE
FROM course
WHERE course_id = 101;

SELECT name, dob
FROM student
WHERE YEAR(dob) > 2000;
-- +-----------+------------+
-- | name      | dob        |
-- +-----------+------------+
-- | Alice Jon | 2005-05-10 |
-- +-----------+------------+

DELETE 
FROM enrollment 
WHERE course_id = 101;

DELETE 
FROM course  
WHERE course_id = 101;



  





