-- Library Management System project 2

-- Creating branch table
Drop table if exists branch;
create table Branch
(
	branch_id varchar(10) primary key ,
	manager_id varchar(10),	
    branch_address varchar(60),	
    contact_no varchar(10)
);

Drop table if exists Employees;
create table Employees
(
	emp_id	varchar(20) primary key , 
	emp_name varchar(50),	
	position varchar(20), 
	salary int,
	branch_id varchar(20));

Drop table if exists books;
Create table books
(
	isbn varchar(20) primary key,
    book_title	varchar(80),
    category	varchar(20),
    rental_price float,
    status	varchar(20),
    author	varchar(35),
    publisher varchar(60)
);
	
Drop table if exists members;    
create table members
(
	member_id	varchar(20) primary key,
    member_name varchar(35)	,
    member_address	varchar(55),
    reg_date date
    );
    
Drop table if exists issued_status;
Create table issued_status
(
	issued_id varchar(20),
    issued_member_id varchar(20),
	issued_book_name varchar(80),
	issued_date	 date ,
    issued_book_isbn varchar(20),
	issued_emp_id varchar(20)
    );

Drop table if exists return_status;
Create table return_status
(
	return_id varchar(20),
	issued_id varchar(20),
	return_book_name varchar(80),
	return_date date,
	return_book_isbn varchar(20)
    );

select	* from books;
select	* from return_status;

-- Project task 
-- Task 1. Create a New Book Record -- "978-1-60129-456-2', 'To Kill a Mockingbird', 'Classic', 6.00, 'yes', 'Harper Lee', 'J.B. Lippincott & Co.')"

insert into books(isbn, book_title, Category, rental_price, status, author, publisher)
values 
('978-1-60129-456-2', 'To Kill a Mockingbird', 'Classic', 6.00, 'yes', 'Harper Lee', 'J.B. Lippincott & Co.');

-- Task 2: Update an Existing Member's Address

select	* from members;
update members
set member_address = '125 Main st'
where member_id = 'C101';

-- Task 3: Delete a Record from the Issued Status Table
-- Objective: Delete the record with issued_id = 'IS121' from the issued_status table.
select	* from issued_status;
Delete from issued_status
where  issued_id = 'IS121';

-- Task 4: Retrieve All Books Issued by a Specific Employee 
-- Objective: Select all books issued by the employee with emp_id = 'E101'.

select * from issued_status
where issued_emp_id = 'E101';

-- Task 5: List Members Who Have Issued More Than One Book
-- Objective: Use GROUP BY to find members who have issued more than one book.

select 
	issued_emp_id,
	count(issued_id) as Total_book_issued
from issued_status
group by issued_emp_id
having count(issued_id) > 1;

-- CTAS 
-- ask 6: Create Summary Tables: Used CTAS to generate new tables based on query results - each book and total book_issued_cnt**
create table book_cnts
as
Select 
b.isbn,
b.book_title,
count(ist.issued_id) as no_issued
from books as b
join 
issued_status as ist
on ist.issued_book_isbn = b.isbn
group by 1, 2;
select * from book_cnts;

-- Task 7. Retrieve All Books in a Specific Category:
select *
from books
where category = 'classic';

-- Task 8: Find Total Rental Income by Category:

select 
b.category,
sum(b.rental_price),
count(*)
from books as b
join 
issued_status as ist
on ist.issued_book_isbn = b.isbn
group by 1;

-- List Members Who Registered in the Last 180 Days:

insert into members(member_id, member_name, member_address, reg_date)
values 
('C120','sam','125 Main St','2026-11-1'),
('C121','Micheal','420 st oak','2026-11-1');

-- List Employees with Their Branch Manager's Name and their branch details:
select 
e1.*,
e2.emp_name as manager_name
from employees as e1
join
branch as b
on b.branch_id = e1.branch_id
join 
employees as e2
on b.manager_id =e2.emp_id;

-- Task 11:Create a Table of Books with Rental Price Above a Certain Threshold:

create table book_rent
as
Select * from books
where rental_price >= 7;
select * from book_rent;

-- Task 12: Retrieve the List of Books Not Yet Returned
select
 distinct ist.issued_book_name
 from issued_status as ist
 left join 
 return_status as rs
 on ist.issued_id = rs.issued_id
 where rs.return_id is null;

select * from issued_status;

-- End of the Project
 