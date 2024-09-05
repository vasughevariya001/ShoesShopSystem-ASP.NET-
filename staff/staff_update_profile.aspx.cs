using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShoesShopSystem
{
    public partial class WebForm44 : System.Web.UI.Page
    {

        SqlConnection con = new SqlConnection("Data Source=HPPAVILION5600\\SQLEXPRESS;Initial Catalog=db_shoes_shop;Integrated Security=True;Encrypt=False");

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string staff = Session["staff"].ToString();
                con.Open();
                SqlCommand cmd = new SqlCommand("SELECT * FROM tbl_staff WHERE username = @uname", con);
                cmd.Parameters.AddWithValue("@uname", staff);
                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        nameTextBox.Text = reader["username"].ToString();
                        emailTextBox.Text = reader["email"].ToString();
                        contactTextBox.Text = reader["contact"].ToString();
                        addressTextBox.Text = reader["address"].ToString();
                    }
                    reader.Close();
                }
                con.Close();
            }
        }

        protected void updateButton_Click(object sender, EventArgs e)
        {
            string staff = Session["staff"].ToString();
            con.Open();
            SqlCommand cmd = new SqlCommand("UPDATE tbl_staff SET username = @uname , contact = @contact, address = @address WHERE username = @uname", con);
            cmd.Parameters.AddWithValue("@contact", contactTextBox.Text);
            cmd.Parameters.AddWithValue("@address", addressTextBox.Text);
            cmd.Parameters.AddWithValue("@uname", staff);
            cmd.ExecuteNonQuery();
            //ScriptManager.RegisterStartupScript(this, GetType(), "", "alert('Profile updated Successfully !');", true);
            ScriptManager.RegisterStartupScript(this, GetType(), "profile", "alert('Profile updated Successfully !'); window.location ='/staff/staff_update_profile.aspx';", true);
            con.Close();
            //Response.Redirect("/customer/update_profile.aspx");
        }
    }
}