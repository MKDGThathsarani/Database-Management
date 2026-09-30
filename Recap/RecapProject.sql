-- ==========================================
-- 1. DATABASE එක හදන්න
-- ==========================================
CREATE DATABASE PracticeDB;

-- ==========================================
-- 2. DATABASE එක තෝරන්න (DBeaver එකේදී උඩ dropdown එකෙන් PracticeDB තෝරන්න)
-- ==========================================

-- ==========================================
-- 3. TABLES හදන්න (DDL)
-- ==========================================
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(100),
    Age INT,
    City VARCHAR(50),
    Marks INT   -- DML වලට අවශ්‍ය නිසා මෙතනට එකතු කළා
);

CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100),
    Credits INT
);

-- ==========================================
-- 4. DATA ඇතුළත් කරන්න (DML - INSERT)
-- ==========================================
INSERT INTO Students (StudentID, Name, Age, City, Marks) VALUES 
(1, 'Kamal', 22, 'Colombo', 85),
(2, 'Nimali', 21, 'Kandy', 92),
(3, 'Sunil', 23, 'Galle', 78),
(4, 'Amala', 22, 'Colombo', 88),
(5, 'Ruwan', 21, 'Matara', 65);

-- ==========================================
-- 5. DATA බලන්න (DML - SELECT)
-- ==========================================
SELECT * FROM Students;

-- ==========================================
-- 6. DATA වෙනස් කරන්න (DML - UPDATE)
-- ==========================================
UPDATE Students SET Marks = 90 WHERE StudentID = 1;

-- වෙනස් වුනාද බලන්න
SELECT * FROM Students WHERE StudentID = 1;

-- ==========================================
-- 7. DATA මකන්න (DML - DELETE)
-- ==========================================
DELETE FROM Students WHERE StudentID = 5;

-- ඉතුරු data බලන්න
SELECT * FROM Students;

-- ==========================================
-- 8. TABLE එකේ හැඩය වෙනස් කරන්න (DDL - ALTER)
-- ==========================================
ALTER TABLE Students ADD Email VARCHAR(100);
ALTER TABLE Students MODIFY Age INT;

-- ==========================================
-- 9. TABLE එක මකන්න (DDL - DROP)
-- ==========================================
DROP TABLE Courses;