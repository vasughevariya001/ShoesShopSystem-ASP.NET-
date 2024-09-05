using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShoesShopSystem
{
    public partial class WebForm27 : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=HPPAVILION5600\\SQLEXPRESS;Initial Catalog=db_shoes_shop;Integrated Security=True;Encrypt=False");
        protected string NotFoundMessage { get; set; }

        protected string Brand { get; set; } = "adidas";
        protected string Category { get; set; } = "sports";
        protected string Gender { get; set; } = "man";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindProductRepeater();
            }
        }
        private void BindProductRepeater()
        {
            string query = $"SELECT id ,brand, category, description, oprice, nprice , size , sole_material , outer_material , occasion , model_name , image FROM tbl_add_pro WHERE brand = '{Brand}' AND category = '{Category}' AND gender = '{Gender}'";

            SqlCommand command = new SqlCommand(query, con);
            SqlDataAdapter adapter = new SqlDataAdapter(command);
            DataTable dataTable = new DataTable();
            adapter.Fill(dataTable);

            if (dataTable.Rows.Count == 0)
            {
                NotFoundMessage = "Product is not available!";
            }

            ProductRepeater.DataSource = dataTable;
            ProductRepeater.DataBind();
        }

        protected string GetImageSrc(object image)
        {
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
        protected void addtocartbtn_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            //string productId = btn.CommandArgument;
            int productId = Convert.ToInt32(btn.CommandArgument);

            var uname = HttpContext.Current.Session["user"].ToString();

            string query = $"SELECT * FROM tbl_add_pro WHERE id = {productId}";
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

            byte[] image = (byte[])row["image"];
            string brand = row["brand"].ToString();
            string category = row["category"].ToString();
            string description = row["description"].ToString();

            decimal price;
            if (!decimal.TryParse(row["nprice"].ToString(), out price))
            {
                ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('Invalid price value.');", true);
                return;
            }
            decimal originalPrice;
            if (!decimal.TryParse(row["oprice"].ToString(), out originalPrice))
            {
                ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('Invalid original price value.');", true);
                return;
            }
            int size;
            if (!int.TryParse(row["size"].ToString(), out size))
            {
                ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('Invalid size value.');", true);
                return;
            }

            int quantity;
            RepeaterItem item = (RepeaterItem)btn.NamingContainer;
            TextBox quantityTextBox = (TextBox)item.FindControl("Quantity");
            HiddenField defaultQuantityHiddenField = (HiddenField)item.FindControl("DefaultQuantity");
            if (string.IsNullOrEmpty(quantityTextBox.Text))
            {
                quantity = Convert.ToInt32(defaultQuantityHiddenField.Value);
            }
            else if (!int.TryParse(quantityTextBox.Text, out quantity))
            {
                ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('Invalid quantity value.');", true);
                return;
            }

            AddToCart(uname, image, brand, category, description, price, originalPrice, size, quantity);

        }

        private void AddToCart(string uname, byte[] image, string brand, string category, string description, decimal price, decimal originalPrice, int size, int quantity)
        {
            using (con)
            {
                string query = @"INSERT INTO tbl_add_cart
                                    (customer_name, image, brand, category, description, price, oprice, size, quantity)
                                VALUES
                                    (@Customer_name, @Image, @Brand, @Category, @Description, @Price, @OriginalPrice, @Size, @Quantity)";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@Customer_name", uname);
                cmd.Parameters.AddWithValue("@Image", image);
                cmd.Parameters.AddWithValue("@Brand", brand);
                cmd.Parameters.AddWithValue("@Category", category);
                cmd.Parameters.AddWithValue("@Description", description);
                cmd.Parameters.AddWithValue("@Price", price);
                cmd.Parameters.AddWithValue("@OriginalPrice", originalPrice);
                cmd.Parameters.AddWithValue("@Size", size);
                cmd.Parameters.AddWithValue("@Quantity", quantity);

                con.Open();
                int rowsAffected = cmd.ExecuteNonQuery();
                if (rowsAffected > 0)
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('Product Added To Cart Succesfully !'); window.location ='/customer/puma_shoes_m_sneaker.aspx';", true);
                }

            }
        }
    }
}