CREATE DATABASE U1;
USE U1;

CREATE TABLE S1(
    id INT  PRIMARY KEY,
    name VARCHAR(200) NOT NULL,
    age INT CHECK(age>=18),
    dept VARCHAR(100) DEFAULT 'CSE',
    email VARCHAR(100) UNIQUE,
    dob DATE DEFAULT '2004-12-03'
);

CREATE TABLE C1(
   c_id INT PRIMARY KEY,
   title VARCHAR(200),
   credit INT CHECK( credit BETWEEN  1 AND 5));
   
CREATE TABLE E1(
   s_id INT,
   c_id INT,
   grade CHAR(2),
   PRIMARY KEY(s_id,c_id),
   FOREIGN KEY(s_id) REFERENCES S1(id),
   FOREIGN KEY(c_id) REFERENCES C1(c_id));
   
   
insert into s1 values
(1,'Mr. A',20,'CSE','a@gmail.com','2004-11-12'),
(2,'Mr.s', 23,'EEE','s@gmail.com','2002-12-12');

insert into c1 values
(101,'DBMS',3),
(100,'ALGO',3);

insert into e1 values
(1,101,'A+'),
(1,100,'A+'),
(2,101,'B');


select * from s1,c1,e1;

-- A. NOT NULL Constraint
-- insert into S1(id,name) values
-- (2,NULL);   -- ERROR

insert into S1(id,name) values
(3,'Naba');

insert into S1(id,name) values
(5,'Nosratee');

Select * from s1;


-- B. UNIQUE Constraint
insert into s1 values
(6,'Mr. Ab',20,'CSE','ab@gmail.com','2007-11-12');

-- C. CHECK Constraint
insert into s1(age) values
(5,'Naba',20);

-- D. DEFAULT Constraint
insert into s1(id,name,age,email) values
(7,'Mr. Abx',20,'abx@gmail.com');

-- E. FOREIGN KEY Constraint
-- insert into e1 values
-- (11,101,'A+');    -- Error

insert into e1 values
(7,101,'A+');


