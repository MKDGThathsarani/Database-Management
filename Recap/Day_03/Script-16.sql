-- ============================================
-- DAY 3: Constraints Practice
-- ============================================

-- 1. Database එක හදන්න
CREATE DATABASE ConstraintDB;

-- ⚠️ දැන් උඩ dropdown එකෙන් ConstraintDB තෝරන්න!

-- 2. Parent Table (Departments)
CREATE TABLE Departments (
    DeptID INT AUTO_INCREMENT PRIMARY KEY,
    DeptName VARCHAR(100) NOT NULL UNIQUE,
    Location VARCHAR(100) DEFAULT 'Main Campus',
    Budget DECIMAL(12,2) CHECK (Budget >= 50000)
);

-- 3. Child Table (Students)
CREATE TABLE Students (
    StudentID INT AUTO_INCREMENT PRIMARY KEY,
    FullName VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Phone VARCHAR(15) UNIQUE,
    Age INT CHECK (Age >= 18 AND Age <= 100),
    Gender ENUM('Male', 'Female', 'Other') NOT NULL,
    City VARCHAR(50) DEFAULT 'Colombo',
    DeptID INT,
    EnrollmentDate DATE DEFAULT (CURRENT_DATE),
    Status ENUM('Active', 'Inactive', 'Graduated') DEFAULT 'Active',
    FOREIGN KEY (DeptID) REFERENCES Departments(DeptID)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);

-- 4. Departments වලට data
INSERT INTO Departments (DeptName, Location, Budget) VALUES
('Computer Science', 'Block A', 500000.00),
('Information Technology', 'Block B', 450000.00);

-- 5. Students වලට data
INSERT INTO Students (FullName, Email, Phone, Age, Gender, DeptID) VALUES
('Kamal Perera', 'kamal@email.com', '0771234567', 22, 'Male', 1),
('Nimali Silva', 'nimali@email.com', '0719876543', 21, 'Female', 1),
('Sunil Fernando', 'sunil@email.com', '0701112233', 23, 'Male', 2);

-- 6. Data බලන්න
SELECT * FROM Students;
SELECT * FROM Departments;

-- ============================================
-- Constraints Test කරන්න (මේවා error එන්න ඕන)
-- ============================================

-- Test 1: UNIQUE fail (kamal@email.com දෙපාරක්)
INSERT INTO Students (FullName, Email, Age, Gender) 
VALUES ('Test', 'kamal@email.com', 22, 'Male');

-- Test 2: CHECK fail (Age 15 < 18)
INSERT INTO Students (FullName, Email, Age, Gender) 
VALUES ('Test', 'test@email.com', 15, 'Male');

-- Test 3: NOT NULL fail (FullName නෑ)
INSERT INTO Students (Email, Age, Gender) 
VALUES ('test2@email.com', 22, 'Male');

-- Test 4: FOREIGN KEY fail (DeptID 999 නෑ)
INSERT INTO Students (FullName, Email, Age, Gender, DeptID) 
VALUES ('Test3', 'test3@email.com', 22, 'Male', 999);

-- ============================================
-- මේවා හරි යන්න ඕන
-- ============================================

-- Test 5: DEFAULT (City, Status, Date auto)
INSERT INTO Students (FullName, Email, Age, Gender) 
VALUES ('Auto Test', 'auto@email.com', 25, 'Female');

SELECT * FROM Students WHERE Email = 'auto@email.com';

-- Test 6: ON DELETE SET NULL
DELETE FROM Departments WHERE DeptID = 2;
SELECT * FROM Students;