<%@ Page Title="" Language="C#" MasterPageFile="~/Second.Master" AutoEventWireup="true" CodeBehind="18EditDoctor.aspx.cs" Inherits="Brightside_Dental_Care_Planning.WebForm14" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .edit-profile-container {
            padding: 20px;
            font-family: Arial, sans-serif;
            background-color: #F9F9F9; /* Light background for better readability */
        }

        .edit-profile-title {
            font-size: 2em;
            color: #006699;
            margin-bottom: 20px;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-label {
            font-weight: bold;
            color: #004466;
            margin-bottom: 5px;
            display: block;
        }

        .form-input {
            width: 100%;
            padding: 10px;
            border: 1px solid #CCCCCC;
            border-radius: 5px;
        }

        .button-save {
            padding: 10px 15px;
            background-color: #006699;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 1em;
        }

        .button-save:hover {
            background-color: #00547E;
        }
    </style>

    <div class="edit-profile-container">
        <h1 class="edit-profile-title">Edit Doctor Profile</h1>

        <asp:Label ID="Label1" runat="server" Text="Update the information below:" AssociatedControlID="DoctorForm"></asp:Label>

        <asp:Panel ID="DoctorForm" runat="server">
            <div class="form-group">
                <label class="form-label" for="email">Email:</label>
                <asp:TextBox ID="EmailTextBox" runat="server" CssClass="form-input" />
            </div>

            <div class="form-group">
                <label class="form-label" for="firstName">First Name:</label>
                <asp:TextBox ID="FirstNameTextBox" runat="server" CssClass="form-input" />
            </div>

            <div class="form-group">
                <label class="form-label" for="lastName">Last Name:</label>
                <asp:TextBox ID="LastNameTextBox" runat="server" CssClass="form-input" />
            </div>

            <div class="form-group">
                <label class="form-label" for="password">Password:</label>
                <asp:TextBox ID="PasswordTextBox" runat="server" CssClass="form-input" TextMode="Password" />
            </div>

            <asp:Button ID="SaveButton" runat="server" Text="Save Changes" CssClass="button-save" OnClick="SaveButton_Click" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="ButtonCancel" runat="server" CssClass="button-save" OnClick="ButtonCancel_Click" Text="Cancel" />
        </asp:Panel>
    </div>
</asp:Content>
