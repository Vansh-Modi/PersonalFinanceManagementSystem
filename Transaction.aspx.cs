using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

namespace PersonalFinanceManagementSystem
{
    public partial class Transaction : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["PersonalFinanceManagementSystem"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            BindTransactionCategories();
        }

        private void BindTransactionCategories()
        {

            SqlConnection conn = new SqlConnection(cs);

            conn.Open();

            string query = "SELECT * FROM type";

            SqlDataAdapter sda = new SqlDataAdapter(query, conn);

            DataTable dt = new DataTable();
            sda.Fill(dt);


            ddltype.DataSource = dt;
            ddltype.DataBind();
            ddltype.DataTextField = "type_name";
            ddltype.DataValueField = "t_id";
            ddltype.DataBind();
            conn.Close();
        }

        protected void ddltype_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(cs);

            conn.Open();

            SqlCommand cmd = new SqlCommand("select * from category where t_Id=@t_Id", conn);

            cmd.Parameters.AddWithValue("t_Id", ddltype.SelectedValue);
            ddlcatagory.DataSource = cmd.ExecuteReader();
            ddlcatagory.DataTextField = "cate_name";
            ddlcatagory.DataValueField = "cate_id";
            ddlcatagory.DataBind();

            conn.Close();

        }
    }
}