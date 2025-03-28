﻿using System;
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
        SqlConnection conn;
        string strcon;
        int userSession;

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
                    if (Session["custId"] != null)
                    {
                        bindType();
                    }
                    else
                    {
                        Response.Redirect("LoginPage.aspx");
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

            ddlType.Items.Insert(0, new ListItem("--Select Type--", "0"));
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
                ddlCategory.Items.Insert(0, new ListItem("--Select Type--", "0"));
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
            try
            {
                userSession = Convert.ToInt16(Session["custId"]);

                string query = "INSERT INTO tblTransaction (custId, category_Id, amount, date, description) " +
                               "VALUES (@custId, @category, @amount, @date, @description)";
                SqlConnection conn = new SqlConnection(strcon);
                conn.Open();
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@custId", userSession);
                cmd.Parameters.AddWithValue("@category", ddlCategory.SelectedValue);
                cmd.Parameters.AddWithValue("@amount", Convert.ToDecimal(txtAmount.Text));
                cmd.Parameters.AddWithValue("@date", txtDate.Text);
                cmd.Parameters.AddWithValue("@description", txtDescription.Text);
                cmd.ExecuteNonQuery();
                fnClearAllFields();
                lblMessage.Text = "Transaction recorded successfully.";
                lblMessage.ForeColor = System.Drawing.Color.Green;
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Error: " + ex.Message;
                lblMessage.ForeColor = System.Drawing.Color.Red;
            }
        }

        protected void fnClearAllFields()
        {
            ddlType.Items.Clear();
            ddlCategory.Items.Clear();
            txtAmount.Text = string.Empty;
            txtDate.Text = string.Empty;
            txtDescription.Text = string.Empty;
            bindType();
        }
    }
}