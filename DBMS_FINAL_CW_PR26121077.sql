-- Q1
CREATE DATABASE citymed_hms;

USE citymed_hms;

-- Q2
CREATE TABLE departments(
	dept_id INT PRIMARY KEY AUTO_INCREMENT,
	dept_name VARCHAR(100) NOT NULL unique,
	location VARCHAR(100) NOT NULL,
	phone_ext CHAR(10) NOT NULL,
	head_doctor VARCHAR(50) NULL
);

-- Q3
CREATE TABLE wards (
    ward_id INT PRIMARY KEY AUTO_INCREMENT,
    ward_name VARCHAR(100) NOT NULL,
    dept_id INT NOT NULL,
    capacity INT NOT NULL CHECK (capacity BETWEEN 1 AND 100),
    ward_type ENUM('General', 'ICU', 'Surgical', 'Maternity', 'Paediatric') DEFAULT 'General',
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);

-- Q4
CREATE TABLE doctors(
	doctor_id INT PRIMARY KEY AUTO_INCREMENT,
	first_name VARCHAR(100) NOT NULL,
	Last_name VARCHAR(100) NOT NULL,
	speciality VARCHAR(100) NOT NULL,
	dep_id INT NOT NULL,
	email VARCHAR(100) UNIQUE,
	phone INT NOT NULL,
	hir_date DATE NOT NULL,
	salary DECIMAL(10,2) NOT NULL CHECK(salary > 0),
	FOREIGN KEY (dep_id) REFERENCES departments(dept_id)
	);

-- Q5
CREATE TABLE nurses (
    nurse_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    ward_id INT NOT NULL,
    shift ENUM('Morning', 'Evening', 'Night') NOT NULL,
    email VARCHAR(50) NOT NULL UNIQUE,
    FOREIGN KEY (ward_id) REFERENCES wards(ward_id)
);

-- Q6
CREATE TABLE patients(
	patient_id INT PRIMARY KEY AUTO_INCREMENT,
	first_name VARCHAR(100) NOT NULL,
	last_name VARCHAR(100) NOT NULL,
	dob DATE NOT NULL,
	gender ENUM('Male','Female','Other')NOT NULL,
	blood_group ENUM('A+','A-','B+','B-','AB+','O+','O-') NULL,
	phone VARCHAR(20) NOT NULL,
	email VARCHAR(50) NULL,
	address TEXT NULL,
	registered_on DATE NOT NULL DEFAULT (CURRENT_DATE)
	);


-- Q7
CREATE TABLE appointments(
	appointment_id INT PRIMARY KEY AUTO_INCREMENT,
	patient_id INT NOT NULL,
	doctor_id INT NOT NULL,
	appt_date DATE NOT NULL,
	appt_time TIME NOT NULL,
	reason VARCHAR(255) NOT NULL,
	status ENUM('Scheduled','Completed','Cancelled','No-Show') DEFAULT 'Scheduled',
	notes TEXT NULL,
	FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id),
	FOREIGN KEY (patient_id) REFERENCES patients(patient_id)
	);

-- Q8
CREATE TABLE prescriptions(
	prescription_id INT PRIMARY KEY AUTO_INCREMENT,
	appointment_id INT NOT NULL,
	medicine_name VARCHAR(150) NOT NULL,
	dosage VARCHAR(50) NOT NULL,
	duration_days INT UNSIGNED NOT NULL  CHECK(duration_days BETWEEN 1 and 365),
	instructions TEXT NULL,
	issued_date DATE NOT NULL DEFAULT(CURRENT_DATE),
	FOREIGN KEY (appointment_id) REFERENCES appointments(appointment_id)
		ON DELETE CASCADE 
		ON UPDATE CASCADE,
	UNIQUE KEY unique_medicine_per_appointment (appointment_id, medicine_name)
	);

-- Q9
CREATE TABLE bills(
	bill_id INT  PRIMARY KEY AUTO_INCREMENT,
	appointment_id INT NOT NULL UNIQUE,
	totle_amount DECIMAL(10,2) NOT NULL CHECK(totle_amount >=0),
	paid_amount DECIMAL(10,2) NOT NULL DEFAULT '0.00' CHECK(paid_amount >=0),
	payment_ststus ENUM('Unpaid','Partial','Paid') DEFAULT 'Unpaid',
	billing_date DATE NOT NULL DEFAULT(CURRENT_DATE),
	FOREIGN KEY (appointment_id) REFERENCES appointments(appointment_id),
	CHECK(paid_amount <= totle_amount)
	);

-- Q10
ALTER TABLE  patients
ADD emergency_contact VARCHAR(50) null;

-- Q11
ALTER TABLE doctors
MODIFY phone VARCHAR (50) not null;

-- Q12
-- ALTER TABLE appointments
-- ADD CONSTRAINT chk_appt_date_future  
-- CHECK (appt_date >= CURRENT_DATE);
     -- appt_date (appointment date) must be today or a future date (cannot take a past date).
     -- But this id error (version )
SHOW TABLES;
DESC departments;
DESC wards;
DESC doctors;
DESC nurses;
DESC patients;
DESC appointments;
DESC prescriptions;
DESC bills;


-- Q13
DROP TABLE IF EXISTS bills;
DROP TABLE IF EXISTS prescriptions;
DROP TABLE IF EXISTS appointments;
DROP TABLE IF EXISTS nurses;
DROP TABLE IF EXISTS wards;
DROP TABLE IF EXISTS doctoes;
DROP TABLE IF EXISTS patient;
DROP TABLE IF EXISTS departmens;

-- Clarification: This sequence is followed because of foreign key constraints.
-- Child tables (tables with foreign keys) must be dropped before parent tables.
-- Otherwise, a foreign key constraint violation error will occur.

-- Q14
INSERT INTO departments (dept_name, location, phone_ext, head_doctor)
	VALUES
    ('Cardiology', '3rd Floor, East Wing', '1234', 'Dr. John Smith'),
    ('Orthopaedics', '2nd Floor, West Wing', '5678', 'Dr. Sarah Lee'),
    ('Neurology', '4th Floor, North Wing', '9012', 'Dr. Michael Brown'),
    ('Paediatrics', '1st Floor, South Wing', '3456', 'Dr. Emily White');

SELECT * FROM departments;

INSERT INTO wards (ward_name, dept_id, capacity, ward_type)
VALUES
    ('Cardiac Care ICU', 1, 25, 'ICU'),
    ('Cardiology General Ward', 1, 40, 'General'),
    ('Orthopaedic Surgical Ward', 2, 30, 'Surgical'),
    ('Orthopaedic Recovery Ward', 2, 35, 'General'),
    ('Neurology ICU', 3, 20, 'ICU'),
    ('Neurology General Ward', 3, 45, 'General'),
    ('Paediatric Ward', 4, 50, 'Paediatric'),
    ('Neonatal ICU', 4, 15, 'ICU');

SELECT * FROM wards;

-- Q16
INSERT INTO doctors (first_name, Last_name, speciality, dep_id, email, phone, hir_date, salary)
VALUES
    ('John', 'Smith', 'Cardiologist', 1, 'john.smith@citymed.com', 771234501, '2018-06-15', 250000.00),
    ('Sarah', 'Lee', 'Orthopaedic Surgeon', 2, 'sarah.lee@citymed.com', 771234502, '2019-03-20', 225000.00),
    ('Michael', 'Brown', 'Neurologist', 3, 'michael.brown@citymed.com', 771234503, '2020-01-10', 240000.00),
    ('Emily', 'White', 'Paediatrician', 4, 'emily.white@citymed.com', 771234504, '2017-11-05', 210000.00),
    ('David', 'Wilson', 'Cardiologist', 1, 'david.wilson@citymed.com', 771234505, '2021-07-22', 235000.00);

SELECT * FROM doctors;

-- Q17
INSERT INTO nurses (first_name, last_name, ward_id, shift, email)
	VALUES
    ('Mary', 'Johnson', 1, 'Morning', 'mary.johnson@citymed.com'),
    ('Lisa', 'Brown', 3, 'Night', 'lisa.brown@citymed.com'),
    ('Anna', 'Williams', 7, 'Evening', 'anna.williams@citymed.com');

select * FROM nurses;

-- Q18
INSERT INTO patients (first_name, last_name, dob, gender, blood_group, phone, email, address)
VALUES
    ('Kamal', 'Perera', '1985-05-15', 'Male', 'O+', '0712345678', 'kamal.perera@email.com', 'Colombo'),
    ('Nimali', 'Silva', '1990-10-20', 'Female', 'A-', '0723456789', 'nimali.silva@email.com', 'Kandy'),
    ('Sunil', 'Jayawardena', '1978-03-12', 'Male', 'B+', '0734567890', NULL, 'Galle'),
    ('Amali', 'Fernando', '1995-07-25', 'Female', 'AB+', '0745678901', 'amali.f@email.com', 'Negombo'),
    ('Ruwan', 'Rathnayake', '2000-12-01', 'Other', 'O-', '0756789012', 'ruwan.r@email.com', 'Kurunegala'),
    ('Dilani', 'Bandara', '1988-08-18', 'Female', 'A+', '0767890123', NULL, 'Matara');

SELECT * FROM patients;

-- Q19
INSERT INTO appointments (patient_id, doctor_id, appt_date, appt_time, reason, status, notes)
VALUES
    (1, 1, '2024-01-10', '09:00:00', 'Chest pain', 'Completed', 'ECG normal'),
    (2, 2, '2024-01-12', '10:30:00', 'Knee pain', 'Completed', 'Physiotherapy'),
    (3, 3, '2024-01-15', '14:00:00', 'Headache', 'Completed', 'MRI scheduled'),
    (4, 4, '2024-01-18', '11:00:00', 'Vaccination', 'Completed', 'Done'),
    (1, 3, '2024-02-01', '09:30:00', 'Neurology check', 'Scheduled', NULL),
    (2, 1, '2024-02-03', '13:00:00', 'Cardiac check', 'Scheduled', NULL),
    (5, 2, '2024-02-05', '10:00:00', 'Back pain', 'Scheduled', NULL),
    (3, 1, '2024-01-05', '08:30:00', 'Checkup', 'Cancelled', 'Patient cancelled');

SELECT * FROM appointments;

-- Q20
INSERT INTO prescriptions (appointment_id, medicine_name, dosage, duration_days, instructions)
VALUES
    (1, 'Aspirin', '75mg once daily', 30, 'Take after breakfast'),
    (1, 'Atorvastatin', '20mg once daily', 90, 'Take at bedtime'),
    (2, 'Ibuprofen', '400mg three times daily', 7, 'Take after meals'),
    (3, 'Paracetamol', '500mg twice daily', 5, 'Take when headache occurs'),
    (4, 'Vitamin C', '500mg once daily', 30, 'Take after breakfast');

SELECT * FROM prescriptions;

-- Q21
INSERT INTO bills (appointment_id, totle_amount, paid_amount, payment_ststus, billing_date)
VALUES
    (1, 7500.00, 7500.00, 'Paid', '2024-01-10'),
    (2, 5000.00, 2000.00, 'Partial', '2024-01-12'),
    (3, 3500.00, 0.00, 'Unpaid', '2024-01-15'),
    (4, 2500.00, 2500.00, 'Paid', '2024-01-18');

SELECT * FROM bills;

-- Q22
UPDATE appointments
SET status = 'Cancelled',
	notes = 'Appointment cancelled by patient due to personal reasons'
WHERE appointment_id = 8;

SELECT * FROM appointments;

USE citymed_hms;

--  Q23
UPDATE bills
SET paid_amount = LEAST(paid_amount + 5000, totle_amount),
	payment_ststus = CASE
					WHEN (paid_amount + 5000) >= totle_amount 
					THEN 'Paid'
					ELSE 'Partial'
	END
WHERE bill_id = 2;
	
SELECT * FROM bills;

-- Q24
UPDATE doctors
JOIN departments ON doctors.dep_id = departments.dept_id
set salary = salary * 0.10
WHERE departments.dept_name = 'Cardiologist';

SELECT * FROM doctors;

-- Q25
DELETE FROM bills
WHERE appointment_id in (
	SELECT appointment_id
	FROM appointments
	WHERE status = 'cancelled'
);

SELECT * FROM bills;

-- Q26
DELETE  FROM appointments
WHERE status = 'No Show'
	AND appt_date < DATE_SUB(CURDATE(), INTERVAL 2 YEAR);

SELECT * FROM appointments;

-- Q27
SELECT 
	patient_id,
	CONCAT(first_name,'',last_name)as full_name,
	dob,
	gender,
	blood_group,
	phone
FROM patients
ORDER BY last_name;

-- Q28
select 
	CONCAT (patients.first_name,'',patients.last_name)as patient_name,
	CONCAT (doctors.first_name,'',doctors.Last_name)as doctor_name,
	appt_date,
	appt_time,
	reason
from appointments
inner join patients on appointments.patient_id = patients.patient_id
inner join doctors on appointments.doctor_id = doctors.doctor_id
where appointments.status = 'Scheduled' and appointments.appt_date >= CURDATE()
order by appointments.appt_date,appointments.appt_time;

-- Q29
SELECT 
    appointments.appointment_id,
    CONCAT(patients.first_name, ' ', patients.last_name) AS patient_name,
    CONCAT(doctors.first_name, ' ', doctors.last_name) AS doctor_name,
    departments.dept_name AS department_name,
    appointments.appt_date,
    appointments.appt_time,
    appointments.status
FROM appointments 
INNER JOIN patients ON appointments.patient_id = patients.patient_id
INNER JOIN doctors ON appointments.doctor_id = doctors.doctor_id
INNER JOIN departments ON doctors.dep_id = departments.dept_id;

-- Q30
SELECT 
	prescriptions.prescription_id,
	CONCAT(patients.first_name, ' ', patients.last_name) AS patient_name,
    CONCAT(doctors.first_name, ' ', doctors.last_name) AS doctor_name,
    prescriptions.medicine_name,
    prescriptions.dosage,
    prescriptions.duration_days AS duration
FROM prescriptions
INNER JOIN appointments ON prescriptions.appointment_id = appointments.appointment_id
INNER JOIN patients ON appointments.patient_id = patients.patient_id
INNER JOIN doctors ON appointments.doctor_id = doctors.doctor_id
where appointments.status = 'Completed';

-- Q31
SELECT
	patients.patient_id,
	CONCAT(patients.first_name, ' ', patients.last_name) AS patient_name,
	COUNT(appointments.appointment_id) AS total_appointments
	FROM patients
LEFT JOIN appointments ON patients.patient_id = appointments.patient_id
GROUP BY patients.patient_id, patients.first_name,patients.last_name
ORDER BY total_appointments desc;

-- Q32
SELECT
	wards.ward_id,
	wards.ward_name,
	wards.ward_type,
	COUNT(nurses.nurse_id) AS nurse_count
FROM wards
LEFT JOIN nurses ON wards.ward_id = nurses.ward_id
GROUP BY wards.ward_id, wards.ward_name,wards.ward_type
ORDER BY nurse_count DESC;

-- Q33
SELECT 
    doctors.doctor_id,
    CONCAT(doctors.first_name, ' ', doctors.last_name) AS doctor_name,
    doctors.speciality,
    COUNT(appointments.appointment_id) AS appointment_count
FROM appointments 
RIGHT JOIN doctors ON appointments.doctor_id = doctors.doctor_id
GROUP BY doctors.doctor_id, doctors.first_name, doctors.last_name, doctors.speciality
ORDER BY appointment_count DESC;

-- Q34
SELECT 
    departments.dept_name AS department_name,
    COUNT(DISTINCT appointments.appointment_id) AS total_appointments,
    COALESCE(SUM(bills.totle_amount), 0) AS gross_revenue,
    COALESCE(SUM(bills.paid_amount), 0) AS collected,
    COALESCE(SUM(bills.totle_amount - bills.paid_amount), 0) AS outstanding_balance
FROM departments
LEFT JOIN doctors ON departments.dept_id = doctors.dep_id
LEFT JOIN appointments ON doctors.doctor_id = appointments.doctor_id
LEFT JOIN bills ON appointments.appointment_id = bills.appointment_id
GROUP BY departments.dept_id, departments.dept_name
ORDER BY gross_revenue DESC;

-- Q35
SELECT 
    CONCAT(patients.first_name, ' ', patients.last_name) AS patient_name,
    patients.phone
FROM patients 
WHERE patients.patient_id IN (
    SELECT DISTINCT appointments.patient_id
    FROM appointments 
    INNER JOIN bills ON appointments.appointment_id = bills.appointment_id
    WHERE bills.payment_ststus IN ('Unpaid', 'Partial')
);

-- Q36










-- Q37

-- Q38
-- Q39

-- Q40

-- Q41
ALTER TABLE prescriptions
ADD CONSTRAINT chk_duration_max_365 
CHECK (duration_days <= 365);
