-- 1. Create a database lab2_test. Inside it create a table books(id, title, author, year). Insert 5
-- rows and show them.
-- 2. Add a new column price to the books table. Update the price for two books.
-- 3. Delete one record from the books table and show the remaining records.
-- 4. Write a query to display all books published after 2015.
CREATE DATABASE lab_test;

USE lab_test;

CREATE TABLE book(
id INT PRIMARY KEY,
title VARCHAR(200),
author VARCHAR(200),
year DATE
);

INSERT INTO book VALUES
(1,'DBMS','X','1990-12-23'),
(2,'ALGO','Y','2000-10-09'),
(3,'OS','Z','1999-07-23'),
(4,'DS','A','1978-12-10'),
(5,'CPP','B','1989-05-12');

SELECT * FROM book;

ALTER TABLE book
ADD price DOUBLE;

UPDATE book
SET price = 200
WHERE id = 2;

UPDATE book
SET price = 200
WHERE id = 3;

SELECT * FROM book;

DELETE FROM book
WHERE id = 1;

SELECT * FROM book;

UPDATE book
SET year = '2017-12-09'
WHERE id = 2;

UPDATE book
SET year = '2020-02-12'
WHERE id = 3;

SELECT *
FROM book
WHERE year > '2015-01-01';


