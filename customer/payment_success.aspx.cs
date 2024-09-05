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
    public partial class WebForm21 : System.Web.UI.Page
    {
        string con = "Data Source=HPPAVILION5600\\SQLEXPRESS;Initial Catalog=db_shoes_shop;Integrated Security=True;Encrypt=False";

        public string CustomerName { get; set; }
        public string Email { get; set; }
        public string City { get; set; }
        public string State { get; set; }
        public string Address { get; set; }
        public string Pincode { get; set; }
        public string TotalProducts { get; set; }
        public string TotalPrice { get; set; }
        public string PaymentStatus { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            string query = "SELECT * FROM tbl_order1 WHERE order_id = @OrderID";
            using (SqlConnection con1 = new SqlConnection(con))
            {
                SqlCommand command = new SqlCommand(query, con1);
                command.Parameters.AddWithValue("@OrderID", Session["order_id"]);
                con1.Open();
                SqlDataReader reader = command.ExecuteReader();
                if (reader.Read())
                {
                    CustomerName = reader["customer_name"].ToString();
                    Email = reader["email"].ToString();
                    City = reader["city"].ToString();
                    Address = reader["address"].ToString();
                    Pincode = reader["pincode"].ToString();
                    TotalProducts = reader["total_products"].ToString();
                    TotalPrice = reader["total_price"].ToString();
                    //PaymentStatus = reader["payment_status"].ToString();
                }
                con1.Close();
            }

            string update = "update tbl_payment SET payment_status='Completed' where order_id = '" + Session["order_id"] + "' ";
            using (SqlConnection con1 = new SqlConnection(con))
            {   
                con1.Open();
                SqlCommand com1 = new SqlCommand(update, con1);
                com1.ExecuteNonQuery();
                con1.Close();
            }

            string update2 = "update tbl_order1 SET payment_status='Completed' where order_id = '" + Session["order_id"] + "' ";
            using (SqlConnection con1 = new SqlConnection(con))
            {
                con1.Open();
                SqlCommand com1 = new SqlCommand(update2, con1);
                com1.ExecuteNonQuery();
                con1.Close();
            }
        }
    }
}