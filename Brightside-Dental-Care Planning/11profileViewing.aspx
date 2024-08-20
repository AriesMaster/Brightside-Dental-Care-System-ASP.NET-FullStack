<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="11profileViewing.aspx.cs" Inherits="Brightside_Dental_Care_Planning._11profileViewing" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>View Profile</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-color: #f4f4f4;
        }

        main {
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
            padding: 40px;
        }

        section {
            width: 100%;
            max-width: 800px;
            background-color: #ffffff;
            border-radius: 10px;
            padding: 40px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        h1 {
            color: #333333;
            margin-bottom: 20px;
            font-size: 2.5em;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        td {
            padding: 10px;
            font-weight: bold;
            text-align: left;
        }

        .form-control {
            width: 100%;
            padding: 8px;
            border-radius: 5px;
            border: 1px solid #ccc;
            margin-bottom: 10px;
        }

        .btn {
            padding: 10px 20px;
            border-radius: 5px;
            text-align: center;
            cursor: pointer;
            font-size: 1em;
            margin: 10px;
        }

        .btn-primary {
            background-color: #007bff;
            color: white;
            border: none;
        }

        .btn-secondary {
            background-color: #6c757d;
            color: white;
            border: none;
        }

        .contact-info {
            margin-top: 20px;
            font-size: 1em;
            color: #666;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <main>
            <section>
                <h1>Profile Details</h1>
                <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                <table>
                    <tr>
                        <td>First Name:</td>
                        <td><asp:Label ID="FirstNameLabel" runat="server"></asp:Label></td>
                    </tr>
                    <tr>
                        <td>Last Name:</td>
                        <td><asp:Label ID="LastNameLabel" runat="server"></asp:Label></td>
                    </tr>
                    <tr>
                        <td>Date of Birth:</td>
                        <td><asp:Label ID="DOBLabel" runat="server"></asp:Label></td>
                    </tr>
                    <tr>
                        <td>Gender:</td>
                        <td><asp:Label ID="GenderLabel" runat="server"></asp:Label></td>
                    </tr>
                    <tr>
                        <td>Phone Number:</td>
                        <td><asp:Label ID="PhoneNumberLabel" runat="server"></asp:Label></td>
                    </tr>
                </table>
                
                <asp:Label ID="ContactAdminLabel" runat="server" Text="If you want to edit your details, contact the admin at:" CssClass="contact-info"></asp:Label>
                <asp:Label ID="AdminNumberLabel" runat="server" Text="(555) 123-4567" CssClass="contact-info"></asp:Label>
                
                <asp:Button ID="MakeAppointmentButton" runat="server" Text="Make an Appointment" CssClass="btn btn-primary" OnClick="MakeAppointmentButton_Click" />
                <asp:Button ID="HomeButton" runat="server" Text="Home Page" CssClass="btn btn-secondary" OnClick="HomeButton_Click" />
                <asp:Button ID="CreateProfileButton" runat="server" Text="Create Profile" CssClass="btn btn-secondary" OnClick="CreateProfileButton_Click" />
            </section>
        </main>
    </form>
</body>
</html>
