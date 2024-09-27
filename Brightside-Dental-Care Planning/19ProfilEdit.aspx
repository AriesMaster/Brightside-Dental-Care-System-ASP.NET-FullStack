<%@ Page Title="Edit Profile" Language="C#" MasterPageFile="~/Second.Master" AutoEventWireup="true" CodeBehind="19ProfilEdit.aspx.cs" Inherits="Brightside_Dental_Care_Planning.WebForm15" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        /* Add your existing styles here */
        .profile-main {
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
            padding: 40px;
            background-color: #f4f4f4;
            height: 100vh;
        }

        .profile-section {
            width: 100%;
            max-width: 400px;
            background-color: #ffffff;
            border-radius: 10px;
            padding: 40px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        .profile-title {
            font-family: 'Segoe UI', Tahoma, sans-serif;
            color: #333333;
            margin-bottom: 20px;
            font-size: 2.5em;
            text-align: center;
        }

        .profile-label {
            display: block;
            margin-bottom: 10px;
            font-size: 1em;
            color: #333333;
        }

        .input-text {
            width: 100%;
            height: 34px;
            padding: 10px;
            border-radius: 5px;
            border: 1px solid #cccccc;
            margin-bottom: 10px;
            font-size: 1em;
        }

        .profile-btn {
            width: 100%;
            height: 50px;
            background-color: #28a745;
            color: #ffffff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 1em;
            margin-top: 10px;
        }

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
    </style>

    <main aria-labelledby="title" class="profile-main">
        <section class="profile-section">
            <h1 id="title" class="profile-title">Edit Profile</h1>

            <asp:Panel ID="ProfilePanel" runat="server" CssClass="profile-panel">
                <!-- First Name Field -->
                <asp:Label ID="FirstNameLabel" runat="server" Text="First Name:" AssociatedControlID="FirstNameTextBox" CssClass="profile-label"></asp:Label>
                <asp:TextBox ID="FirstNameTextBox" runat="server" Placeholder="Enter your first name" CssClass="input-text"></asp:TextBox>
                <asp:RequiredFieldValidator ID="FirstNameRequiredValidator" runat="server" ControlToValidate="FirstNameTextBox" ErrorMessage="First Name is required." ForeColor="Red" CssClass="error-message" />

                <!-- Last Name Field -->
                <asp:Label ID="LastNameLabel" runat="server" Text="Last Name:" AssociatedControlID="LastNameTextBox" CssClass="profile-label"></asp:Label>
                <asp:TextBox ID="LastNameTextBox" runat="server" Placeholder="Enter your last name" CssClass="input-text"></asp:TextBox>
                <asp:RequiredFieldValidator ID="LastNameRequiredValidator" runat="server" ControlToValidate="LastNameTextBox" ErrorMessage="Last Name is required." ForeColor="Red" CssClass="error-message" />

                <!-- Phone Number Field -->
                <asp:Label ID="PhoneNumberLabel" runat="server" Text="Phone Number:" AssociatedControlID="PhoneNumberTextBox" CssClass="profile-label"></asp:Label>
                <asp:TextBox ID="PhoneNumberTextBox" runat="server" Placeholder="Enter your phone number" CssClass="input-text"></asp:TextBox>
                <asp:RequiredFieldValidator ID="PhoneNumberRequiredValidator" runat="server" ControlToValidate="PhoneNumberTextBox" ErrorMessage="Phone Number is required." ForeColor="Red" CssClass="error-message" />
                <asp:RegularExpressionValidator ID="PhoneNumberValidator" runat="server" ControlToValidate="PhoneNumberTextBox" ErrorMessage="Invalid phone number format." ValidationExpression="^\d{10}$" ForeColor="Red" CssClass="error-message" />

                <!-- Date of Birth Field -->
                <asp:Label ID="DateOfBirthLabel" runat="server" Text="Date of Birth:" AssociatedControlID="DateOfBirthTextBox" CssClass="profile-label"></asp:Label>
                <asp:TextBox ID="DateOfBirthTextBox" runat="server" TextMode="Date" CssClass="input-text"></asp:TextBox>
                <asp:RequiredFieldValidator ID="DateOfBirthRequiredValidator" runat="server" ControlToValidate="DateOfBirthTextBox" ErrorMessage="Date of Birth is required." ForeColor="Red" CssClass="error-message" />

                <!-- Gender Field -->
                <asp:Label ID="GenderLabel" runat="server" Text="Gender:" AssociatedControlID="GenderDropDownList" CssClass="profile-label"></asp:Label>
                <asp:DropDownList ID="GenderDropDownList" runat="server" CssClass="input-text">
                    <asp:ListItem Text="Male" Value="Male" />
                    <asp:ListItem Text="Female" Value="Female" />
                    <asp:ListItem Text="Other" Value="Other" />
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="GenderRequiredValidator" runat="server" ControlToValidate="GenderDropDownList" ErrorMessage="Gender is required." ForeColor="Red" CssClass="error-message" />

                <!-- Street Field -->
                <asp:Label ID="StreetLabel" runat="server" Text="Street:" AssociatedControlID="StreetTextBox" CssClass="profile-label"></asp:Label>
                <asp:TextBox ID="StreetTextBox" runat="server" Placeholder="Enter your street address" CssClass="input-text"></asp:TextBox>
                <asp:RequiredFieldValidator ID="StreetRequiredValidator" runat="server" ControlToValidate="StreetTextBox" ErrorMessage="Street is required." ForeColor="Red" CssClass="error-message" />

                <!-- City Field -->
                <asp:Label ID="CityLabel" runat="server" Text="City:" AssociatedControlID="CityTextBox" CssClass="profile-label"></asp:Label>
                <asp:TextBox ID="CityTextBox" runat="server" Placeholder="Enter your city" CssClass="input-text"></asp:TextBox>
                <asp:RequiredFieldValidator ID="CityRequiredValidator" runat="server" ControlToValidate="CityTextBox" ErrorMessage="City is required." ForeColor="Red" CssClass="error-message" />

                <!-- Province Field -->
                <asp:Label ID="ProvinceLabel" runat="server" Text="Province:" AssociatedControlID="ProvinceTextBox" CssClass="profile-label"></asp:Label>
                <asp:TextBox ID="ProvinceTextBox" runat="server" Placeholder="Enter your province" CssClass="input-text"></asp:TextBox>
                <asp:RequiredFieldValidator ID="ProvinceRequiredValidator" runat="server" ControlToValidate="ProvinceTextBox" ErrorMessage="Province is required." ForeColor="Red" CssClass="error-message" />

                <!-- Save Profile Button -->
                <asp:Button ID="SaveProfileButton" runat="server" Text="Save Profile" CssClass="profile-btn" OnClick="SaveProfileButton_Click" />

                <!-- Success and Error Messages -->
                <asp:Label ID="ProfileStatusLabel" runat="server" CssClass="status-message"></asp:Label>
                <asp:Label ID="ErrorLabel" runat="server" CssClass="error-message"></asp:Label>
            </asp:Panel>
        </section>
    </main>
</asp:Content>
