-- Drop tables if they exist
IF OBJECT_ID('Appointment', 'U') IS NOT NULL
    DROP TABLE Appointment;

IF OBJECT_ID('Patient', 'U') IS NOT NULL
    DROP TABLE Patient;

IF OBJECT_ID('Doctor', 'U') IS NOT NULL
    DROP TABLE Doctor;

IF OBJECT_ID('Service_Type', 'U') IS NOT NULL
    DROP TABLE Service_Type;

IF OBJECT_ID('Admin', 'U') IS NOT NULL
    DROP TABLE Admin;

IF OBJECT_ID('Address', 'U') IS NOT NULL
    DROP TABLE Address;

IF OBJECT_ID('Profile', 'U') IS NOT NULL
    DROP TABLE Profile;

-- Create Patient Table
CREATE TABLE Patient (
    Patient_Id INT IDENTITY(1,1) PRIMARY KEY,
    email VARCHAR(50) NOT NULL,
    password VARCHAR(50) NOT NULL  -- Increased length to accommodate passwords
);

-- Insert records into Patient Table
INSERT INTO Patient (email, password)
VALUES ('patient1@example.com', 'password123'),
       ('patient2@example.com', 'password456');

-- Create Doctor Table
CREATE TABLE Doctor (
    Doctor_Id INT IDENTITY(1,1) PRIMARY KEY,
    email VARCHAR(50) NOT NULL,
    password VARCHAR(50) NOT NULL,  -- Increased length to accommodate passwords
    first_name VARCHAR(50) NOT NULL,  -- Increased length for more flexibility
    last_name VARCHAR(50) NOT NULL   -- Increased length for more flexibility
);

-- Insert records into Doctor Table
INSERT INTO Doctor (email, password, first_name, last_name)
VALUES ('doctor1@example.com', 'docpassword123', 'John', 'Doe'),
       ('doctor2@example.com', 'docpassword456', 'Jane', 'Smith');

-- Create Service_Type Table
CREATE TABLE Service_Type (
    Service_Type_Id INT IDENTITY(1,1) PRIMARY KEY,
    Service_name VARCHAR(50) NOT NULL,  -- Increased length for more flexibility
    Service_Desc VARCHAR(100) NOT NULL  -- Increased length for more descriptive text
);

-- Insert records into Service_Type Table
INSERT INTO Service_Type (Service_name, Service_Desc)
VALUES ('Consultation', 'General consultation service'),
       ('Cleaning', 'Teeth cleaning service');

-- Create Appointment Table with patient first and last name fields
CREATE TABLE Appointment (
    Booking_Id INT IDENTITY(1,1) PRIMARY KEY,
    Patient_Id INT FOREIGN KEY REFERENCES Patient(Patient_Id),
    Service_Type_Id INT FOREIGN KEY REFERENCES Service_Type(Service_Type_Id),
    Booking_Date DATE NOT NULL,
    Additional_Info VARCHAR(100),
    Service_name VARCHAR(50) NOT NULL,  -- Increased length for more flexibility
    Patient_FirstName VARCHAR(50) NOT NULL,  -- Increased length for more flexibility
    Patient_LastName VARCHAR(50) NOT NULL   -- Increased length for more flexibility
);

-- Insert records into Appointment Table with patient names
INSERT INTO Appointment (Patient_Id, Service_Type_Id, Booking_Date, Additional_Info, Service_name, Patient_FirstName, Patient_LastName)
VALUES (1, 1, '2024-08-20', 'Needs consultation', 'Consultation', 'Michael', 'Jordan'),
       (2, 2, '2024-08-21', 'Teeth cleaning', 'Cleaning', 'Serena', 'Williams');

-- Create Admin Table
CREATE TABLE Admin (
    Admin_Id INT IDENTITY(1,1) PRIMARY KEY,
    email VARCHAR(50) NOT NULL,
    password VARCHAR(50) NOT NULL,  -- Increased length to accommodate passwords
    first_name VARCHAR(50) NOT NULL,  -- Increased length for more flexibility
    last_name VARCHAR(50) NOT NULL   -- Increased length for more flexibility
);

-- Insert records into Admin Table
INSERT INTO Admin (email, password, first_name, last_name)
VALUES ('admin1@example.com', 'adminpassword123', 'Alice', 'Johnson'),
       ('admin2@example.com', 'adminpassword456', 'Bob', 'Williams');

-- Create Address Table
CREATE TABLE Address (
    Address_Id INT IDENTITY(1,1) PRIMARY KEY,
    Street VARCHAR(100) NOT NULL,  -- Increased length for more flexibility
    City VARCHAR(50) NOT NULL,
    Province VARCHAR(50) NOT NULL
);

-- Insert records into Address Table
INSERT INTO Address (Street, City, Province)
VALUES ('123 Elm St', 'Giyani', 'Limpopo'),
       ('456 Oak St', 'Johannesburg', 'Gauteng');

-- Create Profile Table with Profile_Id column
CREATE TABLE Profile (
    Profile_Id INT IDENTITY(1,1) PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,  -- Increased length for more flexibility
    last_name VARCHAR(50) NOT NULL,  -- Increased length for more flexibility
    Date_of_Birth DATE NOT NULL,
    Gender VARCHAR(10) NOT NULL,
    phone_number BIGINT NOT NULL  -- Changed to BIGINT to avoid potential overflow
);

-- Insert records into Profile Table
INSERT INTO Profile (first_name, last_name, Date_of_Birth, Gender, phone_number)
VALUES ('Michael', 'Jordan', '1980-01-01', 'Male', 1234567890),
       ('Serena', 'Williams', '1981-09-26', 'Female', 9876543210);
