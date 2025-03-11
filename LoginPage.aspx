<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginPage.aspx.cs" Inherits="PersonalFinanceManagementSystem.LoginPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login Page</title>
 <style type="text/css">
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

    nav{
        background: #333;
        padding: 10px;
        text-align: center;

    }

    nav h2{
         color: white;
         margin: 0 10px;
         text-decoration: none;
         padding: 8px 15px;
    }

     .auto-style1 {
         margin:auto;
         width:300px;
       
     }
    
     .auto-style3 {
         width: 604px;
         text-align: center;
     }
     .auto-style4 {
         text-align: center;
         height: 33px;
     }
     .auto-style6 {
         text-align: center;
     }
     header {
         background-color: #4CAF50;
         color: white;
         text-align: center;
         padding: 10px;
     }
     footer{
         background: #333;
         color: white;
         text-align: center;
         margin-top : 320px;
     }
     </style>
</head>
<body>
      <header>
    <div class="header-container">
        <a href="Dashboard.aspx" class="logo" ><img src="Logo\Logo.png" alt="Logo" class="logo" /></a>
        <h1>Personal Finance Management System</h1>
    </div>
</header>

<nav>
    <h2>Login Page</h2>
</nav>

<h2 class="auto-style6">&nbsp;</h2>
    <form id="form1" runat="server">
        <div><table class="auto-style1">
    <tr>
        <td class="auto-style3"><strong>Username:</strong></td>
        <td>
            <asp:TextBox ID="txtusername" runat="server"></asp:TextBox>
            <br />
        </td>
        <td class="auto-style4">
            <asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="txtusername" ErrorMessage="Enter UserName" ForeColor="Red"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="auto-style3"><strong>Password:</strong></td>
        <td>
            <asp:TextBox ID="txtpass" runat="server" TextMode="Password"></asp:TextBox>            
        </td>
        <td class="auto-style4"><asp:RequiredFieldValidator ID="rfvPass" runat="server" ControlToValidate="txtpass" ErrorMessage="Enter Password" ForeColor="Red"></asp:RequiredFieldValidator></td>
    </tr>
    <tr>
        <td class="auto-style4" colspan="2">
            <asp:Button ID="btnlogin" runat="server" OnClick="btnlogin_Click" Text="Login" />
            <br />
            <span style="color: rgb(28, 45, 56); font-family: Euclid Circular A; font-size: 18px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 700; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">
    Don't have an account?<asp:LinkButton ID="lblregister" runat="server" OnClick="lblregister_Click" ValidateRequestMode="Disabled" CausesValidation="false">Register</asp:LinkButton>
</span>

        </td>
        <td></td>
    </tr>
</table>
        </div>  
    </form>
</body>
</html>
