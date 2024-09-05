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
    public partial class WebForm39 : System.Web.UI.Page
    {

        string connectionString = "Data Source=HPPAVILION5600\\SQLEXPRESS;Initial Catalog=db_shoes_shop;Integrated Security=True;Encrypt=False";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //BindGridView();
                BindProducts();
            }
        }
        
        protected void BindProducts()
        {
            string query = "SELECT * FROM tbl_add_pro";
            DataTable dataTable = ExecuteQuery(query);
            ProductRepeater.DataSource = dataTable;
            ProductRepeater.DataBind();
        }

        private DataTable ExecuteQuery(string query)
        {
            DataTable dataTable = new DataTable();
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand(query, con);
                con.Open();
                SqlDataReader reader = command.ExecuteReader();
                dataTable.Load(reader);
                con.Close();
            }
            return dataTable;
        }

        
        protected string GetImageSrc(object imageData)
        {
            byte[] imageBytes = (byte[])imageData;
            string base64String = Convert.ToBase64String(imageBytes);
            return $"data:image/jpeg;base64,{base64String}";
        }

        protected void GridView3_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
        protected void btnUpdate_Click(object sender, EventArgs e)
        {

        }
        protected void ProductRepeater_ItemDataBound(object source, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                DataRowView rowView = (DataRowView)e.Item.DataItem;

                DropDownList brandDropDown = (DropDownList)e.Item.FindControl("BrandDropDown");
                //string query = "SELECT * FROM tbl_add_pro";
                //DataTable dataTable = ExecuteQuery(query);
                //brandDropDown.DataSource = dataTable;
                //brandDropDown.DataTextField = "brand";
                //brandDropDown.DataValueField = "brand";
                //brandDropDown.DataBind();
                brandDropDown.SelectedValue = rowView["brand"].ToString();

                DropDownList categoryDropDown = (DropDownList)e.Item.FindControl("CategoryDropDown");
                //query = "SELECT * FROM tbl_add_pro";
                //dataTable = ExecuteQuery(query);
                //categoryDropDown.DataSource = dataTable;
                //categoryDropDown.DataTextField = "category";
                //categoryDropDown.DataValueField = "category";
                //categoryDropDown.DataBind();
                categoryDropDown.SelectedValue = rowView["category"].ToString();

            }
        }
        protected void ProductRepeater_ItemCommand(object source, RepeaterCommandEventArgs e)
        {

        }
        protected void DeleteButton_Click(object sender, EventArgs e)
        {
            LinkButton deleteButton = (LinkButton)sender; // Cast the sender object to a LinkButton
            RepeaterItem item = (RepeaterItem)deleteButton.NamingContainer;

            int productId = Convert.ToInt32(((Label)item.FindControl("ProductIdLabel")).Text);

            string query = $"DELETE FROM tbl_add_pro WHERE id = {productId}";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand(query, connection);
                connection.Open();
                int rowsAffected = command.ExecuteNonQuery();
                connection.Close();

                if (rowsAffected > 0)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "deleteAlert", "alert('Product Removed Successfully !');", true);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "deleteAlert", "alert('Error While Removing');", true);
                }
            }

            BindProducts();
        }
        protected void UpdateButton_Click(object sender, EventArgs e)
        {
            LinkButton updateButton = (LinkButton)sender; // Cast the sender object to a LinkButton
            RepeaterItem item = (RepeaterItem)updateButton.NamingContainer;
            FileUpload photoUpload = (FileUpload)item.FindControl("PhotoUpload");

            byte[] imageData = new byte[photoUpload.PostedFile.InputStream.Length];
            photoUpload.PostedFile.InputStream.Read(imageData, 0, imageData.Length);

            int productId = Convert.ToInt32(((Label)item.FindControl("ProductIdLabel")).Text);
            string descript = ((TextBox)item.FindControl("txtdescript")).Text;


            TextBox priceTextBox = (TextBox)item.FindControl("txtprice");
            decimal price;
            if (priceTextBox != null && !string.IsNullOrEmpty(priceTextBox.Text) && decimal.TryParse(priceTextBox.Text, out price))
            {
                string size = ((TextBox)item.FindControl("txtsize")).Text;
                string brandname = Convert.ToString(((DropDownList)item.FindControl("BrandDropDown")).SelectedValue);
                string categoryname = Convert.ToString(((DropDownList)item.FindControl("CategoryDropDown")).SelectedValue);
                string gender = ((TextBox)item.FindControl("txtgender")).Text;
                int stock = Convert.ToInt32(((TextBox)item.FindControl("txtsize")).Text);
                //int nprice = Convert.ToInt32(((TextBox)item.FindControl("txtprice")).Text);
                string sole_material = ((TextBox)item.FindControl("txtsole_material")).Text;
                string outer_material = ((TextBox)item.FindControl("txtouter_material")).Text;
                string occasion = ((TextBox)item.FindControl("txtoccasion")).Text;
                string model_name = ((TextBox)item.FindControl("txtmodel_name")).Text;

                string query = "UPDATE tbl_add_pro SET image=@Image, brand = @BrandName, category = @CategoryName, gender = @Gender, stock = @Stock , description = @Description, nprice = @Price, size = @Size,sole_material = @Sole_material, outer_material = @Outer_material, occasion = @Occasion , model_name=@Model WHERE id = @ProductId";

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    SqlCommand command = new SqlCommand(query, connection);
                    command.Parameters.AddWithValue("@Image", imageData);
                    command.Parameters.AddWithValue("@BrandName", brandname);
                    command.Parameters.AddWithValue("@CategoryName", categoryname);
                    command.Parameters.AddWithValue("@Gender", gender);
                    command.Parameters.AddWithValue("@Stock", stock);
                    command.Parameters.AddWithValue("@Description", descript);
                    command.Parameters.AddWithValue("@Price", price);
                    command.Parameters.AddWithValue("@Size", size);
                    command.Parameters.AddWithValue("@Sole_material", sole_material);
                    command.Parameters.AddWithValue("@Outer_material", outer_material);
                    command.Parameters.AddWithValue("@Occasion", occasion);
                    command.Parameters.AddWithValue("@Model", model_name);
                    command.Parameters.AddWithValue("@ProductId", productId);
                    connection.Open();
                    int rowsAffected = command.ExecuteNonQuery();
                    connection.Close();

                    if (rowsAffected > 0)
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "updateAlert", "alert('Product Updated successfully!');", true);
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "updateAlert", "alert('Error! Product Update Failed.');", true);
                    }
                }

                BindProducts();
            }
            else
            {
                Response.Write("error in price!!");
            }
        }
    }
}