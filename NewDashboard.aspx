<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NewDashboard.aspx.cs" Inherits="PersonalFinanceManagementSystem.Account" %>

<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Personal Finance Dashboard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            color: #333;
            margin: 0;
            padding: 0;
        }
        
        /* Navigation Bar */
        .navbar {
            background-color: #2C2F38;
            padding: 10px 20px;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }
        .nav-links {
            display: flex;
            gap: 20px;
        }
        .nav-item {
            color: #bbb;
            text-decoration: none;
            font-size: 16px;
            display: flex;
            align-items: center;
            gap: 5px;
            padding: 8px 12px;
            border-radius: 5px;
        }
        .nav-item:hover, .nav-item.active {
            color: white;
            background-color: #444;
        }
        .nav-item i {
            font-size: 18px;
        }
        
        /* Profile */
        .profile {
            display: flex;
            align-items: center;
            gap: 10px;
            color: white;
        }
        .profile img {
            width: 35px;
            height: 35px;
            border-radius: 50%;
        }

        /* Main Container */
        .container {
            max-width: 1200px;
            margin: auto;
            padding: 20px;
            text-align: center;
        }
        
        /* Dashboard Cards */
        .card {
            background-color: white;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0px 0px 10px 0px #ccc;
            margin: 10px;
            text-align: center;
            display: inline-block;
            width: 250px;
        }
        
        .green { color: green; font-size: 24px; font-weight: bold; }
        .red { color: red; font-size: 24px; font-weight: bold; }
        .blue { color: blue; font-size: 24px; font-weight: bold; }
        .orange { color: orange; font-size: 24px; font-weight: bold; }
        .black { color: black; font-size: 24px; font-weight: bold; }
        
        /* Chart */
        .chart-container {
            background: white;
            padding: 20px;
            margin-top: 20px;
            border-radius: 5px;
        }
        
        /* Button */
        .pdf-button {
            background-color: #3b5998;
            color: white;
            padding: 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 14px;
        }
    </style>

    <!-- Icons (FontAwesome) -->
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
</head>
<body>
    <form id="form1" runat="server">
    
        <!-- Navigation Bar -->
        <div class="navbar">
            <div class="nav-links">
                <a href="#" class="nav-item active"><i class="fas fa-list"></i> Transactions</a>
                <a href="#" class="nav-item"><i class="fas fa-calculator"></i> Accounts</a>
                <a href="#" class="nav-item"><i class="fas fa-tag"></i> Incomes</a>
                <a href="#" class="nav-item"><i class="fas fa-trash"></i> Expenses</a>
                <a href="#" class="nav-item"><i class="fas fa-balance-scale"></i> Amount Transfers</a>
                <a href="#" class="nav-item"><i class="fas fa-bell"></i> Reminders</a>
            </div>
            
            <div class="profile">
                <i class="fas fa-bell"></i>
                <span>Chris</span>
                <asp:Image ID="Image1" runat="server" />
&nbsp;</div>
        </div>

        <!-- Dashboard Content -->
        <div class="container">
            <h2>Personal Finance Dashboard</h2>

            <div class="card">
                <h3>Current Balance</h3>
                <span class="green">$<asp:Label ID="lblCurrentBalance" runat="server" Text="0.00"></asp:Label></span>
            </div>

            <div class="card">
                <h3>Liabilities</h3>
                <span class="red">$<asp:Label ID="lblLiabilities" runat="server" Text="0.00"></asp:Label></span>
            </div>

            <div class="card">
                <h3>This Month's Income</h3>
                <span class="blue">$<asp:Label ID="lblIncome" runat="server" Text="0.00"></asp:Label></span>
            </div>

            <div class="card">
                <h3>This Month's Expense</h3>
                <span class="orange">$<asp:Label ID="lblExpense" runat="server" Text="0.00"></asp:Label></span>
            </div>

            <div class="chart-container">
                <h3>Balance & Liabilities</h3>
                <asp:Chart ID="Chart1" runat="server" Height="126px" Width="438px">
                    <series>
                        <asp:Series Name="Series1" ChartArea="ChartArea1">
                        </asp:Series>
                    </series>
                    <chartareas>
                        <asp:ChartArea Name="ChartArea1">
                        </asp:ChartArea>
                    </chartareas>
                </asp:Chart>
                <asp:Chart ID="chartBalance" runat="server" Width="600px" Height="300px">
                </asp:Chart> 
            </div>

            <div class="card">
                <h3>Active Accounts</h3>
                <span class="black"><asp:Label ID="lblActiveAccounts" runat="server" Text="0"></asp:Label></span>
            </div>

            <div class="card">
                <h3>Archived Accounts</h3>
                <span class="black"><asp:Label ID="lblArchivedAccounts" runat="server" Text="0"></asp:Label></span>
            </div>

            <div>
                <asp:Button ID="btnDownloadPDF" runat="server" Text="Download PDF" CssClass="pdf-button"/>
            </div>
        </div>
    </form>

</body>
</html>
