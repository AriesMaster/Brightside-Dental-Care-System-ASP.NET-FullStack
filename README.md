# Brightside Dental Care Web Application System

## Overview
The **Brightside Dental Care Web Application System** is a comprehensive platform designed to streamline dental care management for patients, doctors, and administrators. Built using **ASP.NET** and **C#**, with a **Microsoft SQL Server** database deployed on **Azure**, this system provides features for user registration, profile management, appointment scheduling, and service information. It also includes administrative tools for managing users, appointments, and services, as well as generating reports.

This project demonstrates my skills in:
- **ASP.NET** for building dynamic web applications.
- **C#** for backend development and logic implementation.
- **Microsoft SQL Server** for database design and management.
- **Azure** for cloud-based database deployment and hosting.
### **Documentation**
[documentation.pdf](https://github.com/user-attachments/files/19362819/documentation.pdf)

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

## Development Stack
- **Frontend**: ASP.NET Web Forms
- **Backend**: C#
- **Database**: Microsoft SQL Server
- **Cloud Deployment**: Azure (Database hosted on Azure SQL Database)

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

### **Step 4: Database Setup**
1. The database is hosted on **Azure SQL Database**.
2. Update the connection string in the `Web.config` file to connect to the Azure SQL Database.
3. Run the provided SQL scripts to create and populate the necessary tables.

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

## Deployment on Azure
- The database is deployed on **Azure SQL Database**, ensuring scalability, security, and high availability.
- The application can be hosted on **Azure App Services** for cloud-based access.

---

## Skills Demonstrated
- **ASP.NET**: Used for building the web application's frontend and backend.
- **C#**: Implemented the business logic and database interactions.
- **Microsoft SQL Server**: Designed and managed the relational database.
- **Azure**: Deployed the database on Azure SQL Database for cloud-based management.
- **Database Management**: Created and maintained tables, relationships, and queries.
- **Cloud Deployment**: Successfully deployed and managed the database on Azure.

---

## Conclusion
The **Brightside Dental Care Web Application System** offers a comprehensive solution for managing dental care services, ensuring a seamless experience for patients, doctors, and administrators. Built using **ASP.NET**, **C#**, and **Microsoft SQL Server**, and deployed on **Azure**, this project demonstrates my expertise in full-stack web development, database management, and cloud deployment. For further assistance, refer to the detailed user manual and technical documentation provided.

---

**End of README**
