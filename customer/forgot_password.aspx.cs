using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static System.Net.WebRequestMethods;

namespace ShoesShopSystem
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=HPPAVILION5600\\SQLEXPRESS;Initial Catalog=db_shoes_shop;Integrated Security=True;Encrypt=False");
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void btnSendOTP_Click(object sender, EventArgs e)
        {
            int otpExpirationMinutes = 1;

            con.Open();
            string email1 = txtEmail.Text;
            SqlCommand cmd = new SqlCommand("SELECT * FROM tbl_reg WHERE email = @Email", con);
            cmd.Parameters.AddWithValue("@Email", email1);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            if (dt.Rows.Count > 0)
            {
                try
                {

                    Random rand = new Random();
                    int generatedOTP = rand.Next(1000, 10000);

                    DateTime otpExpirationTime = DateTime.Now.AddMinutes(otpExpirationMinutes);
                    Session["OTP"] = generatedOTP;
                    Session["OTPExpiration"] = otpExpirationTime;

                    MailMessage mail = new MailMessage();
                    SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587);
                    mail.From = new MailAddress("shoesshop8700@gmail.com");
                    mail.To.Add(email1);
                    mail.Subject = "shoesshop : Forgot Password OTP";
                    mail.Body = "Your OTP to change password is: " + generatedOTP + "<br><br>Thank You.<br>Team shoeshop";


                    Session["semail"] = email1;

                    mail.IsBodyHtml = true;

                    smtp.Credentials = new System.Net.NetworkCredential("shoesshop8700@gmail.com", "ptntqyhazvycdqbt");
                    smtp.EnableSsl = true;
                    smtp.Send(mail);

                    //Response.Write("<script>alert('OTP Sent')</script>");
                    ScriptManager.RegisterStartupScript(this, GetType(), "otpAlert", "alert('OTP Sent Successfully !');", true);

                    con.Close();
                }
                catch (Exception ex)
                {
                    Response.Write("Message could not be sent. Mailer Error: " + ex.Message);
                }
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "EmailExistsAlert", "alert('User Does not Exists. Kindly Register.');", true);
            }
        }

        protected void btnVerify_Click(object sender, EventArgs e)
        {
            string otp = txtOTP.Text;

            if (Session["OTP"] != null && Session["OTPExpiration"] != null)
            {
                int storedOTP = (int)Session["OTP"];
                DateTime otpExpirationTime = (DateTime)Session["OTPExpiration"];

                if (DateTime.Now <= otpExpirationTime && otp == storedOTP.ToString())
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "otpVerifiedAlert", "alert('OTP Verified'); window.location='NewPassword.aspx';", true);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "invalidOTPAlert", "alert('Invalid OTP');", true);
                }

                // Clear the session variables
                Session.Remove("OTP");
                Session.Remove("OTPExpiration");
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "noOTPAlert", "alert('No OTP was sent or it has expired. Please request a new OTP.');", true);
            }
        }
    }
}