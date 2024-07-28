<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="1login.aspx.cs" Inherits="Brightside_Dental_Care_Planning.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <table style="width: 100%; height: 477px;">
    <tr>
        <td class="text-center">&nbsp;</td>
        <td class="text-center">&nbsp;</td>
        <td class="text-center">&nbsp;</td>
    </tr>
    <tr>
        <td class="text-center">&nbsp;</td>
        <td class="text-center" colspan="2">
            <asp:Login ID="Login1" runat="server" BackColor="#F7F6F3" BorderColor="#E6E2D8" BorderPadding="4" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#333333" Height="282px" OnAuthenticate="Login1_Authenticate" style="margin-left: 635px" Width="504px">
                <InstructionTextStyle Font-Italic="True" ForeColor="Black" />
                <LayoutTemplate>
                    <table cellpadding="4" cellspacing="0" style="border-collapse:collapse;">
                        <tr>
                            <td>
                                <table cellpadding="0" style="height:262px;width:493px;">
                                    <tr>
                                        <td align="center" colspan="2" style="color:White;background-color:#000000; font-size:large; font-weight:bold; height: 62px;">Log In</td>
                                    </tr>
                                    <tr>
                                        <td align="right" style="height: 75px">
                                            <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">Enter your email :</asp:Label>
                                        </td>
                                        <td style="height: 75px">
                                            <asp:TextBox ID="UserName" runat="server" Font-Size="0.8em" Height="29px" Width="166px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" style="height: 77px">
                                            <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Enter your password  :</asp:Label>
                                        </td>
                                        <td style="height: 77px">
                                            <asp:TextBox ID="Password" runat="server" Font-Size="0.8em" TextMode="Password" Height="34px" Width="169px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td align="center" colspan="2" style="color:Red; height: 56px;">
                                            <asp:Label ID="PasswordLabel0" runat="server" AssociatedControlID="Password">Haven&#39;t signed up yet ?    </asp:Label>
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            <asp:DynamicHyperLink ID="DynamicHyperLink1" runat="server" NavigateUrl="~/2signup.aspx">Sign Up</asp:DynamicHyperLink>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            <asp:Button ID="LoginButton" runat="server" BackColor="#FFFBFF" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" CommandName="Login" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#284775" Height="57px" OnClick="LoginButton_Click" Text="Log In" ValidationGroup="Login1" Width="118px" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </LayoutTemplate>
                <LoginButtonStyle BackColor="#FFFBFF" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#284775" />
                <TextBoxStyle Font-Size="0.8em" />
                <TitleTextStyle BackColor="#5D7B9D" Font-Bold="True" Font-Size="0.9em" ForeColor="White" />
            </asp:Login>
        </td>
    </tr>
    <tr>
        <td class="text-center">&nbsp;</td>
        <td class="text-center">&nbsp;</td>
        <td class="text-center">&nbsp;</td>
    </tr>
</table>
</asp:Content>
