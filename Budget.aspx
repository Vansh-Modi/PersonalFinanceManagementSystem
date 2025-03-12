<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Budget.aspx.cs" Inherits="PersonalFinanceManagementSystem.Budget" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Budget</title>
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
                max-width: 600px; 
                margin: auto; 
                background: white; 
                padding: 20px; 
                border-radius: 10px; 
                box-shadow: 0px 0px 10px 0px #aaa; 

            }

            h2 {
                text-align: center; 

            }

            input, select, button { 
                width: 100%; 
                margin: 10px 0; 
                padding: 10px; 

            }
            table {
                width: 100%; 
                border-collapse: collapse; 
                margin-top: 20px; 

            }

            th, td { 
                border: 1px solid #ddd; 
                padding: 8px; 
                text-align: left; 

            }

            th { 
                background-color: #4CAF50; 
                color: white; 

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
        <h2>Budget Management</h2>
        <form id="budgetForm" runat="server">
            <label for="txtCategory">Category:</label>
            <asp:TextBox ID="txtCategory" runat="server" required="true" CssClass="form-control"></asp:TextBox>
    
            <label for="txtAmount">Amount:</label>
            <asp:TextBox ID="txtAmount" runat="server" required="true" CssClass="form-control" TextMode="Number"></asp:TextBox>
    
            <label for="txtStartDate">Start Date:</label>
            <asp:TextBox ID="txtStartDate" runat="server" required="true" CssClass="form-control" TextMode="Date"></asp:TextBox>
    
            <label for="txtEndDate">End Date:</label>
            <asp:TextBox ID="txtEndDate" runat="server" required="true" CssClass="form-control" TextMode="Date"></asp:TextBox>
    
            <asp:Button ID="btnSubmit" runat="server" Text="Add Budget" OnClick="btnSubmit_Click" CssClass="btn btn-primary" />

            <asp:GridView ID="GridViewBudget" runat="server" AutoGenerateColumns="true" CssClass="table table-striped" />
        </form>
    </div>
</body>
</html>