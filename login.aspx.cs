using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace PersonalFinanceManagementSystem
{
    public partial class login : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["PersonalFinanceManagementSystem"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnlogin_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = "SELECT * FROM login WHERE custId = @user AND password = @pass";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@user", txtusername.Text);
                cmd.Parameters.AddWithValue("@pass", txtpass.Text);

                try
                {
                    con.Open();
                    SqlDataReader dr = cmd.ExecuteReader();

                    if (dr.HasRows)
                    {
                        Session["user"] = txtusername.Text;
                        Response.Redirect("Dashboard.aspx");
                    }
                    else
                    {
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('Login Failed!')</script>");
                    }
                }
                catch (SqlException sqlEx)
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", $"<script>alert('SQL Error: {sqlEx.Message}')</script>");
                }
                catch (Exception ex)
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), $"Scripts", $"<script>alert('Error: {ex.Message}')</script>");
                }
                finally
                {
                    if (con.State == System.Data.ConnectionState.Open)
                    {
                        con.Close();
                    }
                }
            }
        }

        protected void lblregister_Click(object sender, EventArgs e)
        {
            Response.Redirect("RegistrationPage.aspx");
        }
    }
}