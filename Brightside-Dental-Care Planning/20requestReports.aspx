<%@ Page Title="Request Reports" Language="C#" MasterPageFile="~/Second.Master" AutoEventWireup="true" CodeBehind="20requestReports.aspx.cs" Inherits="Brightside_Dental_Care_Planning.WebForm11" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2 class="report-title">Request Reports</h2>

    <div class="report-section">
        <h3>1. Appointment Summary Report</h3>
        <p>This report summarizes total appointments and revenue generated over a specific date range.</p>

        <div class="filter-group">
            <label for="StartDate">Start Date:</label>
            <asp:TextBox ID="StartDate" runat="server" TextMode="Date" CssClass="date-input"></asp:TextBox>
            
            <label for="EndDate">End Date:</label>
            <asp:TextBox ID="EndDate" runat="server" TextMode="Date" CssClass="date-input"></asp:TextBox>
            
            <asp:Button ID="FilterButton" runat="server" Text="Generate Report" OnClick="FilterButton_Click" CssClass="styled-button" />
        </div>

        <asp:Label ID="MessageLabel" runat="server" Text="" CssClass="message-label" Visible="False"></asp:Label>
        
        <asp:GridView ID="ReportGridView" runat="server" AllowSorting="True" AutoGenerateColumns="False" 
                      CssClass="report-grid">
            <Columns>
                <asp:BoundField DataField="Service_name" HeaderText="Service Name" SortExpression="Service_name" />
                <asp:BoundField DataField="TotalAppointments" HeaderText="Total Appointments" SortExpression="TotalAppointments" />
                <asp:BoundField DataField="TotalRevenue" HeaderText="Total Revenue" SortExpression="TotalRevenue" DataFormatString="{0:C}" />
                <asp:BoundField DataField="ReportDate" HeaderText="Report Date" SortExpression="ReportDate" DataFormatString="{0:MM/dd/yyyy}" />
            </Columns>
            <FooterStyle CssClass="grid-footer" />
            <HeaderStyle CssClass="grid-header" />
            <PagerStyle CssClass="grid-pager" />
            <RowStyle CssClass="grid-row" />
            <SortedAscendingCellStyle CssClass="sorted-asc" />
            <SortedDescendingCellStyle CssClass="sorted-desc" />
        </asp:GridView>

        <asp:Label ID="NoRecordsLabel" runat="server" Text="" CssClass="no-records-label" Visible="False"></asp:Label>
    </div>

    <div class="report-section">
        <h3>2. Detailed Appointment Report</h3>
        <p>This report provides detailed information on each appointment made within the selected date range.</p>

        <div class="filter-group">
            <label for="DetailedStartDate">Start Date:</label>
            <asp:TextBox ID="DetailedStartDate" runat="server" TextMode="Date" CssClass="date-input"></asp:TextBox>
            
            <label for="DetailedEndDate">End Date:</label>
            <asp:TextBox ID="DetailedEndDate" runat="server" TextMode="Date" CssClass="date-input"></asp:TextBox>
            
            <asp:Button ID="DetailedFilterButton" runat="server" Text="Generate Detailed Report" OnClick="DetailedFilterButton_Click" CssClass="styled-button" />
        </div>

        <asp:GridView ID="DetailedReportGridView" runat="server" AllowSorting="True" AutoGenerateColumns="False" 
                      CssClass="report-grid">
            <Columns>
                <asp:BoundField DataField="Booking_Id" HeaderText="Booking ID" SortExpression="Booking_Id" />
                <asp:BoundField DataField="Patient_FirstName" HeaderText="Patient First Name" SortExpression="Patient_FirstName" />
                <asp:BoundField DataField="Patient_LastName" HeaderText="Patient Last Name" SortExpression="Patient_LastName" />
                <asp:BoundField DataField="Service_name" HeaderText="Service Name" SortExpression="Service_name" />
                <asp:BoundField DataField="Booking_Date" HeaderText="Booking Date" SortExpression="Booking_Date" DataFormatString="{0:MM/dd/yyyy}" />
                <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" DataFormatString="{0:C}" />
            </Columns>
            <FooterStyle CssClass="grid-footer" />
            <HeaderStyle CssClass="grid-header" />
            <PagerStyle CssClass="grid-pager" />
            <RowStyle CssClass="grid-row" />
            <SortedAscendingCellStyle CssClass="sorted-asc" />
            <SortedDescendingCellStyle CssClass="sorted-desc" />
        </asp:GridView>

        <asp:Label ID="DetailedNoRecordsLabel" runat="server" Text="" CssClass="no-records-label" Visible="False"></asp:Label>
    </div>

    <style>
        .report-title {
            font-size: 2em;
            margin-bottom: 20px;
            color: #333;
        }

        .report-section {
            margin: 20px 0;
            padding: 15px;
            border: 1px solid #006699;
            border-radius: 5px;
            background-color: #f9f9f9;
        }

        .filter-group {
            margin-bottom: 15px;
        }

        label {
            font-weight: bold;
            margin-right: 10px;
        }

        .date-input {
            padding: 5px;
            border: 1px solid #006699;
            border-radius: 5px;
            margin-right: 10px;
        }

        .styled-button {
            background-color: #006699;
            color: white;
            border: none;
            border-radius: 5px;
            padding: 8px 15px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .styled-button:hover {
            background-color: #004d66;
        }

        .message-label {
            font-size: 1em;
            font-weight: bold;
            margin-top: 10px;
        }

        .report-grid {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
        }

        .grid-header {
            background-color: #006699;
            color: white;
            font-weight: bold;
        }

        .grid-footer {
            background-color: #f1f1f1;
            font-weight: bold;
        }

        .grid-pager {
            background-color: #f9f9f9;
        }

        .grid-row {
            border-bottom: 1px solid #ddd;
            color: #333;
        }

        .sorted-asc {
            background-color: #e9e9e9;
        }

        .sorted-desc {
            background-color: #d9d9d9;
        }

        .no-records-label {
            font-weight: bold;
            color: red;
            margin-top: 10px;
        }
    </style>
</asp:Content>
