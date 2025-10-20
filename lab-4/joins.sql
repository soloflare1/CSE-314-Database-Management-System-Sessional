MariaDB [university]> CREATE TABLE student(
    -> student_id INT PRIMARY KEY,
    -> name VARCHAR(200),
    -> dept VARCHAR(200)
    -> );
MariaDB [university]> CREATE TABLE enrollments (
    -> student_id INT,
    -> course_id INT,
    -> grade CHAR(3),
    -> PRIMARY KEY(student_id, course_id),
    -> FOREIGN KEY(student_id) REFERENCES student(student_id)
    -> );

MariaDB [university]> INSERT INTO student (student_id, name, dept)
    -> VALUES
    -> (1, 'Mr. A', 'CSE'),
    -> (2, 'Mr. B', 'CSE'),
    -> (3, 'Mr. C', 'CSE'),
    -> (4, 'Mr. D', 'CSE'),
    -> (5, 'Mr. E', 'CSE');
MariaDB [university]> INSERT INTO enrollments (student_id, course_id, grade)
    -> VALUES
    -> (1, 101, 'A+'),
    -> (2, 102, 'A+'),
    -> (3, 103, 'A'),
    -> (5, 101, 'A');
MariaDB [university]> SELECT student_id, name, course _id
    -> FROM student as s
    -> INNER JOIN enrollments as e
    -> ON s. student_id = e.student_id;
ERROR 1052 (23000): Column 'student_id' in field list is ambiguous
MariaDB [university]> SELECT s.student_id, s.name, e.course_id
    -> FROM student AS s
    -> INNER JOIN enrollments AS e
    -> ON s.student_id = e.student_id;
+------------+-------+-----------+
| student_id | name  | course_id |
+------------+-------+-----------+
|          1 | Mr. A |       101 |
|          2 | Mr. B |       102 |
|          3 | Mr. C |       103 |
|          5 | Mr. E |       101 |
+------------+-------+-----------+
4 rows in set (0.000 sec)

MariaDB [university]> SELECT s.student_id, s.name, e.course_id
    ->  FROM student AS s
    -> LEFT JOIN enrollments AS e
    -> ON s.student_id = e.student_id;
+------------+-------+-----------+
| student_id | name  | course_id |
+------------+-------+-----------+
|          1 | Mr. A |       101 |
|          2 | Mr. B |       102 |
|          3 | Mr. C |       103 |
|          4 | Mr. D |      NULL |
|          5 | Mr. E |       101 |
+------------+-------+-----------+
5 rows in set (0.000 sec)

MariaDB [university]> SELECT s.student_id, s.name, e.course_id
    -> FROM student AS s
    -> RIGHT JOIN enrollments AS e
    -> ON s.student_id = e.student_id;
+------------+-------+-----------+
| student_id | name  | course_id |
+------------+-------+-----------+
|          1 | Mr. A |       101 |
|          2 | Mr. B |       102 |
|          3 | Mr. C |       103 |
|          5 | Mr. E |       101 |
+------------+-------+-----------+
4 rows in set (0.000 sec)

MariaDB [university]> SELECT s.student_id, s.name, e.course_id
    -> FROM student AS s
    -> LEFT JOIN enrollments AS e
    -> ON s.student_id = e.student_id
    -> UNION
    -> SELECT s.student_id, s.name, e.course_id
    ->  FROM student AS s
    -> RIGHT JOIN enrollments AS e
    ->  ON s.student_id = e.student_id;
+------------+-------+-----------+
| student_id | name  | course_id |
+------------+-------+-----------+
|          1 | Mr. A |       101 |
|          2 | Mr. B |       102 |
|          3 | Mr. C |       103 |
|          4 | Mr. D |      NULL |
|          5 | Mr. E |       101 |
+------------+-------+-----------+
5 rows in set (0.001 sec)

MariaDB [university]> SELECT * FROM student;
+------------+-------+------+
| student_id | name  | dept |
+------------+-------+------+
|          1 | Mr. A | CSE  |
|          2 | Mr. B | CSE  |
|          3 | Mr. C | CSE  |
|          4 | Mr. D | CSE  |
|          5 | Mr. E | CSE  |
+------------+-------+------+
5 rows in set (0.000 sec)

MariaDB [university]>  SELECT * FROM enrollments;
+------------+-----------+-------+
| student_id | course_id | grade |
+------------+-----------+-------+
|          1 |       101 | A+    |
|          2 |       102 | A+    |
|          3 |       103 | A     |
|          5 |       101 | A     |
+------------+-----------+-------+
4 rows in set (0.000 sec)


MariaDB [university]>  SELECT s.name, e.course_id
    -> FROM student AS s
    -> INNER JOIN enrollments AS e
    -> ON s.student_id = e.student_id
    -> WHERE e.course_id = 101;
+-------+-----------+
| name  | course_id |
+-------+-----------+
| Mr. A |       101 |
| Mr. E |       101 |
+-------+-----------+

MariaDB [university]> SELECT s.student_id, s.name, e.course_id
    -> FROM student AS s
    -> LEFT JOIN enrollments AS e
    -> ON s.student_id = e.student_id
    ->  WHERE  e.course_id is NULL;
+------------+-------+-----------+
| student_id | name  | course_id |
+------------+-------+-----------+
|          4 | Mr. D |      NULL |
+------------+-------+-----------+
