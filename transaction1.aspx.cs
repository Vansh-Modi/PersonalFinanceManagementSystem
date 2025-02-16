﻿using System;
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

        protected void ddlType_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                string query = "SELECT * FROM tblCategory WHERE t_id = @t_id";
                SqlConnection conn = new SqlConnection(strcon);
                conn.Open();

                
                SqlCommand cmd = new SqlCommand(query, conn);

                cmd.Parameters.AddWithValue("@t_id", ddlType.SelectedValue);

                SqlDataReader reader = cmd.ExecuteReader();

                ddlCategory.DataSource = reader;
                ddlCategory.DataTextField = "category_name";
                ddlCategory.DataValueField = "category_id";
                ddlCategory.DataBind();

                conn.Close();
                ddlCategory.Items.Insert(0, new ListItem("--Select Type--"));
            }
            catch (SqlException sqlEx)
            {
                lblMessage.Text = "SQL Error: " + sqlEx.Message;
                lblMessage.ForeColor = System.Drawing.Color.Red;
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Error: " + ex.Message;
                lblMessage.ForeColor = System.Drawing.Color.Crimson;
            }
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
                    cmd.Parameters.AddWithValue("@category", ddlCategory.SelectedValue);
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

        protected void lbCategory_Click(object sender, EventArgs e)
        {
            Response.Redirect("category.aspx");
        }
    }
}