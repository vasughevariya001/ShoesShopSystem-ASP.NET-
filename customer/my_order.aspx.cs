using Razorpay.Api;
using System;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebGrease.Activities;

namespace ShoesShopSystem.customer
{
    public partial class my_order : System.Web.UI.Page
    {
        //SqlConnection con = new SqlConnection("Data Source=HPPAVILION5600\\SQLEXPRESS;Initial Catalog=db_shoes_shop;Integrated Security=True;Encrypt=False");

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string username = Session["user"] as string;
                string query = "SELECT * FROM tbl_order1 WHERE customer_name = @username";

                using (SqlConnection con = new SqlConnection("Data Source=HPPAVILION5600\\SQLEXPRESS;Initial Catalog=db_shoes_shop;Integrated Security=True;Encrypt=False"))
                {
                    SqlCommand command = new SqlCommand(query, con);
                    command.Parameters.AddWithValue("@username", username);

                    con.Open();
                    SqlDataReader reader = command.ExecuteReader();

                    if (!reader.HasRows)
                    {
                        PlaceHolderNoOrder.Visible = true;
                        PlaceHolderOrders.Visible = false;
                    }
                    else
                    {
                        orderRepeater.DataSource = reader;
                        orderRepeater.DataBind();
                    }
                    reader.Close();

                }

            }
        }

        protected void orderRepeater_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                string username = Session["user"] as string;
                int orderID = Convert.ToInt32(DataBinder.Eval(e.Item.DataItem, "order_id"));
                Repeater orderDetailsRepeater = e.Item.FindControl("orderDetailsRepeater") as Repeater;

                string query = "SELECT d.description AS description, d.image AS image, d.quantity AS quantity, d.brand AS brand, d.category as category, d.size AS size, d.price AS price, o.payment_status AS payment_status, o.order_id AS order_id FROM tbl_order_details AS d JOIN tbl_order1 AS o ON d.odr_id = o.order_id WHERE o.customer_name = @username AND o.order_id = @orderID";

                using (SqlConnection con = new SqlConnection("Data Source=HPPAVILION5600\\SQLEXPRESS;Initial Catalog=db_shoes_shop;Integrated Security=True;Encrypt=False"))
                {
                    SqlCommand command = new SqlCommand(query, con);
                    command.Parameters.AddWithValue("@username", username);
                    command.Parameters.AddWithValue("@orderID", orderID);

                    con.Open();
                    SqlDataReader reader = command.ExecuteReader();

                    orderDetailsRepeater.DataSource = reader;
                    orderDetailsRepeater.DataBind();

                    reader.Close();
                }


                PlaceHolder placeHolder1 = e.Item.FindControl("placeHolder1") as PlaceHolder;
                PlaceHolder placeHolder2 = e.Item.FindControl("placeHolder2") as PlaceHolder;
                PlaceHolder placeHolder3 = e.Item.FindControl("placeHolder3") as PlaceHolder;
                Button btnPayNow = e.Item.FindControl("btnPayNow") as Button;
                Button btnPrint = e.Item.FindControl("btnPrint") as Button;

                string status = DataBinder.Eval(e.Item.DataItem, "order_status").ToString();

                if (status == "Placed")
                {
                    placeHolder2.Visible = true;
                    //btnPayNow.CommandArgument = orderID.ToString();
                }
                else
                {
                    //placeHolder3.Visible = true;
                    //btnPrint.CommandArgument = orderID.ToString();
                }
            }
        }
        protected string GetImageSrc(object imageData)
        {
            byte[] imageBytes = (byte[])imageData;
            string base64String = Convert.ToBase64String(imageBytes);
            return $"data:image/jpeg;base64,{base64String}";
        }
        //protected void CancelOrder_Click(object sender, EventArgs e)
        //{
        //    Button btn = (Button)sender;
        //    RepeaterItem item = (RepeaterItem)btn.NamingContainer;
        //    int orderID = Convert.ToInt32(DataBinder.Eval(item.DataItem, "order_id"));

        //    string query = "UPDATE tbl_order SET order_status = 'Cancel' WHERE order_id = @orderID";
        //    string deleteQuery = "DELETE FROM tbl_order_details WHERE odr_id = @orderID";

        //    using (SqlConnection con = new SqlConnection("Data Source=HPPAVILION5600\\SQLEXPRESS;Initial Catalog=db_shoes_shop;Integrated Security=True;Encrypt=False"))
        //    {
        //        SqlCommand command = new SqlCommand(query, con);
        //        command.Parameters.AddWithValue("@orderID", orderID);

        //        SqlCommand deleteCommand = new SqlCommand(deleteQuery, con);
        //        deleteCommand.Parameters.AddWithValue("@orderID", orderID);

        //        try
        //        {
        //            con.Open();
        //            command.ExecuteNonQuery();
        //            deleteCommand.ExecuteNonQuery();

        //            // Display success message or perform other actions

        //            ClientScript.RegisterStartupScript(this.GetType(), "Success", "Swal.fire({ position: 'top', icon: 'success', title: 'Your order has been cancel !', showConfirmButton: true }).then(function(){ window.location.href = 'my_order.aspx'; });", true);
        //        }
        //        catch (Exception ex)
        //        {
        //            // Handle exception

        //            ClientScript.RegisterStartupScript(this.GetType(), "Error", "Swal.fire({ position: '', icon: 'error', title: 'Error In cancellation !', showConfirmButton: true }).then(function(){ window.location.href = 'my_order.aspx'; });", true);
        //        }
        //    }
        //}

        protected void orderRepeater_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "CancelOrder")
            {
                int orderId = Convert.ToInt32(e.CommandArgument);
                // TODO: Cancel the order with the given order ID
                string query = "UPDATE tbl_order1 SET order_status = 'Cancel' WHERE order_id = @orderId";
                //string deleteQuery = "DELETE FROM tbl_order_details WHERE odr_id = @orderID";
                string deleteQuery = "DELETE FROM tbl_order1 WHERE order_id = @orderID";

                using (SqlConnection con = new SqlConnection("Data Source=HPPAVILION5600\\SQLEXPRESS;Initial Catalog=db_shoes_shop;Integrated Security=True;Encrypt=False"))
                {
                    SqlCommand command = new SqlCommand(query, con);
                    command.Parameters.AddWithValue("@orderId", orderId);

                    SqlCommand deleteCommand = new SqlCommand(deleteQuery, con);
                    deleteCommand.Parameters.AddWithValue("@orderID", orderId);

                    try
                    {
                        con.Open();
                        command.ExecuteNonQuery();
                        deleteCommand.ExecuteNonQuery();

                        ScriptManager.RegisterStartupScript(this, GetType(), "error", "alert('Order Cancelled Successfully !'); window.location ='/customer/my_order.aspx';", true);
                    }
                    catch (Exception ex)
                    {
                        ScriptManager.RegisterStartupScript(this, GetType(), "error", "alert('Error in Cancel Order !');", true);
                    }
                }
            }
        }
        protected void btnPrint_Click(object sender, EventArgs e)
        { 
            int orderID = Convert.ToInt32((sender as Button).CommandArgument);
            Session["order_id"] = orderID;
            Response.Redirect("/customer/generate_pdf.aspx");
        }
    }
}
