<%@ Page Title="Appointment" Language="C#" MasterPageFile="~/Second.Master" AutoEventWireup="true" CodeBehind="5Appointment.aspx.cs" Inherits="Brightside_Dental_Care_Planning.WebForm8" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', Tahoma, sans-serif;
            background-color: #f9f9f9; /* A lighter background for the entire page */
        }

        .appointment-main {
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
            padding: 40px;
            height: 100vh;
        }

        .appointment-section {
            width: 100%;
            max-width: 450px; /* Slightly wider for modern design */
            background-color: #ffffff;
            border-radius: 10px;
            padding: 40px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1); /* Enhanced shadow for a more modern look */
            transition: box-shadow 0.3s ease; /* Smooth transition effect */
        }

        .appointment-section:hover {
            box-shadow: 0 12px 30px rgba(0, 0, 0, 0.15); /* Hover effect for interaction */
        }

        .appointment-title {
            color: #333333;
            margin-bottom: 20px;
            font-size: 2.5em;
            text-align: center;
            font-weight: bold; /* Bold for emphasis */
        }

        .appointment-label {
            display: block;
            margin-bottom: 10px;
            font-size: 1em;
            color: #555555; /* Slightly lighter color for labels */
        }

        .input-text {
            width: 100%;
            height: 40px;
            padding: 12px; /* Increased padding for better usability */
            border-radius: 8px; /* More rounded corners for modern look */
            border: 1px solid #dddddd; /* Light border for subtlety */
            margin-bottom: 20px; /* Increased space between inputs */
            font-size: 1em;
            transition: border 0.3s ease; /* Transition for border on focus */
        }

        .input-text:focus {
            border-color: #28a745; /* Change border color on focus */
            outline: none; /* Remove default outline */
        }

        .appointment-btn {
            width: 100%;
            height: 50px;
            background-color: #28a745; /* Primary action color */
            color: #ffffff;
            border: none;
            border-radius: 8px; /* Rounded button for modern look */
            cursor: pointer;
            font-size: 1em;
            transition: background-color 0.3s ease; /* Smooth transition */
        }

        .appointment-btn:hover {
            background-color: #218838; /* Darker shade on hover */
        }

        .status-message {
            display: block;
            margin-top: 20px;
            font-size: 1.1em;
            color: #28a745; /* Color for success messages */
            text-align: center; /* Center alignment */
        }

        .error-message {
            display: block;
            margin-top: 10px;
            color: #dc3545; /* Bootstrap danger color for errors */
            text-align: center; /* Center alignment */
        }
    </style>

    <main aria-labelledby="title" class="appointment-main">
        <section class="appointment-section">
            <h1 id="title" class="appointment-title">Make an Appointment</h1>

            <asp:Panel ID="AppointmentPanel" runat="server" Height="551px">
                <!-- Service Type Field -->
                <asp:Label ID="ServiceTypeLabel" runat="server" Text="Service Type:" AssociatedControlID="ServiceType" CssClass="appointment-label"></asp:Label>
                <asp:DropDownList ID="ServiceType" runat="server" CssClass="input-text" DataSourceID="SqlDataSource1" DataTextField="Service_name" DataValueField="Service_name">
                    <asp:ListItem Text="Consultation" Value="Consultation" />
                    <asp:ListItem Text="Cleaning" Value="Cleaning" />
                </asp:DropDownList>

                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dentistdatabaseConnectionString %>" SelectCommand="SELECT [Service_name] FROM [Service_Type]"></asp:SqlDataSource>

                <!-- Appointment Date Field -->
                <asp:Label ID="AppointmentDateLabel" runat="server" Text="Appointment Date:" AssociatedControlID="AppointmentDate" CssClass="appointment-label"></asp:Label>
                <asp:TextBox ID="AppointmentDate" runat="server" TextMode="Date" CssClass="input-text"></asp:TextBox>

                <!-- Additional Information Field -->
                <asp:Label ID="AdditionalInfoLabel" runat="server" Text="Additional Information(Optional) :" AssociatedControlID="AdditionalInfo" CssClass="appointment-label"></asp:Label>
                <asp:TextBox ID="AdditionalInfo" runat="server" CssClass="input-text"></asp:TextBox>

                <!-- Make Appointment Button -->
                <asp:Button ID="MakeAppointmentButton" runat="server" Text="Make Appointment" CssClass="appointment-btn" OnClick="MakeAppointmentButton_Click" />

                <!-- Add a div for spacing between buttons -->
                <div style="height: 20px;"></div>

                <!-- Back To Profile Button -->
                <asp:Button ID="BackToProfileButton" runat="server" CssClass="appointment-btn" Text="Back To Profile" OnClick="BackToProfileButton_Click" />

                 <!-- Add a div for spacing between buttons -->
                <div style="height: 20px;"></div>
                
                <!-- New View Appointments Button -->
                <asp:Button ID="ViewAppointmentsButton" runat="server" CssClass="appointment-btn" Text="View Appointments" OnClick="ViewAppointmentsButton_Click" />

                <asp:Label ID="StatusLabel" runat="server" CssClass="status-message"></asp:Label>
                <asp:Label ID="ErrorLabel" runat="server" CssClass="error-message"></asp:Label>
            </asp:Panel>
        </section>
    </main>
</asp:Content>
