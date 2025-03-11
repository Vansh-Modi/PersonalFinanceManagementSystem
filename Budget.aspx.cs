using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;
namespace PersonalFinanceManagementSystem
{
    public partial class Budget : Page
    {
        int userSession;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //Session["custId"] = 9;
                if (Session["custId"] != null)
                {
                    userSession = Convert.ToInt16(Session["custId"]);
                    LoadBudgetData();
                }
                else
                {
                    Response.Redirect("Login.aspx");
                }
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            userSession = Convert.ToInt16(Session["custId"]);
            string category = txtCategory.Text;
            decimal amount = Convert.ToDecimal(txtAmount.Text);
            DateTime startDate = Convert.ToDateTime(txtStartDate.Text);
            DateTime endDate = Convert.ToDateTime(txtEndDate.Text);

            string connStr = ConfigurationManager.ConnectionStrings["PersonalFinanceManagementSystem"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "INSERT INTO tblBudget(custId, category, amount, startDate, endDate) " +
                    "VALUES(@custId, @category, @amount, @startDate, @endDate)";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@custId", userSession);
                    cmd.Parameters.AddWithValue("@category", category);
                    cmd.Parameters.AddWithValue("@amount", amount);
                    cmd.Parameters.AddWithValue("@startDate", startDate);
                    cmd.Parameters.AddWithValue("@endDate", endDate);

                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();
                }
            }
            LoadBudgetData();
        }

        private void LoadBudgetData()
        {
            string connStr = ConfigurationManager.ConnectionStrings["PersonalFinanceManagementSystem"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "SELECT category, amount, startDate, endDate FROM tblBudget WHERE custId = @custId";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@custId", userSession); 
                    conn.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    GridViewBudget.DataSource = reader;
                    GridViewBudget.DataBind();
                    conn.Close();
                }
            }
        }
    }
}