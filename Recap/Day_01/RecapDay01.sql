create database PracticeDB;
use PracticeDB;

create table Students(
	StudentID INT primary key,
	Name VARCHAR(100),
	Age INT,
	City VARCHAR(50)
)

create table Courses(
	CourseID INT primary key,
	CourseName VARCHAR(100),
	Credits INT
)

select * from Students;
desc Students;

alter table Students add Emaill VARCHAR(50);

alter table Students modify age INT;

drop table Courses;