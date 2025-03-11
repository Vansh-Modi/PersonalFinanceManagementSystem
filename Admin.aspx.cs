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

        protected void grvshow_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            GridViewRow row = grvshow.Rows[e.NewSelectedIndex];
            
            string custName = row.Cells[2].Text;
            string email = row.Cells[3].Text;
            string pass = row.Cells[4].Text;
            string phone = row.Cells[5].Text;

            txtname.Text = custName;
            txtemail.Text = email;
            txtphone.Text = phone;
            txtpass.Text = pass;

        }

        protected void btndele_Click(object sender, EventArgs e)
        {

            //GridViewRow row = grvshow.SelectedRow;
            //int custId = Convert.ToInt16(row.Cells[1].Text);

            //string query = "delete from tblCustomer where custId=@custId";

            //SqlConnection conn = new SqlConnection(strcon);
            //SqlCommand cmd = new SqlCommand(@query, conn);

            //cmd.Parameters.AddWithValue("@custId", custId);

            //conn.Open();
            //cmd.ExecuteNonQuery();
            //conn.Close();

            //bindgrid();
            GridViewRow row = grvshow.SelectedRow;

                int custId = Convert.ToInt32(row.Cells[1].Text);
                string query = "DELETE FROM tblCustomer WHERE custId=@custId";
                using (SqlConnection conn = new SqlConnection(strcon))
                {
                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@custId", custId);
                    conn.Open();
                    cmd.ExecuteNonQuery();
                }
                bindgrid();
            
        }

        protected void btnup_Click(object sender, EventArgs e)
        {
            GridViewRow row = grvshow.SelectedRow;

            int custId = Convert.ToInt32(row.Cells[1].Text);
                string query = "UPDATE tblCustomer SET custName=@custName, email=@email,password = @password,phNo = @phNo WHERE custId=@custId";
            SqlConnection conn = new SqlConnection(strcon);
                
                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@custName", txtname.Text);
                    cmd.Parameters.AddWithValue("@email", txtemail.Text);
            cmd.Parameters.AddWithValue("@password", txtpass.Text);
            cmd.Parameters.AddWithValue("@phNo", txtphone.Text);
                    
                    cmd.Parameters.AddWithValue("@custId", custId);
                    conn.Open();
                    cmd.ExecuteNonQuery();
                bindgrid();
        }
    }
}

