create database MiniLiberyDB;

show databases;
select DATABASE();

create table Authors(
	Authors_ID INT primary key AUTO_INCREMENT,
	Name Varchar(100) not NULL,
	Country Varchar(50) DEFAULT 'Sri Lanka'
);

desc Authors;

create table Books(
	Book_ID INT primary key auto_increment,
	Title VARCHAR(200) not null,
	ISBN VARCHAR(200) unique not null,
	Authors_ID INT,
	Price DECIMAL(10,2) CHECK(Price >= 0),
	Category VARCHAR (50),
	Published_Year INT CHECK(Published_Year >= 1800),
	FOREIGN KEY (Authors_ID) REFERENCES Authors(Authors_ID)
);
DROP TABLE IF EXISTS Borrowings;

create table Borrowings(
	Borrow_ID INT primary key AUTO_INCREMENT,
	Book_ID INT,
	Member_Name VARCHAR(100) not null,
	Borrow_Date DATE default (CURRENT_DATE),
	Return_Date DATE DEFAULT(NULL),
	foreign key (Book_ID) references Books (Book_ID)	
);
desc Borrowings;
show TABLES;

insert into Authors (Name,Country)
values
("Martin Wickramasinghe","Sri Lanka"),
("Arthur C. Clarke", "UK"),
("Kumaratunga Munidasa" ,  "Sri Lanka");

SELECT * FROM Authors;
DELETE FROM Authors WHERE Authors_ID IN (4, 5, 6);
SELECT * FROM Authors;

insert into Books (Title, ISBN, Authors_ID, Price, Category, Published_Year)
values 
('Gamperaliya', '978-955-0001', 1, 1200.00, 'Fiction', 1944),
('Madol Doova', '978-955-0002', 1, 950.00, 'Children', 1947),
('2001: A Space Odyssey', '978-955-0003', 2, 1800.00, 'Science', 1968),
('Village in the Jungle', '978-955-0004', 1, 1100.00, 'Fiction', 1913),
('Hath Pana', '978-955-0005', 1, 850.00, 'Children', 1952),
('Aparajitha', '978-955-0006', 3, 1400.00, 'Fiction', 1957);

SELECT * FROM Books;

insert into Borrowings(Member_Name, Book_ID)
values
("Kamal",1),
("Nimali",2),
("Sunil",3),
("Amala",1),
("Ruwan",4);

select * from Borrowings;

select * from Authors;
select * from Books;

update Books set Price = 1500 where Book_ID =1;
select * from Books where Book_ID = 1;
delete from Authors where Authors_ID = 3;

select A.Name, B.Title
from authors a 
inner join books b on a.Authors_ID = b.Authors_ID ;

INSERT INTO Authors (Name, Country) VALUES ('New Author', 'India');

select A.Name, B.Title
from authors a 
Left join books b on a.Authors_ID = b.Authors_ID ;

SELECT A.Name ,B.Title, br.Member_Name  
FROM Borrowings br
INNER JOIN Books b ON br.Book_ID = b.Book_ID
INNER JOIN Authors a ON b.Authors_ID = a.Authors_ID;

SELECT B.Title, br.Member_Name  
FROM books b
left JOIN borrowings br ON b.Book_ID = br.Book_ID;

select 
Name,
UPPER(Name) as UpperName
from authors a ;

select 
Title,
LENGTH(Title) as TitleLength
from books b  ;

select 
Title,
LENGTH(Title) as TitleLength
from books b  ;




