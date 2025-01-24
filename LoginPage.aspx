<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginPage.aspx.cs" Inherits="PersonalFinanceManagementSystem.LoginPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        body{
             font-family: Arial, sans-serif;
             margin: 0;
             padding: 0;
             background-color: #f9f9f9;
        }
        .container {
            max-width: 800px;
            margin: 20px auto;
            background: white;
            padding: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);

        }
        .auto-style1 {
            max-width: 800px;
            margin: 20px auto;
            background: white;
            padding: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        header{
            background-color: #4CAF50;
            color: white;
            text-align: center;
            padding: 10px;
        }
    </style>
</head>
<body>
    <header>Personal Finance Management System</header>
    <form id="form1" runat="server">
        <div class="auto-style1">

            <strong>Login</strong><br />
            <br />
            <br />

            Username :
            <asp:TextBox ID="txtUname" runat="server"></asp:TextBox>
            <br />
            <br />
            Password :
            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>

            <br />
            <br />
            <asp:Button ID="btnSubmit" runat="server" Text="Submit" />
&nbsp;
            <asp:Button ID="btnReset" runat="server" Text="Reset" />

        </div>
    </form>
</body>
</html>
