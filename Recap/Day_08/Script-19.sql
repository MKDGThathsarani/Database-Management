CREATE DATABASE IF NOT EXISTS AdvancedDB;

CREATE TABLE IF NOT EXISTS Students (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(100),
    Age INT,
    City VARCHAR(50),
    Marks INT,
    DeptID INT
);

INSERT INTO Students VALUES 
(1, 'Kamal', 22, 'Colombo', 85, 1),
(2, 'Nimali', 21, 'Kandy', 92, 1),
(3, 'Sunil', 23, 'Galle', 78, 2),
(4, 'Amala', 22, 'Colombo', 88, 1),
(5, 'Ruwan', 21, 'Matara', 65, 2),
(6, 'Saman', 24, 'Kandy', 70, 3);

SELECT Name, Marks,
    CASE 
        WHEN Marks >= 80 THEN 'A'
        WHEN Marks >= 70 THEN 'B'
        WHEN Marks >= 60 THEN 'C'
        ELSE 'F'
    END AS Grade
FROM Students;

SELECT Name, City,
    CASE City
        WHEN 'Colombo' THEN 'Western'
        WHEN 'Kandy' THEN 'Central'
        WHEN 'Galle' THEN 'Southern'
        WHEN 'Matara' THEN 'Southern'
        ELSE 'Other'
    END AS Province
FROM Students;

SELECT Name, Marks,
    RANK() OVER (ORDER BY Marks DESC) AS RankNum
FROM Students;

SELECT Name, DeptID, Marks,
    AVG(Marks) OVER (PARTITION BY DeptID) AS DeptAvg,
    Marks - AVG(Marks) OVER (PARTITION BY DeptID) AS Diff
FROM Students;

WITH TopStudents AS (
    SELECT Name, Marks FROM Students WHERE Marks >= 80
)
SELECT * FROM TopStudents;

WITH DeptAvg AS (
    SELECT DeptID, AVG(Marks) AS AvgMarks
    FROM Students
    GROUP BY DeptID
)
SELECT s.Name, s.Marks, d.AvgMarks
FROM Students s
JOIN DeptAvg d ON s.DeptID = d.DeptID
WHERE s.Marks > d.AvgMarks;

WITH DeptAvg AS (
    SELECT DeptID, AVG(Marks) AS AvgMarks
    FROM Students
    GROUP BY DeptID
)
SELECT s.Name, s.Marks, d.AvgMarks
FROM Students s
JOIN DeptAvg d ON s.DeptID = d.DeptID
WHERE s.Marks > d.AvgMarks;

SELECT Name, City FROM Students WHERE City = 'Colombo'
UNION
SELECT Name, City FROM Students WHERE Marks > 80;

SELECT Name, City FROM Students WHERE City = 'Colombo'
UNION ALL
SELECT Name, City FROM Students WHERE Marks > 80;