DROP DATABASE IF EXISTS University;
CREATE DATABASE University;
USE University;

DROP TABLE IF EXISTS Student;
CREATE TABLE Student(
   id INT PRIMARY KEY,
   name VARCHAR(100),
   dob DATE
);

INSERT INTO Student
(id, name, dob)
VALUES
(1, 'Alice', '2005-12-03'),
(2, 'Alexa', '2005-12-03'),
(3, 'Arial', '2005-12-03');

SELECT *
FROM Student;

-- Create a new user 'lab_user_x' with password 'lab_pass_x123'
CREATE USER 'lab_user_x'@'localhost' 
IDENTIFIED BY 'lab_pass_x123';

-- Grant SELECT, UPDATE, DELETE, and INSERT privileges on the University database 
GRANT SELECT,UPDATE,DELETE,INSERT
ON University.* 
TO 'lab_user_x'@'localhost';

