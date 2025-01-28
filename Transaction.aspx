<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Transaction.aspx.cs" Inherits="PersonalFinanceManagementSystem.Transaction" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        body{
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f9;
        }

        header{
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

/*        .form-container {
             display: none;
        }*/

        .form-container.active {
             display: block;
        }

        form {
             display: flex;
             flex-direction: column;
        }
    </style>
</head>
<body>
    
    <header>
        <h1>Personal Finance Management System</h1>
    </header>
    <nav>
        <a href="#">Dashboard</a>
        <a href="#">Transaction</a>
        <a href="#">Set Notification</a>
        <a href="#">Report</a>
        <a href="#">Account</a>
    </nav>

    <div class="container">
        <h2>Transaction </h2>
        <div class="tabs">

            <button class="active" id="btnAddin">Add Income</button>
            <button id="btnAddexp">Add Expenses</button>

        </div>
        <div class="form-container active">
            <form id="form1" runat="server">
                <label for="incomeSource">Income Source </label>
                <asp:TextBox ID="txtIncomeso" runat="server"></asp:TextBox>
&nbsp;
                <label for="Description">Description </label>
                <asp:TextBox ID="txtDescription" runat="server"></asp:TextBox>
&nbsp;
                <label for="incomeAmount">Income Amount</label>
                <asp:TextBox ID="txtIncomeamt" runat="server"></asp:TextBox>

                <label for="incomeDate">Income Date</label>
                <asp:TextBox ID="txtIndate" runat="server" TextMode="Date"></asp:TextBox>
                <br />
                <br />
                <asp:Button ID="btnSubmit" runat="server" Text="Add Income" />
            </form>
        </div>

    </div>
   
</body>
</html>
