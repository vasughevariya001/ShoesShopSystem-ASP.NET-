using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShoesShopSystem
{
    public partial class WebForm41 : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=HPPAVILION5600\\SQLEXPRESS;Initial Catalog=db_shoes_shop;Integrated Security=True;Encrypt=False");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                using (con)
                {
                    string query = "SELECT * FROM tbl_order1";
                    using (SqlCommand command = new SqlCommand(query, con))
                    {
                        con.Open();
                        using (SqlDataReader reader = command.ExecuteReader())
                        {
                            rptOrders.DataSource = reader;
                            rptOrders.DataBind();
                        }
                    }
                }
            }

        }
        protected void rptOrders_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "Delete")
            {
                int orderId = Convert.ToInt32(e.CommandArgument);
                using (con)
                {
                    string query = "DELETE FROM tbl_order1 WHERE order_id = @OID";
                    using (SqlCommand command = new SqlCommand(query, con))
                    {
                        command.Parameters.AddWithValue("@OID", orderId);
                        con.Open();
                        command.ExecuteNonQuery();
                    }
                }
                Response.Redirect("staff_view_order.aspx");
            }
            else if (e.CommandName == "Print")
            {
                int orderId = Convert.ToInt32(e.CommandArgument);

                string connectionString = ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;
                string orderStatus = string.Empty;
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    string query = "SELECT order_status FROM tbl_order1 WHERE order_id = @orderId";
                    using (SqlCommand command = new SqlCommand(query, con))
                    {
                        command.Parameters.AddWithValue("@orderId", orderId);
                        con.Open();
                        orderStatus = (string)command.ExecuteScalar();
                    }
                }
                if (orderStatus != "Cancel")
                {
                    Session["order_id"] = orderId;
                    Response.Redirect("/customer/generate_pdf.aspx");
                }
            }
        }

        protected void rptOrders_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                int orderId = Convert.ToInt32(DataBinder.Eval(e.Item.DataItem, "order_id"));
                Repeater rptOrderDetails = e.Item.FindControl("rptOrderDetails") as Repeater;

                string connectionString = ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;

                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    string query = "SELECT * FROM tbl_order_details WHERE odr_id = @orderId";
                    using (SqlCommand command = new SqlCommand(query, con))
                    {
                        command.Parameters.AddWithValue("@orderId", orderId);
                        con.Open();
                        using (SqlDataReader reader = command.ExecuteReader())
                        {
                            rptOrderDetails.DataSource = reader;
                            rptOrderDetails.DataBind();
                        }
                    }
                }

            }
        }


        protected void LinkButtonDelete_Click(object sender, EventArgs e)
        {

        }

        protected void LinkButtonBill_Click(object sender, EventArgs e)
        {

        }

        protected void LinkButtonSend_Click(object sender, EventArgs e)
        {
            // Implement send mail functionality here
        }
        protected string GetImageSrc(object imageData)
        {
            byte[] imageBytes = (byte[])imageData;
            string base64String = Convert.ToBase64String(imageBytes);
            return $"data:image/jpeg;base64,{base64String}";
        }
    }
}