using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShoesShopSystem
{
    public partial class WebForm10 : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=HPPAVILION5600\\SQLEXPRESS;Initial Catalog=db_shoes_shop;Integrated Security=True;Encrypt=False");
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Cpassword_Click(object sender, EventArgs e)
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

                try
                {
                    con.Open();
                    string insertQuery = "INSERT INTO tbl_reg (username, email, contact, address, city, password,confirm_pass) VALUES (@username, @email, @contact, @address, @city, @password,@Confirm_password)";
                    SqlCommand cmd = new SqlCommand(insertQuery, con);
                    cmd.Parameters.AddWithValue("@username", uname1);
                    cmd.Parameters.AddWithValue("@email", email1);
                    cmd.Parameters.AddWithValue("@contact", contact);
                    cmd.Parameters.AddWithValue("@address", address);
                    cmd.Parameters.AddWithValue("@city", city);
                    cmd.Parameters.AddWithValue("@password", password1);
                    cmd.Parameters.AddWithValue("@Confirm_password", confirm_password1);
                    cmd.ExecuteNonQuery();
                    con.Close();

                    // Display success message
                    ScriptManager.RegisterStartupScript(this, GetType(), "SuccessAlert", "alert('Customer added successfully !'); window.location ='/Admin/add_cust.aspx';", true);
                }
                catch (Exception ex)
                {
                    // Display error message
                    ScriptManager.RegisterStartupScript(this, GetType(), "ErrorAlert", "alert('Error adding customer: " + ex.Message + "');", true);
                }
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
