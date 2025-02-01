<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Report.aspx.cs" Inherits="PersonalFinanceManagementSystem.Report" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <title>Reports - Finance Management</title>
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
            max-width: 900px;
            margin: 20px auto;
            background: white;
            padding: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        h2 {
            text-align: center;
            color: #4CAF50;
            margin-bottom: 20px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        table, th, td {
            border: 1px solid #ddd;
        }
        th, td {
            padding: 10px;
            text-align: center;
        }
        th {
            background-color: #4CAF50;
            color: white;
        }
        footer {
            background: #333;
            color: white;
            text-align: center;
            padding: 10px;
            margin-top: 310px;
        }
    </style>
</head>
<body>
    <header><h1>Personal Finance Management System</h1></header>
    <nav>
        <a href="Dashboard.aspx">Dashboard</a>
        <a href="Transaction.aspx">Transaction</a>
        <a href="Notification.aspx">Set Notification</a>
        <a href="Report.aspx">Report</a>
        <a href="Account.aspx">Account</a>
    </nav>
    <div class="container">
        <h2>Financial Reports</h2>
        <table>
            <thead>
                <tr>
                    <th>Date</th>
                    <th>Source/Category</th>
                    <th>Type</th>
                    <th>Amount</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>2025-01-01</td>
                    <td>Salary</td>
                    <td>Income</td>
                    <td>$5,000</td>
                </tr>
                <tr>
                    <td>2025-01-05</td>
                    <td>Groceries</td>
                    <td>Expense</td>
                    <td>$200</td>
                </tr>
            </tbody>
        </table>
    </div>
    <footer>
        &copy; 2025 Personal Finance Management System
    </footer>
</body>
</html>
