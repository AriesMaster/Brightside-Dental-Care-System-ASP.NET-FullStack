<%@ Page Title="Sign Up" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="2signup.aspx.cs" Inherits="Brightside_Dental_Care_Planning.WebForm3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        /* Main container styling */
        .signup-main {
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
            padding: 40px;
            background-color: #f4f4f4;
            height: 100vh;
        }

        /* Signup section styling */
        .signup-section {
            width: 100%;
            max-width: 400px;
            background-color: #ffffff;
            border-radius: 10px;
            padding: 40px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        /* Title styling */
        .signup-title {
            font-family: 'Segoe UI', Tahoma, sans-serif;
            color: #333333;
            margin-bottom: 20px;
            font-size: 2.5em;
            text-align: center;
        }

        /* Label styling */
        .signup-label {
            display: block;
            margin-bottom: 10px;
            font-size: 1em;
            color: #333333;
        }

        /* Input text styling */
        .input-text {
            width: 100%;
            height: 34px;
            padding: 10px;
            border-radius: 5px;
            border: 1px solid #cccccc;
            margin-bottom: 10px;
            font-size: 1em;
        }

        /* Button styling */
        .signup-btn {
            width: 100%;
            height: 50px;
            background-color: #007bff;
            color: #ffffff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 1em;
            margin-top: 10px;
        }

        /* Status and error message styling */
        .status-message {
            display: block;
            margin-top: 20px;
            font-size: 1.1em;
            color: green;
        }

        .error-message {
            display: block;
            margin-top: 10px;
            color: red;
        }

        /* Login link styling */
        .login-link {
            text-align: center;
            margin-top: 20px;
        }

        .login-link a {
            color: #007bff;
            text-decoration: none;
        }
    </style>

    <main aria-labelledby="title" class="signup-main">
        <section class="signup-section">
            <h1 id="title" class="signup-title">Sign Up</h1>

            <asp:Panel ID="SignupPanel" runat="server" CssClass="signup-panel">
                <!-- Email Field -->
                <asp:Label ID="EmailLabel" runat="server" Text="Email:" AssociatedControlID="UserName" CssClass="signup-label"></asp:Label>
                <asp:TextBox ID="UserName" runat="server" Placeholder="Enter your email" CssClass="input-text"></asp:TextBox>
                <asp:RequiredFieldValidator ID="EmailRequiredValidator" runat="server" ControlToValidate="UserName" ErrorMessage="Email is required." ForeColor="Red" CssClass="error-message" />
                <asp:RegularExpressionValidator ID="EmailRegexValidator" runat="server" ControlToValidate="UserName" ErrorMessage="Please enter a valid email format." ForeColor="Red" ValidationExpression="^[^@\s]+@[^@\s]+\.[^@\s]+$" CssClass="error-message" />

                <!-- Password Field -->
                <asp:Label ID="PasswordLabel" runat="server" Text="Password:" AssociatedControlID="Password" CssClass="signup-label"></asp:Label>
                <asp:TextBox ID="Password" runat="server" Placeholder="Enter your password" TextMode="Password" CssClass="input-text"></asp:TextBox>
                <asp:RequiredFieldValidator ID="PasswordRequiredValidator" runat="server" ControlToValidate="Password" ErrorMessage="Password is required." ForeColor="Red" CssClass="error-message" />

                <!-- Confirm Password Field -->
                <asp:Label ID="ConfirmPasswordLabel" runat="server" Text="Confirm Password:" AssociatedControlID="ConfirmPassword" CssClass="signup-label"></asp:Label>
                <asp:TextBox ID="ConfirmPassword" runat="server" Placeholder="Confirm your password" TextMode="Password" CssClass="input-text"></asp:TextBox>
                <asp:CompareValidator ID="PasswordCompareValidator" runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword" ErrorMessage="Passwords do not match." ForeColor="Red" CssClass="error-message" />

                <!-- Signup Button -->
                <asp:Button ID="SignupButton" runat="server" Text="Sign Up" CssClass="signup-btn" OnClick="SignupButton_Click" />

                <!-- Success and Error Messages -->
                <asp:Label ID="SignupStatusLabel" runat="server" CssClass="status-message"></asp:Label>
                <asp:Label ID="ErrorLabel" runat="server" CssClass="error-message"></asp:Label>
            </asp:Panel>

            <!-- Link to Login -->
            <p class="login-link">
                <asp:HyperLink ID="LoginLink" runat="server" NavigateUrl="~/1login.aspx">Already have an account? Log In</asp:HyperLink>
            </p>
        </section>
    </main>
</asp:Content>
