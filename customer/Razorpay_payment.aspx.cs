using System;
using Razorpay.Api;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace ShoesShopSystem.customer
{
    public partial class Razorpay_payment : System.Web.UI.Page
    {
        public string orderId;
        public string UserName;
        public string UserEmail;
        public string UserContact;
        public decimal Amount;
        public string RazorpayKey;
        public string DisplayCurrency;
        public string RazorpayOrderId;
        public int AmountPaise;

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                //fetch order id from session
                int orderIdInt = 0;
                if (Session["order_id"] != null && int.TryParse(Session["order_id"].ToString(), out orderIdInt))
                {
                    orderId = orderIdInt.ToString();

                }

                //fetch amount from database
                fetchamount();

                //fetch customer data from database
                fetchcustomerdata();

                Session["totalprice"] = Amount;

                RazorpayKey = "rzp_test_jtgT3NoTThWsok";
                DisplayCurrency = "INR";

                // Convert Amount variable to integer and store it in AmountPaise
                AmountPaise = Convert.ToInt32(Amount * 100);

                // Create an order
                var client = new RazorpayClient(RazorpayKey, "1KsOFegqBEt78G1gHjb0tVxf");
                var orderRequest = new Dictionary<string, object>
        {
            { "amount", AmountPaise },
            { "currency", DisplayCurrency },
            { "receipt", orderId }
        };
                var orderResponse = client.Order.Create(orderRequest);
                RazorpayOrderId = orderResponse["id"].ToString();
            }
            catch (Exception ex)
            {
                Response.Write(ex.ToString());
            }


        }

        //fetch customer data from database
        public void fetchcustomerdata()
        {
            string connectionString = "Data Source=HPPAVILION5600\\SQLEXPRESS;Initial Catalog=db_shoes_shop;Integrated Security=True;Encrypt=False";
            string customerQuery = "select * from tbl_reg where username = @uname";
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                SqlCommand command = new SqlCommand(customerQuery, connection);
                command.Parameters.AddWithValue("@uname", Session["user"]);
                SqlDataReader reader = command.ExecuteReader();

                if (reader.Read())
                {
                    UserName = reader["username"].ToString();
                    UserEmail = reader["email"].ToString();
                    UserContact = reader["contact"].ToString();
                }

                reader.Close();
            }
        }

        public void fetchamount()
        {
            //fetch amount from database
            string connectionString = "Data Source=HPPAVILION5600\\SQLEXPRESS;Initial Catalog=db_shoes_shop;Integrated Security=True;Encrypt=False";
            string orderQuery = "select * from tbl_order1 where order_id = @Order_Id";
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                SqlCommand command = new SqlCommand(orderQuery, connection);
                command.Parameters.AddWithValue("@Order_Id", Session["order_id"]);

                // Check if Session["order_id"] is null before executing the query
                if (Session["order_id"] != null)
                {
                    SqlDataReader reader = command.ExecuteReader();

                    if (reader.Read())
                    {
                        // Store total_price directly in Amount variable as decimal
                        Amount = Convert.ToDecimal(reader["total_price"]);
                    }

                    reader.Close();
                }
                else
                {
                    Response.Write("order id is null");
                }
            }
        }

    }
}
