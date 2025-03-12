<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Transaction.aspx.cs" Inherits="PersonalFinanceManagementSystem.Transaction" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Transaction - Finance Management</title>
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
        .auto-style1 {
            text-align: right;
        }

        .left-align {
            text-align: left;
        }

        .right-align {
            text-align: right;
        }

        .auto-style1 {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .auto-style2 {
            text-align: left;
        }
    </style>
    <script>
        function showForm(formId) {
            const forms = document.querySelectorAll('.form-container');
            const tabs = document.querySelectorAll('.tabs button');
            forms.forEach(form => form.classList.remove('active'));
            tabs.forEach(tab => tab.classList.remove('active'));
            document.getElementById(formId).classList.add('active');
            document.querySelector([data - form="${formId}"]).classList.add('active');
        }
    </script>
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
            <h2>Transaction Entry</h2>
            <label for="ddlType">Type:</label>
            <asp:DropDownList ID="ddlType" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlType_SelectedIndexChanged">
                <asp:ListItem Text="Income" Value="Income" />
                <asp:ListItem Text="Expense" Value="Expense" />
            </asp:DropDownList>

            <label for="ddlCategory">Category:</label>
            <asp:DropDownList ID="ddlCategory" runat="server">
            </asp:DropDownList>

            <div class="auto-style1">
    <div class="auto-style2">
        <asp:RequiredFieldValidator ID="rfvCategory" runat="server" ControlToValidate="ddlCategory" ErrorMessage="Select Category" ForeColor="Red" InitialValue="0"></asp:RequiredFieldValidator>
        <asp:RequiredFieldValidator ID="rfvType" runat="server" ControlToValidate="ddlType" ErrorMessage="Select Type" ForeColor="Red" InitialValue="0"></asp:RequiredFieldValidator>
    </div>
    <div class="right-align">
        Didn't find category?<asp:HyperLink ID="hlCategory" runat="server" NavigateUrl="~/Category.aspx">Add Category</asp:HyperLink>
&nbsp;</div>
</div>
            
            <label for="txtAmount">Amount:</label>
            <asp:TextBox ID="txtAmount" runat="server"></asp:TextBox>

            <asp:RequiredFieldValidator ID="rfvAmt" runat="server" ControlToValidate="txtAmount" ErrorMessage="Enter Amount" ForeColor="Red"></asp:RequiredFieldValidator>

            <label for="txtDate">Date:</label>
            <asp:TextBox ID="txtDate" runat="server" TextMode="Date"></asp:TextBox>

            <asp:RequiredFieldValidator ID="rfvDate" runat="server" ControlToValidate="txtDate" ErrorMessage="Enter Date" ForeColor="Red"></asp:RequiredFieldValidator>

            <label for="txtDescription">Description:</label>
            <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" Height="44px"></asp:TextBox>

            <br />
            <br />

            <asp:Button ID="btnSubmit" runat="server" Text="Add" CssClass="btn" OnClick="btnSubmit_Click" Width="130px" />
            
            <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
        </div>
        <footer>
            &copy; 2025 Finance Management System
        </footer>
    </form>
</body>
</html>