using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace ShoesShopSystem
{
    public partial class WebForm17 : System.Web.UI.Page
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
            string query = "SELECT * FROM tbl_payment";
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        GridView1.DataSource = dt;
                        GridView1.DataBind();
                    }
                }
            }
        }
        protected void ddlNewStatus_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            int payId = Convert.ToInt32((sender as LinkButton).CommandArgument);

            GridViewRow row = (GridViewRow)(sender as LinkButton).NamingContainer;
            DropDownList ddlNewStatus = (DropDownList)row.FindControl("ddlNewStatus");
            string newStatus = ddlNewStatus.SelectedValue;

            int orderId = Convert.ToInt32(row.Cells[1].Text);

            string connectionString = "Data Source=HPPAVILION5600\\SQLEXPRESS;Initial Catalog=db_shoes_shop;Integrated Security=True;Encrypt=False";
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                // Update payment status in tbl_payment
                string query1 = "UPDATE tbl_payment SET payment_status = @NewStatus WHERE pay_id = @PayID";
                using (SqlCommand command1 = new SqlCommand(query1, connection))
                {
                    command1.Parameters.AddWithValue("@NewStatus", newStatus);
                    command1.Parameters.AddWithValue("@PayID", payId);

                    connection.Open();
                    command1.ExecuteNonQuery();
                }

                string query2 = "UPDATE tbl_order1 SET payment_status = @NewStatus WHERE order_id = @OrderID";
                using (SqlCommand command2 = new SqlCommand(query2, connection))
                {
                    command2.Parameters.AddWithValue("@NewStatus", newStatus);
                    command2.Parameters.AddWithValue("@OrderID", orderId);

                    command2.ExecuteNonQuery();
                }

                connection.Close();
            }

            BindGridView();

            string script = "alert('Payment status updated successfully!');";
            ScriptManager.RegisterStartupScript(this, GetType(), "UpdateSuccess", script, true);
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
        protected System.Drawing.Color GetPaymentStatusColor(string paymentStatus)
        {
            switch (paymentStatus.ToLower())
            {
                case "Completed":
                    return System.Drawing.Color.Green;
                default:
                    return System.Drawing.Color.OrangeRed;
            }
        }

    }
}