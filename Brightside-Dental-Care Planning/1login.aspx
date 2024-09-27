<%@ Page Title="Login" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="1login.aspx.cs" Inherits="Brightside_Dental_Care_Planning._1login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <main aria-labelledby="title" style="display: flex; justify-content: center; align-items: center; flex-direction: column; padding: 40px; background-color: #f4f4f4; height: 100vh;">
        <section style="width: 100%; max-width: 400px; background-color: #ffffff; border-radius: 10px; padding: 40px; box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);">
            <h1 id="title" style="font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; color: #333333; margin-bottom: 20px; font-size: 2.5em; text-align: center;">Log In</h1>
            
            <asp:Panel ID="LoginPanel" runat="server" Style="width: 100%; margin: 0 auto;">
                
                <asp:Label ID="Label3" runat="server" Text="User Type:" AssociatedControlID="UserTypeDropDown" Style="display: block; margin-bottom: 10px; font-size: 1em; color: #333333;"></asp:Label>
                <asp:DropDownList ID="UserTypeDropDown" runat="server" Style="padding: 10px; border-radius: 5px; border: 1px solid #cccccc; width: 100%; margin-bottom: 20px;">
                    <asp:ListItem Value="Patient">Patient</asp:ListItem>
                    <asp:ListItem Value="Doctor">Doctor</asp:ListItem>
                    <asp:ListItem Value="Admin">Admin</asp:ListItem>
                </asp:DropDownList>
                
                <asp:Label ID="UserNameLabel" runat="server" Text="Email:" AssociatedControlID="UserName" Style="display: block; margin-bottom: 10px; font-size: 1em; color: #333333;"></asp:Label>
                <asp:TextBox ID="UserName" runat="server" Font-Size="1em" Height="34px" Placeholder="Enter your email" Style="padding: 10px; border-radius: 5px; border: 1px solid #cccccc; margin-bottom: 20px;" Width="100%"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorUserName" runat="server" ControlToValidate="UserName" ErrorMessage="Email is required." ForeColor="Red"></asp:RequiredFieldValidator>
                
                <div style="display: flex; align-items: center; margin-bottom: 10px;">
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="UserName" ErrorMessage="Enter a valid email format." SetFocusOnError="True" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ForeColor="Red"></asp:RegularExpressionValidator>
                </div>

                <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password" Style="display: block; margin-bottom: 10px; font-size: 1em; color: #333333;" Text="Password:"></asp:Label>
                <asp:TextBox ID="Password" runat="server" Font-Size="1em" Height="34px" Placeholder="Enter your password" Style="padding: 10px; border-radius: 5px; border: 1px solid #cccccc; margin-bottom: 20px;" TextMode="Password" Width="100%"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorPassword" runat="server" ControlToValidate="Password" ErrorMessage="Password is required." ForeColor="Red"></asp:RequiredFieldValidator>

                  <asp:Label ID="Label1" runat="server" ForeColor="Red" Style="display:none; text-align:center; margin-top: 10px;"></asp:Label>
        <asp:Label ID="IncorrectLoginLabel" runat="server" Style="display:none; text-align:center; margin-top: 10px;"></asp:Label>
   

                <br />
   

                <asp:Button ID="LoginButton" runat="server" BackColor="#007bff" BorderColor="#007bff" BorderStyle="Solid" BorderWidth="1px" CommandName="Login" Font-Names="Segoe UI" Font-Size="1em" ForeColor="#ffffff" Height="50px" Text="Log In" OnClick="LoginButton_Click" Style="width: 100%; border-radius: 5px; cursor: pointer; margin-bottom: 20px;" />
                
                <asp:Label ID="LoginErrorLabel" runat="server" ForeColor="Red" Style="display:none; text-align:center; margin-top: 10px;"></asp:Label>
            </asp:Panel>

            <p style="text-align: center; color: #666666;">
                <asp:Label ID="NoAccountLabel" runat="server" Style="margin-right: 10px;">Haven't signed up yet?</asp:Label>
                <asp:HyperLink ID="SignUpLink" runat="server" NavigateUrl="~/2signup.aspx" Style="color: #007bff; text-decoration: none;">Sign Up</asp:HyperLink>
            </p>
            <p style="text-align: center; color: #666666;">
                <asp:Label ID="Label4" runat="server" Text="Label" Visible="False"></asp:Label>
            </p>
        </section>
    </main>
</asp:Content>
