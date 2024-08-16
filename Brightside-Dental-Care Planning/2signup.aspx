<%@ Page Language="C#" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Sign Up</title>
    <style type="text/css">
        .text-center {
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <table style="width: 100%; height: 477px;">
            <tr>
                <td class="text-center">&nbsp;</td>
                <td class="text-center" colspan="2">
                    <asp:Panel ID="Panel1" runat="server" BackColor="#F7F6F3" BorderColor="#E6E2D8" BorderPadding="4" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#333333" Height="282px" Width="504px">
                        <table cellpadding="4" cellspacing="0" style="border-collapse:collapse;">
                            <tr>
                                <td align="center" colspan="2" style="color:White;background-color:#000000; font-size:large; font-weight:bold; height: 62px;">Sign Up</td>
                            </tr>
                            <tr>
                                <td align="right" style="height: 75px">
                                    <asp:Label ID="lblFirstName" runat="server" AssociatedControlID="txtFirstName">First Name:</asp:Label>
                                </td>
                                <td style="height: 75px">
                                    <asp:TextBox ID="txtFirstName" runat="server" Font-Size="0.8em" Height="29px" Width="166px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvFirstName" runat="server" ControlToValidate="txtFirstName" ErrorMessage="First name is required" ForeColor="Red">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" style="height: 77px">
                                    <asp:Label ID="lblLastName" runat="server" AssociatedControlID="txtLastName">Last Name:</asp:Label>
                                </td>
                                <td style="height: 77px">
                                    <asp:TextBox ID="txtLastName" runat="server" Font-Size="0.8em" Height="29px" Width="166px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvLastName" runat="server" ControlToValidate="txtLastName" ErrorMessage="Last name is required" ForeColor="Red">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" style="height: 77px">
                                    <asp:Label ID="lblEmail" runat="server" AssociatedControlID="txtEmail">Email:</asp:Label>
                                </td>
                                <td style="height: 77px">
                                    <asp:TextBox ID="txtEmail" runat="server" Font-Size="0.8em" Height="29px" Width="166px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="Email is required" ForeColor="Red">*</asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="Invalid email address" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" style="height: 77px">
                                    <asp:Label ID="lblPassword" runat="server" AssociatedControlID="txtPassword">Password:</asp:Label>
                                </td>
                                <td style="height: 77px">
                                    <asp:TextBox ID="txtPassword" runat="server" Font-Size="0.8em" Height="29px" Width="166px" TextMode="Password"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtPassword" ErrorMessage="Password is required" ForeColor="Red">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" style="height: 77px">