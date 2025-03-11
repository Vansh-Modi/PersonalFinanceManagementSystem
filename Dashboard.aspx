<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="PersonalFinanceManagementSystem.Dashboard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Dashboard</title>
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
            max-width: 800px;
            margin: 20px auto;
            background: white;
            padding: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);

        }
 
        .card {
            padding: 20px;
            background: #f4f4f4;
            margin: 10px;
            border: 1px solid #ddd;
            text-align: center;

        }
 
        .card h3 {
            color: #4CAF50; 

        }

        footer{
            background: #333;
            color: white;
            text-align: center;
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
    <div class="container">
        <h2>Dashboard</h2>
        <div class="card">
           <h3>Total Income</h3>
           <p id="paraDisplayIncome" runat="server"></p>
        </div>
        <div class="card">
           <h3>Total Expenses</h3>
           <p id="paraDisplayExpense" runat="server"></p>
        </div>
        <div class="card">
           <h3>Remaining Budget</h3>
           <p id="paraDisplayBudget" runat="server"></p>
        </div> 
    </div>
    <footer>
           &copy; 2025 Personal Finance Management System
    </footer>
</body>
</html>