using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PersonalFinanceManagementSystem
{
	public partial class Category : System.Web.UI.Page
	{
         SqlConnection conn;
        string strcon;
        string userSession;

        protected void fnConnection()
        {
            strcon = ConfigurationManager.ConnectionStrings["PersonalFinanceManagementSystem"].ConnectionString;
            conn = new SqlConnection(strcon);
            if (conn.State != ConnectionState.Open)
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

                try
                {
                    Session["custId"] = 8;
                    Response.Write(Session["custId"]);
                    if (Session["custId"] != null)
                    {
                        userSession = Session["custId"].ToString();
                        // Use the selectedID as needed in your dashboard page logic

                        bindType();
                    }
                    else
                    {
                        // Handle the case where the Session variable is null (e.g., redirect to login page)
                        Response.Redirect("Login.aspx");
                    }
                }
                catch (Exception ex)
                {
                    Response.Write($"<script>alert('Error: {ex.Message}')</script>");
                }
            }
        }

        private void bindType()
        {

            SqlConnection conn = new SqlConnection(strcon);
            conn.Open();

            string query = "SELECT * FROM tblType";
            SqlDataAdapter adapter = new SqlDataAdapter(query, conn);

            DataTable dt = new DataTable();
            adapter.Fill(dt);

            ddlType.DataSource = dt;
            ddlType.DataBind();
            ddlType.DataTextField = "type_name";
            ddlType.DataValueField = "t_Id";
            ddlType.DataBind();

            //conn.Close();

            ddlType.Items.Insert(0, new ListItem("--Select Type--"));
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(strcon);
            conn.Open();
            string category = txtCategory.Text;
            int type = Convert.ToInt16((string)ddlType.SelectedValue);
            string query = "INSERT INTO tblCategory VALUES(@type , @category)";
            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@type", type);
            cmd.Parameters.AddWithValue("@category", category);
            cmd.ExecuteNonQuery();
            conn.Close();
            Response.Redirect("Transaction.aspx");

        }
    }
}