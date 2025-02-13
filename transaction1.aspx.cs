using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Xml.Linq;
using System.Security.Cryptography;

namespace PersonalFinanceManagementSystem
{
    public partial class transaction1 : System.Web.UI.Page
    {
        string strcon;
        SqlConnection conn;
        
        protected void Page_Load(object sender, EventArgs e)
        {
            fnconnctions();
            bindcategory();

        }

        protected void fnconnctions()
        {

            strcon = ConfigurationManager.ConnectionStrings["PersonalFinanceManagementSystem"].ConnectionString;

            conn = new SqlConnection(strcon);

            if (conn.State != ConnectionState.Open)
            {

                conn.Open();
                Response.Write("succesfull");

            }
            else
            {

                Response.Write("false");
            }

        }

        private void bindcategory()
        {

            SqlConnection conn = new SqlConnection(strcon);

            conn.Open();

            string query = "SELECT * FROM type";

            SqlDataAdapter sda = new SqlDataAdapter(query, conn);

            DataTable dt = new DataTable();
            sda.Fill(dt);


            ddlType.DataSource = dt;
            ddlType.DataBind();
            ddlType.DataTextField = "type_name";
            ddlType.DataValueField = "t_id";
            ddlType.DataBind();
            conn.Close();
        }

        protected void ddlType_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(strcon);

            conn.Open();

            SqlCommand cmd = new SqlCommand("select * from category where t_Id=@t_Id", conn);

            cmd.Parameters.AddWithValue("t_Id", ddlType.SelectedValue);
            ddlcate.DataSource = cmd.ExecuteReader();
            ddlcate.DataTextField = "cate_name";
            ddlcate.DataValueField = "cate_id";
            ddlcate.DataBind();

            conn.Close();

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(strcon))
            {
                string query = "INSERT INTO tblTransaction (type, category, amount, date, description) " +
                               "VALUES (@type, @category, @amount, @date, @description)";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    
                    cmd.Parameters.AddWithValue("@type", ddlType.SelectedValue);
                    cmd.Parameters.AddWithValue("@category", ddlcate.SelectedValue);
                    cmd.Parameters.AddWithValue("@amount", Convert.ToDecimal(txtAmount.Text));
                    cmd.Parameters.AddWithValue("@date", Convert.ToDateTime(txtDate.Text));
                    cmd.Parameters.AddWithValue("@description", txtDescription.Text);

                    try
                    {
                        con.Open();
                        cmd.ExecuteNonQuery();
                        lblMessage.Text = "Transaction recorded successfully.";
                        lblMessage.ForeColor = System.Drawing.Color.Green;
                    }
                    catch (Exception ex)
                    {
                        lblMessage.Text = "Error: " + ex.Message;
                        lblMessage.ForeColor = System.Drawing.Color.Red;
                    }
                }
            }
        }
    }
}