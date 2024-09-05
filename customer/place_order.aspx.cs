using Antlr.Runtime.Misc;
using Microsoft.Ajax.Utilities;
using Newtonsoft.Json.Linq;
using Razorpay.Api;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Drawing.Drawing2D;
using System.Linq;
using System.Security.Policy;
using System.Web;
using System.Web.Optimization;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace ShoesShopSystem
{
    public partial class WebForm19 : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=HPPAVILION5600\\SQLEXPRESS;Initial Catalog=db_shoes_shop;Integrated Security=True;Encrypt=False");
        private object pincode;

        protected string NotFoundMessage { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection("Data Source=HPPAVILION5600\\SQLEXPRESS;Initial Catalog=db_shoes_shop;Integrated Security=True;Encrypt=False");
            if (!IsPostBack)
            {
                BindProductRepeater();
            }
            using (con)
            {
                con.Open();
                var usname = HttpContext.Current.Session["user"].ToString();
                string selectCartQuery = "SELECT * FROM tbl_add_cart WHERE customer_name = @uname";

                using (SqlCommand cmd = new SqlCommand(selectCartQuery, con))
                {
                    cmd.Parameters.AddWithValue("@uname", usname);

                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        decimal total = 0.0M;
                        decimal grandTotal = 0.0M;
                        decimal totalDiscount = 0.0M;
                        int itemCount = 0;

                        while (reader.Read())
                        {
                            decimal oldPrice = reader.GetDecimal(reader.GetOrdinal("oprice")) * reader.GetInt32(reader.GetOrdinal("quantity"));
                            decimal newPrice = reader.GetDecimal(reader.GetOrdinal("price")) * reader.GetInt32(reader.GetOrdinal("quantity"));

                            HtmlGenericControl allProductDiv = new HtmlGenericControl("div");
                            allProductDiv.Attributes["class"] = "all-product hide";

                            HtmlGenericControl productsCardDiv = new HtmlGenericControl("div");
                            productsCardDiv.Attributes["class"] = "products-card";

                            HtmlGenericControl productDetailsDiv = new HtmlGenericControl("div");
                            productDetailsDiv.Attributes["class"] = "product-details";

                            HtmlGenericControl priceParagraph = new HtmlGenericControl("p");
                            priceParagraph.Attributes["class"] = "price";
                            priceParagraph.InnerHtml = $"<span>₹{oldPrice}</span>&nbsp;&nbsp;₹{newPrice}";

                            productDetailsDiv.Controls.Add(priceParagraph);
                            productsCardDiv.Controls.Add(productDetailsDiv);
                            allProductDiv.Controls.Add(productsCardDiv);
                            allCartItem.Controls.Add(allProductDiv);

                            int quantity = reader.GetInt32(reader.GetOrdinal("quantity"));
                            itemCount += quantity;

                            total += newPrice;
                            grandTotal += newPrice;
                            totalDiscount += (oldPrice - newPrice);
                        }

                        reader.Close();

                        // Store the total products and total price in session variables
                        Session["TotalProducts"] = itemCount;
                        Session["TotalPrice"] = grandTotal;

                        HtmlGenericControl priceDetailDiv = new HtmlGenericControl("div");
                        priceDetailDiv.Attributes["class"] = "price-detail";

                        HtmlGenericControl priceDetailHeader = new HtmlGenericControl("h3");
                        priceDetailHeader.InnerText = "Price Details";

                        HtmlGenericControl priceDetailParagraph = new HtmlGenericControl("p");
                        priceDetailParagraph.InnerHtml = $"Price <bold style=\"position: relative; left: -106px;\">({itemCount} Items)</bold> <span>₹{total}</span>";

                        HtmlGenericControl saveTextParagraph = new HtmlGenericControl("p");
                        saveTextParagraph.Attributes["class"] = "save-text";
                        saveTextParagraph.InnerHtml = $"Your Total Saving on this order ₹{totalDiscount}";

                        HtmlGenericControl totalAmountParagraph = new HtmlGenericControl("p");
                        totalAmountParagraph.Attributes["class"] = "total-amt";
                        totalAmountParagraph.InnerHtml = $"Amount Payable : <span>₹{grandTotal}</span>";

                        priceDetailDiv.Controls.Add(priceDetailHeader);
                        priceDetailDiv.Controls.Add(priceDetailParagraph);
                        priceDetailDiv.Controls.Add(new LiteralControl("<br>"));
                        priceDetailDiv.Controls.Add(totalAmountParagraph);
                        priceDetailDiv.Controls.Add(new LiteralControl("<hr style=\"border-bottom: 1px solid lightgrey;\">"));
                        priceDetailDiv.Controls.Add(saveTextParagraph);

                        allCartItem.Controls.Add(priceDetailDiv);
                    }
                }
            }
        }
        
        private void BindProductRepeater()
        {
            var uname = HttpContext.Current.Session["user"].ToString();
            string query = "SELECT * FROM tbl_reg WHERE username = '"+ uname +"' ";

            SqlCommand command = new SqlCommand(query, con);
            SqlDataAdapter adapter = new SqlDataAdapter(command);
            DataTable dataTable = new DataTable();
            adapter.Fill(dataTable);

            if (dataTable.Rows.Count == 0)
            {
                NotFoundMessage = "User is not available!";
            }

            ProductRepeater.DataSource = dataTable;
            ProductRepeater.DataBind();   
        }


        protected void orderNow_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            int regId = Convert.ToInt32(btn.CommandArgument);

            var uname = HttpContext.Current.Session["user"].ToString();

            string query = $"SELECT * FROM tbl_reg WHERE id = {regId}";
            SqlCommand command = new SqlCommand(query, con);
            SqlDataAdapter adapter = new SqlDataAdapter(command);
            DataTable dataTable = new DataTable();
            adapter.Fill(dataTable);

            if (dataTable.Rows.Count == 0)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('Invalid product ID.');", true);
                return;
            }

            DataRow row = dataTable.Rows[0];

            RepeaterItem item = (RepeaterItem)btn.NamingContainer;

            TextBox pincodeTextBox = (TextBox)item.FindControl("pincode");
            DropDownList paymentMethodDropDownList = (DropDownList)item.FindControl("paymentMethod");


            TextBox contactnumber = (TextBox)item.FindControl("contactnumber");


            //byte[] image = (byte[])row["image"];
            string email = row["email"].ToString();
            string contact = row["contact"].ToString();
            string address = row["address"].ToString();
            string city = row["city"].ToString();
            string pincode = pincodeTextBox.Text;

            string paymentMethods = paymentMethodDropDownList.SelectedValue;
            //int contactno = int.Parse(contactnumber.Text.Trim());

            if (paymentMethods == "UPI")
            {

                AddToOrder(uname, email, pincode, 7867, address, city, paymentMethods);
                
                Response.Redirect("Razorpay_payment.aspx");
            }
            else
            {
                //int contactno;
                //if (int.TryParse(contactnumber.Text.Trim(), out contactno))
                //{
                    AddToOrder(uname, email, pincode, 9998, address, city, paymentMethods);
                //}
                //else
                //{
                //    ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('errorrrrrr!');", true);
                //}
            }

            //AddToOrder(uname, email, pincode, contactno, address, city, paymentMethods);
        }
       
        private void AddToOrder(string uname, string email, string pincode, int contact, string address, string city, string paymentMethod)
        {
            using (con)
            {
                int totalProducts = (int)Session["TotalProducts"];
                decimal totalPrice = (decimal)Session["TotalPrice"];

                string query = "INSERT INTO tbl_order1 " +
                                       "(order_date, customer_name, email, contact, city, address, pincode, payment_status, order_status, total_products, total_price, payment_method) " +
                                       "VALUES " +
                                    "(GETDATE(), @Customer_name, @Email, @Contact, @City, @Address, @Pincode, 'Incomplete', 'Placed', @TotalProducts, @TotalPrice, @PaymentMethod); SELECT SCOPE_IDENTITY()";


                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@Customer_name", uname);
                cmd.Parameters.AddWithValue("@Email", email);
                cmd.Parameters.AddWithValue("@Pincode", pincode);
                cmd.Parameters.AddWithValue("@Contact", "9900887896");
                cmd.Parameters.AddWithValue("@Address", address);
                cmd.Parameters.AddWithValue("@City", city);
                cmd.Parameters.AddWithValue("@PaymentMethod", paymentMethod);
                cmd.Parameters.AddWithValue("@TotalProducts", totalProducts);
                cmd.Parameters.AddWithValue("@TotalPrice", totalPrice);

                con.Open();
                int orderId = Convert.ToInt32(cmd.ExecuteScalar());
                //int rowsAffected = cmd.ExecuteNonQuery();
                if (orderId > 0)
                {
                    //int orderId = Convert.ToInt32(cmd.ExecuteScalar());
                    Session["order_id"] = orderId;


                    string payment = "insert into tbl_payment (c_name , email , contact, payment_method , total_amount , payment_status , order_id) values (@Customer_name , @Email , @Contact , @PaymentMethod , @TotalPrice, @PaymentStatus , '" + orderId + "');";
                    SqlCommand cmd1 = new SqlCommand(payment, con);
                    cmd1.Parameters.AddWithValue("@Customer_name", uname);
                    cmd1.Parameters.AddWithValue("@Email", email);
                    cmd1.Parameters.AddWithValue("@Contact", "7678656");
                    cmd1.Parameters.AddWithValue("@PaymentMethod", paymentMethod);
                    cmd1.Parameters.AddWithValue("@TotalPrice", totalPrice);
                    cmd1.Parameters.AddWithValue("@PaymentStatus", "Incomplete");
                    cmd1.ExecuteNonQuery();


                    string cartQuery = "SELECT image, description, quantity, price, brand, size, category FROM tbl_add_cart WHERE customer_name = @username";
                    List<Dictionary<string, object>> cartItems = new List<Dictionary<string, object>>();
                    using (SqlCommand cartCommand = new SqlCommand(cartQuery, con))
                    {
                        string username = Session["user"].ToString();
                        cartCommand.Parameters.AddWithValue("@username", username);
                        SqlDataReader cartReader = cartCommand.ExecuteReader();
                        while (cartReader.Read())
                        {
                            Dictionary<string, object> cartItem = new Dictionary<string, object>();
                            cartItem["image"] = cartReader["image"];
                            cartItem["description"] = cartReader["description"];
                            cartItem["quantity"] = cartReader["quantity"];
                            cartItem["price"] = cartReader["price"];
                            cartItem["brand"] = cartReader["brand"];
                            cartItem["size"] = cartReader["size"];
                            cartItem["category"] = cartReader["category"];
                            cartItems.Add(cartItem);
                        }
                        cartReader.Close(); // Close the DataReader after reading
                    }

                    // Insert cart items into order details
                    string insertOrderDetailsQuery = "INSERT INTO tbl_order_details (odr_id, description, quantity, price,image, brand, category, size) VALUES (@orderId, @Description, @quantity, @price,@Image, @brand, @category, @size)";
                    foreach (var cartItem in cartItems)
                    {
                        using (SqlCommand orderDetailsCommand = new SqlCommand(insertOrderDetailsQuery, con))
                        {
                            orderDetailsCommand.Parameters.AddWithValue("@orderId", orderId);
                            orderDetailsCommand.Parameters.AddWithValue("@Description", cartItem["description"]);
                            orderDetailsCommand.Parameters.AddWithValue("@quantity", cartItem["quantity"]);
                            orderDetailsCommand.Parameters.AddWithValue("@price", cartItem["price"]);
                            orderDetailsCommand.Parameters.AddWithValue("@Image", cartItem["image"]);
                            orderDetailsCommand.Parameters.AddWithValue("@brand", cartItem["brand"]);
                            orderDetailsCommand.Parameters.AddWithValue("@category", cartItem["category"]);
                            orderDetailsCommand.Parameters.AddWithValue("@size", cartItem["size"]);
                            orderDetailsCommand.ExecuteNonQuery();

                        }
                    }
                    ScriptManager.RegisterStartupScript(this, GetType(), "orderalert", "alert('Order placed Succesfully !'); window.location ='/customer/Home1.aspx';", true);
                    //Response.Redirect("Home1.aspx");
                }
            }
        }






    }
}