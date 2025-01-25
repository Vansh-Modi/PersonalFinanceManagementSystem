<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="PersonalFinanceManagementSystem.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f9;
        }

        h2{
            text-align: center;
            color: #4CAF50;
        }
        .auto-style1 {
            margin:auto;
            width:300px;
          
        }
       
        .auto-style3 {
            width: 604px;
            text-align: center;
        }
        .auto-style4 {
            text-align: center;
            height: 33px;
        }
        .auto-style6 {
            text-align: center;
        }
        header {
            background-color: #4CAF50;
            color: white;
            text-align: center;
            padding: 10px;
        }
        footer{
            background: #333;
            color: white;
            text-align: center;
            margin-top : 320px;
        }
    </style>
</head>
<body class="">
            <header><h1>Personal Finance Management System</h1></header>

    <h2 class="auto-style6">&nbsp;</h2>
            <h2 class="auto-style6">&nbsp;</h2>
            <h2 class="auto-style6">&nbsp;&nbsp;Login</h2>
    <form id="form1" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style3"><strong>Username :</strong></td>
                    <td>
                        <asp:TextBox ID="txtusername" runat="server"></asp:TextBox>
                        <br />
                        <br />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3"><strong>Password :</strong></td>
                    <td>
                        <asp:TextBox ID="txtpass" runat="server" TextMode="Password"></asp:TextBox>
                        <br />
                        <br />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4" colspan="2">
                        <asp:Button ID="btnlogin" runat="server" OnClick="btnlogin_Click" Text="Login" />
                    </td>
                </tr>
            </table>
        </div>
    </form>
    <footer>
          &copy; 2025 Personal Finance Management System
    </footer>
</body>
</html>
