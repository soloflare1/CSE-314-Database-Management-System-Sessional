
--                      # Visiting operators in where

-- Arithmetic     :  +,  -,  *,  /,  %
-- Comparison  :  =,  !=,  >,  <,  >=
-- Logical           :  AND, OR, NOT, IN, BETWEEN, ALL, LIKE, ANY
-- BITWISE        :  &, |

-- Original data change -> update,set


MariaDB [lab_test]> CREATE TABLE student(
    -> student_id INT PRIMARY KEY,
    -> name VARCHAR(200),
    -> marks double,
    -> CGPA double);
Query OK, 0 rows affected (0.010 sec)

MariaDB [lab_test]> SELECT * FROM student;
Empty set (0.001 sec)

MariaDB [lab_test]> INSERT INTO student
    -> VALUES
    -> (1, 'Jiangly', 95, 4.00),
    -> (2, 'Ptr', 80, 3.90),
    -> (3, 'etrpth', 70, 3.80);
Query OK, 3 rows affected (0.002 sec)
Records: 3  Duplicates: 0  Warnings: 0

MariaDB [lab_test]> SELECT * FROM student;
+------------+---------+-------+------+
| student_id | name    | marks | CGPA |
+------------+---------+-------+------+
|          1 | Jiangly |    95 |    4 |
|          2 | Ptr     |    80 |  3.9 |
|          3 | etrpth  |    70 |  3.8 |
+------------+---------+-------+------+
3 rows in set (0.000 sec)

MariaDB [lab_test]> SELECT * FROM student
    -> WHERE marks+10 >100;
+------------+---------+-------+------+
| student_id | name    | marks | CGPA |
+------------+---------+-------+------+
|          1 | Jiangly |    95 |    4 |
+------------+---------+-------+------+
1 row in set (0.000 sec)

MariaDB [lab_test]>  SELECT * FROM student
    -> WHERE marks=100;
Empty set (0.000 sec)

MariaDB [lab_test]> SELECT * FROM student
    -> WHERE marks BETWEEN 80 AND 100;
+------------+---------+-------+------+
| student_id | name    | marks | CGPA |
+------------+---------+-------+------+
|          1 | Jiangly |    95 |    4 |
|          2 | Ptr     |    80 |  3.9 |
+------------+---------+-------+------+
2 rows in set (0.000 sec)

MariaDB [lab_test]>  SELECT * FROM student
    -> WHERE marks BETWEEN 80 AND 90;
+------------+------+-------+------+
| student_id | name | marks | CGPA |
+------------+------+-------+------+
|          2 | Ptr  |    80 |  3.9 |
+------------+------+-------+------+
1 row in set (0.000 sec)

MariaDB [lab_test]> ALTER TABLE student
    -> ADD city VARCHAR(100);
Query OK, 0 rows affected (0.006 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [lab_test]> SELECT * FROM student;
+------------+---------+-------+------+------+
| student_id | name    | marks | CGPA | city |
+------------+---------+-------+------+------+
|          1 | Jiangly |    95 |    4 | NULL |
|          2 | Ptr     |    80 |  3.9 | NULL |
|          3 | etrpth  |    70 |  3.8 | NULL |
+------------+---------+-------+------+------+
3 rows in set (0.000 sec)

MariaDB [lab_test]> UPDATE student
    -> SET city = 'Cumilla'
    -> WHERE student_id=1;
Query OK, 1 row affected (0.003 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [lab_test]> UPDATE student
    ->  SET city = 'Dhaka'
    ->  WHERE student_id=2;
Query OK, 1 row affected (0.002 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [lab_test]> UPDATE student
    -> SET city = 'Cumilla'
    -> WHERE student_id=3;
Query OK, 1 row affected (0.002 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [lab_test]> SELECT * FROM student;
+------------+---------+-------+------+---------+
| student_id | name    | marks | CGPA | city    |
+------------+---------+-------+------+---------+
|          1 | Jiangly |    95 |    4 | Cumilla |
|          2 | Ptr     |    80 |  3.9 | Dhaka   |
|          3 | etrpth  |    70 |  3.8 | Cumilla |
+------------+---------+-------+------+---------+
3 rows in set (0.000 sec)

MariaDB [lab_test]> SELECT * FROM student
    -> WHERE city IN
    -> ('Dhaka'.
    -> ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near '.' at line 3
MariaDB [lab_test]> SELECT * FROM student
    ->  WHERE city IN
    -> ('Cumilla', 'Dhaka');
+------------+---------+-------+------+---------+
| student_id | name    | marks | CGPA | city    |
+------------+---------+-------+------+---------+
|          1 | Jiangly |    95 |    4 | Cumilla |
|          2 | Ptr     |    80 |  3.9 | Dhaka   |
|          3 | etrpth  |    70 |  3.8 | Cumilla |
+------------+---------+-------+------+---------+
3 rows in set (0.000 sec)

MariaDB [lab_test]> SELECT * FROM student
    -> WHERE city IN
    -> ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near '' at line 2
MariaDB [lab_test]>  SELECT * FROM student
    ->  WHERE city NOT IN  ('Cumilla', 'Dhaka');
Empty set (0.000 sec)

MariaDB [lab_test]>  SELECT * FROM student
    ->  WHERE city IN
    -> ('Cumilla');
+------------+---------+-------+------+---------+
| student_id | name    | marks | CGPA | city    |
+------------+---------+-------+------+---------+
|          1 | Jiangly |    95 |    4 | Cumilla |
|          3 | etrpth  |    70 |  3.8 | Cumilla |
+------------+---------+-------+------+---------+
2 rows in set (0.000 sec)

MariaDB [lab_test]>
















