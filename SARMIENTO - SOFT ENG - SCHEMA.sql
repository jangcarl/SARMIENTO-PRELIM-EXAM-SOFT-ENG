DROP TABLE IF EXISTS appointment;
DROP TABLE IF EXISTS medical_record;
DROP TABLE IF EXISTS prescription;
DROP TABLE IF EXISTS billing;
DROP TABLE IF EXISTS doctor;
DROP TABLE IF EXISTS patient;
DROP TABLE Customers;
DROP TABLE Orders;
DROP TABLE Shippings;


CREATE TABLE patient (
    patient_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    birthdate DATE,
    phone VARCHAR(15),
    email VARCHAR(50)
);

CREATE TABLE doctor (
    doctor_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    specialization VARCHAR(50),
    phone VARCHAR(15),
    email VARCHAR(50)
);

CREATE TABLE appointment (
    appointment_id INT PRIMARY KEY,
    patient_id INT,
    doctor_id INT,
    appointment_date DATE,
    appointment_time TIME,
    purpose_of_visit VARCHAR(50),
    FOREIGN KEY (patient_id) REFERENCES patient(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES doctor(doctor_id)
);

CREATE TABLE medical_record (
    record_id INT PRIMARY KEY,
    patient_id INT,
    doctor_id INT,
    record_date DATE,
    diagnosis VARCHAR(50),
    treatment VARCHAR(50),
    FOREIGN KEY (patient_id) REFERENCES patient(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES doctor(doctor_id)
);

CREATE TABLE prescription (
    prescription_id INT PRIMARY KEY,
    record_id INT,
    medication VARCHAR(50),
    dosage VARCHAR(50),
    frequency VARCHAR(50),
    FOREIGN KEY (record_id) REFERENCES medical_record(record_id)
);

CREATE TABLE billing (
    billing_id INT PRIMARY KEY,
    patient_id INT,
    amount DECIMAL(10, 2),
    billing_date DATE,
    payment_status VARCHAR(50),
    FOREIGN KEY (patient_id) REFERENCES patient(patient_id)
);