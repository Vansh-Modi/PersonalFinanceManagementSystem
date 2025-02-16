using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Xml.Linq;

namespace PersonalFinanceManagementSystem
{
    public partial class Registrationpage : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["PersonalFinanceManagementSystem"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            string user = txtusern.Text;
            string email = txtEmail.Text;
            string password = txtPassword.Text; 
            string phone = txtphone.Text;
          
            string query = "insert into tblCustomer values(@user,@email,@pass,@phone)";
            SqlConnection conn = new SqlConnection(cs);
            SqlCommand cmd = new SqlCommand(query, conn);   
            cmd.Parameters.AddWithValue("@user", user);
            cmd.Parameters.AddWithValue("@email", email);
            cmd.Parameters.AddWithValue("@pass", password);
            cmd.Parameters.AddWithValue("@phone",phone);

            try
            {
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();

                ScriptManager.RegisterStartupScript(this, this.GetType(), "popup", "alert('Registration Successful!');", true);
                Response.Redirect("Login.aspx");
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "popup", $"alert('Error: {ex.Message}');", true);
            }

        }
    }
}