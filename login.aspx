<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="PersonalFinanceManagementSystem.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            margin:auto;
            width:300px;
            border: 3px solid #000000;
            background-color: #c8f3ec;
        }
        .auto-style2 {
            font-size: large;
            text-align: center;
        }
        .auto-style3 {
            width: 604px;
            text-align: center;
        }
        .auto-style4 {
            width: 604px;
            text-align: center;
            height: 33px;
        }
        .auto-style5 {
            height: 33px;
        }
        .auto-style6 {
            text-align: center;
        }
    </style>
</head>
<body class="">
    <h2 class="auto-style6">Log in Here</h2>
    <form id="form1" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style2" colspan="2"><strong>Login Page</strong></td>
                </tr>
                <tr>
                    <td class="auto-style3"><strong>Username :</strong></td>
                    <td>
                        <asp:TextBox ID="txtusername" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3"><strong>Password :</strong></td>
                    <td>
                        <asp:TextBox ID="txtpass" runat="server" TextMode="Password"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4">
                        <asp:Button ID="btnlogin" runat="server" OnClick="btnlogin_Click" Text="Login" />
                    </td>
                    <td class="auto-style5">
                        </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
