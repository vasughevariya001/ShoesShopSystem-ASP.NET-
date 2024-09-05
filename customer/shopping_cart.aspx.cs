using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace ShoesShopSystem
{
    public partial class WebForm18 : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=HPPAVILION5600\\SQLEXPRESS;Initial Catalog=db_shoes_shop;Integrated Security=True;Encrypt=False");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Fetch data from the database
                var uname = HttpContext.Current.Session["user"].ToString();

                string query = "SELECT * FROM tbl_add_cart WHERE customer_name = @customer_name";

                using (con)
                {
                    SqlCommand command = new SqlCommand(query, con);
                    command.Parameters.AddWithValue("@customer_name", uname);

                    con.Open();
                    SqlDataReader reader = command.ExecuteReader();

                    if (reader.HasRows)
                    {
                        Repeater1.DataSource = reader;
                        Repeater1.DataBind();

                        // Calculate total, discount, and grand total amounts
                        decimal total = 0.0M;
                        decimal discount = 0.0M;
                        decimal grandTotal = 0.0M;

                        reader.Close();
                        reader = command.ExecuteReader();

                        while (reader.Read())
                        {
                            decimal oldPrice = reader.GetDecimal(reader.GetOrdinal("oprice")) * reader.GetInt32(reader.GetOrdinal("quantity"));
                            decimal newPrice = reader.GetDecimal(reader.GetOrdinal("price")) * reader.GetInt32(reader.GetOrdinal("quantity"));

                            total += oldPrice;
                            discount += (oldPrice - newPrice);
                            grandTotal += newPrice;
                        }

                        TotalLabel.Text = total.ToString();
                        DiscountLabel.Text = discount.ToString();
                        GrandTotalLabel.Text = grandTotal.ToString();
                        SaveLabel.Text = discount.ToString();

                        //TotalLabel.Text = $"Price: <span>₹{total:N2}</span>";
                        //DiscountLabel.Text = $"Discount: <span class=\"discount-txt\">- ₹{discount:N2}</span>";
                        //GrandTotalLabel.Text = $"Total Amount: <span>₹{grandTotal:N2}</span>";
                        //SaveLabel.Text = $"You will save ₹{discount:N2} on this order";
                    }
                }
            }
        }
        protected int GetStock(string description)
        {
            int stock = 0;
            string query = "SELECT stock FROM tbl_add_pro WHERE description = @description";

            using (con)
            {
                SqlCommand command = new SqlCommand(query, con);
                command.Parameters.AddWithValue("@description", description);

                con.Open();
                stock = (int)command.ExecuteScalar();
            }

            return stock;
        }
        protected string GetImageSrc(object image)
        {
            //byte[] imageBytes = (byte[])image;
            //string base64String = Convert.ToBase64String(imageBytes);
            //return $"data:image/jpeg;base64,{base64String}";
            if (image != null && image != DBNull.Value)
            {
                byte[] imageBytes = (byte[])image;
                string base64String = Convert.ToBase64String(imageBytes);
                return $"data:image/jpeg;base64,{base64String}";
            }
            else
            {
                return string.Empty;
            }
        }
        protected void RemoveFromCart(object sender, EventArgs e)
        {
            int id = int.Parse((sender as LinkButton).CommandArgument);
            string query = "DELETE FROM tbl_add_cart WHERE id = @Id";

            using (con)
            {
                SqlCommand command = new SqlCommand(query, con);
                command.Parameters.AddWithValue("@Id", id);

                con.Open();
                int rowsAffected = command.ExecuteNonQuery();

                if (rowsAffected > 0)
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('Item removed from cart. !'); window.location ='/customer/shopping_cart.aspx';", true);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('Item could't not be remove from cart. !'); window.location ='/customer/shopping_cart.aspx';", true);
                }
            }
        }
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            Button btnUpdate = (Button)sender;
            RepeaterItem item = (RepeaterItem)btnUpdate.NamingContainer;

            int updateId = int.Parse(((HiddenField)item.FindControl("HiddenField1")).Value);
            int updateValue = int.Parse(((TextBox)item.FindControl("TextBox1")).Text);

            string updateQtyQuery = "UPDATE tbl_add_cart SET quantity = @updateValue WHERE id = @updateId";

            using (con)
            {
                SqlCommand cmd = new SqlCommand(updateQtyQuery, con);
                cmd.Parameters.AddWithValue("@updateValue", updateValue);
                cmd.Parameters.AddWithValue("@updateId", updateId);

                con.Open();
                int rowsAffected = cmd.ExecuteNonQuery();

                if (rowsAffected > 0)
                {
                    Response.Redirect("/customer/shopping_cart.aspx");
                }
            }
        }
        protected void PlaceOrder_Click(object sender, EventArgs e)
        {
            Response.Redirect("place_order.aspx");
        }
    }
}