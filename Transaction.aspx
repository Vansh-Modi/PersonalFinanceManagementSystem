<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Transaction.aspx.cs" Inherits="PersonalFinanceManagementSystem.Transaction" %>




<!DOCTYPE html>
<html lang="en">
<head>
    <title>Transaction - Finance Management</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f9;
        }

        header {
            background-color: #4CAF50;
            color: white;
            text-align: center;
            padding: 10px;
        }

        nav {
            background: #333;
            padding: 10px;
            text-align: center;
        }

        nav a {
            color: white;
            text-decoration: none;
            margin: 5px;
            padding: 8px 15px;
        }

        nav a:hover {
            background-color: #4CAF50;
            border-radius: 5px;
        }

        .container {
            max-width: 700px;
            margin: 20px auto;
            background: white;
            padding: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .tabs {
            display: flex;
            justify-content: space-around;
            background: #ddd;
            padding: 10px 0;
            border-radius: 5px;
            margin-bottom: 20px;
        }

        .tabs button {
            background: none;
            border: none;
            padding: 10px 20px;
            cursor: pointer;
            font-size: 1rem;
            color: #333;
        }

        .tabs button.active {
            background-color: #4CAF50;
            color: white;
            border-radius: 5px;
        }

        .form-container {
            display: none;
        }

        .form-container.active {
            display: block;
        }

        form {
            display: flex;
            flex-direction: column;
        }

        label, .textbox, button, select {
            margin: 10px 0;
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
    </style>
    <script>
        function showForm(formId) {
            const forms = document.querySelectorAll('.form-container');
            const tabs = document.querySelectorAll('.tabs button');
            forms.forEach(form => form.classList.remove('active'));
            tabs.forEach(tab => tab.classList.remove('active'));
            document.getElementById(formId).classList.add('active');
            document.querySelector(`[data-form="${formId}"]`).classList.add('active');
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <header>
        <h1>Finance Management System</h1>
    </header>
    <nav>
       <a href="Dashboard.aspx">Dashboard</a>
       <a href="Transaction.aspx">Transaction</a>
       <a href="Notification.aspx">Set Notification</a>
       <a href="Report.aspx">Report</a>
       <a href="Account.aspx">Account</a>
    </nav>
    <div class="container">
        <h2>Transaction</h2>
        <div class="tabs">
            <asp:DropDownList ID="ddltype" runat="server" AutoPostBack="True">
            </asp:DropDownList>
            <asp:DropDownList ID="ddlcatagory" runat="server">
            </asp:DropDownList>
        </div>
        <div id="incomeForm" class="form-container active">
                <label for="incomeSource">Income Source</label>
                <input class="textbox" type="text" id="incomeSource" name="incomeSource" placeholder="e.g., Salary, Business" required>
                <label for="incomeAmount">Amount</label>
                <input class="textbox" type="number" id="incomeAmount" name="incomeAmount" placeholder="Enter amount" required>
                <label for="incomeDate">Date</label>
                <input class="textbox" type="date" id="incomeDate" name="incomeDate" required>
                <button type="submit">Add Income</button>
        </div>
        <div id="expensesForm" class="form-container">
               <label for="expenseCategory">Expense Category</label>
                <input class="textbox" type="text" id="expenseCategory" name="expenseCategory" placeholder="e.g., Groceries, Rent, Utilities, Entertainment" required>

                <label for="expenseAmount">Amount</label>
                <input class="textbox" type="number" id="expenseAmount" name="expenseAmount" placeholder="Enter amount" required>
                    <label for="expenseDate">Date</label>
                <input class="textbox" type="date" id="expenseDate" name="expenseDate" required>
                <button type="submit">Add Expense</button>
        </div>
    </div>
    <footer>
        &copy; 2025 Finance Management System
    </footer>
    </form>
</body>
</html>

