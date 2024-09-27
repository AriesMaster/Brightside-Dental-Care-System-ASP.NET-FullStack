<%@ Page Title="Create Profile" Language="C#" MasterPageFile="~/Second.Master" AutoEventWireup="true" CodeBehind="10profile.aspx.cs" Inherits="Brightside_Dental_Care_Planning.WebForm5" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
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
            <h1 id="title" class="profile-title">Create Profile</h1>

            <asp:Panel ID="ProfilePanel" runat="server" CssClass="profile-panel">
                <!-- First Name Field -->
                <asp:Label ID="FirstNameLabel" runat="server" Text="First Name:" AssociatedControlID="FirstName" CssClass="profile-label"></asp:Label>
                <asp:TextBox ID="FirstName" runat="server" Placeholder="Enter your first name" CssClass="input-text"></asp:TextBox>
                <asp:RequiredFieldValidator ID="FirstNameRequiredValidator" runat="server" ControlToValidate="FirstName" ErrorMessage="First Name is required." ForeColor="Red" CssClass="error-message" />

                <!-- Last Name Field -->
                <asp:Label ID="LastNameLabel" runat="server" Text="Last Name:" AssociatedControlID="LastName" CssClass="profile-label"></asp:Label>
                <asp:TextBox ID="LastName" runat="server" Placeholder="Enter your last name" CssClass="input-text"></asp:TextBox>
                <asp:RequiredFieldValidator ID="LastNameRequiredValidator" runat="server" ControlToValidate="LastName" ErrorMessage="Last Name is required." ForeColor="Red" CssClass="error-message" />

                <!-- Phone Number Field -->
                <asp:Label ID="PhoneNumberLabel" runat="server" Text="Phone Number:" AssociatedControlID="PhoneNumber" CssClass="profile-label"></asp:Label>
                <asp:TextBox ID="PhoneNumber" runat="server" Placeholder="Enter your phone number" CssClass="input-text"></asp:TextBox>
                <asp:RequiredFieldValidator ID="PhoneNumberRequiredValidator" runat="server" ControlToValidate="PhoneNumber" ErrorMessage="Phone Number is required." ForeColor="Red" CssClass="error-message" />
                <asp:RegularExpressionValidator ID="PhoneNumberValidator" runat="server" ControlToValidate="PhoneNumber" ErrorMessage="Invalid phone number format." ValidationExpression="^\d{10}$" ForeColor="Red" CssClass="error-message" />

                <!-- Date of Birth Field -->
                <asp:Label ID="DateOfBirthLabel" runat="server" Text="Date of Birth:" AssociatedControlID="DateOfBirth" CssClass="profile-label"></asp:Label>
                <asp:TextBox ID="DateOfBirth" runat="server" TextMode="Date" CssClass="input-text"></asp:TextBox>
                <asp:RequiredFieldValidator ID="DateOfBirthRequiredValidator" runat="server" ControlToValidate="DateOfBirth" ErrorMessage="Date of Birth is required." ForeColor="Red" CssClass="error-message" />

                <!-- Gender Field -->
                <asp:Label ID="GenderLabel" runat="server" Text="Gender:" AssociatedControlID="Gender" CssClass="profile-label"></asp:Label>
                <asp:DropDownList ID="Gender" runat="server" CssClass="input-text">
                    <asp:ListItem Text="Male" Value="Male" />
                    <asp:ListItem Text="Female" Value="Female" />
                    <asp:ListItem Text="Other" Value="Other" />
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="GenderRequiredValidator" runat="server" ControlToValidate="Gender" ErrorMessage="Gender is required." ForeColor="Red" CssClass="error-message" />

                <!-- Street Field -->
                <asp:Label ID="StreetLabel" runat="server" Text="Street:" AssociatedControlID="Street" CssClass="profile-label"></asp:Label>
                <asp:TextBox ID="Street" runat="server" Placeholder="Enter your street address" CssClass="input-text"></asp:TextBox>
                <asp:RequiredFieldValidator ID="StreetRequiredValidator" runat="server" ControlToValidate="Street" ErrorMessage="Street is required." ForeColor="Red" CssClass="error-message" />

                <!-- City Field -->
                <asp:Label ID="CityLabel" runat="server" Text="City:" AssociatedControlID="City" CssClass="profile-label"></asp:Label>
                <asp:TextBox ID="City" runat="server" Placeholder="Enter your city" CssClass="input-text"></asp:TextBox>
                <asp:RequiredFieldValidator ID="CityRequiredValidator" runat="server" ControlToValidate="City" ErrorMessage="City is required." ForeColor="Red" CssClass="error-message" />

                <!-- Province Field -->
                <asp:Label ID="ProvinceLabel" runat="server" Text="Province:" AssociatedControlID="Province" CssClass="profile-label"></asp:Label>
                <asp:TextBox ID="Province" runat="server" Placeholder="Enter your province" CssClass="input-text"></asp:TextBox>
                <asp:RequiredFieldValidator ID="ProvinceRequiredValidator" runat="server" ControlToValidate="Province" ErrorMessage="Province is required." ForeColor="Red" CssClass="error-message" />

                <!-- Create Profile Button -->
                <asp:Button ID="CreateProfileButton" runat="server" Text="Create Profile" CssClass="profile-btn" OnClick="CreateProfileButton_Click" />

                <!-- Success and Error Messages -->
                <asp:Label ID="ProfileStatusLabel" runat="server" CssClass="status-message"></asp:Label>
                <asp:Label ID="ErrorLabel" runat="server" CssClass="error-message"></asp:Label>
            </asp:Panel>
        </section>
    </main>
</asp:Content>
