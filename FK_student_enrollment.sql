 LAB PC - 29@DESKTOP-OST8UBC c:\xampp
#  mysql -u root -p
Enter password:
Welcome to the MariaDB monitor.  Commands end with ; or \g.
Your MariaDB connection id is 10
Server version: 10.4.11-MariaDB mariadb.org binary distribution

Copyright (c) 2000, 2018, Oracle, MariaDB Corporation Ab and others.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

MariaDB [(none)]> CREATE DATABASE university;
ERROR 1007 (HY000): Can't create database 'university'; database exists
MariaDB [(none)]> CREATE DATABASE university5;
Query OK, 1 row affected (0.001 sec)

MariaDB [(none)]> USE university5;
Database changed
MariaDB [university5]> CREATE TABLE student(
    ->  id INT PRIMARY KEY,
    -> name VARCHAR(100),
    -> dob DATE,
    -> dept VARCHAR(200)
    -> );
Query OK, 0 rows affected (0.025 sec)

MariaDB [university5]> INSERT INTO student
    -> VALUES
    -> (1,'Alice','2005-05-10','CSE'),
    ->  (2,'Bob','2000-04-11');
ERROR 1136 (21S01): Column count doesn't match value count at row 2
MariaDB [university5]> INSERT INTO student
    -> VALUES
    -> (1,'Alice','2005-05-10','CSE'),
    ->  (2,'Bob','2000-04-11','CSE')
    -> ;
Query OK, 2 rows affected (0.002 sec)
Records: 2  Duplicates: 0  Warnings: 0

MariaDB [university5]>  SELECT *
    ->  FROM student;
+----+-------+------------+------+
| id | name  | dob        | dept |
+----+-------+------------+------+
|  1 | Alice | 2005-05-10 | CSE  |
|  2 | Bob   | 2000-04-11 | CSE  |
+----+-------+------------+------+
2 rows in set (0.000 sec)

MariaDB [university5]> CREATE TABLE course(
    ->  course_id INT PRIMARY KEY,
    -> title VARCHAR(100),
    -> credit INT);
Query OK, 0 rows affected (0.024 sec)

MariaDB [university5]> CREATE TABLE enrollment(
    -> student_id INT,
    -> course_id INT,
    -> grade CHAR(2),
    -> PRIMARY KEY (student_id, course_id),
    -> FOREIGN KEY((student_id) REFERENCES student(id),
    -> ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near '(student_id) REFERENCES student(id),' at line 6
MariaDB [university5]> CREATE TABLE enrollment(
    -> student_id INT,
    ->  course_id INT,
    ->  grade CHAR(2),
    ->  PRIMARY KEY (student_id, course_id),
    -> FOREIGN KEY(student_id) REFERENCES student(id),
    ->  FOREIGN KEY (course_id) REFERENCES student(course_id)
    -> );
ERROR 1005 (HY000): Can't create table `university5`.`enrollment` (errno: 150 "Foreign key constraint is incorrectly formed")MariaDB [university5]> CREATE TABLE enrollment(
    -> student_id INT,
    ->  course_id INT,
    ->  grade CHAR(2),
    ->  PRIMARY KEY (student_id, course_id),
    -> FOREIGN KEY(student_id) REFERENCES student(id)
    ->  FOREIGN KEY (course_id) REFERENCES student(course_id));
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'FOREIGN KEY (course_id) REFERENCES student(course_id))' at line 7
MariaDB [university5]> CREATE TABLE enrollment (
    -> student_id INT,
    -> course_id INT,
    -> grade CHAR(2),
    ->  PRIMARY KEY (student_id, course_id),
    -> FOREIGN KEY (student_id) REFERENCES student(id),
    ->  FOREIGN KEY (course_id) REFERENCES course(course_id)
    -> );
Query OK, 0 rows affected (0.027 sec)

MariaDB [university5]> INSERT INTO course
    -> VALUES
    -> (101, 'DBMS', 3),
    -> (102, 'OS', 3);
Query OK, 2 rows affected (0.007 sec)
Records: 2  Duplicates: 0  Warnings: 0

MariaDB [university5]>  INSERT INTO enrollment
    -> VALUES
    -> (1,101,'A'),
    -> (2,102,'A');
Query OK, 2 rows affected (0.002 sec)
Records: 2  Duplicates: 0  Warnings: 0

MariaDB [university5]> SELECT * FROM course;
+-----------+-------+--------+
| course_id | title | credit |
+-----------+-------+--------+
|       101 | DBMS  |      3 |
|       102 | OS    |      3 |
+-----------+-------+--------+
2 rows in set (0.000 sec)

MariaDB [university5]> SELECT * FROM enrollment;
+------------+-----------+-------+
| student_id | course_id | grade |
+------------+-----------+-------+
|          1 |       101 | A     |
|          2 |       102 | A     |
+------------+-----------+-------+
2 rows in set (0.000 sec)

MariaDB [university5]>




MariaDB [university5]> ALTER TABLE course ADD instructor VARCHAR(100);
Query OK, 0 rows affected (0.007 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [university5]> UPDATE student SET name = 'Alice Jon'
    -> WHERE id = 1;
Query OK, 1 row affected (0.003 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [university5]> DELETE
    -> FROM course
    -> WHERE course_id = 101;
ERROR 1451 (23000): Cannot delete or update a parent row: a foreign key constraint fails (`university5`.`enrollment`, CONSTRAINT `enrollment_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`))



MariaDB [university5]> DELET FROM enrollment WHERE course_id = 101;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'DELET FROM enrollment WHERE course_id = 101' at line 1
MariaDB [university5]> SELECT name, dob
    -> FROM student
    -> WHERE YEAR(dob) > 2000;
+-----------+------------+
| name      | dob        |
+-----------+------------+
| Alice Jon | 2005-05-10 |
+-----------+------------+
1 row in set (0.000 sec)

MariaDB [university5]> DELETE FROM enrollment WHERE course_id = 101;
Query OK, 1 row affected (0.003 sec)

MariaDB [university5]>  DELETE FROM course  WHERE course_id = 101;
Query OK, 1 row affected (0.003 sec)



  







