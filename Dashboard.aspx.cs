using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PersonalFinanceManagementSystem
{
    public partial class Dashboard : System.Web.UI.Page
    {
        SqlConnection conn;
        string strcon;
        string userSession;
        int custId;

        protected void fnConnection()
        {
            strcon = ConfigurationManager.ConnectionStrings["PersonalFinanceManagementSystem"].ConnectionString;
            conn = new SqlConnection(strcon);
            if(conn.State != System.Data.ConnectionState.Open)
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
            if (!IsPostBack)
            {
                if (Session["user"] != null)
                {
                    userSession = Session["user"].ToString();
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
        }

        protected void fnPrintDashData()
        {
            custId = 8; //it is ToString be fetch from  the session
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
                paraDisplayIncome.InnerHtml = $"{totalIncome:C}";
            }
            else
            {
                totalIncome = 0;
                paraDisplayIncome.InnerHtml = "0";
            }

            //Expense code

            string queryExpense = "SELECT SUM(amount) FROM tblTransaction WHERE custId = @custId AND type = 'Expense'";

            adapter = new SqlDataAdapter(queryExpense, conn);
            
            cmd = new SqlCommand(queryExpense, conn);
            cmd.Parameters.AddWithValue("@custId", custId);
            
            var resultExpense = cmd.ExecuteScalar();
            decimal totalExpense;
            
            if (resultExpense != DBNull.Value)
            {
                totalExpense = (decimal)resultExpense;
                paraDisplayExpense.InnerHtml = $"{totalExpense:C}"; 
            }
            else
            {
                totalExpense = 0;
                paraDisplayExpense.InnerHtml = " 0";
            }
            
            conn.Close();

            //budget code
            
            decimal budgetRemaining = totalIncome - totalExpense;
            paraDisplayBudget.InnerHtml = $"{budgetRemaining:C}";
        }


    }
}