<%@ Page Title="Request Reports" Language="C#" MasterPageFile="~/Second.Master" AutoEventWireup="true" CodeBehind="20requestReports.aspx.cs" Inherits="Brightside_Dental_Care_Planning.WebForm11" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        /* General Styles */
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
        }

        h2 {
            color: #333;
            text-align: center;
        }

        .form-group {
            margin: 20px 0;
            text-align: center;
        }

        label {
            font-weight: bold;
            margin-right: 10px;
            color: #555;
        }

        input[type="date"] {
            padding: 5px;
            border: 1px solid #ccc;
            border-radius: 4px;
            margin-right: 10px;
        }

        .btn-generate {
            background-color: #5cb85c;
            color: white;
            border: none;
            padding: 10px 15px;
            border-radius: 4px;
            cursor: pointer;
        }

        .btn-generate:hover {
            background-color: #4cae4c;
        }

        hr {
            margin: 20px 0;
        }

        /* GridView Styles */
        .grid-view {
            width: 100%;
            border-collapse: collapse;
            margin: 20px auto;
            background-color: white;
        }

        .grid-view th, .grid-view td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: center;
        }

        .grid-view th {
            background-color: #f2f2f2;
            color: #333;
        }

        .grid-view tr:hover {
            background-color: #f5f5f5;
        }

        .message-label {
            text-align: center;
            font-size: 16px;
            font-weight: bold;
            color: green;
            display: none; /* Hidden by default */
        }
    </style>

    <h2>Report Generation</h2>
    
    <div class="form-group">
        <asp:Label ID="LabelStartDate" runat="server" Text="Start Date:"></asp:Label>
        <asp:TextBox ID="TextBoxStartDate" runat="server" TextMode="Date"></asp:TextBox>

        <asp:Label ID="LabelEndDate" runat="server" Text="End Date:"></asp:Label>
        <asp:TextBox ID="TextBoxEndDate" runat="server" TextMode="Date"></asp:TextBox>

        <asp:Button ID="ButtonGenerateReport" runat="server" CssClass="btn-generate" Text="Generate Report" OnClick="ButtonGenerateReport_Click" />
    </div>
    
    <hr />
    
    <asp:GridView ID="GridViewReports" runat="server" AutoGenerateColumns="False" CssClass="grid-view">
        <Columns>
            <asp:BoundField DataField="DoctorName" HeaderText="Doctor Name" />
            <asp:BoundField DataField="TotalAppointments" HeaderText="Total Appointments" />
            <asp:BoundField DataField="TotalRevenue" HeaderText="Total Revenue" DataFormatString="{0:C}" />
        </Columns>
    </asp:GridView>
    
    <asp:Label ID="LabelMessage" runat="server" CssClass="message-label" Visible="false"></asp:Label>
</asp:Content>
