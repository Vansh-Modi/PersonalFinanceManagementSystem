using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI;

namespace PersonalFinanceManagementSystem
{
    public partial class Notification : System.Web.UI.Page
    {
        SqlConnection conn;
        string strcon;

        protected void Page_Load(object sender, EventArgs e)
        {
            strcon = ConfigurationManager.ConnectionStrings["PersonalFinanceManagementSystem"].ConnectionString;
            conn = new SqlConnection(strcon);
            if (!IsPostBack)
            {
                if (Session["custId"] != null)
                {
                    bindNotifications();
                }
                else
                {
                    lblMessage.Text = "Session expired. Please log in again.";
                }
            }
        }

        private void bindNotifications()
        {
            try
            {
                int userSession = Convert.ToInt32(Session["custId"]);
                string query = "SELECT date, message FROM tblNotification WHERE custId = @custId ORDER BY date DESC";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@custId", userSession);
                    SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    int rowsAffected = adapter.Fill(dt); // Fill the DataTable

                    // Check if any rows were returned
                    if (rowsAffected == 0)
                    {
                        lblMessage.Text = "No notifications found.";
                    }

                    rptNotifications.DataSource = dt;
                    rptNotifications.DataBind();
                }
            }
            catch (SqlException sqlEx)
            {
                lblMessage.Text = "SQL Error: " + sqlEx.Message;
                lblMessage.ForeColor = System.Drawing.Color.Red;
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Error: " + ex.Message;
                lblMessage.ForeColor = System.Drawing.Color.Red;
            }
        }
    }
}