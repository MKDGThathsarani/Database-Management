CREATE DATABASE company_db;
USE company_db;

CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    dept_id INT
    FOREIGN KEY (dept_id) references departments(dept_id)
);

INSERT INTO departments (dept_id, dept_name) VALUES
(101, 'HR'), (102, 'IT'), (103, 'Finance'), (104, 'Marketing');

INSERT INTO employees (emp_id, emp_name, dept_id) VALUES
(1, 'Alice', 101), (2, 'Bob', 102), (3, 'Charlie', 102), (4, 'David', 103), (5, 'Eve', NULL);

select 
	employees.emp_name,
	departmrnts.dept_name
from employees
inner join depatments on employees.dep_id = departments.dep_id;

select
	employees.emp_name,
	departments.dept_name
from employees
join departments on employees.dept_id = departments.dept_id;

select
	employees.emp_name,
	departments.dept_name
from employees
left join departments on employees.dept_id = departments.dept_id;

select
	employees.emp_name,
	departments.dept_name
from employees
right join departments on employees.dept_id = departments.dept_id;






