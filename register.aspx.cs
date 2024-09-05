using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.EnterpriseServices;
using System.Linq;
using System.Text.RegularExpressions;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;

namespace ShoesShopSystem
{
    public partial class register : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=HPPAVILION5600\\SQLEXPRESS;Initial Catalog=db_shoes_shop;Integrated Security=True;Encrypt=False");
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void reg_Click(object sender, EventArgs e)
        {
            string uname = Request.Form["uname"];
            string email = Request.Form["email"];
            string password = Request.Form["password"];
            string confirm_password = Request.Form["confirm_password"];


            // ----------------------------------------------- Password Validation ------------------------------------------
            bool isStrongPassword = ValidatePasswordStrength(password);

            if (!isStrongPassword)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "WeakPasswordAlert", "alert('Password should be at least 8 characters in length and should include at least one upper case letter, one number, and one special character.');", true);
                return;
            }
            if (!IsValidEmail(email))
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "InvalidEmailAlert", "alert('Please enter a valid email address.');", true);
                return;
            }

            // ---------------------------------------- Password Not Matched ------------------------------------
            if (password != confirm_password)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "PasswordMisMatch", "alert('Password Does Not Matched !');", true);
                return;
            }

            // ------------------------------------------ Email Exist or Not ----------------------------------------------
            if (EmailExist(email))
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "EmailExistsAlert", "alert('Email already exists! Please choose a different email.');", true);
                return;
            }
            // ------------------------------------------- Send OTP -------------------------------------------------------
            else
            {
                String otp = new Random().Next(1000, 10000).ToString();
                Session["otp"] = otp;
                string to = Request.Form["email"];

                try
                {
                    SmtpClient client = new SmtpClient("smtp.gmail.com", 587);

                    client.EnableSsl = true;

                    client.Credentials = new NetworkCredential("shoesshop8700@gmail.com", "ptntqyhazvycdqbt"); // Replace with your email address and password

                    MailMessage mail = new MailMessage();

                    mail.From = new MailAddress("shoesshop8700@gmail.com", "Registration-ShoesShop");

                    mail.To.Add(to);

                    mail.Subject = "OTP Verification !";
                    mail.Body = "Otp for registration in ShoesShop : " + otp + "<br><br>Thank You.<br>Team shoeshop";
                    mail.IsBodyHtml = true;

                    client.Send(mail);

                    // Display success message
                    //ClientScript.RegisterStartupScript(this.GetType(), "otpSent", "alert('OTP sent successfully!'); window.location='otp_form.aspx';", true);


                    Session["username"] = Request.Form["uname"];
                    Session["semail"] = Request.Form["email"];
                    Session["password"] = Request.Form["password"];
                    Session["confirm_password"] = Request.Form["confirm_password"];

                    ClientScript.RegisterStartupScript(this.GetType(), "otpSent", "alert('OTP sent successfully!'); window.location='otp_form.aspx';", true);

                }
                catch (Exception ex)
                {
                    // Display error message
                    ClientScript.RegisterStartupScript(this.GetType(), "sendError", "alert('Error sending email: " + ex.Message + "');", true);
                }


                //ClientScript.RegisterStartupScript(this.GetType(), "otpSent", "alert('OTP sent successfully!');", true);
            }

            /*Session["uname"] = uname;
            Session["email"] = email;
            Session["password"] = password;
            Session["confirm_pass"] = confirm_password;

            String query = "insert into tbl_registration(username , email , password , confirm_pass) " +
                "values ('" + uname + "' , '" + email + "','" + password + "' , '" + confirm_password + "' )";

            SqlCommand cmd = new SqlCommand(query, con);

            con.Open();
            int rowsAffected = cmd.ExecuteNonQuery();

            if (rowsAffected > 0)
            {
                Response.Redirect("success_page.aspx");
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Failed to insert login credentials.');", true);
            }*/
        }


        // ------------------------------------------ Password Validation ------------------------------------------
        private bool ValidatePasswordStrength(string password)
        {
            // Define regex patterns for password validation
            string uppercasePattern = @"[A-Z]";
            string lowercasePattern = @"[a-z]";
            string digitPattern = @"\d";
            string specialCharacterPattern = @"[\W_]";

            // Check if the password meets the required criteria
            bool hasUppercase = Regex.IsMatch(password, uppercasePattern);
            bool hasLowercase = Regex.IsMatch(password, lowercasePattern);
            bool hasDigit = Regex.IsMatch(password, digitPattern);
            bool hasSpecialCharacter = Regex.IsMatch(password, specialCharacterPattern);
            bool isLengthValid = password.Length >= 8;

            return hasUppercase && hasLowercase && hasDigit && hasSpecialCharacter && isLengthValid;
        }
        // ------------------------------------------ Email Exist or Not ----------------------------------------------
        private bool EmailExist(string email)
        {
            string query = "SELECT COUNT(*) FROM tbl_registration WHERE email = '" + email + "'";
            int count = 0;

            try
            {
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@Email", email);
                    con.Open();
                    count = (int)cmd.ExecuteScalar();
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("An error occurred: " + ex.Message);
            }
            finally
            {
                con.Close();
            }
            return count > 0;
        }

        // Email format validation
        private bool IsValidEmail(string email)
        {
            try
            {
                var addr = new MailAddress(email);
                return addr.Address == email;
            }
            catch
            {
                return false;
            }
        }
    }
}