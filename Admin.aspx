<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="PersonalFinanceManagementSystem.Admin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>

   

    </style>
</head>
<body>
            <header><h1>Personal Finance Management System</h1></header>

    <form id="form1" runat="server">
    <h2 class="auto-style1"> User managment<br />
        <table class="auto-style2">
            <tr>
                <td class="auto-style3">Name </td>
                <td>
                    <asp:TextBox ID="txtname" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">Email</td>
                <td>
                    <asp:TextBox ID="txtemail" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">Password</td>
                <td>
                    <asp:TextBox ID="txtpass" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">Phone no.</td>
                <td>
                    <asp:TextBox ID="txtphone" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style1" colspan="2">
                    <asp:Button ID="btnup" runat="server" Text="Update" OnClick="btnup_Click" />
                </td>
                <td class="auto-style1" colspan="2">
    <asp:Button ID="btndele" runat="server" Text="Delete" OnClick="btndele_Click" />
</td>
            </tr>
        </table>
        </h2>
        <asp:GridView ID="grvshow" runat="server" AutoGenerateSelectButton="True" CssClass="GridView" OnSelectedIndexChanging="grvshow_SelectedIndexChanging">
</asp:GridView>
        <div>

        </div>
    </form>
            <p>
&nbsp;</p>
</body>
</html>
