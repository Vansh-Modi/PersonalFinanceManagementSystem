<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="PersonalFinanceManagementSystem.Admin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
          body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
    background-color: #f9f9f9;
}

header {
    background-color: #4CAF50;
    color: white;
    text-align: center;
    padding: 15px;
    font-size: 24px;
    font-weight: bold;
}

nav {
    background: #333;
    padding: 10px;
    text-align: center;
}

nav a {
    color: white;
    margin: 0 10px;
    text-decoration: none;
    padding: 10px 15px;
    font-size: 18px;
    transition: 0.3s ease-in-out;
}

nav a:hover {
    background-color: #4CAF50;
    border-radius: 5px;
}

.container {
    max-width: 800px;
    margin: 20px auto;
    background: white;
    padding: 20px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    border-radius: 8px;
}

.card {
    padding: 20px;
    background: #f4f4f4;
    margin: 10px;
    border: 1px solid #ddd;
    text-align: center;
    border-radius: 5px;
}

.card h3 {
    color: #4CAF50;
}

/* Table Styling */
table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 20px;
}

table, th, td {
    border: 1px solid #ddd;
}

th, td {
    padding: 12px;
    text-align: left;
    font-size: 16px;
}

th {
    background-color: #4CAF50;
    color: white;
}

tr:nth-child(even) {
    background-color: #f2f2f2;
}

tr:hover {
    background-color: #ddd;
}

/* GridView Buttons */
.GridView a, .btn {
    text-decoration: none;
    padding: 8px 12px;
    background-color: #4CAF50;
    color: white;
    border-radius: 5px;
    font-size: 16px;
    border: none;
    cursor: pointer;
    transition: 0.3s ease-in-out;
}

.GridView a:hover, .btn:hover {
    background-color: #45a049;
}

/* Form Styling */
form {
    text-align: center;
}

form h2 {
    margin-bottom: 20px;
}

input[type="text"] {
            width: 95%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

button, .auto-style1 input {
    background-color: #4CAF50;
    color: white;
    padding: 10px 15px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-size: 16px;
}

button:hover, .auto-style1 input:hover {
    background-color: #45a049;
}

/* Footer */
footer {
    background: #333;
    color: white;
    text-align: center;
    padding: 10px;
    margin-top: 20px;
    font-size: 16px;
}



    </style>
</head>
<body>
            <header><h1>Admin</h1></header>

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
    </form>
            <p>
&nbsp;</p>

</body>
</html>