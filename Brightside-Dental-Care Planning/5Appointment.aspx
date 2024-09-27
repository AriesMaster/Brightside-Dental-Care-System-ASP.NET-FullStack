<%@ Page Title="Appointment" Language="C#" MasterPageFile="~/Second.Master" AutoEventWireup="true" CodeBehind="5Appointment.aspx.cs" Inherits="Brightside_Dental_Care_Planning.WebForm8" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .appointment-main {
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
            padding: 40px;
            background-color: #f4f4f4;
            height: 100vh;
        }

        .appointment-section {
            width: 100%;
            max-width: 400px;
            background-color: #ffffff;
            border-radius: 10px;
            padding: 40px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        .appointment-title {
            font-family: 'Segoe UI', Tahoma, sans-serif;
            color: #333333;
            margin-bottom: 20px;
            font-size: 2.5em;
            text-align: center;
        }

        .appointment-label {
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

        .appointment-btn {
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

    <main aria-labelledby="title" class="appointment-main">
        <section class="appointment-section">
            <h1 id="title" class="appointment-title">Make an Appointment</h1>

            <asp:Panel ID="AppointmentPanel" runat="server">
                <!-- Service Type Field -->
                <asp:Label ID="ServiceTypeLabel" runat="server" Text="Service Type:" AssociatedControlID="ServiceType" CssClass="appointment-label"></asp:Label>
                <asp:DropDownList ID="ServiceType" runat="server" CssClass="input-text" DataSourceID="SqlDataSource1" DataTextField="Service_name" DataValueField="Service_name">
                    <asp:ListItem Text="Consultation" Value="Consultation" />
                    <asp:ListItem Text="Cleaning" Value="Cleaning" />
                </asp:DropDownList>

                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dentistdatabaseConnectionString %>" SelectCommand="SELECT [Service_name] FROM [Service_Type]"></asp:SqlDataSource>

                <!-- Appointment Date Field -->
                <asp:Label ID="AppointmentDateLabel" runat="server" Text="Appointment Date:" AssociatedControlID="AppointmentDate" CssClass="appointment-label"></asp:Label>
                <asp:TextBox ID="AppointmentDate" runat="server" TextMode="Date" CssClass="input-text"></asp:TextBox>

                <!-- Additional Information Field -->
                <asp:Label ID="AdditionalInfoLabel" runat="server" Text="Additional Information:" AssociatedControlID="AdditionalInfo" CssClass="appointment-label"></asp:Label>
                <asp:TextBox ID="AdditionalInfo" runat="server" CssClass="input-text"></asp:TextBox>

                <!-- Make Appointment Button -->
                <asp:Button ID="MakeAppointmentButton" runat="server" Text="Make Appointment" CssClass="appointment-btn" OnClick="MakeAppointmentButton_Click" />

                <!-- Status Messages -->
                <asp:Label ID="StatusLabel" runat="server" CssClass="status-message"></asp:Label>
                <asp:Label ID="ErrorLabel" runat="server" CssClass="error-message"></asp:Label>
            </asp:Panel>
        </section>
    </main>
</asp:Content>
