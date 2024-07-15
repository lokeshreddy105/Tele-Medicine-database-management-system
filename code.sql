create database project;
use project;
CREATE TABLE patient (
patient_id INT PRIMARY KEY,
gender ENUM('M', 'F'),
dob DATE,
fullname VARCHAR(255),
username VARCHAR(255),
address VARCHAR(255),
email VARCHAR(255),
phone_number VARCHAR(255),
password VARCHAR(255)
);
CREATE TABLE payment_list (
payment_id INT PRIMARY KEY,
appointment_id INT,
patient_id INT,
proof_of_payment VARCHAR(255),
remark VARCHAR(255),
status ENUM('Pending', 'Completed', 'Failed'),
amount DECIMAL(10,2),
service_id INT
);
CREATE TABLE user (
user_id INT PRIMARY KEY,
user_name VARCHAR(255),
email VARCHAR(255),
password VARCHAR(255),
contact VARCHAR(255),
fullname VARCHAR(255),
status ENUM('Active', 'Inactive')
);
CREATE TABLE doctor (
doctor_id INT PRIMARY KEY,
password VARCHAR(255),

gender ENUM('M', 'F'),
phone_number VARCHAR(255),
date_of_birth DATE,
status ENUM('Active', 'Inactive'),
address VARCHAR(255),
email VARCHAR(255),
user_id INT,
FOREIGN KEY (user_id) REFERENCES user(user_id)
);
CREATE TABLE appointment (
appointment_id INT PRIMARY KEY,
doctor_id INT,
patient_id INT,
date DATE,
amount DECIMAL(10,2),
time TIME,
service_id INT,
status ENUM('Pending', 'Confirmed', 'Cancelled')
);
CREATE TABLE services (
service_id INT PRIMARY KEY,
service_name VARCHAR(255),
doctor_name VARCHAR(255),
amount DECIMAL(10,2)
);
CREATE TABLE review (
review_id INT AUTO_INCREMENT PRIMARY KEY,
doctor_id INT,
rating INT,
patient_id INT
);

INSERT INTO patient (patient_id, gender, dob, fullname, username, address,
email, phone_number, password)
VALUES
(1, 'M', '1990-05-15', 'John Doe', 'john_doe', '123 Main St, Cityville',
'john.doe@email.com', '555-1234', 'password123'),
(2, 'F', '1985-08-22', 'Jane Smith', 'jane_smith', '456 Oak St, Townsville',
'jane.smith@email.com', '555-5678', 'securepass'),
(3, 'M', '1995-02-10', 'Bob Johnson', 'bob_j', '789 Pine St, Villagetown',
'bob.johnson@email.com', '555-9876', 'secretword'),
(4, 'F', '1988-11-30', 'Alice Brown', 'alice_b', '321 Maple St, Hamletville',
'alice.brown@email.com', '555-4321', 'p@ssw0rd'),
(5, 'M', '1980-03-25', 'Michael White', 'mike_white', '567 Elm St, Countryside',
'michael.white@email.com', '555-8765', 'mysecret'),
(6, 'F', '1992-07-12', 'Eva Miller', 'eva_m', '987 Birch St, Suburbia',
'eva.miller@email.com', '555-2345', 'eva_password');

INSERT INTO payment_list (payment_id, appointment_id, patient_id,
proof_of_payment, remark, status, amount, service_id)
VALUES
(1, 101, 1, 'payment_proof_1.jpg', 'Payment for appointment on 2024-03-01',
'Completed', 50.00, 201),
(2, 102, 2, 'payment_proof_2.jpg', 'Payment for appointment on 2024-03-02',
'Completed', 75.50, 202),
(3, 103, 3, 'payment_proof_3.jpg', 'Payment for appointment on 2024-03-03',
'Pending', 30.00, 203),
(4, 104, 4, 'payment_proof_4.jpg', 'Payment for appointment on 2024-03-04',
'Failed', 45.25, 204),
(5, 105, 5, 'payment_proof_5.jpg', 'Payment for appointment on 2024-03-05',
'Completed', 60.75, 205),
(6, 106, 6, 'payment_proof_6.jpg', 'Payment for appointment on 2024-03-06',
'Pending', 40.50, 206);

INSERT INTO user (user_id, user_name, email, password, contact, fullname,
status)
VALUES
(1, 'john_doe', 'john.doe@email.com', 'password123', '555-1234', 'John Doe',

'Active'),
(2, 'jane_smith', 'jane.smith@email.com', 'securepass', '555-5678', 'Jane
Smith', 'Active'),
(3, 'bob_j', 'bob.johnson@email.com', 'secretword', '555-9876', 'Bob Johnson',
'Active'),
(4, 'alice_b', 'alice.brown@email.com', 'p@ssw0rd', '555-4321', 'Alice Brown',
'Active'),
(5, 'mike_white', 'michael.white@email.com', 'mysecret', '555-8765', 'Michael
White', 'Active'),
(6, 'eva_m', 'eva.miller@email.com', 'eva_password', '555-2345', 'Eva Miller',
'Active');

INSERT INTO doctor (doctor_id, password, gender, phone_number,
date_of_birth, status, address, email, user_id)
VALUES
(1, 'dr_password123', 'M', '555-1234', '1980-05-15', 'Active', '123 Medical St,
Hospitalville', 'dr.smith@email.com', 1),
(2, 'dr_securepass', 'F', '555-5678', '1975-08-22', 'Active', '456 Health St, Clinic
City', 'dr.jones@email.com', 2),
(3, 'dr_secretword', 'M', '555-9876', '1985-02-10', 'Active', '789 Care St,
Healthtown', 'dr.white@email.com', 3);

INSERT INTO appointment (appointment_id, doctor_id, patient_id, date, amount,
time, service_id, status)
VALUES
(101, 1, 1, '2024-03-01', 50.00, '10:00:00', 301, 'Confirmed'),
(102, 2, 2, '2024-03-02', 75.50, '11:30:00', 302, 'Confirmed'),
(103, 3, 3, '2024-03-03', 30.00, '14:15:00', 303, 'Pending'),
(104, 1, 4, '2024-03-04', 45.25, '16:45:00', 304, 'Pending'),
(105, 2, 5, '2024-03-05', 60.75, '09:00:00', 305, 'Cancelled'),
(106, 3, 6, '2024-03-06', 40.50, '13:30:00', 306, 'Confirmed');

INSERT INTO services (service_id, service_name, doctor_name, amount)
VALUES
(301, 'General Checkup', 'Dr. Smith', 50.00),

(302, 'Dental Cleaning', 'Dr. Jones', 75.50),
(303, 'X-ray Examination', 'Dr. White', 30.00),
(304, 'Blood Test', 'Dr. Smith', 45.25),
(305, 'Eye Examination', 'Dr. Jones', 60.75),
(306, 'Physical Therapy', 'Dr. White', 40.50);

INSERT INTO review (doctor_id, rating, patient_id)
VALUES
(1, 4, 1),
(2, 5, 2),
(3, 3, 3),
(1, 4, 4),
(2, 5, 5),
(3, 3, 6);

SELECT * FROM patient;
SELECT * FROM payment_list;
SELECT * FROM user;
SELECT * FROM doctor;
SELECT * FROM appointment;
SELECT * FROM services;
SELECT * FROM review;
-- 1)User Table:
-- Select all active users:
SELECT * FROM user WHERE status = 'Active';
-- Select users with a specific email:
SELECT * FROM user WHERE email = 'example@email.com';
-- Select users with usernames starting with 'j':
SELECT * FROM user WHERE user_name LIKE 'j%';
-- Select users with 'Inactive' status and order them by the user name:
SELECT * FROM user WHERE status = 'Inactive' ORDER BY user_name;
-- subqueries
-- Select patients who have made payments:
SELECT * FROM user WHERE user_id IN (SELECT DISTINCT patient_id
FROM payment_list);

-- Select users with the highest rating in reviews:
SELECT * FROM user WHERE user_id = (SELECT patient_id FROM review
ORDER BY rating DESC LIMIT 1);

-- 2)Patient Table:
-- Select patients with 'F' gender:
SELECT * FROM patient WHERE gender = 'F';
-- Select patients born after a specific date:
SELECT * FROM patient WHERE dob > '1990-01-01';
-- Select patients who live in a specific city:
SELECT * FROM patient WHERE address LIKE '%City%';
-- Select patients who were born between two dates:
SELECT * FROM patient WHERE dob BETWEEN '1980-01-01' AND '1990-01-
01';
-- subqueries
-- Select patients who have upcoming appointments:
SELECT * FROM patient WHERE patient_id IN (SELECT DISTINCT patient_id
FROM appointment WHERE date > CURDATE());
-- Select patients who have not made any payments:
SELECT * FROM patient WHERE patient_id NOT IN (SELECT DISTINCT
patient_id FROM payment_list);

-- 3)Payment List Table:
-- Select completed payments:
SELECT * FROM payment_list WHERE status = 'Completed';
-- Select payments with an amount greater than a specific value:
SELECT * FROM payment_list WHERE amount > 50.00;

-- Select payments with a specific proof of payment:
SELECT * FROM payment_list WHERE proof_of_payment =
'payment_proof_1.jpg';
-- Select payments with an amount between two values:
SELECT * FROM payment_list WHERE amount BETWEEN 40.00 AND 60.00;
-- subqueries
-- Select payments with amounts greater than the average payment amount:
SELECT * FROM payment_list WHERE amount > (SELECT AVG(amount)
FROM payment_list);
-- Select the latest payment for each patient:
SELECT * FROM payment_list WHERE (patient_id, date) IN (SELECT
patient_id, MAX(date) FROM payment_list GROUP BY patient_id);

-- 4)Doctor Table:
-- Select inactive doctors:
SELECT * FROM doctor WHERE status = 'Inactive';
-- Select doctors with a specific gender:
SELECT * FROM doctor WHERE gender = 'M';
-- Select doctors with a specific address:
SELECT * FROM doctor WHERE address LIKE '%Health%';
-- Select doctors who are born after a specific date:
SELECT * FROM doctor WHERE date_of_birth > '1975-01-01';
-- subqueries
-- Select doctors who have pending appointments:
SELECT * FROM doctor WHERE doctor_id IN (SELECT DISTINCT doctor_id
FROM appointment WHERE status = 'Pending');
-- Select doctors who have received the highest rating:
SELECT * FROM doctor WHERE doctor_id = (SELECT doctor_id FROM review
ORDER BY rating DESC LIMIT 1);

-- 5)Appointment Table:
-- Select appointments for a specific doctor:
SELECT * FROM appointment WHERE doctor_id = 1;
-- Select pending appointments:

SELECT * FROM appointment WHERE status = 'Pending';
-- subqueries
-- Select appointments with a service amount greater than the average service
amount:
SELECT * FROM appointment WHERE amount > (SELECT AVG(amount)
FROM services);
-- Select appointments for patients who have made payments:
SELECT * FROM appointment WHERE patient_id IN (SELECT DISTINCT
patient_id FROM payment_list);

-- 6)Services Table:
-- Select services with an amount less than a specific value:
SELECT * FROM services WHERE amount < 60.00;
-- Select services provided by a specific doctor:
SELECT * FROM services WHERE doctor_name = 'Dr. Smith';
-- subqueries
-- Select services with an amount greater than the average service amount:
SELECT * FROM services WHERE amount > (SELECT AVG(amount) FROM
services);
-- Select services with the most appointments:
SELECT * FROM services WHERE service_id = (SELECT service_id FROM
appointment GROUP BY service_id ORDER BY COUNT(*) DESC LIMIT 1);

-- 7) Review Table:
-- Select reviews with a rating greater than a specific value:
SELECT * FROM review WHERE rating > 3;
-- Select reviews for a specific doctor:
SELECT * FROM review WHERE doctor_id = 2;
-- subqueries
-- Select reviews for doctors with an average rating greater than 4:
SELECT * FROM review WHERE doctor_id IN (SELECT doctor_id FROM review
GROUP BY doctor_id HAVING AVG(rating) > 4);

-- Select reviews for patients who have upcoming appointments:
SELECT * FROM review WHERE patient_id IN (SELECT DISTINCT patient_id
FROM appointment WHERE date > CURDATE());

-- clauses-- clauses-- clauses-- clauses-- clauses
-- 1)user table
-- GROUP BY and ORDER BY:
-- Select the count of users by status and order by count in descending order:
SELECT status, COUNT(*) AS user_count
FROM user
GROUP BY status
ORDER BY user_count DESC;
-- 2)Patient Table:
-- GROUP BY and HAVING:
-- Select the count of appointments for each patient and filter for those with more
than 3 appointments:
SELECT patient_id, COUNT(*) AS appointment_count
FROM appointment
GROUP BY patient_id
HAVING appointment_count > 3;
-- ORDER BY:
-- Select patients and order them by date of birth in ascending order:
SELECT * FROM patient
ORDER BY dob ASC;

-- 3)Payment List Table:
-- GROUP BY and ORDER BY:
-- Select the total amount of payments for each status and order by total amount
in descending order:
SELECT status, SUM(amount) AS total_amount
FROM payment_list

GROUP BY status
ORDER BY total_amount DESC;

-- 4)Doctor Table:
-- GROUP BY and HAVING:
-- Select the count of appointments for each doctor and filter for those with more
than 5 appointments:
SELECT doctor_id, COUNT(*) AS appointment_count
FROM appointment
GROUP BY doctor_id
HAVING appointment_count > 5;
-- ORDER BY:
-- Select doctors and order them by status and date of birth:
SELECT * FROM doctor
ORDER BY status, date_of_birth DESC;

-- 5)Appointment Table:
-- GROUP BY and HAVING:
-- Select doctors with the count of appointments and filter for those with more
than 2 appointments:
SELECT doctor_id, COUNT(*) AS appointment_count
FROM appointment
GROUP BY doctor_id
HAVING appointment_count > 2;
-- ORDER BY:
-- Select appointments and order them by date and time in ascending order:
SELECT * FROM appointment
ORDER BY date ASC, time ASC;

-- 6)Services Table:
-- GROUP BY and ORDER BY:
-- Select the average amount for each service and order by average amount in

descending order:
SELECT service_id, AVG(amount) AS avg_amount
FROM appointment
GROUP BY service_id
ORDER BY avg_amount DESC;
-- ORDER BY:
-- Select services and order them by service name in ascending order:
SELECT * FROM services
ORDER BY service_name ASC;

-- 7)Review Table:
-- GROUP BY and ORDER BY:
-- Select the average rating for each doctor and order by average rating in
descending order:
SELECT doctor_id, AVG(rating) AS avg_rating
FROM review
GROUP BY doctor_id
ORDER BY avg_rating DESC;
-- ORDER BY:
-- Select reviews and order them by rating in ascending order:
SELECT * FROM review
ORDER BY rating ASC;
