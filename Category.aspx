<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Category.aspx.cs" Inherits="PersonalFinanceManagementSystem.Category" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Category - Finance Management</title>
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

        nav a{
             color: white;
             margin: 0 10px;
             text-decoration: none;
             padding: 8px 15px;
        }

        nav a:hover{
            background-color: #4CAF50;
            border-radius: 5px;
        }

        .container {
            max-width: 700px;
            margin: 20px auto;
            background: white;
            padding: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 5px;
        }

        label, .textbox, button, select {
            margin: 10px 0;
            display: block;
            width: 100%;
        }

        .textbox, select {
            padding: 10px;
            font-size: 1rem;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        button {
            background-color: #4CAF50;
            color: white;
            padding: 10px;
            border: none;
            cursor: pointer;
            border-radius: 5px;
            width: 100%;
        }

        button:hover {
            background-color: #45a049;
        }

        footer {
            background: #333;
            color: white;
            text-align: center;
            padding: 10px;
            margin-top: 20px;
        }

        .btn {
            background-color: #28a745;
            color: white;
            border: none;
            padding: 10px;
            border-radius: 5px;
            cursor: pointer;
        }

        .btn:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
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
        <div class="container">
            <h2>Add Category</h2>
            <label for="ddlType">Type:<asp:RequiredFieldValidator ID="rfvType" runat="server" ControlToValidate="ddlType" InitialValue="0" ErrorMessage="Select Type" ForeColor="Red"></asp:RequiredFieldValidator>

            </label>
            <asp:DropDownList ID="ddlType" runat="server" AutoPostBack="True">
                <asp:ListItem Text="Income" Value="Income" />
                <asp:ListItem Text="Expense" Value="Expense" />
            </asp:DropDownList>

            <label for="txtCategory">Category:<asp:RequiredFieldValidator ID="rfvCategory" runat="server" ControlToValidate="txtCategory" ErrorMessage="Select Category" ForeColor="Red"></asp:RequiredFieldValidator>
            </label>
            &nbsp;<asp:TextBox ID="txtCategory" runat="server" Width="95%" Height="31px"></asp:TextBox>

            <br />
            <br />

            <asp:Button ID="btnSubmit" runat="server" Text="Add" CssClass="btn" OnClick="btnSubmit_Click" Width="109px" />
            <br />
            <br />
            <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
        </div>
        <footer>
            &copy; 2025 Finance Management System
        </footer>
    </form>
</body>
</html>
