<%@ Page Title="Add Service Types" Language="C#" MasterPageFile="~/Second.Master" AutoEventWireup="true" CodeBehind="24AddServiceTypes.aspx.cs" Inherits="Brightside_Dental_Care_Planning.WebForm10" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div style="max-width: 600px; margin: auto; padding: 20px; background-color: #f4f4f4; border-radius: 8px; box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);">
        <h2 style="text-align: center; font-family: Arial, sans-serif; color: #333;">Add New Service Type</h2>
        
        <asp:Label ID="AddSuccessMessage" runat="server" ForeColor="Green" Visible="false" style="text-align: center; display: block; margin-bottom: 20px;"></asp:Label>
        
        <asp:Label ID="LabelServiceName" runat="server" Text="Service Name:" AssociatedControlID="TextBoxServiceName" />
        <asp:TextBox ID="TextBoxServiceName" runat="server" placeholder="Enter service name" style="width: 100%; padding: 10px; margin-bottom: 10px; border-radius: 4px; border: 1px solid #ccc;" />
        
        <asp:Label ID="LabelServiceDesc" runat="server" Text="Service Description:" AssociatedControlID="TextBoxServiceDesc" />
        <asp:TextBox ID="TextBoxServiceDesc" runat="server" TextMode="MultiLine" placeholder="Enter service description" style="width: 100%; padding: 10px; margin-bottom: 10px; border-radius: 4px; border: 1px solid #ccc; height: 80px;" />
        
        <asp:Label ID="LabelPrice" runat="server" Text="Price:" AssociatedControlID="TextBoxPrice" />
        <asp:TextBox ID="TextBoxPrice" runat="server" placeholder="Enter price" style="width: 100%; padding: 10px; margin-bottom: 20px; border-radius: 4px; border: 1px solid #ccc;" />
        
        <asp:Button ID="ButtonAddServiceType" runat="server" Text="Add Service Type" OnClick="ButtonAddServiceType_Click" 
                    style="width: 100%; padding: 10px; background-color: #5cb85c; color: white; border: none; border-radius: 4px; cursor: pointer;" />
        
        <asp:Button ID="ButtonBack" runat="server" Text="Go Back to Admin Dashboard" OnClick="ButtonBack_Click" 
                    style="width: 100%; padding: 10px; background-color: #d9534f; color: white; border: none; border-radius: 4px; cursor: pointer; margin-top: 10px;" />
    </div>
</asp:Content>
