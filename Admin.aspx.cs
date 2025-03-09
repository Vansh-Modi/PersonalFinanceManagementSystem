using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PersonalFinanceManagementSystem
{
    public partial class Admin : System.Web.UI.Page
    {
        SqlConnection conn;
        string strcon;
        protected void Page_Load(object sender, EventArgs e)
        {
            fnConnection();
            bindgrid();
            LoadUsers();
        }

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

        protected void bindgrid()
        {
            SqlConnection conn = new SqlConnection(strcon);
            string query = "select * from tblCustomer";

            conn.Open();
            SqlDataAdapter sda = new SqlDataAdapter(query, conn);
            DataTable dt = new DataTable();

            sda.Fill(dt);
            grvshow.DataSource = dt;
            grvshow.DataBind();
            conn.Close();
        }

        protected void LoadUsers()
        {
            using (SqlConnection con = new SqlConnection(strcon))
            {
                SqlDataAdapter da = new SqlDataAdapter("SELECT custId, custName, email, phNo FROM tblCustomer", con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                grvshow.DataSource = dt;
                grvshow.DataBind();
            }
        }

        protected void grvshow_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int userId = Convert.ToInt32(grvshow.DataKeys[e.RowIndex].Value);

            using (SqlConnection con = new SqlConnection(strcon))
            {
                SqlCommand cmd = new SqlCommand("DELETE FROM tblCustomer WHERE custId = @UserID", con);
                cmd.Parameters.AddWithValue("@UserID", userId);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }

            LoadUsers();
        }
    }
}

