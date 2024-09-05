using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShoesShopSystem
{
    public partial class WebForm9 : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=HPPAVILION5600\\SQLEXPRESS;Initial Catalog=db_shoes_shop;Integrated Security=True;Encrypt=False");
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void staff_Click(object sender, EventArgs e)
        {
            string uname1 = uname.Text;
            string email1 = email.Text;
            string contact = txtcontact.Text;
            string address = txtaddress.Text;
            string password1 = password.Text;

            bool emailExistsInStaff = EmailExistsInTable("tbl_staff", email1);
            bool emailExistsInReg = EmailExistsInTable("tbl_reg", email1);

            if (emailExistsInStaff || emailExistsInReg)
            {
                Response.Write("<script>alert('Email already exists in either tbl_staff or tbl_reg');</script>");
                return;
            }

            try
            {
                con.Open();
                string query = "INSERT INTO tbl_staff (username, email, contact, address, password) VALUES (@Username, @Email, @Contact, @Address, @Password)";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@Username", uname.Text);
                cmd.Parameters.AddWithValue("@Email", email.Text);
                cmd.Parameters.AddWithValue("@Contact", txtcontact.Text);
                cmd.Parameters.AddWithValue("@Address", txtaddress.Text);
                cmd.Parameters.AddWithValue("@Password", password.Text);
                cmd.ExecuteNonQuery();
                con.Close();
                ScriptManager.RegisterStartupScript(this, GetType(), "staff", "alert('Staff member added successfully !'); window.location ='/Admin/add_staff_member.aspx';", true);
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
        private bool EmailExistsInTable(string tableName, string email)
        {
            string query = $"SELECT COUNT(*) FROM {tableName} WHERE email = @Email";
            using (SqlCommand cmd = new SqlCommand(query, con))
            {
                cmd.Parameters.AddWithValue("@Email", email);
                con.Open();
                int count = (int)cmd.ExecuteScalar();
                con.Close();
                return count > 0;
            }
        }
    }
}