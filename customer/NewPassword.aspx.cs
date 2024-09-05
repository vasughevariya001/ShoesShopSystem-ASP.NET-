using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShoesShopSystem
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=HPPAVILION5600\\SQLEXPRESS;Initial Catalog=db_shoes_shop;Integrated Security=True;Encrypt=False");
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnVerify_Click(object sender, EventArgs e)
        {
            string newpassword = txtNewPassword.Text;
            string confirmpassword = txtConfirmPassword.Text;
            string email = Session["semail"] as string;

            if (newpassword != confirmpassword)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "SamePassword", "alert('Please enter a same password !');", true);
            }
            else
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("UPDATE tbl_reg SET password = '" + newpassword + "' , confirm_pass = '" + confirmpassword + "' WHERE email = @Email", con);
                cmd.Parameters.AddWithValue("@Password", newpassword);
                //cmd.Parameters.AddWithValue("@Password", confirmpassword);

                cmd.Parameters.AddWithValue("@Email", email);
                cmd.ExecuteNonQuery();
                con.Close();
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Password Change Successfully!'); window.location ='/customer/Login.aspx';", true);
                
            }
        }
    }
}