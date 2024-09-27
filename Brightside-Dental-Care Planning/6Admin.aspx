<%@ Page Title="" Language="C#" MasterPageFile="~/Second.Master" AutoEventWireup="true" CodeBehind="6Admin.aspx.cs" Inherits="Brightside_Dental_Care_Planning.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <table style="width: 100%; height: 661px;">
        <tr>
            <td style="text-align: center">
                <asp:Label ID="Label1" runat="server" Text="Admin DashBoard"></asp:Label>
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label2" runat="server" Text="Patients"></asp:Label>
                <!-- Label for showing success message -->
                <asp:Label ID="DeleteSuccessMessage" runat="server" Text="" ForeColor="Green" Visible="False"></asp:Label>

                <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" 
                    BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="Patient_Id" 
                    DataSourceID="SqlDataSource1" OnRowDeleting="GridView1_RowDeleting">
                    <Columns>
                        <asp:BoundField DataField="Patient_Id" HeaderText="Patient_Id" InsertVisible="False" ReadOnly="True" SortExpression="Patient_Id" />
                        <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
                        <asp:BoundField DataField="password" HeaderText="password" SortExpression="password" />
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
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dentistdatabaseConnectionString %>" SelectCommand="SELECT * FROM [Patient]" DeleteCommand="DELETE FROM [Patient] WHERE [Patient_Id] = @Patient_Id">
                    <DeleteParameters>
                        <asp:Parameter Name="Patient_Id" Type="Int32" />
                    </DeleteParameters>
                </asp:SqlDataSource>
            </td>
            <td rowspan="5">&nbsp;</td>
            <td rowspan="5">&nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label3" runat="server" Text="Profiles"></asp:Label>
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
            <td>
                <asp:Label ID="Label4" runat="server" Text="Addresses"></asp:Label>
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
            <td>
               <asp:Label ID="Label5" runat="server" Text="Appointments"></asp:Label>
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
            <td style="height: 25px">
               <asp:Label ID="Label6" runat="server" Text="Service Types"></asp:Label>
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
            <td>
               <asp:Label ID="Label7" runat="server" Text="Doctors"></asp:Label>

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
            <td rowspan="4">&nbsp;</td>
            <td rowspan="4">&nbsp;</td>
        </tr>
        <tr>
            <td>
               <asp:Label ID="LabelAdmins" runat="server" Text="Admins"></asp:Label>

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
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Content>
