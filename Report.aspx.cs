using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;

namespace PersonalFinanceManagementSystem
{
    public partial class Report : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if(Session["custId"] == null)
                {
                    Response.Redirect("Login.aspx");
                }
                else
                {
                    BindTransactionData();
                }
            }
        }

        private void BindTransactionData()
        {
            string strcon = ConfigurationManager.ConnectionStrings["PersonalFinanceManagementSystem"].ConnectionString;

            // Get the user ID from the session
            int userId = Convert.ToInt32(Session["custId"]);

            try
            {
                using (SqlConnection conn = new SqlConnection(strcon))
                {
                    // Update the query to filter by user ID
                    string query = "SELECT t.date, c.category_name, ty.type_name, t.amount " +
                                   "FROM tblTransaction t " +
                                   "JOIN tblCategory c ON t.category_Id = c.category_id " +
                                   "JOIN tblType ty ON c.t_id = ty.t_Id " +
                                   "WHERE t.custId = @custId " + // Filter by user ID
                                   "ORDER BY t.date DESC";

                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        // Add the parameter for the user ID
                        cmd.Parameters.AddWithValue("@custId", userId);

                        conn.Open();
                        SqlDataReader reader = cmd.ExecuteReader();

                        // Clear existing rows if any
                        TransactionTableBody.Controls.Clear();

                        if (reader.HasRows)
                        {
                            while (reader.Read())
                            {
                                TableRow newRow = new TableRow();

                                // Create cells for each column
                                for (int i = 0; i < reader.FieldCount; i++)
                                {
                                    TableCell newCell = new TableCell();
                                    newCell.Text = reader[i].ToString();
                                    newRow.Cells.Add(newCell);
                                }

                                // Add the new row to the table body
                                TransactionTableBody.Controls.Add(newRow);
                            }
                        }
                        else
                        {
                            // Handle case where no data is returned
                            TableRow emptyRow = new TableRow();
                            TableCell emptyCell = new TableCell();
                            emptyCell.Text = "No transactions found.";
                            emptyCell.ColumnSpan = 4; // Adjust based on the number of columns
                            emptyRow.Cells.Add(emptyCell);
                            TransactionTableBody.Controls.Add(emptyRow);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                // Handle any errors that may have occurred
                TableRow errorRow = new TableRow();
                TableCell errorCell = new TableCell();
                errorCell.Text = "Error retrieving data: " + ex.Message;
                errorCell.ColumnSpan = 4; // Adjust based on the number of columns
                errorRow.Cells.Add(errorCell);
                TransactionTableBody.Controls.Add(errorRow);
            }
        }
    }
}