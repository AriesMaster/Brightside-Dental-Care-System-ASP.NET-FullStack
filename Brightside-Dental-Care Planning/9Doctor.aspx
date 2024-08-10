<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="9Doctor.aspx.cs" Inherits="Brightside_Dental_Care_Planning.Doctor" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
            height: 780px;
        }
        .auto-style2 {
            width: 867px;
        }
        .auto-style3 {
            height: 197px;
        }
        .auto-style4 {
            height: 60px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td>&nbsp;</td>
                    <td colspan="2">&nbsp;</td>
                    <td colspan="2">
                        <asp:Label ID="Label1" runat="server" ForeColor="#FF0066" Text="list of appointments"></asp:Label>
                    </td>
                    <td colspan="2">&nbsp;</td>
                    <td colspan="2">&nbsp;</td>
                    <td colspan="2">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td rowspan="5">&nbsp;</td>
                    <td class="auto-style2" rowspan="5">&nbsp;</td>
                    <td class="auto-style3" colspan="2">
                        <asp:ListBox ID="ListBox1" runat="server" Height="240px" Width="555px">
                            <asp:ListItem>thabo  unconfirmed</asp:ListItem>
                        </asp:ListBox>
                    </td>
                    <td colspan="2" rowspan="5">&nbsp;</td>
                    <td colspan="2" rowspan="5">&nbsp;</td>
                    <td colspan="2" rowspan="5">&nbsp;</td>
                    <td rowspan="5">&nbsp;</td>
                    <td rowspan="5">&nbsp;</td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:TextBox ID="TextBox1" runat="server" Height="65px" Width="328px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4" colspan="2">
                        <asp:Button ID="appListBtn" runat="server" Height="87px" OnClick="appListBtn_Click" Text="Button" Width="307px" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">&nbsp;</td>
                </tr>
                <tr>
                    <td colspan="2">&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td colspan="10">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
