<%@ Page Title="Sign Up" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="2signup.aspx.cs" Inherits="Brightside_Dental_Care_Planning.WebForm3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <main aria-labelledby="title" style="display: flex; justify-content: center; align-items: center; flex-direction: column; padding: 40px; background-color: #f4f4f4; height: 100vh;">
        <section style="width: 100%; max-width: 400px; background-color: #ffffff; border-radius: 10px; padding: 40px; box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);">
            <h1 id="title" style="font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; color: #333333; margin-bottom: 20px; font-size: 2.5em; text-align: center;">Sign Up</h1>
            
            <asp:Panel ID="SignupPanel" runat="server" Style="width: 100%; margin: 0 auto;">
                <asp:Label ID="EmailLabel" runat="server" Text="Email:" AssociatedControlID="UserName" Style="display: block; margin-bottom: 10px; font-size: 1em; color: #333333;"></asp:Label>
                <asp:TextBox ID="UserName" runat="server" Placeholder="Enter your email" Font-Size="1em" Height="34px" Width="100%" Style="padding: 10px; border-radius: 5px; border: 1px solid #cccccc; margin-bottom: 10px;"></asp:TextBox>
                
                <asp:RequiredFieldValidator ID="EmailRequiredValidator" runat="server" ControlToValidate="UserName" ErrorMessage="Email is required." ForeColor="Red" Style="display: block; margin-bottom: 5px;" />
                <asp:RegularExpressionValidator ID="EmailRegexValidator" runat="server" ControlToValidate="UserName" ErrorMessage="Please enter a valid email format." ForeColor="Red" 
                    ValidationExpression="^[^@\s]+@[^@\s]+\.[^@\s]+$" Style="display: block; margin-bottom: 10px;" />

                <asp:Label ID="PasswordLabel" runat="server" Text="Password:" AssociatedControlID="Password" Style="display: block; margin-bottom: 10px; font-size: 1em; color: #333333;"></asp:Label>
                <asp:TextBox ID="Password" runat="server" Placeholder="Enter your password" TextMode="Password" Font-Size="1em" Height="34px" Width="100%" Style="padding: 10px; border-radius: 5px; border: 1px solid #cccccc; margin-bottom: 10px;"></asp:TextBox>
                
                <asp:RequiredFieldValidator ID="PasswordRequiredValidator" runat="server" ControlToValidate="Password" ErrorMessage="Password is required." ForeColor="Red" Style="margin-bottom: 10px;" />

                <asp:Label ID="ConfirmPasswordLabel" runat="server" Text="Confirm Password:" AssociatedControlID="ConfirmPassword" Style="display: block; margin-bottom: 10px; font-size: 1em; color: #333333;"></asp:Label>
                <asp:TextBox ID="ConfirmPassword" runat="server" Placeholder="Confirm your password" TextMode="Password" Font-Size="1em" Height="34px" Width="100%" Style="padding: 10px; border-radius: 5px; border: 1px solid #cccccc; margin-bottom: 10px;"></asp:TextBox>

                <asp:CompareValidator ID="PasswordCompareValidator" runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword" ErrorMessage="Passwords do not match." ForeColor="Red" Style="margin-bottom: 10px;" />

                <asp:Button ID="SignupButton" runat="server" BackColor="#007bff" BorderColor="#007bff" BorderStyle="Solid" BorderWidth="1px" CommandName="Signup" Font-Names="Segoe UI" Font-Size="1em" ForeColor="#ffffff" Height="50px" Text="Sign Up" Style="width: 100%; border-radius: 5px; cursor: pointer;" OnClick="SignupButton_Click" />
            </asp:Panel>

            <p style="text-align: center; margin-top: 20px;">
                <asp:HyperLink ID="LoginLink" runat="server" NavigateUrl="~/1login.aspx" Style="color: #007bff; text-decoration: none;">Already have an account? Log In</asp:HyperLink>
            </p>
        </section>
    </main>
</asp:Content>



