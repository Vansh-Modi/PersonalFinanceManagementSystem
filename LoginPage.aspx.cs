﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PersonalFinanceManagementSystem
{
    public partial class LoginPage : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["PersonalFinanceManagementSystem"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnlogin_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(cs);
            
                string query = "SELECT * FROM tblCustomer WHERE custName = @user AND password = @pass";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@user", txtusername.Text);
                cmd.Parameters.AddWithValue("@pass", txtpass.Text);

                try
                {
                    con.Open();
                    SqlDataReader dr = cmd.ExecuteReader();

                    if (dr.HasRows)
                    {
                        while (dr.Read())
                        {
                            Session["custId"] = dr["custId"].ToString();
                            Session["custName"] = dr["custName"].ToString();

                        }
                        Response.Redirect("Dashboard.aspx");
                    }
                    else
                    {
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('Login Failed! Invalid Login Name or Password')</script>");
                    }
                }
                catch (SqlException sqlEx)
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", $"<script>alert('SQL Error: {sqlEx.Message}')</script>");
                }
                catch (Exception ex)
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), $"Scripts", $"<script>alert('Error: {ex.Message}')</script>");
                }
                finally
                {
                    if (con.State == System.Data.ConnectionState.Open)
                    {
                        con.Close();
                    }
                }
            
        }
        protected void lblregister_Click(object sender, EventArgs e)
        {
            Response.Redirect("Registrationpage.aspx");
        }
    }
}