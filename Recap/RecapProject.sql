-- 1. Database එක හදන්න
CREATE DATABASE PracticeDB;
USE PracticeDB;

-- 2. Students table එක හදන්න (; අමතක කරන්න එපා!)
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(100),
    Age INT,
    City VARCHAR(50)
);

-- 3. Courses table එක හදන්න (; අමතක කරන්න එපා!)
CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100),
    Credits INT
);

-- 4. Data බලන්න (දැන් data නෑ, ඒක normal)
SELECT * FROM Students;

-- 5. Table එකේ structure බලන්න
DESC Students;

-- 6. Email column එක add කරන්න (Emaill නෙවෙයි — Email)
ALTER TABLE Students ADD Email VARCHAR(50);

-- 7. Age column එක modify කරන්න
ALTER TABLE Students MODIFY Age INT;

-- 8. Courses table එක drop කරන්න
DROP TABLE Courses;