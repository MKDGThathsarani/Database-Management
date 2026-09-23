-- Create and select the database
CREATE DATABASE library_db;
USE library_db;

-- Create the Members table
CREATE TABLE members (
    member_id INT PRIMARY KEY,
    member_name VARCHAR(50)
);

-- Create the Books table
-- (member_id indicates who has currently borrowed the book)
CREATE TABLE books (
    book_id INT PRIMARY KEY,
    book_title VARCHAR(100),
    member_id INT
    FOREIGN KEY (member_id) references members(member_id)
);

-- Insert data into the Members table
INSERT INTO members (member_id, member_name) VALUES
(1, 'Saman'),
(2, 'Ruwan'),
(3, 'Nayana'),
(4, 'Kasun'); 
-- Note: Kasun has not borrowed any books.

-- Insert data into the Books table
INSERT INTO books (book_id, book_title, member_id) VALUES
(101, 'Madol Doova', 1),
(102, 'Harry Potter', 2),
(103, 'Sherlock Holmes', 1),
(104, 'The Hobbit', NULL), 
-- Note: The Hobbit is available in the library (not borrowed).
(105, 'Advanced SQL', 99); 
-- Note: Member 99 does not exist in the members table (System Error/Lost record).

select 
	members.member_name,
	books.book_title
from books
inner join
	

