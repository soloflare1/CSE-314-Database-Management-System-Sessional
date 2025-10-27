-- Create Students table
CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    name VARCHAR(50),
    age INT,
    dept VARCHAR(10)
);

-- Insert data into Students table
INSERT INTO Students (student_id, name, age, dept) VALUES
(1, 'Alice', 20, 'CSE'),
(2, 'Rahim', 22, 'EEE'),
(3, 'Karima', 19, 'CSE'),
(4, 'Rafi', 23, 'BBA');



-- Create Enrollments table
CREATE TABLE Enrollments (
    student_id INT,
    course_id INT,
    grade VARCHAR(5),
    FOREIGN KEY (student_id) REFERENCES Students(student_id)
);

-- Insert data into Enrollments table
INSERT INTO Enrollments (student_id, course_id, grade) VALUES
(1, 101, 'A'),
(2, 102, 'B'),
(3, 101, 'A-'),
(5, 103, 'B+');
