using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShoesShopSystem
{
    public partial class WebForm37 : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=HPPAVILION5600\\SQLEXPRESS;Initial Catalog=db_shoes_shop;Integrated Security=True;Encrypt=False");

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void staff_password_Click(object sender, EventArgs e)
        {
            string staffMember = Session["staff"].ToString(); // Get the logged in staff member's username
            string oldPassword = oldpass.Text;
            string newPassword = newpass.Text;
            string confirmPassword = confirmpass.Text;

            //// First, check if the old password is correct
            //string checkPasswordQuery = "SELECT password FROM tbl_staff WHERE username = '" + staffMember + "'";
            //using (SqlCommand checkCmd = new SqlCommand(checkPasswordQuery, con))
            //{
            //    checkCmd.Parameters.AddWithValue("@staff", staffMember);
            //    con.Open();
            //    string storedPassword = (string)checkCmd.ExecuteScalar();

            //    if (oldPassword != storedPassword)
            //    {
            //        ScriptManager.RegisterStartupScript(this, GetType(), "matched", "alert('Your Old Password is wrong !');", true);
            //        return;
            //    }
            //}

            if (newPassword == confirmPassword)
            {
                con.Open();
                string query = "UPDATE tbl_staff SET password = @NewPassword WHERE username = '" + staffMember + "'";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@NewPassword", newPassword);

                    int rowsAffected = cmd.ExecuteNonQuery();
                    if (rowsAffected > 0)
                    {
                        ScriptManager.RegisterStartupScript(this, GetType(), "changepass", "alert('Password Change Successfully !'); window.location ='/customer/Login.aspx';", true);
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, GetType(), "Error", "alert('Error updating password !');", true);
                    }
                }
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "matched", "alert('New password and confirm password do not match !');", true);
            }
        }
    }
}