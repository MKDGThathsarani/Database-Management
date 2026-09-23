CREATE DATABASE SchoolDB;
USE SchoolDB;

CREATE TABLE Teachers (
    teacher_id INT PRIMARY KEY,
    teacher_name VARCHAR(50),
    email VARCHAR(100)
);

CREATE TABLE Subjects (
    subject_id INT PRIMARY KEY,
    subject_name VARCHAR(50),
    teacher_id INT,
    FOREIGN KEY (teacher_id) REFERENCES Teachers(teacher_id)
);

CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50),
    grade INT,
    city VARCHAR(50)
);

CREATE TABLE Exam_Marks (
    record_id INT PRIMARY KEY,
    student_id INT,
    subject_id INT,
    marks INT,
    exam_date DATE,
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (subject_id) REFERENCES Subjects(subject_id)
);

INSERT INTO Teachers VALUES 
(1, 'Mr. Perera', 'perera@school.lk'),
(2, 'Mrs. Silva', 'silva@school.lk'),
(3, 'Mr. Gunawardena', 'guna@school.lk');

INSERT INTO Subjects VALUES 
(101, 'Mathematics', 1),
(102, 'Science', 2),
(103, 'History', 3),
(104, 'English', 1);

INSERT INTO Students VALUES 
(1, 'Kasun Kalhara', 10, 'Colombo'),
(2, 'Amal Perera', 10, 'Kandy'),
(3, 'Nimali Fonseka', 11, 'Galle'),
(4, 'Ruwan Hettiarachchi', 11, 'Colombo'),
(5, 'Saman Kumara', 10, 'Matara');

INSERT INTO Exam_Marks VALUES 
(1, 1, 101, 85, '2023-12-01'), -- Kasun - Maths
(2, 1, 102, 60, '2023-12-02'), -- Kasun - Science
(3, 2, 101, 45, '2023-12-01'), -- Amal - Maths
(4, 3, 103, 92, '2023-12-03'), -- Nimali - History
(5, 4, 101, 78, '2023-12-01'), -- Ruwan - Maths
(6, 5, 102, 30, '2023-12-02'); -- Saman - Science

select  
	Students.student_name,
	Subjects.subject_name,
	Exam_marks.marks
from exam_marks
inner join student on Exam_marks.student.id = student.student_id
inner join subject on Exam_marks.subject.id = subject.subject_id;

select 
	Subjects.subject_name,
	Teachers.teacher_name
from Exam_Marks
inner join Students on Exam_marks.student_id = Students.student_id
inner join Subjects on Exam_marks.subject_id = Subjects.subject_id
inner join Teachers on Subjects.teacher_id = Teachers.teacher_id
where Students.student_name = 'Kasun Kalhara';

select
	Subjects.subject_name,
	Teachers.teacher_name
from Exam_marks
join Students on Exam_marks.student_id = Students.student_id
join Subjects on Exam_marks.subject_id = Subjects.subject_id
join Teachers on Subjects.teacher_id = Teachers.teacher_id
where Students.student_name = 'Kasun Kalhara';

select 
	Students.student_name,
	Subjects.subject_name,
	Exam_marks.marks
from Exam_marks
inner join Students on Exam_marks.student_id = Students.student_id
inner join Subjects on Exam_marks.subject_id = Subjects.subject_id
where Students.city = 'Colombo';

select 
	Students.student_name,
	Subjects.subject_name,
	Exam_marks.marks
from Exam_marks
inner join Students on Exam_marks.student_id = Students.student_id
inner join Subjects on Exam_marks.subject_id = Subjects.subject_id
where Exam_marks.marks > 80;


select 
	Students.student_name,
	Subjects.subject_name
from Exam_marks
inner join Students on Exam_marks.student_id = Students.student_id
inner join Subjects on Exam_marks.subject_id = Subjects.subject_id
inner join Teachers on Subjects.teacher_id = Teachers.teacher_id
where Teachers.teacher_name = 'Mr. Perera';

select
	Students.student_name,
	Subjects.subject_name
from Teachers
join Subjects on Teachers.teacher_id = Subjects.teacher_id
join Exam_marks on subjects.subject_id = Exam_marks.subject_id
join Students on Exam_marks.student_id = Students.student_id
where Teachers.teacher_name = 'Mr. Perera';


	