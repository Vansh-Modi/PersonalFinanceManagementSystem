using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;

namespace PerosnalFinanceManagementSystem
{
    public partial class LoginForm : System.Web.UI.Page
    {
        SqlConnection conn;
        string strcon;

        protected void FnConnection()
        {
            string cs = ConfigurationManager.ConnectionStrings["db_login"].ConnectionString;

        }

        protected void Page_Load(object sender, EventArgs e)
        {
  
        }
            
    }
}