# Brightside Dental Care Web Application System

## Overview
The **Brightside Dental Care Web Application System** is a comprehensive platform designed to streamline dental care management for patients, doctors, and administrators. It provides features for user registration, profile management, appointment scheduling, and service information. The system also includes administrative tools for managing users, appointments, and services, as well as generating reports.

---

## Features

### **Patient Features**
- **User Registration and Authentication**: Patients can sign up and log in using their email and password.
- **Profile Management**: Patients can create, view, and edit their profiles, including personal details and contact information.
- **Appointment Management**: Patients can view, make, and cancel appointments. They can also view the status of their appointment requests.
- **Service Information**: Patients can browse the types of dental services offered and access contact information.

### **Doctor Features**
- **Login**: Doctors can log in using their credentials.
- **Appointment Management**: Doctors can view and update the status of patient appointments.
- **Profile Management**: Doctors can view and edit their profile information.

### **Admin Features**
- **Login**: Admins can log in using their credentials.
- **User Management**: Admins can edit and delete patient profiles.
- **Appointment Management**: Admins can edit and delete appointments.
- **Service Management**: Admins can add, edit, or delete service types and manage doctor profiles.
- **Reporting and Analytics**: Admins can generate reports summarizing appointments and revenue.

---

## Technical Requirements
- **Processor**: 4 GHz or faster 64-bit processor, Quad-core or better.
- **RAM**: Minimum of 8 GB. 16 GB recommended for smooth operation.
- **Hard Disk Space**: Minimum of 100 GB (includes space for Visual Studio).
- **Display**: Video card supporting a minimum resolution of WXGA (1366 by 768).

---

## Installation

### **Step 1: Download and Install Visual Studio 2022**
Ensure the following workloads are installed:
- Azure development
- .NET desktop development
- Universal Windows Platform development
- Data storage and processing

Install necessary individual components and language packs.

### **Step 2: Download the Brightside Dental Care Zip File**
1. Navigate to the download location and unzip the file.
2. Open the solution file `Brightside-Dental-Care-Planning.sln` in Visual Studio.

### **Step 3: Set Up the Project**
1. In **Solution Explorer**, right-click the homepage form and set it as the start page.
2. Change the browser to **Brave** under IIS Express settings.
3. Build the solution and run the project using IIS Express.

---

## User Manual

### **Patient**
- **Sign Up**: Enter your email and password to create an account.
- **Login**: Choose "Patient" as the user type and enter your credentials.
- **Profile**: Create and manage your profile, including personal details and address.
- **Appointments**: Make, view, and cancel appointments.

### **Doctor**
- **Login**: Use the provided doctor credentials to log in.
- **Appointments**: View and update the status of patient appointments.
- **Profile**: View and edit your profile information.

### **Admin**
- **Login**: Use the provided admin credentials to log in.
- **Dashboard**: Manage patients, appointments, services, and doctors.
- **Reports**: Generate appointment summary and detailed reports.

---

## Database Schema
The system uses a relational database with the following tables:
- **Patient**
- **Profile**
- **Address**
- **Doctor**
- **Admin**
- **Service Type**
- **Appointment**

SQL scripts for creating and maintaining these tables are provided in the documentation.

---

## Reports
- **Appointment Summary Report**: Summarizes total appointments and revenue over a specified date range.
- **Detailed Appointment Report**: Provides detailed information on each appointment within a specified date range.

---

## Conclusion
The **Brightside Dental Care Web Application System** offers a comprehensive solution for managing dental care services, ensuring a seamless experience for patients, doctors, and administrators. For further assistance, refer to the detailed user manual and technical documentation provided.

---

**End of README**
