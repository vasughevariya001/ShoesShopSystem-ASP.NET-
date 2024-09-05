using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShoesShopSystem
{
    public partial class WebForm8 : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=HPPAVILION5600\\SQLEXPRESS;Initial Catalog=db_shoes_shop;Integrated Security=True;Encrypt=False");

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["admin"] == null)
            {
                Response.Redirect("/customer/Login.aspx");
            }
        }
        protected void change_pass_click(object sender, EventArgs e)
        {
            string admin1 = Session["admin"].ToString();
            string oldPassword = oldpass.Text;
            string newPassword = newpass.Text;
            string confirmPassword = confirmpass.Text;

            if (oldPassword != newPassword)
            {
                if (newPassword == confirmPassword)
                {
                    con.Open();
                    string query = "UPDATE tbl_admin SET admin_password = @NewPassword WHERE admin_user = @admin";

                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@NewPassword", newPassword);
                        cmd.Parameters.AddWithValue("@admin", admin1);

                        int rowsAffected = cmd.ExecuteNonQuery();
                        if (rowsAffected > 0)
                        {
                            ScriptManager.RegisterStartupScript(this, GetType(), "changepass", "alert('Password Change Successfully !'); window.location ='/customer/Login.aspx';", true);
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