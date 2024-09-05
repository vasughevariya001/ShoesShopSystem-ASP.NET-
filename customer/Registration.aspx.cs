using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Net;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShoesShopSystem
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=HPPAVILION5600\\SQLEXPRESS;Initial Catalog=db_shoes_shop;Integrated Security=True;Encrypt=False");
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void reg_Click(object sender, EventArgs e)
        {
            string uname1 = uname.Text;
            string email1 = email.Text;
            string contact = txtcontact.Text;
            string address = txtaddress.Text;
            string city = reg_dropdown.Text;

            string password1 = password.Text;
            string confirm_password1 = confirm_password.Text;


            // ----------------------------------------------- Password Validation ------------------------------------------
            bool isStrongPassword = ValidatePasswordStrength(password1);

            if (!isStrongPassword)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "WeakPasswordAlert", "alert('Password should be at least 8 characters in length and should include at least one upper case letter, one number, and one special character.');", true);
                return;
            }
            if (!IsValidEmail(email1))
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "InvalidEmailAlert", "alert('Please enter a valid email address.');", true);
                return;
            }

            // ---------------------------------------- Password Not Matched ------------------------------------
            if (password1 != confirm_password1)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "PasswordMisMatch", "alert('Password Does Not Matched !');", true);
                return;
            }

            // ------------------------------------------ Email Exist or Not ----------------------------------------------
            if (EmailExist(email1))
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "EmailExistsAlert", "alert('Email already exists! Please choose a different email.');", true);
                return;
            }
            // ------------------------------------------- Send OTP -------------------------------------------------------
            else
            {
                String otp = new Random().Next(1000, 10000).ToString();
                Session["otp"] = otp;
                string to = email.Text;

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


                    Session["username"] = uname.Text;
                    Session["semail"] = email.Text;
                    Session["contact"] = txtcontact.Text;
                    Session["address"] = txtaddress.Text;
                    Session["dropdown"] = reg_dropdown.Text;
                    Session["password"] = password.Text;
                    Session["confirm_password"] = confirm_password.Text;


                    ClientScript.RegisterStartupScript(this.GetType(), "otpSent", "alert('OTP sent successfully!'); window.location='otp_form.aspx';", true);

                }
                catch (Exception ex)
                {
                    // Display error message
                    ClientScript.RegisterStartupScript(this.GetType(), "sendError", "alert('Error sending email: " + ex.Message + "');", true);
                }


                //ClientScript.RegisterStartupScript(this.GetType(), "otpSent", "alert('OTP sent successfully!');", true);
            }
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
            string query = "SELECT COUNT(*) FROM tbl_reg WHERE email = '" + email + "'";
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