<%@ Page Title="Profile View" Language="C#" MasterPageFile="~/Second.Master" AutoEventWireup="true" CodeBehind="11profileview.aspx.cs" Inherits="Brightside_Dental_Care_Planning.WebForm6" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, sans-serif;
            margin: 0;
            background-color: #e9ecef;
        }

        .profile-main {
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
            padding: 40px;
            height: 100vh;
        }

        .profile-section {
            width: 100%;
            max-width: 400px;
            background-color: #ffffff;
            border-radius: 10px;
            padding: 40px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.15);
            transition: transform 0.3s;
        }

        .profile-section:hover {
            transform: scale(1.02);
        }

        .profile-title {
            color: #007bff;
            margin-bottom: 20px;
            font-size: 2.5em;
            text-align: center;
            border-bottom: 2px solid #007bff;
            padding-bottom: 10px;
        }

        .profile-info {
            font-size: 1.1em;
            color: #495057;
            margin-bottom: 15px;
            line-height: 1.5;
        }

        .status-message {
            margin-top: 20px;
            font-size: 1.1em;
            color: #dc3545;
            text-align: center;
        }

        .info-label {
            font-size: 1.1em;
            color: #6c757d;
            text-align: center;
            margin-bottom: 20px;
        }

        .profile-btn {
            width: 100%;
            padding: 10px;
            margin-top: 20px;
            border: none;
            border-radius: 5px;
            background-color: #007bff;
            color: white;
            font-size: 1.2em;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .profile-btn:hover {
            background-color: #0056b3;
        }

        .profile-btn:focus {
            outline: none;
            box-shadow: 0 0 0 4px rgba(0, 123, 255, 0.5);
        }
    </style>

    <main aria-labelledby="title" class="profile-main">
        <section class="profile-section">
            <h1 id="title" class="profile-title">Profile Details</h1>

            <!-- New label for creating a profile -->
            <asp:Label ID="CreateProfileLabel" runat="server" CssClass="info-label" Text="Create a profile before making an appointment"></asp:Label>

            <!-- Profile Details -->
            <asp:Panel ID="ProfileViewPanel" runat="server">
                <div class="profile-info">
                    <strong>First Name:</strong> <asp:Label ID="FirstNameLabel" runat="server" CssClass="profile-info"></asp:Label>
                </div>
                <div class="profile-info">
                    <strong>Last Name:</strong> <asp:Label ID="LastNameLabel" runat="server" CssClass="profile-info"></asp:Label>
                </div>
                <div class="profile-info">
                    <strong>Phone Number:</strong> <asp:Label ID="PhoneNumberLabel" runat="server" CssClass="profile-info"></asp:Label>
                </div>
                <div class="profile-info">
                    <strong>Date of Birth:</strong> <asp:Label ID="DateOfBirthLabel" runat="server" CssClass="profile-info"></asp:Label>
                </div>
                <div class="profile-info">
                    <strong>Gender:</strong> <asp:Label ID="GenderLabel" runat="server" CssClass="profile-info"></asp:Label>
                </div>
                <div class="profile-info">
                    <strong>Address:</strong> <asp:Label ID="AddressLabel" runat="server" CssClass="profile-info"></asp:Label>
                </div>

                <!-- Status Message Label -->
                <asp:Label ID="ProfileStatusLabel" runat="server" CssClass="status-message"></asp:Label>

                <!-- Button to Create Profile / Edit Profile -->
                <asp:Button ID="EditProfileButton" runat="server" Text="Create Profile" OnClick="EditProfileButton_Click" CssClass="profile-btn" />

                <!-- Make Appointment Button -->
                <asp:Button ID="MakeAppointmentButton" runat="server" Text="Make Appointment" OnClick="MakeAppointmentButton_Click" CssClass="profile-btn" />
                <asp:Label ID="AppointmentStatusLabel" runat="server" CssClass="status-message"></asp:Label>
            </asp:Panel>
        </section>
    </main>
</asp:Content>
