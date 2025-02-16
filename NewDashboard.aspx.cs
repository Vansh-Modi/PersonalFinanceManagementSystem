using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PersonalFinanceManagementSystem
{
    public partial class Account : System.Web.UI.Page
    {
        SqlConnection conn;
        string strcon;
        string userSession;
        int custId;

        protected void fnConnection()
        {
            try
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
            catch (SqlException sqlEx)
            {
                Response.Write($"<script>alert('SQL Error: {sqlEx.Message}')</script>");
            }
            catch (Exception ex)
            {
                Response.Write($"<script>alert('Error: {ex.Message}')</script>");
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    //Session["custId"] = 8;
                    //Response.Write(Session["custId"]);
                    if (Session["custId"] != null)
                    {
                        userSession = Session["custId"].ToString();
                        // Use the selectedID as needed in your dashboard page logic
                        fnConnection();
                        fnPrintDashData();
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

        protected void fnPrintDashData()
        {
            try
            {
                custId = Convert.ToInt16(userSession);
                SqlConnection conn = new SqlConnection(strcon);

                string queryIncome = "SELECT SUM(amount) FROM tblTransaction WHERE custId = @custId AND type = 'Income'";
                conn.Open();

                SqlDataAdapter adapter = new SqlDataAdapter(queryIncome, conn);

                SqlCommand cmd = new SqlCommand(queryIncome, conn);
                cmd.Parameters.AddWithValue("@custId", custId);

                var resultIncome = cmd.ExecuteScalar();
                decimal totalIncome;

                if (resultIncome != DBNull.Value)
                {
                    totalIncome = (decimal)resultIncome;
                    lblIncome.Text = $"{totalIncome:C}";
                }
                else
                {
                    totalIncome = 0;
                    lblIncome.Text = "0";
                }

                // Expense code
                string queryExpense = "SELECT SUM(amount) FROM tblTransaction WHERE custId = @custId AND type = 'Expense'";
                adapter = new SqlDataAdapter(queryExpense, conn);
                cmd = new SqlCommand(queryExpense, conn);
                cmd.Parameters.AddWithValue("@custId", custId);

                var resultExpense = cmd.ExecuteScalar();
                decimal totalExpense;

                if (resultExpense != DBNull.Value)
                {
                    totalExpense = (decimal)resultExpense;
                    lblExpense.Text = $"{totalExpense:C}";
                }
                else
                {
                    totalExpense = 0;
                    lblExpense.Text = "0";
                }

                // Budget code
                decimal budgetRemaining = totalIncome - totalExpense;
                lblCurrentBalance.Text = $"{budgetRemaining:C}";
                lblLiabilities.Text = "100";
            }
            catch (SqlException sqlEx)
            {
                Response.Write($"<script>alert('SQL Error: {sqlEx.Message}')</script>");
            }
            catch (Exception ex)
            {
                Response.Write($"<script>alert('Error: {ex.Message}')</script>");
            }
            finally
            {
                if (conn.State == System.Data.ConnectionState.Open)
                {
                    conn.Close();
                }
            }
        }
    }
}
