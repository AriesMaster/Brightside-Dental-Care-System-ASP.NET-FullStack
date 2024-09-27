<%@ Page Title="Request Reports" Language="C#" MasterPageFile="~/Second.Master" AutoEventWireup="true" CodeBehind="20requestReports.aspx.cs" Inherits="Brightside_Dental_Care_Planning.WebForm16" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            background-color: #f9f9f9; /* Light grey background */
        }

        h2 {
            color: #2c3e50; /* Dark blue for main title */
            text-align: center;
        }

        h3 {
            color: #34495e; /* Slightly lighter blue for section titles */
            margin-top: 30px;
            margin-bottom: 10px;
        }

        label {
            font-weight: bold;
            margin-right: 10px;
        }

        input[type="date"] {
            padding: 5px;
            border: 1px solid #ccc;
            border-radius: 4px;
            margin-right: 20px;
        }

        .btn-generate {
            background-color: #3498db; /* Blue button */
            color: white;
            border: none;
            padding: 10px 15px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }

        .btn-generate:hover {
            background-color: #2980b9; /* Darker blue on hover */
        }

        .report-grid {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        .report-grid th, .report-grid td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: left;
        }

        .report-grid th {
            background-color: #f2f2f2; /* Light grey for headers */
            color: #2c3e50; /* Dark blue for header text */
        }

        .report-grid tr:nth-child(even) {
            background-color: #f9f9f9; /* Alternate row color */
        }

        .report-grid tr:hover {
            background-color: #f1f1f1; /* Hover effect */
        }
    </style>

    <h2>Request Reports</h2>

    <div>
        <h3>Patient Appointments Summary</h3>
        <asp:GridView ID="GridViewPatientAppointments" runat="server" AutoGenerateColumns="false" CssClass="report-grid">
            <Columns>
                <asp:BoundField DataField="Patient_Id" HeaderText="Patient ID" />
                <asp:BoundField DataField="Name" HeaderText="Patient Name" />
                <asp:BoundField DataField="TotalAppointments" HeaderText="Total Appointments" />
                <asp:BoundField DataField="CompletedAppointments" HeaderText="Completed Appointments" />
            </Columns>
        </asp:GridView>
        
        <h3>Services Utilized Summary</h3>
        <label for="StartDate">Start Date:</label>
        <asp:TextBox ID="StartDate" runat="server" TextMode="Date" />
        
        <label for="EndDate">End Date:</label>
        <asp:TextBox ID="EndDate" runat="server" TextMode="Date" />

        <asp:Button ID="ButtonGenerateReport" runat="server" CssClass="btn-generate" Text="Generate Report" OnClick="ButtonGenerateReport_Click" />
        
        <asp:GridView ID="GridViewServicesUtilized" runat="server" AutoGenerateColumns="false" CssClass="report-grid">
            <Columns>
                <asp:BoundField DataField="Service_Type_Id" HeaderText="Service Type ID" />
                <asp:BoundField DataField="Service_Name" HeaderText="Service Name" />
                <asp:BoundField DataField="TotalBookings" HeaderText="Total Bookings" />
                <asp:BoundField DataField="TotalRevenue" HeaderText="Total Revenue" />
            </Columns>
        </asp:GridView>
    </div>

</asp:Content>
