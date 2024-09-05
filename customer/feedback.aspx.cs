using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShoesShopSystem.customer
{
    public partial class feedback : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=HPPAVILION5600\\SQLEXPRESS;Initial Catalog=db_shoes_shop;Integrated Security=True;Encrypt=False");

        public string UserName { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                UserName = Session["user"] as string;


                string uname = Session["user"].ToString();
                con.Open();
                SqlCommand cmd = new SqlCommand("SELECT * FROM tbl_reg WHERE username = @uname", con);
                cmd.Parameters.AddWithValue("@uname", uname);
                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        name.Text = reader["username"].ToString();
                        email.Text = reader["email"].ToString();
                    }
                    reader.Close();
                }
                con.Close();
            }
        }
        protected void Submit_Click(object sender, EventArgs e)
        {
            string uname = Session["user"].ToString();
            con.Open();
            SqlCommand cmd = new SqlCommand("insert into tbl_feedback (c_name , email , message) values (@uname , @email , @message);", con);
            cmd.Parameters.AddWithValue("@uname", name.Text);
            cmd.Parameters.AddWithValue("@email", email.Text);
            cmd.Parameters.AddWithValue("@message", message.Text);
            cmd.ExecuteNonQuery();
            ScriptManager.RegisterStartupScript(this, GetType(), "profile", "alert('Feedback Sent Successfully !'); window.location ='/customer/feedback.aspx';", true);
            
            con.Close();
        }
        protected void CustomerRepeater_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            //if (e.CommandName == "SubmitFeedback")
            //{
            //    RepeaterItem item = e.Item;
            //    string name = ((TextBox)item.FindControl("name")).Text;
            //    string email = ((TextBox)item.FindControl("email")).Text;
            //    string message = ((TextBox)item.FindControl("message")).Text;


            //    using (con)
            //    {
            //        con.Open();
            //        string checkQuery = "SELECT * FROM tbl_reg WHERE username = @name AND email = @email";
            //        SqlCommand checkCmd = new SqlCommand(checkQuery, con);
            //        checkCmd.Parameters.AddWithValue("@name", name);
            //        checkCmd.Parameters.AddWithValue("@email", email);

            //        int count = (int)checkCmd.ExecuteScalar();

            //        if (count > 0)
            //        {
            //            string insertQuery = "INSERT INTO tbl_feedback(c_name, email, message) VALUES (@name, @email, @message)";
            //            SqlCommand insertCmd = new SqlCommand(insertQuery, con);
            //            insertCmd.Parameters.AddWithValue("@name", name);
            //            insertCmd.Parameters.AddWithValue("@email", email);
            //            insertCmd.Parameters.AddWithValue("@message", message);

            //            if (insertCmd.ExecuteNonQuery() > 0)
            //            {
            //                // Show success message
            //            }
            //            else
            //            {
            //                // Show error message
            //            }
            //        }
            //        else
            //        {
            //            // Show invalid username or email message
            //        }
            //    }
            //}
        }

    }
    
}