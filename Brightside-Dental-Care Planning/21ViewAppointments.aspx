<%@ Page Title="" Language="C#" MasterPageFile="~/Second.Master" AutoEventWireup="true" CodeBehind="21ViewAppointments.aspx.cs" Inherits="Brightside_Dental_Care_Planning.WebForm4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        /* Basic styles for the page */
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
        }

        /* Header label */
        #Label1 {
            font-size: 24px;
            font-weight: bold;
            color: #333;
            margin-bottom: 20px;
        }

        /* Status message for no appointments */
        .status-message {
            color: #d9534f; /* Bootstrap danger color */
            font-weight: bold;
            margin-top: 10px;
        }

        /* GridView styles */
        #GridView1 {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        #GridView1 th, #GridView1 td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: left;
        }

        #GridView1 th {
            background-color: #4CAF50; /* Green background */
            color: white;
        }

        #GridView1 tr:nth-child(even) {
            background-color: #f2f2f2; /* Zebra striping */
        }

        #GridView1 tr:hover {
            background-color: #ddd; /* Highlight on hover */
        }

        /* Button styles */
        .appointment-button {
            background-color: #4CAF50; /* Green */
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            margin-top: 10px;
        }

        .appointment-button:hover {
            background-color: #45a049; /* Darker green on hover */
        }

        /* Responsive design */
        @media (max-width: 768px) {
            table {
                width: 100%;
                font-size: 14px;
            }

            .appointment-button {
                width: 100%;
                margin: 5px 0;
            }
        }
    </style>

    <table style="width: 100%;">
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" Text="Your Appointments"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <!-- New Label for displaying no appointments message -->
                <asp:Label ID="NoAppointmentsLabel" runat="server" CssClass="status-message" Visible="false"></asp:Label>

                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3">
                    <Columns>
                        <asp:BoundField DataField="Patient_LastName" HeaderText="Patient Last Name" SortExpression="Patient_LastName" />
                        <asp:BoundField DataField="Patient_FirstName" HeaderText="Patient First Name" SortExpression="Patient_FirstName" />
                        <asp:BoundField DataField="Service_name" HeaderText="Service Name" SortExpression="Service_name" />
                        <asp:BoundField DataField="Additional_Info" HeaderText="Additional Info" SortExpression="Additional_Info" />
                        <asp:BoundField DataField="Booking_Date" HeaderText="Booking Date" SortExpression="Booking_Date" />
                        <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
                        <asp:BoundField DataField="AppointmentStatus" HeaderText="Appointment Status" SortExpression="AppointmentStatus" />
                    </Columns>
                    <FooterStyle BackColor="White" ForeColor="#000066" />
                    <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                    <RowStyle ForeColor="#000066" />
                    <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#007DBB" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#00547E" />
                </asp:GridView>

                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:dentistdatabaseConnectionString %>" 
                    SelectCommand="SELECT [Patient_LastName], [Patient_FirstName], [Service_name], [Additional_Info], [Booking_Date], [Price], [AppointmentStatus] FROM [Appointment] WHERE Patient_Id = @PatientId">
                    <SelectParameters>
                        <asp:Parameter Name="PatientId" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>

                <asp:Button ID="Button2" runat="server" CssClass="appointment-button" OnClick="Button2_Click" Text="Make appointment" />
                <asp:Button ID="Button1" runat="server" CssClass="appointment-button" OnClick="Button1_Click" Text="View profile details" />
            </td>
        </tr>
    </table>
</asp:Content>
