﻿<%@ Page 
    Title="" 
    Language="C#" 
    MasterPageFile="~/Second.Master" 
    AutoEventWireup="true" 
    CodeBehind="9Doctor.aspx.cs" 
    Inherits="Brightside_Dental_Care_Planning.WebForm13" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .dashboard-container {
            padding: 20px;
            font-family: Arial, sans-serif;
            background-color: #F9F9F9;
        }

        .dashboard-title {
            font-size: 2em;
            color: #006699;
            margin-bottom: 20px;
        }

        .section-title {
            font-size: 1.5em;
            color: #004466;
            margin-top: 20px;
        }

        .grid-view {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
        }

        .grid-view th, .grid-view td {
            border: 1px solid #CCCCCC;
            padding: 8px;
            text-align: left;
        }

        .footer-style {
            background-color: #F8F8F8;
            color: #000066;
        }

        .header-style {
            background-color: #006699;
            color: white;
            font-weight: bold;
        }

        .pager-style {
            background-color: #F8F8F8;
            color: #000066;
        }

        .row-style {
            color: #000066;
        }

        .selected-row-style {
            background-color: #669999;
            color: white;
            font-weight: bold;
        }

        .sorted-ascending-cell {
            background-color: #F1F1F1;
        }

        .sorted-ascending-header {
            background-color: #007DBB;
        }

        .sorted-descending-cell {
            background-color: #CAC9C9;
        }

        .sorted-descending-header {
            background-color: #00547E;
        }

        .edit-profile-button {
            margin-top: 20px;
        }

        .button-edit {
            padding: 10px 15px;
            background-color: #006699;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 1em;
        }

        .button-edit:hover {
            background-color: #00547E;
        }
    </style>

    <div class="dashboard-container">
        <h1 class="dashboard-title">Doctor Dashboard</h1>

        <section class="appointments-section">
            <h2 class="section-title">List of Appointments</h2>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                DataSourceID="SqlDataSource1" CssClass="grid-view" 
                DataKeyNames="Booking_Id" 
                OnRowEditing="GridView1_RowEditing" 
                OnRowUpdating="GridView1_RowUpdating" 
                OnRowCancelingEdit="GridView1_RowCancelingEdit">
                <Columns>

                    <asp:CommandField ShowEditButton="True" HeaderText="Update Appointment Status" />
                    <asp:TemplateField HeaderText="Appointment Status">
                        <EditItemTemplate>
                            <asp:DropDownList ID="ddlAppointmentStatus" runat="server" SelectedValue='<%# Bind("AppointmentStatus") %>'>
                                <asp:ListItem Text="Pending" Value="Pending"></asp:ListItem>
                                <asp:ListItem Text="Completed" Value="Completed"></asp:ListItem>
                                <asp:ListItem Text="Cancelled" Value="Cancelled"></asp:ListItem>
                            </asp:DropDownList>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblAppointmentStatus" runat="server" Text='<%# Eval("AppointmentStatus") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    
                    <asp:BoundField DataField="Patient_LastName" HeaderText="Patient Last Name" SortExpression="Patient_LastName" ReadOnly="True" />
                    <asp:BoundField DataField="Patient_FirstName" HeaderText="Patient First Name" SortExpression="Patient_FirstName" ReadOnly="True" />
                    <asp:BoundField DataField="Service_name" HeaderText="Service Name" SortExpression="Service_name" ReadOnly="True" />
                    <asp:BoundField DataField="Additional_Info" HeaderText="Additional Info" SortExpression="Additional_Info" ReadOnly="True" />
                    <asp:BoundField DataField="Booking_Date" HeaderText="Booking Date" SortExpression="Booking_Date" ReadOnly="True" />
                    <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" ReadOnly="True" />

                    
                    
                </Columns>
                <FooterStyle CssClass="footer-style" />
                <HeaderStyle CssClass="header-style" />
                <PagerStyle CssClass="pager-style" />
                <RowStyle CssClass="row-style" />
                <SelectedRowStyle CssClass="selected-row-style" />
                <SortedAscendingCellStyle CssClass="sorted-ascending-cell" />
                <SortedAscendingHeaderStyle CssClass="sorted-ascending-header" />
                <SortedDescendingCellStyle CssClass="sorted-descending-cell" />
                <SortedDescendingHeaderStyle CssClass="sorted-descending-header" />
            </asp:GridView>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:dentistdatabaseConnectionString %>" 
                SelectCommand="SELECT [Booking_Id], [AppointmentStatus], [Patient_LastName], [Patient_FirstName], [Service_name], [Additional_Info], [Booking_Date], [Price] FROM [Appointment]"
                UpdateCommand="UPDATE [Appointment] SET [AppointmentStatus] = @AppointmentStatus WHERE [Booking_Id] = @Booking_Id">
                <UpdateParameters>
                    <asp:Parameter Name="AppointmentStatus" Type="String" />
                    <asp:Parameter Name="Booking_Id" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>

        </section>

        <section class="doctor-profile-section">
            <h2 class="section-title">Doctor Profile</h2>
            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="Doctor_Id" DataSourceID="SqlDataSource2" CssClass="grid-view">
                <Columns>
                    <asp:BoundField DataField="Doctor_Id" HeaderText="Doctor_Id" InsertVisible="False" ReadOnly="True" SortExpression="Doctor_Id" />
                    <asp:BoundField DataField="last_name" HeaderText="last_name" SortExpression="last_name" />
                    <asp:BoundField DataField="first_name" HeaderText="first_name" SortExpression="first_name" />
                    <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
                </Columns>
                <FooterStyle CssClass="footer-style" />
                <HeaderStyle CssClass="header-style" />
                <PagerStyle CssClass="pager-style" />
                <RowStyle CssClass="row-style" />
                <SelectedRowStyle CssClass="selected-row-style" />
                <SortedAscendingCellStyle CssClass="sorted-ascending-cell" />
                <SortedAscendingHeaderStyle CssClass="sorted-ascending-header" />
                <SortedDescendingCellStyle CssClass="sorted-descending-cell" />
                <SortedDescendingHeaderStyle CssClass="sorted-descending-header" />
            </asp:GridView>

            <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                ConnectionString="<%$ ConnectionStrings:dentistdatabaseConnectionString %>" 
                SelectCommand="SELECT [Doctor_Id], [last_name], [first_name], [email] FROM [Doctor] WHERE ([email] = @email)">
                <SelectParameters>
                    <asp:SessionParameter Name="email" SessionField="UserName" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
        </section>

        <div class="edit-profile-button">
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Edit Doctor Profile" CssClass="button-edit" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        </div>
    </div>
</asp:Content>

