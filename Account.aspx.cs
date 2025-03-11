using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;

namespace PersonalFinanceManagementSystem
{
    public partial class Account : Page
    {
        int userSession;
        SqlConnection conn;
        string strcon;
        protected void fnConnection()
        {
            strcon = ConfigurationManager.ConnectionStrings["PersonalFinanceManagementSystem"].ConnectionString;
            conn = new SqlConnection(strcon);
            if (conn.State != System.Data.ConnectionState.Open)
            {
                conn.Open();
            }
            else
            {
                Response.Write("Connection was not Established");
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            fnConnection();
            if (!IsPostBack)
            {
                
                if (Session["custId"] != null)
                {
                    userSession = Convert.ToInt32(Session["custId"]);
                    LoadUserData();
                }
                else
                {
                    Response.Redirect("LoginPage.aspx");
                }
            }
        }

        private void LoadUserData()
        {
            string connStr = ConfigurationManager.ConnectionStrings["PersonalFinanceManagementSystem"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "SELECT custName, email, password, phNo FROM tblCustomer WHERE custId = @custId";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@custId", userSession);
                    conn.Open();

                    SqlDataReader reader = cmd.ExecuteReader();
                    if (reader.Read())
                    {
                        txtUsername.Text = reader["custName"].ToString();
                        txtEmail.Text = reader["email"].ToString();
                        txtPassword.Text = reader["password"].ToString();
                        txtNumber.Text = reader["phNo"].ToString();
                    }
                    conn.Close();
                }
            }
        }

        protected void UpdateAccount_Click(object sender, EventArgs e)
        {
            string email = txtEmail.Text;
            string password = txtPassword.Text;
            SqlConnection conn = new SqlConnection(strcon);
            conn.Open();
            string query = "UPDATE tblCustomer SET email = @Email, password = @Password WHERE custId = @custId";
            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@Email", email);
            cmd.Parameters.AddWithValue("@Password", password);
            cmd.Parameters.AddWithValue("@custId", userSession);
            cmd.ExecuteNonQuery();
            conn.Close();
            Response.Write("<script>alert('Account updated successfully!');</script>");
        }

        protected void DeleteAccount_Click(object sender, EventArgs e)
        {
            string query1 = "DELETE FROM tblBudget WHERE custId=@custId";
            string query2 = "DELETE FROM tblTransaction WHERE custId=@custId";
            string query3 = "DELETE FROM tblCustomer WHERE custId=@custId";
            SqlConnection conn = new SqlConnection(strcon);
            conn.Open();
            userSession = Convert.ToInt16(Session["custId"]);
            SqlCommand cmd = new SqlCommand(query1, conn);
            cmd = new SqlCommand(query1, conn);
            cmd.Parameters.AddWithValue("@custId", userSession);
            cmd.ExecuteNonQuery();
            cmd = new SqlCommand(query2, conn);
            cmd.Parameters.AddWithValue("@custId", userSession);
            cmd.ExecuteNonQuery();
            cmd = new SqlCommand(query3, conn);
            cmd.Parameters.AddWithValue("@custId", userSession);
            cmd.ExecuteNonQuery();
            conn.Close();
            Session.Abandon();
            Response.Redirect("LoginPage.aspx");
        }
    }
}
