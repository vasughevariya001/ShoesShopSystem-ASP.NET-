using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShoesShopSystem
{
    public partial class WebForm43 : System.Web.UI.Page
    {

        SqlConnection con = new SqlConnection("Data Source=HPPAVILION5600\\SQLEXPRESS;Initial Catalog=db_shoes_shop;Integrated Security=True;Encrypt=False");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGridView();
            }
        }
        private void BindGridView()
        {
            string connectionString = "Data Source=HPPAVILION5600\\SQLEXPRESS;Initial Catalog=db_shoes_shop;Integrated Security=True;Encrypt=False";
            string query = "SELECT * FROM tbl_feedback";
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        GridView4.DataSource = dt;
                        GridView4.DataBind();
                    }
                }
            }
        }
        //protected void btnDelete_Click(object sender, EventArgs e)
        //{
        //    LinkButton btnDelete = (LinkButton)sender;

        //    // Get the ID from the CommandArgument property
        //    int feedbackId = Convert.ToInt32(btnDelete.CommandArgument);

        //    // Call the DeleteCustomer method with the customerId
        //    DeleteCustomer(feedbackId);
        //}
        //private void DeleteCustomer(int feedbackId)
        //{
        //    string deleteQuery = "DELETE FROM tbl_feedback WHERE feedback_id = @r_id";

        //    using (con)
        //    {
        //        con.Open();

        //        using (SqlCommand cmd = new SqlCommand(deleteQuery, con))
        //        {
        //            cmd.Parameters.AddWithValue("@r_id", feedbackId);
        //            int result = cmd.ExecuteNonQuery();

        //            if (result > 0)
        //            {
        //                ScriptManager.RegisterStartupScript(this, GetType(), "custdelete", "alert('Feedback has been Removed !'); window.location ='/Admin/view_feedback.aspx';", true);
        //            }
        //            else
        //            {
        //                ClientScript.RegisterStartupScript(this.GetType(), "error", "alert('Error While Deleting Feedback!');", true);
        //            }
        //        }
        //    }
        //}

        protected void GridView3_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void GridView4_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}