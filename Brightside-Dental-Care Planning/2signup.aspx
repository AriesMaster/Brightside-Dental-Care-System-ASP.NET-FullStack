<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="2signup.aspx.cs" Inherits="Brightside_Dental_Care_Planning.WebForm3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <table style="width: 100%; height: 539px;">
    <tr>
        <td>&nbsp;</td>
        <td colspan="8">&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td class="text-center">&nbsp;</td>
        <td class="text-center">&nbsp;</td>
        <td class="text-center">&nbsp;</td>
        <td style="width: 657px" class="text-center">&nbsp;</td>
        <td class="text-center">
            <asp:Login ID="Login1" runat="server" Height="241px" Width="490px" BackColor="#F7F6F3" BorderColor="#E6E2D8" BorderPadding="4" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#333333">
                <InstructionTextStyle Font-Italic="True" ForeColor="Black" />
                <LayoutTemplate>
                    <table cellpadding="4" cellspacing="0" style="border-collapse:collapse;">
                        <tr>
                            <td>
                                <table cellpadding="0" style="height:241px;width:490px;">
                                    <tr>
                                        <td align="center" colspan="2" style="color:White;background-color:#000000; font-size:large; font-weight:bold; height: 62px;">Sign Up</td>
                                    </tr>
                                    <tr>
                                        <td align="right" style="height: 62px">
                                            <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">Enter your email :</asp:Label>
                                        </td>
                                        <td style="height: 62px">
                                            <asp:TextBox ID="UserName" runat="server" Font-Size="0.8em" Height="27px" Width="261px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" style="height: 68px">
                                            <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Enter your password  :</asp:Label>
                                        </td>
                                        <td style="height: 68px">
                                            <asp:TextBox ID="Password" runat="server" Font-Size="0.8em" TextMode="Password" Height="25px" Width="268px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="text-end" style="height: 59px">
                                            <asp:Label ID="PasswordLabel0" runat="server" AssociatedControlID="Password">Confirm  your password  :</asp:Label>
                                        </td>
                                        <td style="height: 59px">
                                            <asp:TextBox ID="Password0" runat="server" Font-Size="0.8em" TextMode="Password" Height="29px" Width="273px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td align="center" colspan="2" style="color:Red;">
                                            <asp:Label ID="PasswordLabel1" runat="server" AssociatedControlID="Password">Aready Signed Up ?   </asp:Label>
                                            &nbsp;&nbsp;
                                            <asp:DynamicHyperLink ID="DynamicHyperLink1" runat="server" NavigateUrl="~/1login.aspx">Login</asp:DynamicHyperLink>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center" colspan="2" style="color:Red; height: 51px;"></td>
                                    </tr>
                                    <tr>
                                        <td class="text-center" colspan="2">
                                            <asp:Button ID="SignUpBTN" runat="server" BackColor="#FFFBFF" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" CommandName="Login" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#284775" Height="70px" OnClick="SignUpBTN_Click" Text="Sign Up" ValidationGroup="Login1" Width="132px" />
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
        <td class="text-center">&nbsp;</td>
        <td class="text-center">&nbsp;</td>
        <td class="text-center">&nbsp;</td>
        <td class="text-center">&nbsp;</td>
        <td class="text-center">&nbsp;</td>
    </tr>
    <tr>
        <td>&nbsp;</td>
        <td colspan="8">&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
</table>
</asp:Content>
