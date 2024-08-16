<%@ Page Title="Sign Up" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="2signup.aspx.cs" Inherits="Brightside_Dental_Care_Planning.WebForm3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <main aria-labelledby="title" style="display: flex; justify-content: center; align-items: center; flex-direction: column; padding: 40px; background-color: #f4f4f4; height: 100vh;">
        <section style="width: 100%; max-width: 400px; background-color: #ffffff; border-radius: 10px; padding: 40px; box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);">
            <h1 id="title" style="font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; color: #333333; margin-bottom: 20px; font-size: 2.5em; text-align: center;">Sign Up</h1>
            
            <asp:Panel ID="SignupPanel" runat="server" Style="width: 100%; margin: 0 auto;">
                <asp:TextBox ID="UserName" runat="server" Placeholder="Enter your email" Font-Size="1em" Height="34px" Width="100%" Style="padding: 10px; border-radius: 5px; border: 1px solid #cccccc; margin-bottom: 20px;"></asp:TextBox>
                
                <asp:TextBox ID="Password" runat="server" Placeholder="Enter your password" TextMode="Password" Font-Size="1em" Height="34px" Width="100%" Style="padding: 10px; border-radius: 5px; border: 1px solid #cccccc; margin-bottom: 20px;"></asp:TextBox>
                
                <asp:TextBox ID="ConfirmPassword" runat="server" Placeholder="Confirm your password" TextMode="Password" Font-Size="1em" Height="34px" Width="100%" Style="padding: 10px; border-radius: 5px; border: 1px solid #cccccc; margin-bottom: 20px;"></asp:TextBox>
                
                <asp:Button ID="SignupButton" runat="server" BackColor="#007bff" BorderColor="#007bff" BorderStyle="Solid" BorderWidth="1px" CommandName="Signup" Font-Names="Segoe UI" Font-Size="1em" ForeColor="#ffffff" Height="50px" Text="Sign Up" Style="width: 100%; border-radius: 5px; cursor: pointer;" />
            </asp:Panel>

            <p style="text-align: center; margin-top: 20px;">
                <asp:HyperLink ID="LoginLink" runat="server" NavigateUrl="~/1login.aspx" Style="color: #007bff; text-decoration: none;">Already have an account? Log In</asp:HyperLink>
            </p>
        </section>
    </main>
</asp:Content>
