MariaDB [(none)]> CREATE DATABASE lab_test;
Query OK, 1 row affected (0.001 sec)

MariaDB [(none)]> USE lab_test;
Database changed
MariaDB [lab_test]> CREATE TABLE book(
    -> id int PRIMARY KEY,
    -> title VARCHAR(200),
    -> author VARCHAR(200),
    -> year DATE);
Query OK, 0 rows affected (0.007 sec)

MariaDB [lab_test]> INSERT INTO book
    -> VALUES
    -> (1,'DBMS','X','1990-12-23'),
    -> (2,'ALGO','Y','2000-10-09'),
    -> (3,'OS','Z','1999-07-23'),
    -> (4,'DS','A','1978-12-10'),
    -> (5,'CPP','B','1989-05-12');
Query OK, 5 rows affected (0.006 sec)
Records: 5  Duplicates: 0  Warnings: 0

MariaDB [lab_test]> SELECT * FROM book;
+----+-------+--------+------------+
| id | title | author | year       |
+----+-------+--------+------------+
|  1 | DBMS  | X      | 1990-12-23 |
|  2 | ALGO  | Y      | 2000-10-09 |
|  3 | OS    | Z      | 1999-07-23 |
|  4 | DS    | A      | 1978-12-10 |
|  5 | CPP   | B      | 1989-05-12 |
+----+-------+--------+------------+
5 rows in set (0.000 sec)

MariaDB [lab_test]> ALTER TABLE book
    -> ADD price double;
Query OK, 0 rows affected (0.005 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [lab_test]>  SELECT * FROM book;
+----+-------+--------+------------+-------+
| id | title | author | year       | price |
+----+-------+--------+------------+-------+
|  1 | DBMS  | X      | 1990-12-23 |  NULL |
|  2 | ALGO  | Y      | 2000-10-09 |  NULL |
|  3 | OS    | Z      | 1999-07-23 |  NULL |
|  4 | DS    | A      | 1978-12-10 |  NULL |
|  5 | CPP   | B      | 1989-05-12 |  NULL |
+----+-------+--------+------------+-------+
5 rows in set (0.000 sec)

MariaDB [lab_test]> DELETE
    -> FROM book
    -> WHERE id=1;
Query OK, 1 row affected (0.002 sec)

MariaDB [lab_test]>   SELECT * FROM book;
+----+-------+--------+------------+-------+
| id | title | author | year       | price |
+----+-------+--------+------------+-------+
|  2 | ALGO  | Y      | 2000-10-09 |  NULL |
|  3 | OS    | Z      | 1999-07-23 |  NULL |
|  4 | DS    | A      | 1978-12-10 |  NULL |
|  5 | CPP   | B      | 1989-05-12 |  NULL |
+----+-------+--------+------------+-------+
4 rows in set (0.000 sec)

MariaDB [lab_test]> UPDATE book
    -> SET price = 200
    -> WHERE id=2
    -> ;
Query OK, 1 row affected (0.003 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [lab_test]> UPDATE book
    -> SET price = 200
    -> WHERE id=3;
Query OK, 1 row affected (0.002 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [lab_test]>  SELECT * FROM book;
+----+-------+--------+------------+-------+
| id | title | author | year       | price |
+----+-------+--------+------------+-------+
|  2 | ALGO  | Y      | 2000-10-09 |   200 |
|  3 | OS    | Z      | 1999-07-23 |   200 |
|  4 | DS    | A      | 1978-12-10 |  NULL |
|  5 | CPP   | B      | 1989-05-12 |  NULL |
+----+-------+--------+------------+-------+
4 rows in set (0.000 sec)

MariaDB [lab_test]>  UPDATE book
    -> SET year = '2017-12-09'
    -> WHERE id = 2;
Query OK, 1 row affected (0.002 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [lab_test]> UPDATE book
    ->  SET year = '2020-02-12'
    ->  WHERE id = 3;
Query OK, 1 row affected (0.002 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [lab_test]> SELECT *
    -> FROM book
    -> WHERE year > '2015-09-12';
+----+-------+--------+------------+-------+
| id | title | author | year       | price |
+----+-------+--------+------------+-------+
|  2 | ALGO  | Y      | 2017-12-09 |   200 |
|  3 | OS    | Z      | 2020-02-12 |   200 |
+----+-------+--------+------------+-------+
2 rows in set (0.000 sec)
