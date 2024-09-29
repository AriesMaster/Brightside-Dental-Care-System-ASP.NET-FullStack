<%@ Page Title="" Language="C#" MasterPageFile="~/Second.Master" AutoEventWireup="true" CodeBehind="25UpdateAppointment.aspx.cs" Inherits="Brightside_Dental_Care_Planning.WebForm12" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        body {
            font-family: Arial, sans-serif; /* Sets a clean, readable font */
            background-color: #f8f9fa; /* Light background for contrast */
            margin: 0;
            padding: 20px; /* Add padding for a better layout */
        }

        .form-group {
            margin-bottom: 15px; /* Space between form fields */
        }

        .form-label {
            display: block; /* Ensures labels are on their own lines */
            margin-bottom: 5px; /* Space between label and input */
            font-weight: bold; /* Bold labels for visibility */
        }

        .form-control {
            width: 100%; /* Full width for inputs */
            padding: 10px; /* Padding inside inputs for comfort */
            border: 1px solid #ccc; /* Light border */
            border-radius: 4px; /* Rounded corners */
            box-sizing: border-box; /* Include padding in width */
        }

        .form-control:focus {
            border-color: #007bff; /* Change border color on focus */
            outline: none; /* Remove default outline */
            box-shadow: 0 0 5px rgba(0,123,255,.5); /* Soft shadow effect */
        }

        .message-label {
            margin-bottom: 20px; /* Space above message label */
            font-weight: bold; /* Bold messages for emphasis */
            color: green; /* Color for success messages */
        }

        .btn {
            padding: 10px 15px; /* Padding for buttons */
            border: none; /* Remove default border */
            border-radius: 4px; /* Rounded corners */
            color: white; /* White text */
            cursor: pointer; /* Pointer cursor for buttons */
            font-weight: bold; /* Bold button text */
            margin-right: 5px; /* Space between buttons */
        }

        .btn-primary {
            background-color: #007bff; /* Bootstrap primary color */
        }

        .btn-secondary {
            background-color: #6c757d; /* Bootstrap secondary color */
        }

        .btn:hover {
            opacity: 0.9; /* Slight transparency on hover */
        }
    </style>

    <asp:Label ID="MessageLabel" runat="server" CssClass="message-label" Text="" ForeColor="Green" Visible="False"></asp:Label>

    <div class="form-group">
        <asp:Label ID="Label1" runat="server" CssClass="form-label" Text="Booking Date:"></asp:Label>
        <asp:TextBox ID="BookingDateTextBox" runat="server" CssClass="form-control"></asp:TextBox>
    </div>

    <div class="form-group">
        <asp:Label ID="Label2" runat="server" CssClass="form-label" Text="Additional Info:"></asp:Label>
        <asp:TextBox ID="AdditionalInfoTextBox" runat="server" CssClass="form-control"></asp:TextBox>
    </div>

    <div class="form-group">
        <asp:Label ID="Label3" runat="server" CssClass="form-label" Text="Service Name:"></asp:Label>
        <asp:TextBox ID="ServiceNameTextBox" runat="server" CssClass="form-control"></asp:TextBox>
    </div>

    <div class="form-group">
        <asp:Label ID="Label4" runat="server" CssClass="form-label" Text="Patient First Name:"></asp:Label>
        <asp:TextBox ID="PatientFirstNameTextBox" runat="server" CssClass="form-control"></asp:TextBox>
    </div>

    <div class="form-group">
        <asp:Label ID="Label5" runat="server" CssClass="form-label" Text="Patient Last Name:"></asp:Label>
        <asp:TextBox ID="PatientLastNameTextBox" runat="server" CssClass="form-control"></asp:TextBox>
    </div>

    <div class="form-group">
        <asp:Label ID="Label6" runat="server" CssClass="form-label" Text="Price:"></asp:Label>
        <asp:TextBox ID="PriceTextBox" runat="server" CssClass="form-control"></asp:TextBox>
    </div>

    <div class="form-group">
        <asp:Label ID="Label7" runat="server" CssClass="form-label" Text="Appointment Status:"></asp:Label>
        <asp:TextBox ID="AppointmentStatusTextBox" runat="server" CssClass="form-control"></asp:TextBox>
    </div>

    <asp:Button ID="UpdateButton" runat="server" CssClass="btn btn-primary" OnClick="UpdateButton_Click" Text="Update Appointment" />
    <asp:Button ID="Backtoadmin" runat="server" CssClass="btn btn-secondary" OnClick="Backtoadmin_Click" Text="Back to admin dashboard" />
    
</asp:Content>
