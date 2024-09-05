using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShoesShopSystem
{
    public partial class WebForm38 : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=HPPAVILION5600\\SQLEXPRESS;Initial Catalog=db_shoes_shop;Integrated Security=True;Encrypt=False");
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void brand_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void brand_SelectedIndexChanged1(object sender, EventArgs e)
        {
            string brands = brand.SelectedValue;
            string categorys = category.SelectedValue;
            string genders = gender.SelectedValue;

            using (con)
            {
                string category_qry = "SELECT * FROM tbl_add_pro WHERE brand = @brand AND category = @category AND gender = @gender";

                con.Open();
                using (SqlCommand cmd = new SqlCommand(category_qry, con))
                {
                    cmd.Parameters.AddWithValue("@brand", brands);
                    cmd.Parameters.AddWithValue("@category", categorys);
                    cmd.Parameters.AddWithValue("@gender", genders);


                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.HasRows)
                        {
                            string redirectUrl = "";
                            switch ($"{brand}-{category}-{gender}")
                            {
                                case "puma-sneakers-man":
                                    redirectUrl = "/customer/puma_shoes_m_sneaker.aspx";
                                    break;
                                case "puma-sports-man":
                                    redirectUrl = "/customer/puma_shoes_m_sports.aspx";
                                    break;
                                case "puma-running-man":
                                    redirectUrl = "brands/puma_shoes_m_running.aspx";
                                    break;

                                case "u.s.polo-sneakers-man":
                                    redirectUrl = "brands/uspolo_shoes_m_sneaker.aspx";
                                    break;

                                case "u.s.polo-sneakers-women":
                                    redirectUrl = "brands/uspolo_shoes_w_sneaker.aspx";
                                    break;
                                case "u.s.polo-running-women":
                                    redirectUrl = "brands/uspolo_shoes_w_running.aspx";
                                    break;

                                case "u.s.polo-sports-women":
                                    redirectUrl = "brands/uspolo_shoes_w_sports.aspx";
                                    break;
                                case "u.s.polo-loafer-man":
                                    redirectUrl = "brands/uspolo_shoes_m_loafers.aspx";
                                    break;

                                case "adidas-sneakers-man":
                                    redirectUrl = "brands/adidas_shoes_m_sneaker.aspx";
                                    break;
                                case "adidas-sneakers-women":
                                    redirectUrl = "brands/adidas_shoes_w_sneaker.aspx";
                                    break;
                                case "adidas-running-man":
                                    redirectUrl = "brands/adidas_shoes_m_running.aspx";
                                    break;

                                case "adidas-running-women":
                                    redirectUrl = "brands/adidas_shoes_w_running.aspx";
                                    break;
                                case "adidas-sports-man":
                                    redirectUrl = "brands/adidas_shoes_m_sports.aspx";
                                    break;
                                case "adidas-sports-women":
                                    redirectUrl = "brands/adidas_shoes_w_sports.aspx";
                                    break;

                                case "puma-sneakers-women":
                                    redirectUrl = "brands/puma_shoes_w_sneaker.aspx";
                                    break;

                                case "puma-slider-man":
                                    redirectUrl = "brands/puma_m_slider.php";
                                    break;

                                case "puma-slipper-man":
                                    redirectUrl = "brands/puma_m_slipper.php";
                                    break;

                                case "puma-slider-women":
                                    redirectUrl = "brands/puma_w_slider.php";
                                    break;

                                case "fila-slider-women":
                                    redirectUrl = "brands/fila_w_slider.php";
                                    break;

                                case "bata-slipper-women":
                                    redirectUrl = "brands/bata_w_slipper.php";
                                    break;

                                case "adidas-slipper-women":
                                    redirectUrl = "brands/adidas_w_slipper.php";
                                    break;

                                default:
                                    // Handle other categories or provide a default redirect
                                    // echo '<script> alert("Category Not Available !")</script>';
                                    break;
                            }
                            if (!string.IsNullOrEmpty(redirectUrl))
                            {
                                Response.Redirect(redirectUrl);
                            }
                        }
                        else
                        {
                            //ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('Category Not Available !');", true);
                        }
                    }
                }
            }
        }

        protected void submit_Click(object sender, EventArgs e)
        {
            byte[] imageData = new byte[p_image.PostedFile.InputStream.Length];
            p_image.PostedFile.InputStream.Read(imageData, 0, imageData.Length);

            string insertQuery = "INSERT INTO tbl_add_pro (brand, category, gender, stock, description, nprice, oprice, size, sole_material, outer_material, occasion, model_name , image) VALUES (@Brand, @Category, @Gender, @Stock, @Description, @NPrice, @OPrice, @Size, @SoleMaterial, @OuterMaterial, @Occasion, @ModelName, @Image)";

            string connectionString = "Data Source=HPPAVILION5600\\SQLEXPRESS;Initial Catalog=db_shoes_shop;Integrated Security=True;Encrypt=False";

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(insertQuery, con))
                {
                    command.Parameters.AddWithValue("@Brand", brand.Text);
                    command.Parameters.AddWithValue("@Category", category.Text);
                    command.Parameters.AddWithValue("@Gender", gender.Text);
                    command.Parameters.AddWithValue("@Stock", Convert.ToInt32(stock.Text));
                    command.Parameters.AddWithValue("@Description", descript.Text);
                    command.Parameters.AddWithValue("@NPrice", Convert.ToDecimal(newprice.Text));
                    command.Parameters.AddWithValue("@OPrice", Convert.ToDecimal(oldprice.Text));
                    command.Parameters.AddWithValue("@Size", size.Text);
                    command.Parameters.AddWithValue("@SoleMaterial", sole_Material.Text);
                    command.Parameters.AddWithValue("@OuterMaterial", outer_Material.Text);
                    command.Parameters.AddWithValue("@Occasion", occasion.Text);
                    command.Parameters.AddWithValue("@ModelName", model_name.Text);
                    command.Parameters.AddWithValue("@Image", imageData);


                    con.Open();

                    int result = command.ExecuteNonQuery();

                    if (result > 0)
                    {
                        ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('Product Added succesfully !'); window.location ='/staff/staff_add_product.aspx';", true);
                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Error While Inserting !');", true);
                    }
                }
            }
        }
    }
}