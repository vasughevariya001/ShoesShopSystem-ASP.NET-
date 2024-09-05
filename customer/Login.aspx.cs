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
    public partial class WebForm5 : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=HPPAVILION5600\\SQLEXPRESS;Initial Catalog=db_shoes_shop;Integrated Security=True;Encrypt=False");
        protected void Page_Load(object sender, EventArgs e)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "disableBackButton", "disableBackButton();", true);
        }

        protected void login_Click(object sender, EventArgs e)
        {
            string user = username.Text;
            string pass = password.Text;

            using (con)
            {
                con.Open();

                //if (CheckStaffLogin(con, user, pass))
                //    return;

                // Check if the user is an admin
                string adminQuery = "SELECT * FROM tbl_admin WHERE admin_user = @username AND admin_password = @password";
                SqlCommand adminCmd = new SqlCommand(adminQuery, con);
                adminCmd.Parameters.AddWithValue("@username", user);
                adminCmd.Parameters.AddWithValue("@password", pass);

                using (SqlDataReader adminReader = adminCmd.ExecuteReader())
                {
                    if (adminReader.HasRows)
                    {
                        Session["admin"] = user.ToString();
                        // Successful admin login
                        ScriptManager.RegisterStartupScript(this, GetType(), "adminlogin", "alert('Login as an Admin!'); window.location ='/Admin/admin_dashboard.aspx';", true);

                        return;
                    }
                } // adminReader is closed here


                // Check if the user is a staff
                string staffQuery = "SELECT * FROM tbl_staff WHERE username = @username AND password = @password";
                SqlCommand staffCmd = new SqlCommand(staffQuery, con);
                staffCmd.Parameters.AddWithValue("@username", user);
                staffCmd.Parameters.AddWithValue("@password", pass);

                using (SqlDataReader staffReader = staffCmd.ExecuteReader())
                {
                    if (staffReader.HasRows)
                    {
                        Session["staff"] = user.ToString();
                        // Successful staff login
                        ScriptManager.RegisterStartupScript(this, GetType(), "stafflogin", "alert('Login as a Staff!'); window.location ='/staff/staff_change_password.aspx';", true);
                        return;
                    }
                } // staffReader is closed here





                // Check if the user is a customer
                string query = "SELECT * FROM tbl_reg WHERE username = @username AND password = @password";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@username", user);
                cmd.Parameters.AddWithValue("@password", pass);

                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    if (reader.HasRows)
                    {
                        Session["user"] = user.ToString();

                        string welcomeMessage = "Welcome " + user + "!";
                        string script = "alert('" + welcomeMessage + "'); window.location='/customer/Home1.aspx';";
                        ScriptManager.RegisterStartupScript(this, GetType(), "login", script, true);
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, GetType(), "loginFailed", "alert('Wrong username or password!');", true);
                    }
                }
            }
        }


        //private bool CheckStaffLogin(SqlConnection con, string user1, string pass1)
        //{
        //    using (SqlCommand cmd1 = new SqlCommand("SELECT password FROM tbl_staff WHERE username = @Username AND password = @Password", con))
        //    {
        //        //string user = username.Text;
        //        //string pass = Convert.ToString(password.Text);

        //        cmd1.Parameters.AddWithValue("@Username", user1);
        //        cmd1.Parameters.AddWithValue("@Password", pass1);

        //        using (SqlDataReader reader = cmd1.ExecuteReader())
        //        {
        //            if (reader.HasRows)
        //            {
        //                reader.Read();
        //                string storedPassword = reader["password"].ToString();

        //                if (storedPassword == "a")
        //                {
        //                    Session["tempstaff"] = user1;
        //                    Response.Redirect("/customer/forgot_password.aspx");
        //                }
        //                else
        //                {
        //                    Session["staff"] = user1;
        //                    Response.Redirect("/customer/Home1.aspx");
        //                }
        //                return true;
        //            }
        //        }
        //    }
        //    return false;
        //}
    }
}