create database TCLDB;
use TCLDB;

CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(100),
    Marks INT
);

INSERT INTO Students VALUES 
(1, 'Kamal', 85),
(2, 'Nimali', 92),
(3, 'Sunil', 78);

SELECT * FROM Students;

-- COMMIT Test
start transaction;
update Students set Marks = 100 where StudentID = 1;
SELECT * FROM Students;
insert into Students values (4,'Amal',75);
SELECT * FROM Students;

commit;

SELECT * FROM Students;

-- ROLEBACK
rollback;
select* from Students;

-- ROLLBACK Test
start transaction;

UPDATE Students SET Marks = 0;
delete from Students where StudentID = 3;

select * from Students;

rollback;

select * from Students;

-- SAVEPOINT
start transaction;

insert into Students values (5,'Ruwan',65);
savepoint sp1;

select * from Students;

UPDATE Students SET Marks = 95 WHERE StudentID = 2;
SAVEPOINT sp2;

select * from Students;

DELETE FROM Students WHERE StudentID = 1;

select * from Students;

ROLLBACK TO sp2;

select * from Students;