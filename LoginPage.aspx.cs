using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;

namespace PerosnalFinanceManagementSystem
{
    public partial class LoginForm : System.Web.UI.Page
    {
        SqlConnection conn;
        string strcon;

        protected void FnConnection()
        {
            //ConnectDB is to change from web config
            //strcon = ConfigurationManager.ConnectionStrings["ConnectDB"].ConnectionString;
            conn = new SqlConnection(strcon);
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            FnConnection();
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            //string empEmail = txtLogin.Text;
            //string empPass = txtPassword.Text;

            SqlConnection conn = new SqlConnection(strcon);
            conn.Open();
            string query = "SELECT count(*) FROM tblCustomer WHERE Email = @Email AND Password = @Password";
            SqlCommand cmd = new SqlCommand(query, conn);
            //cmd.Parameters.AddWithValue("Email", empEmail);
            //cmd.Parameters.AddWithValue("Password", empPass);

            int i = Convert.ToInt16(cmd.ExecuteScalar());

            if (i == 0)
            {
                Response.Write("login id is Invalid");
            }
            else
            {
                //Session["a"] = txtLogin.Text;
                Response.Redirect("EMS.aspx");
            }

        }
    }
}