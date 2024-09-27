<%@ Page Title="" Language="C#" MasterPageFile="~/Second.Master" AutoEventWireup="true" CodeBehind="6Admin.aspx.cs" Inherits="Brightside_Dental_Care_Planning.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
      <style>
        /* General Styles */
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
        }

        h1 {
            color: #006699;
            text-align: center;
            margin-bottom: 20px;
        }

        .styled-button {
            background-color: #006699; /* Blue background */
            color: white; /* White text */
            border: none; /* No border */
            border-radius: 5px; /* Rounded corners */
            padding: 10px 20px; /* Padding */
            font-size: 16px; /* Font size */
            cursor: pointer; /* Pointer cursor on hover */
            transition: background-color 0.3s; /* Transition effect */
            margin: 5px; /* Margin for spacing */
        }

        .styled-button:hover {
            background-color: #004d66; /* Darker blue on hover */
        }

        /* Table Styles */
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        th, td {
            padding: 10px;
            text-align: left;
            border: 1px solid #ccc;
        }

        th {
            background-color: #006699;
            color: white;
            font-weight: bold;
        }

        tr:nth-child(even) {
            background-color: #f1f1f1; /* Alternate row colors */
        }

        tr:hover {
            background-color: #e9e9e9; /* Highlight on hover */
        }

        .success-message {
            color: green;
            margin-top: 10px;
        }

        /* Labels */
        label {
            font-weight: bold;
            color: #006699;
            display: block;
            margin: 10px 0 5px; /* Spacing for labels */
        }
          .auto-style1 {
              text-align: center;
          }
          .auto-style2 {
              font-size: large;
          }
    </style>

    <h1>Admin Dashboard</h1>

    <table>
        <tr>
            <td class="auto-style1">
                <strong>
    <asp:Label ID="Label2" runat="server" Text="Patients" CssClass="auto-style2"></asp:Label>
                </strong>
    <asp:Label ID="DeleteSuccessMessage" runat="server" Text="" ForeColor="Green" Visible="False"></asp:Label>

    <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" 
        BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="Patient_Id" 
        DataSourceID="SqlDataSource1" OnRowDeleting="GridView1_RowDeleting" 
        OnRowEditing="GridView1_RowEditing" OnRowCancelingEdit="GridView1_RowCancelingEdit" 
        OnRowUpdating="GridView1_RowUpdating">
        <Columns>
            <asp:BoundField DataField="Patient_Id" HeaderText="Patient_Id" InsertVisible="False" ReadOnly="True" SortExpression="Patient_Id" />
            <asp:TemplateField HeaderText="Email">
                <ItemTemplate>
                    <asp:Label ID="LabelEmail" runat="server" Text='<%# Bind("email") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBoxEmail" runat="server" Text='<%# Bind("email") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Password">
                <ItemTemplate>
                    <asp:Label ID="LabelPassword" runat="server" Text='<%# Bind("password") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBoxPassword" runat="server" Text='<%# Bind("password") %>' TextMode="Password"></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
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

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dentistdatabaseConnectionString %>" 
        SelectCommand="SELECT * FROM [Patient]" DeleteCommand="DELETE FROM [Patient] WHERE [Patient_Id] = @Patient_Id">
        <DeleteParameters>
            <asp:Parameter Name="Patient_Id" Type="Int32" />
        </DeleteParameters>
    </asp:SqlDataSource>
</td>

            <td rowspan="5">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style1">
                <strong>
                <asp:Label ID="Label3" runat="server" Text="Profiles" CssClass="auto-style2"></asp:Label>
                </strong>
                <!-- Label for showing success message for profiles -->
                <asp:Label ID="DeleteSuccessMessageProfile" runat="server" Text="" ForeColor="Green" Visible="False"></asp:Label>

                <asp:GridView ID="GridView2" runat="server" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" 
                    BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="Profile_Id" 
                    DataSourceID="SqlDataSource2" OnRowDeleting="GridView2_RowDeleting">
                    <Columns>
                        <asp:BoundField DataField="Profile_Id" HeaderText="Profile_Id" InsertVisible="False" ReadOnly="True" SortExpression="Profile_Id" />
                        <asp:BoundField DataField="Patient_Id" HeaderText="Patient_Id" SortExpression="Patient_Id" />
                        <asp:BoundField DataField="first_name" HeaderText="first_name" SortExpression="first_name" />
                        <asp:BoundField DataField="last_name" HeaderText="last_name" SortExpression="last_name" />
                        <asp:BoundField DataField="Date_of_Birth" HeaderText="Date_of_Birth" SortExpression="Date_of_Birth" />
                        <asp:BoundField DataField="Gender" HeaderText="Gender" SortExpression="Gender" />
                        <asp:BoundField DataField="phone_number" HeaderText="phone_number" SortExpression="phone_number" />
                        <asp:CommandField ShowDeleteButton="True" />
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
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:dentistdatabaseConnectionString %>" SelectCommand="SELECT * FROM [Profile]" DeleteCommand="DELETE FROM [Profile] WHERE [Profile_Id] = @Profile_Id">
                    <DeleteParameters>
                        <asp:Parameter Name="Profile_Id" Type="Int32" />
                    </DeleteParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td class="auto-style1">
                <strong>
                <asp:Label ID="Label4" runat="server" Text="Addresses" CssClass="auto-style2"></asp:Label>
                </strong>
                <asp:Label ID="DeleteSuccessMessageAddress" runat="server" Text="" ForeColor="Green" Visible="False"></asp:Label>

                <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="Address_Id" DataSourceID="SqlDataSource3" OnRowDeleting="GridView3_RowDeleting">
                    <Columns>
                        <asp:BoundField DataField="Address_Id" HeaderText="Address_Id" InsertVisible="False" ReadOnly="True" SortExpression="Address_Id" />
                        <asp:BoundField DataField="Patient_Id" HeaderText="Patient_Id" SortExpression="Patient_Id" />
                        <asp:BoundField DataField="Street" HeaderText="Street" SortExpression="Street" />
                        <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
                        <asp:BoundField DataField="Province" HeaderText="Province" SortExpression="Province" />
                        <asp:CommandField ShowDeleteButton="True" />
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
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:dentistdatabaseConnectionString %>" SelectCommand="SELECT * FROM [Address]" DeleteCommand="DELETE FROM [Address] WHERE [Address_Id] = @Address_Id">
                    <DeleteParameters>
                        <asp:Parameter Name="Address_Id" Type="Int32" />
                    </DeleteParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td class="auto-style1">
                <strong>
               <asp:Label ID="Label5" runat="server" Text="Appointments" CssClass="auto-style2"></asp:Label>
                </strong>
<!-- Label for showing success message for appointments -->
<asp:Label ID="DeleteSuccessMessageAppointments" runat="server" Text="" ForeColor="Green" Visible="False"></asp:Label>

<asp:GridView ID="GridView4" runat="server" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" 
    BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="Booking_Id" 
    DataSourceID="SqlDataSource4" OnRowDeleting="GridView4_RowDeleting">
    <Columns>
        
        <asp:BoundField DataField="Booking_Id" HeaderText="Booking_Id" InsertVisible="False" ReadOnly="True" SortExpression="Booking_Id" />
        <asp:BoundField DataField="Patient_Id" HeaderText="Patient_Id" SortExpression="Patient_Id" />
        <asp:BoundField DataField="Service_Type_Id" HeaderText="Service_Type_Id" SortExpression="Service_Type_Id" />
        <asp:BoundField DataField="Booking_Date" HeaderText="Booking_Date" SortExpression="Booking_Date" />
        <asp:BoundField DataField="Additional_Info" HeaderText="Additional_Info" SortExpression="Additional_Info" />
        <asp:BoundField DataField="Service_name" HeaderText="Service_name" SortExpression="Service_name" />
        <asp:BoundField DataField="Patient_FirstName" HeaderText="Patient_FirstName" SortExpression="Patient_FirstName" />
        <asp:BoundField DataField="Patient_LastName" HeaderText="Patient_LastName" SortExpression="Patient_LastName" />
        <asp:CommandField ShowDeleteButton="True" />
        
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

<asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:dentistdatabaseConnectionString %>" 
    SelectCommand="SELECT * FROM [Appointment]" DeleteCommand="DELETE FROM [Appointment] WHERE [Booking_Id] = @Booking_Id">
    <DeleteParameters>
        <asp:Parameter Name="Booking_Id" Type="Int32" />
    </DeleteParameters>
</asp:SqlDataSource>


                    
                    </td>
        </tr>
        <tr>
            <td style="height: 25px" class="auto-style1">
                <strong>
               <asp:Label ID="Label6" runat="server" Text="Service Types" CssClass="auto-style2"></asp:Label>
                </strong>
<!-- Label for showing success message for Service Types -->
<asp:Label ID="DeleteSuccessMessageServiceTypes" runat="server" ForeColor="Green" Visible="False"></asp:Label>

<asp:GridView ID="GridView5" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" 
    BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="Service_Type_Id" 
    DataSourceID="SqlDataSource5" OnRowDeleting="GridView5_RowDeleting">
    <Columns>
        
        <asp:BoundField DataField="Service_Type_Id" HeaderText="Service_Type_Id" InsertVisible="False" ReadOnly="True" SortExpression="Service_Type_Id" />
        <asp:BoundField DataField="Service_name" HeaderText="Service_name" SortExpression="Service_name" />
        <asp:BoundField DataField="Service_Desc" HeaderText="Service_Desc" SortExpression="Service_Desc" />
        <asp:CommandField ShowDeleteButton="True" />
        
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

<asp:SqlDataSource ID="SqlDataSource5" runat="server" 
    ConnectionString="<%$ ConnectionStrings:dentistdatabaseConnectionString %>" 
    SelectCommand="SELECT * FROM [Service_Type]" 
    DeleteCommand="DELETE FROM [Service_Type] WHERE [Service_Type_Id] = @Service_Type_Id">
    <DeleteParameters>
        <asp:Parameter Name="Service_Type_Id" Type="Int32" />
    </DeleteParameters>
</asp:SqlDataSource>

            </td>
        </tr>
        <tr>
            <td class="auto-style1">
                <strong>
               <asp:Label ID="Label7" runat="server" Text="Doctors" CssClass="auto-style2"></asp:Label>

                </strong>

<!-- Label for showing success message for deleting a doctor -->
<asp:Label ID="DeleteSuccessMessageDoctors" runat="server" Text="" ForeColor="Green" Visible="False"></asp:Label>

<asp:GridView ID="GridView6" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" 
    BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="Doctor_Id" DataSourceID="SqlDataSource6" 
    OnRowDeleting="GridView6_RowDeleting">
    <Columns>
        <asp:BoundField DataField="Doctor_Id" HeaderText="Doctor_Id" InsertVisible="False" ReadOnly="True" SortExpression="Doctor_Id" />
        <asp:BoundField DataField="email" HeaderText="Email" SortExpression="email" />
        <asp:BoundField DataField="password" HeaderText="Password" SortExpression="password" />
        <asp:BoundField DataField="first_name" HeaderText="First Name" SortExpression="first_name" />
        <asp:BoundField DataField="last_name" HeaderText="Last Name" SortExpression="last_name" />
        <asp:CommandField ShowDeleteButton="True" />
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

<!-- SQL DataSource to connect to Doctor table -->
<asp:SqlDataSource ID="SqlDataSource6" runat="server" 
    ConnectionString="<%$ ConnectionStrings:dentistdatabaseConnectionString %>" 
    SelectCommand="SELECT * FROM [Doctor]" 
    DeleteCommand="DELETE FROM [Doctor] WHERE [Doctor_Id] = @Doctor_Id">
    <DeleteParameters>
        <asp:Parameter Name="Doctor_Id" Type="Int32" />
    </DeleteParameters>
</asp:SqlDataSource>

            </td>
            <td rowspan="8">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style1">
                <strong>
               <asp:Label ID="LabelAdmins" runat="server" Text="Admins" CssClass="auto-style2"></asp:Label>

                </strong>

<asp:Label ID="DeleteSuccessMessageAdmins" runat="server" ForeColor="Green" Visible="False"></asp:Label>

<asp:GridView ID="GridView7" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" 
    BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="Admin_Id" DataSourceID="SqlDataSource7" 
    OnRowDeleting="GridView7_RowDeleting">
    <Columns>
        <asp:BoundField DataField="Admin_Id" HeaderText="Admin_Id" InsertVisible="False" ReadOnly="True" SortExpression="Admin_Id" />
        <asp:BoundField DataField="email" HeaderText="Email" SortExpression="email" />
        <asp:BoundField DataField="password" HeaderText="Password" SortExpression="password" />
        <asp:BoundField DataField="first_name" HeaderText="First Name" SortExpression="first_name" />
        <asp:BoundField DataField="last_name" HeaderText="Last Name" SortExpression="last_name" />
        <asp:CommandField ShowDeleteButton="True" />
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

<asp:SqlDataSource ID="SqlDataSource7" runat="server" 
    ConnectionString="<%$ ConnectionStrings:dentistdatabaseConnectionString %>" 
    SelectCommand="SELECT * FROM [Admin]" 
    DeleteCommand="DELETE FROM [Admin] WHERE [Admin_Id] = @Admin_Id">
    <DeleteParameters>
        <asp:Parameter Name="Admin_Id" Type="Int32" />
    </DeleteParameters>
</asp:SqlDataSource>

            </td>
        </tr>
        <tr>
            <td style="height: 25px"></td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="height: 30px">
                <asp:Button ID="Button1" runat="server" CssClass="styled-button" Text="Request reports" OnClick="Button1_Click" />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="Button2" runat="server" CssClass="styled-button" Text="Add Doctor" />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="Button3" runat="server" CssClass="styled-button" Text="Add Admin" />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="Button4" runat="server" CssClass="styled-button" Text="Add Service Types" />
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Content>