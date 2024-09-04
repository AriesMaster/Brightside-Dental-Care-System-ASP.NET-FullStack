<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="6Admin.aspx.cs" Inherits="Brightside_Dental_Care_Planning.Admin" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Dashboard</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        .container {
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 40px;
        }
        .card {
            width: 100%;
            max-width: 1000px;
            background-color: #ffffff;
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
        }
        h1 {
            font-size: 2.5em;
            color: #333333;
            margin-bottom: 20px;
            text-align: center;
        }
        .button {
            background-color: #007bff;
            color: #ffffff;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            margin: 5px;
            text-decoration: none;
            font-size: 1em;
        }
        .button.logout {
            background-color: #dc3545;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        th, td {
            padding: 10px;
            text-align: left;
            border-bottom: 1px solid #cccccc;
        }
        th {
            background-color: #f4f4f4;
        }
        .form-group {
            margin-bottom: 20px;
        }
        .form-group label {
            display: block;
            margin-bottom: 5px;
        }
        .form-group input, .form-group select {
            width: 100%;
            padding: 10px;
            border-radius: 5px;
            border: 1px solid #cccccc;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h1>Admin Dashboard</h1>
            
            <div class="card">
                <asp:Panel ID="CrudPanel" runat="server">
                    <!-- Add CRUD operation controls here -->
                    <asp:Label ID="Label1" runat="server" Text="Create Record" Font-Bold="True" Style="display: block; margin-bottom: 15px;"></asp:Label>
                    <div class="form-group">
                        <asp:Label ID="NameLabel" runat="server" Text="Name:"></asp:Label>
                        <asp:TextBox ID="NameTextBox" runat="server"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="EmailLabel" runat="server" Text="Email:"></asp:Label>
                        <asp:TextBox ID="EmailTextBox" runat="server"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="PasswordLabel" runat="server" Text="Password:"></asp:Label>
                        <asp:TextBox ID="PasswordTextBox" runat="server" TextMode="Password"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="FirstNameLabel" runat="server" Text="First Name:"></asp:Label>
                        <asp:TextBox ID="FirstNameTextBox" runat="server"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="LastNameLabel" runat="server" Text="Last Name:"></asp:Label>
                        <asp:TextBox ID="LastNameTextBox" runat="server"></asp:TextBox>
                    </div>
                    <asp:Button ID="CreateButton" runat="server" Text="Create" OnClick="CreateButton_Click" CssClass="button" />
                    
                    <hr />
                    
                    <asp:Label ID="Label2" runat="server" Text="Update Record" Font-Bold="True" Style="display: block; margin-bottom: 15px;"></asp:Label>
                    <div class="form-group">
                        <asp:Label ID="RecordIdLabel" runat="server" Text="Record ID:"></asp:Label>
                        <asp:TextBox ID="RecordIdTextBox" runat="server"></asp:TextBox>
                    </div>
                    <asp:Button ID="FetchButton" runat="server" Text="Fetch Record" OnClick="FetchButton_Click" CssClass="button" />
                    <asp:Button ID="UpdateButton" runat="server" Text="Update" OnClick="UpdateButton_Click" CssClass="button" />
                    
                    <hr />
                    
                    <asp:Label ID="Label3" runat="server" Text="Delete Record" Font-Bold="True" Style="display: block; margin-bottom: 15px;"></asp:Label>
                    <div class="form-group">
                        <asp:Label ID="DeleteRecordIdLabel" runat="server" Text="Record ID:"></asp:Label>
                        <asp:TextBox ID="DeleteRecordIdTextBox" runat="server"></asp:TextBox>
                    </div>
                    <asp:Button ID="DeleteButton" runat="server" Text="Delete" OnClick="DeleteButton_Click" CssClass="button" />
                </asp:Panel>
            </div>
            
            <a href="3homepage.aspx" class="button">Go Back</a>
            <asp:Button ID="LogoutButton" runat="server" Text="Log Out" OnClick="LogoutButton_Click" CssClass="button logout" />
        </div>
    </form>
</body>
</html>
