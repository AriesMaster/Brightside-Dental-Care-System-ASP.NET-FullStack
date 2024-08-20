<%@ Page Title="Profile" Language="C#" AutoEventWireup="true" CodeBehind="10profile.aspx.cs" Inherits="Brightside_Dental_Care_Planning._10profile" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create a Profile</title>
    <link rel="stylesheet" href="path/to/your/css">
    <style>
        /* Add any inline styles here or link to an external stylesheet */
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-color: #f0f0f0;
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
            max-width: 900px;
            background-color: #ffffff;
            border-radius: 10px;
            padding: 40px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        h1 {
            color: #333333;
            margin-bottom: 20px;
            font-size: 2.5em;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        td {
            padding: 10px;
        }

        .form-control {
            width: 100%;
            padding: 8px;
            border-radius: 5px;
            border: 1px solid #ccc;
        }

        .btn {
            padding: 10px 20px;
            border-radius: 5px;
            text-align: center;
            cursor: pointer;
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
    </style>
</head>
<body>
    <main aria-labelledby="title">
        <section>
            <h1 id="title">Create a Profile</h1>
            <form id="form1" runat="server">
                <table>
                    <tr>
                        <td style="width: 160px; font-weight: bold;">First Name:</td>
                        <td>
                            <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="font-weight: bold;">Last Name:</td>
                        <td>
                            <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="font-weight: bold;">Date of Birth:</td>
                        <td>
                            <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="font-weight: bold;">Gender:</td>
                        <td>
                            <asp:TextBox ID="TextBox4" runat="server" CssClass="form-control"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="font-weight: bold;">Phone Number:</td>
                        <td>
                            <asp:TextBox ID="TextBox5" runat="server" CssClass="form-control"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:Button ID="Button1" runat="server" Text="Create Profile" CssClass="btn btn-primary" OnClick="Button1_Click1" />
                            <asp:Button ID="Button2" runat="server" Text="Back to Home" CssClass="btn btn-secondary" OnClick="Button2_Click" />
                        </td>
                    </tr>
                </table>
            </form>
        </section>
    </main>
</body>
</html>
