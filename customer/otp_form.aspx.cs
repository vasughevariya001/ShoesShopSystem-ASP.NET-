using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShoesShopSystem
{
    public partial class otp_form : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=HPPAVILION5600\\SQLEXPRESS;Initial Catalog=db_shoes_shop;Integrated Security=True;Encrypt=False");
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void otp_verify_Click(object sender, EventArgs e)
        {
            String sessionOtp = Session["otp"] as String;
            String verify_otp = Request.Form["verify_otp"];

            if (sessionOtp == verify_otp)
            {
                //using (con)
                //{
                    con.Open();
                    SqlCommand insert = new SqlCommand("INSERT INTO tbl_reg (username , email , contact , address , city , password , confirm_pass) VALUES (@Username,@Email,@Contact,@Address,@City,@Password,@Confirm_password);", con);

                    insert.Parameters.AddWithValue("@Username", Session["username"] as String);
                    insert.Parameters.AddWithValue("@Email", Session["semail"] as String);
                    insert.Parameters.AddWithValue("@Contact", Session["contact"] as String);
                    insert.Parameters.AddWithValue("@Address", Session["address"] as String);
                    insert.Parameters.AddWithValue("@City", Session["dropdown"] as String);
                    insert.Parameters.AddWithValue("@Password", Session["password"] as String);
                    insert.Parameters.AddWithValue("@Confirm_password", Session["confirm_password"] as String);

                    insert.ExecuteNonQuery();
                    //ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('OTP Verified Successfully !'); window.location='login_demo.aspx';", true);

                //}
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('OTP Verified Successfully !'); window.location='Login.aspx';", true);
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Wrong OTP ! please try again !'); window.location='otp_form.aspx';", true);
                //ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Wrong OTP ! please try again !')", true);
                //Response.Redirect("otp_form.aspx");

            }
        }
    }
}