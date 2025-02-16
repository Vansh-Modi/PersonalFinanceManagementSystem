<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Transaction1.aspx.cs" Inherits="PersonalFinanceManagementSystem.transaction1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            padding: 20px;
            background-color: #f4f4f4;
        }
        .container {
            background: white;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0px 0px 10px 0px #ccc;
            width: 300px;
            margin: auto;
        }
        label, input, select, textarea {
            display: block;
            width: 100%;
            margin-bottom: 10px;
        }
        input, select, textarea {
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 5px;
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
        <div class="container">
            <h2>Transaction Entry</h2>
            &nbsp;<label for="ddlType">Type:</label>
            <asp:DropDownList ID="ddlType" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlType_SelectedIndexChanged">
                <asp:ListItem Text="Income" Value="Income" />
                <asp:ListItem Text="Expense" Value="Expense" />
            </asp:DropDownList>
            
            <label for="txtCategory">Category:</label>
            <asp:DropDownList ID="ddlcate" runat="server">
            </asp:DropDownList>
            
            <label for="txtAmount">Amount:</label>
            <asp:TextBox ID="txtAmount" runat="server"></asp:TextBox>
            
            <label for="txtDate">Date:</label>
            <asp:TextBox ID="txtDate" runat="server" TextMode="Date"></asp:TextBox>
            
            <label for="txtDescription">Description:</label>
            <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" Height="44px"></asp:TextBox>
            
            <asp:Button ID="btnSubmit" runat="server" Text="ADD" CssClass="btn" OnClick="btnSubmit_Click" />
            <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
        </div>
    </form>
</body>
</html>
