<%@ Page Title="Add Doctor" Language="C#" MasterPageFile="~/Second.Master" AutoEventWireup="true" CodeBehind="22AddDoctor.aspx.cs" Inherits="Brightside_Dental_Care_Planning.WebForm7" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div style="max-width: 600px; margin: auto; padding: 20px; background-color: #f4f4f4; border-radius: 8px; box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);">
        <h2 style="text-align: center; font-family: Arial, sans-serif; color: #333;">Add New Doctor</h2>
        
        <asp:Label ID="AddSuccessMessage" runat="server" ForeColor="Green" Visible="false" style="text-align: center; display: block; margin-bottom: 20px;"></asp:Label>
        
        <asp:Label ID="LabelFirstName" runat="server" Text="First Name:" AssociatedControlID="TextBoxFirstName" />
        <asp:TextBox ID="TextBoxFirstName" runat="server" placeholder="Enter first name" style="width: 100%; padding: 10px; margin-bottom: 10px; border-radius: 4px; border: 1px solid #ccc;" />
        
        <asp:Label ID="LabelLastName" runat="server" Text="Last Name:" AssociatedControlID="TextBoxLastName" />
        <asp:TextBox ID="TextBoxLastName" runat="server" placeholder="Enter last name" style="width: 100%; padding: 10px; margin-bottom: 10px; border-radius: 4px; border: 1px solid #ccc;" />
        
        <asp:Label ID="LabelEmail" runat="server" Text="Email:" AssociatedControlID="TextBoxEmail" />
        <asp:TextBox ID="TextBoxEmail" runat="server" placeholder="Enter email" style="width: 100%; padding: 10px; margin-bottom: 10px; border-radius: 4px; border: 1px solid #ccc;" />
        
        <asp:Label ID="LabelPassword" runat="server" Text="Password (min 6 characters):" AssociatedControlID="TextBoxPassword" />
        <asp:TextBox ID="TextBoxPassword" runat="server" TextMode="Password" placeholder="Enter password" style="width: 100%; padding: 10px; margin-bottom: 20px; border-radius: 4px; border: 1px solid #ccc;" />
        
        <asp:Button ID="ButtonAddDoctor" runat="server" Text="Add Doctor" OnClick="ButtonAddDoctor_Click" 
                    style="width: 100%; padding: 10px; background-color: #5cb85c; color: white; border: none; border-radius: 4px; cursor: pointer;" />
        
        <asp:Button ID="ButtonBack" runat="server" Text="Go Back to Admin Dashboard" OnClick="ButtonBack_Click" 
                    style="width: 100%; padding: 10px; background-color: #d9534f; color: white; border: none; border-radius: 4px; cursor: pointer; margin-top: 10px;" />
    </div>
</asp:Content>
