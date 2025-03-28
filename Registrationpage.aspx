﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegistrationPage.aspx.cs" Inherits="PersonalFinanceManagementSystem.Registrationpage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Registration Page</title>
    <style>
        body{
             font-family: Arial, sans-serif;
             margin: 0;
             padding: 0;
             background-color: #f9f9f9;
        }

        header{
            background-color: #4CAF50;
            color: white;
            text-align: center;
            padding: 10px;
        }

        .header-container {
            display: flex;
            align-items: center;
            justify-content: center;
            position: relative;
        }

        .logo {
            position: absolute;
            left: 20px;
            height : 75px
        }

        .logout-btn {
            position: absolute;
            right: 20px;
            background-color: #4CAF50;
            color: white;
            text-decoration: none;
            padding: 8px 15px;
            border-radius: 5px;
            font-size: 14px;
            transition: background-color 0.3s, color 0.3s;
        }

        .logout-btn:hover {
            background-color: white;
            color: #333;
        }


        nav{
            background: #333;
            padding: 10px;
            text-align: center;

        }

        nav h2{
             color: white;
             margin: 0 10px;
             text-decoration: none;
             padding: 8px 15px;
        }

        table {
            margin: 0 auto;
            border-spacing: 10px;
            margin-top: 30px;
            margin-left:10px;
        }

        td {
            text-align: center;
            padding: 5px;
        }

        footer {
            background: #333;
            color: white;
            text-align: center;
            padding: 10px;
            margin-top: 20px;
            position: fixed;
            width: 100%;
            bottom: 0;
        }

        .auto-style2 {
            width: 473px;
        }

        .auto-style5 {
            height: 29px;
        }

        .auto-style6 {
            height: 201px;
            margin-left: 130px;
        }
 </style>
</head>
<body>
    <form id="form1" runat="server">
        <header>
            <div class="header-container">
                <a href="Dashboard.aspx" class="logo" ><img src="Logo\Logo.png" alt="Logo" class="logo" /></a>
                <h1>Personal Finance Management System</h1>
            </div>
        </header>

        <nav>
            <h2>Registration Page</h2>
        </nav>

            <table class="auto-style6">
                <tr>
                    <td class="auto-style4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Username&nbsp; :</td>
                    <td class="auto-style5">
                        <asp:TextBox ID="txtusern" runat="server"></asp:TextBox>
                    </td><td>
                        <asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="txtusern" ErrorMessage="Enter UserName" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; E-mail :</td>
                    <td>
                        <asp:TextBox ID="txtEmail" runat="server" TextMode="Email"></asp:TextBox>
                    </td><td>
                        <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="Enter Valid Email" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ForeColor="Red"></asp:RegularExpressionValidator>
                        <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Password :</td>
                    <td>
                        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
                    </td><td>
                        <asp:RequiredFieldValidator ID="rfvPass" runat="server" ControlToValidate="txtPassword" ErrorMessage="Enter Password" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Confirm Password :</td>
                    <td>
                        <asp:TextBox ID="txtConfirmPass" runat="server" TextMode="Password"></asp:TextBox>
                    </td>
                    <td>
                        <asp:CompareValidator ID="cvPass" runat="server" ControlToCompare="txtConfirmPass" ControlToValidate="txtPassword" ErrorMessage="Password Missmatch" ForeColor="Red"></asp:CompareValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Phone No. :</td>
                    <td>
                        <asp:TextBox ID="txtphone" runat="server" TextMode="Phone"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="rfvPhone" runat="server" ControlToValidate="txtphone" ErrorMessage="Enter Number" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3" colspan="2">
                        <br />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="btnRegister" runat="server" Text="Register" OnClick="btnRegister_Click" />
                    </td><td></td>
                </tr>
                </table>       
    </form>
    <footer>
            &copy; 2025 Personal Finance Management System
    </footer>
</body>
</html>
