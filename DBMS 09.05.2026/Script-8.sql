-- Create and select the new database
CREATE DATABASE shop_db;
USE shop_db;

-- Create the Customers table
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(50)
);

-- Create the Orders table
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product_name VARCHAR(50),
    amount DECIMAL(10, 2)
    FOREIGN KEY (customer_id) references customers(customer_id)
);

-- Insert data into the Customers table
INSERT INTO customers (customer_id, customer_name, city) VALUES
(1, 'Kamal', 'Colombo'),
(2, 'Nimal', 'Kandy'),
(3, 'Sunil', 'Galle'),
(4, 'Piyal', 'Matara'); 

-- Insert data into the Orders table
INSERT INTO orders (order_id, customer_id, product_name, amount) VALUES
(101, 1, 'Laptop', 150000.00),
(102, 1, 'Mouse', 1500.00),
(103, 2, 'Keyboard', 3500.00),
(104, 5, 'Monitor', 45000.00);

select 
	customers.customer_name,
	orders.product_name
from orders
inner join customers on orders.customer_id = customers.customer_id;

select 
	customers.customer_name,
	orders.order_name
from customers
left join orders on customers.customer_id = orders.order_id ;

select
	customers.customer_name,
	orders.product_name
from customers
left join orders on customers.customer_id = orders.customer_id;


select
	customers.customer_name,
	orders.product_name
from customers
right join orders on customers.customer_id = orders.customer_id;

select
	customers.customer_name,
	orders.product_name
from customers
right join orders on customers.customer_id = orders.customer_id;

select
	customers.customer_name,
	orders.product_name
from customers
left join orders on customers.customer_id = orders.customer_id
where orders.order_id is null;





