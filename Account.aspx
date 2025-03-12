<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Account.aspx.cs" Inherits="PersonalFinanceManagementSystem.Account" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Account</title>
    <style>
       body {
             font-family: Arial, sans-serif;
             margin: 0;
             padding: 0;
             background-color: #f9f9f9;
        }

        header {
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
            height: 75px;
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

        nav {
            background: #333;
            padding: 10px;
            text-align: center;
        }

        nav a {
             color: white;
             margin: 0 10px;
             text-decoration: none;
             padding: 8px 15px;
        }

        nav a:hover {
            background-color: #4CAF50;
            border-radius: 5px;
        }

        .container {
            max-width: 600px;
            margin: 20px auto;
            background: white;
            padding: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            color: #4CAF50;
        }

        label {
            font-weight: bold;
        }

        input[type="text"], input[type="email"], input[type="password"], input[type="txtNumber"], button {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ddd;
            border-radius: 5px;
        }

        button {
            background-color: #4CAF50;
            color: white;
            cursor: pointer;
        }

        button:hover {
            background-color: #45a049;
        }

        .delete-btn {
            background-color: #f44336;
        }

        .delete-btn:hover {
            background-color: #d32f2f;
        }
    </style>
</head>
<body>
    <header>
    <div class="header-container">
            <a href="Dashboard.aspx" class="logo" ><img src="Logo\Logo.png" alt="Logo" class="logo" /></a>
            <h1>Personal Finance Management System</h1>
            <a href="LoginPage.aspx" class="logout-btn">Logout</a>
        </div>
    </header>
    <nav>
        <a href="Dashboard.aspx">Dashboard</a>
        <a href="Transaction.aspx">Transaction</a>
        <%--<a href="Notification.aspx">Set Notification</a>--%>
        <a href="Report.aspx">Report</a>
        <a href="Budget.aspx">Budget</a>
        <a href="Account.aspx">Account</a>
    </nav>
    <form id="formAccount" runat="server">
        <div class="container">
            <h2>Account Details</h2>
            
            <label for="txtUsername">Username:</label>
            <asp:TextBox ID="txtUsername" runat="server" Enabled="false" />

            <label for="txtEmail">Email:</label>
            <asp:RequiredFieldValidator ID="rfvUserName" runat="server" ControlToValidate="txtEmail" ErrorMessage="Enter Email" ForeColor="Red"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="Enter Correct Email" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            <asp:TextBox ID="txtEmail" runat="server" />

            <label for="txtPassword">Password:</label>
            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" />

            <label for="txtNumber">Phone number:</label>
            <asp:RequiredFieldValidator ID="rfvNumber" runat="server" ControlToValidate="txtNumber" ErrorMessage="Enter Number" ForeColor="Red"></asp:RequiredFieldValidator>
            <br />
            <asp:TextBox ID="txtNumber" runat="server" TextMode="Number" />

            <button type="button" runat="server" onserverclick="UpdateAccount_Click">Update Account</button>
            <button type="button" class="delete-btn" runat="server" onserverclick="DeleteAccount_Click">Delete Account</button>
        </div>
    </form>
</body>
</html>
