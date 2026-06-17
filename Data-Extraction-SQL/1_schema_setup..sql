CREATE DATABASE HealthcareDB;
USE HealthcareDB;

CREATE TABLE patients (
    patient_id VARCHAR(50),
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    gender CHAR(1),
    date_of_birth DATE,
    contact_number VARCHAR(20),
    address VARCHAR(255),
    registration_date DATE,
    insurance_provider VARCHAR(100),
    insurance_number VARCHAR(50),
    email VARCHAR(100),
    PRIMARY KEY (patient_id)
);


CREATE TABLE doctors (
    doctor_id VARCHAR(50), -- Matching type: VARCHAR(50) 
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    specialization VARCHAR(100),
    phone_number VARCHAR(20),
    years_experience INT,
    hospital_branch VARCHAR(100),
    email VARCHAR(100),
    PRIMARY KEY (doctor_id)
);


CREATE TABLE appointments (
    appointment_id VARCHAR(50),
    patient_id VARCHAR(50),  
    doctor_id VARCHAR(50),  
    appointment_date DATE,
    appointment_time TIME,
    reason_for_visit VARCHAR(255),
    status VARCHAR(50),
    PRIMARY KEY (appointment_id),
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id) ON DELETE CASCADE,
    FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id) ON DELETE CASCADE
);


CREATE TABLE billing (
    billing_id VARCHAR(50),
    patient_id VARCHAR(50),      
    appointment_id VARCHAR(50),  
    billing_amount DECIMAL(10,2),
    payment_status VARCHAR(50),
    payment_method VARCHAR(50),
    billing_date DATE,
    PRIMARY KEY (billing_id),
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id) ON DELETE CASCADE,
    FOREIGN KEY (appointment_id) REFERENCES appointments(appointment_id) ON DELETE CASCADE
);


CREATE TABLE treatments (
    record_id VARCHAR(50),
    patient_id VARCHAR(50),      
    doctor_id VARCHAR(50),      
    diagnosis TEXT,
    treatment_plan TEXT,
    prescribed_medication VARCHAR(255),
    record_date DATE,
    PRIMARY KEY (record_id),
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id) ON DELETE CASCADE,
    FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id) ON DELETE CASCADE
);

USE HealthcareDB;
DROP TABLE IF EXISTS medical_records;

CREATE TABLE billing (
    billing_id VARCHAR(50) PRIMARY KEY,
    patient_id VARCHAR(50),
    appointment_id VARCHAR(50),
    billing_date DATE,
    billing_amount DECIMAL(10,2),
    payment_method VARCHAR(50),
    payment_status VARCHAR(50)
);