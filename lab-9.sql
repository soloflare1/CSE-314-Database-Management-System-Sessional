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



