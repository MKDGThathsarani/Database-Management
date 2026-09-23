-- Create database for Ride-Sharing App
CREATE DATABASE rideshare_db;
USE rideshare_db;

-- Create drivers table
CREATE TABLE drivers (
    driver_id INT PRIMARY KEY,
    driver_name VARCHAR(50)
);

-- Create rides table
CREATE TABLE rides (
    ride_id INT PRIMARY KEY,
    driver_id INT,
    destination VARCHAR(100),
    fare DECIMAL(10, 2)
);

-- Insert data into drivers
INSERT INTO drivers (driver_id, driver_name) VALUES
(1, 'Kamal'),
(2, 'Nimal'),
(3, 'Sunil'); 
-- Note: Sunil will have 0 rides.

-- Insert data into rides
INSERT INTO rides (ride_id, driver_id, destination, fare) VALUES
(101, 1, 'Colombo', 1500.00),
(102, 1, 'Gampaha', 2000.00),
(103, 2, 'Kandy', 3500.00),
(104, NULL, 'Galle', 4500.00); 
-- Note: Ride 104 has a missing driver_id (System Glitch).

select
	drivers.driver_name
from drivers
left join rides on drivers.driver_id = rides.driver_id
where rides.ride_id is null;



