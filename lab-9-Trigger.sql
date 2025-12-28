DELIMITER //

CREATE TRIGGER trigger_name
AFTER INSERT ON table_name
FOR EACH ROW
BEGIN
   SQL statements;
END //

DELIMITER ;
-- ----------------------------------------------------
CREATE TRIGGER log_student
AFTER INSERT ON s1
FOR EACH ROW
BEGIN
   INSERT INTO log_table(id, name)
   VALUES (NEW.id, NEW.name);
END;
-- -------------------------------------------

create table t_tb(
   id int,
   name varchar(100)
);

DELIMITER //
CREATE TRIGGER t1
AFTER INSERT ON s1
FOR EACH ROW
BEGIN
   insert into t_tb(id,name)
   values (NEW.id, NEW.name);
END //
DELIMITER ;

insert into s1 values
(10,'Mr. Aded',20,'CSE','ade@gmail.com','2004-11-12');

select * from t_tb;

-- ----------------------------------------------------


create table t_tb2(
   id int,
   name varchar(100),
   action varchar(100)
);

delimiter //
create trigger t2
after insert on s1
for each row
begin 
  insert into t_tb2(id,name,action)
  values (new.id,new.name,'insert');
end //
delimiter ;

insert into s1 values
(12,'Mr. Aded',20,'CSE','ad2e@gmail.com','2004-11-12');

select * from t_tb2;

-- -----------------------------------------------------
DELIMITER //
CREATE TRIGGER t
AFTER DELETE ON s1
FOR EACH ROW
BEGIN
  insert into t_tb (id,name)
  values (old.id, old.name);
END //
DELIMITER ;

DELETE 
FROM s1
WHERE id=1;

select * from t_tb;
-- ----------------------------------------------------

use u1;
DELIMITER //
CREATE TRIGGER tt
BEFORE INSERT ON s1
for each row
begin 
    if new.age < 19 then
    signal sqlstate '45000'
    set message_text ='Age must be 18 or big';
    end if;
end //
delimiter ;

drop trigger tt;

insert into s1 values
(111,'Mr. A',2,'CSE','a11@gmail.com','2004-11-12');


-- ---------------------------------------------------------


-- drop database University;
CREATE DATABASE University;
USE University;
CREATE TABLE student(
   s_id INT PRIMARY KEY,
   s_name VARCHAR(100)
);

CREATE TABLE audit_student_table(
   id INT AUTO_INCREMENT PRIMARY KEY,
   s_id INT,
   s_name VARCHAR(100),
   action VARCHAR(100),
   action_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

DELIMITER //
CREATE TRIGGER student_audit
AFTER INSERT ON student
FOR EACH ROW
BEGIN
   INSERT INTO audit_student_table(s_id, s_name, action)
   VALUES (NEW.s_id, NEW.s_name, 'INSERT');
END //
DELIMITER ;


INSERT INTO student
VALUES 
(1118005, 'Nosratee Jahan Naba');

SELECT * FROM audit_student_table;


CREATE TABLE course(
   c_id INT PRIMARY KEY,
   c_name VARCHAR(100)
);

INSERT INTO course
VALUES
(313,'DBMS'),
(311, 'CE');


CREATE TABLE log_table(
   id INT AUTO_INCREMENT PRIMARY KEY,
   c_id INT,
   c_name VARCHAR(100),
   action VARCHAR(100),
   action_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


DELIMITER //
CREATE TRIGGER log_update
AFTER DELETE ON course
FOR EACH ROW
BEGIN
    INSERT INTO log_table (c_id,c_name,action)
    VALUES(old.c_id,old.c_name,'DELETE');
END //
DELIMITER ;

DELETE 
FROM course
WHERE c_id = 311;
 
SELECT * FROM log_table;


ALTER TABLE student
add age INT;

DELIMITER //
CREATE TRIGGER check_student
BEFORE INSERT ON student
FOR EACH ROW
BEGIN
    IF NEW.age < 18 THEN
      SIGNAL SQLSTATE '45000'
      SET MESSAGE_TEXT = 'Age must be greater than 18';
    END IF;
END //
DELIMITER ;

INSERT INTO student
VALUES (101, 'A', 17);

INSERT INTO student
VALUES (101, 'A', 20);



