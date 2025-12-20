
create table Students(
   id INT PRIMARY KEY,
   dept VARCHAR(100),
   email VARCHAR(100)
);

INSERT INTO Students VALUES
(1, 'CSE','abc@gmail.com'),
(2, 'EEE', 'xyz@gmail.com');


CREATE INDEX idx_email
ON Students(email);

SELECT * FROM Students
WHERE email = 'xyz@gmail.com';




CREATE INDEX idx_dept
ON Students(dept);

SELECT * FROM Students
WHERE dept = 'CSE';





