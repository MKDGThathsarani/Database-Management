CREATE DATABASE SubqueryDB;

SELECT DATABASE();

CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(100),
    Age INT,
    City VARCHAR(50),
    Marks INT,
    DeptID INT
);

CREATE TABLE Departments (
    DeptID INT PRIMARY KEY,
    DeptName VARCHAR(100)
);

SHOW TABLES;

INSERT INTO Departments VALUES 
(1, 'CS'), (2, 'IT'), (3, 'Math');

INSERT INTO Students VALUES 
(1, 'Kamal', 22, 'Colombo', 85, 1),
(2, 'Nimali', 21, 'Kandy', 92, 1),
(3, 'Sunil', 23, 'Galle', 78, 2),
(4, 'Amala', 22, 'Colombo', 88, 1),
(5, 'Ruwan', 21, 'Matara', 65, 2),
(6, 'Saman', 24, 'Kandy', 70, 3);

SELECT * FROM Students;

-- Kamal ගේ Marks එකට වඩා වැඩි අය
SELECT Name, Marks 
FROM Students
WHERE Marks > (SELECT Marks FROM Students WHERE Name = 'Kamal');

-- CS dept එකේ ඉන්න students
SELECT Name 
FROM Students
WHERE DeptID IN (SELECT DeptID FROM Departments WHERE DeptName = 'CS');

-- තමන්ගේ city එකේ සාමාන්‍ය marks ට වැඩි අය
SELECT Name, City, Marks
FROM Students s1
WHERE Marks > (SELECT AVG(Marks) FROM Students s2 WHERE s2.City = s1.City);

-- Students ඉන්න departments
SELECT DeptName 
FROM Departments d
WHERE EXISTS (SELECT 1 FROM Students s WHERE s.DeptID = d.DeptID);

-- Students නැති departments
SELECT DeptName 
FROM Departments d
WHERE NOT EXISTS (SELECT 1 FROM Students s WHERE s.DeptID = d.DeptID);

INSERT INTO Departments VALUES (4, 'Physics');

SELECT DeptName 
FROM Departments d
WHERE NOT EXISTS (SELECT 1 FROM Students s WHERE s.DeptID = d.DeptID);