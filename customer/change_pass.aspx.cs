using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShoesShopSystem.customer
{
    public partial class change_pass : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=HPPAVILION5600\\SQLEXPRESS;Initial Catalog=db_shoes_shop;Integrated Security=True;Encrypt=False");

        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["user"] == null)
            {
                Response.Redirect("Login.aspx");
            }
        }

        protected void change_pass_Click(object sender, EventArgs e)
        {
            
        }

        protected void change_password_Click(object sender, EventArgs e)
        {
            string user1 = Session["user"].ToString();
            string oldPassword = oldpassTextBox.Text;
            string newPassword = newpassTextBox.Text;
            string confirmPassword = confirmpassTextBox.Text;

            if (oldPassword != newPassword)
            {
                if (newPassword == confirmPassword)
                {
                    con.Open();
                    string query = "UPDATE tbl_reg SET password = @NewPassword,confirm_pass = @ConfirmPassword WHERE username = @user";

                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@NewPassword", newPassword);
                        cmd.Parameters.AddWithValue("@ConfirmPassword", confirmPassword);
                        cmd.Parameters.AddWithValue("@user", user1);

                        int rowsAffected = cmd.ExecuteNonQuery();
                        if (rowsAffected > 0)
                        {
                            ScriptManager.RegisterStartupScript(this, GetType(), "changepass", "alert('Password Change Successfully !'); window.location ='Login.aspx';", true);
                            //Response.Redirect("Login.aspx");
                        }
                        else
                        {
                            //Response.Write("Error updating password.");
                            ScriptManager.RegisterStartupScript(this, GetType(), "Error", "alert('Error updating password !');", true);
                        }
                    }
                }
                else
                {
                    // Response.Write("New password and confirm password do not match.");
                    ScriptManager.RegisterStartupScript(this, GetType(), "matched", "alert('New password and confirm password do not match !');", true);
                }
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "matched", "alert('Your Old Password is wrong !');", true);
            }
        }
    }
}