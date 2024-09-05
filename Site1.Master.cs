using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShoesShopSystem
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        SqlConnection con = new SqlConnection("Data Source=HPPAVILION5600\\SQLEXPRESS;Initial Catalog=db_shoes_shop;Integrated Security=True;Encrypt=False");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (HttpContext.Current.Session["admin"] != null)
            {
                var userProfileLink = new LiteralControl("<li><a href=\"/Admin/Admin_panel.aspx\">Profile</a></li>");
                LoginPlaceholder.Controls.Add(userProfileLink);
            }
            else if (HttpContext.Current.Session["user"] != null)
            {
                //var userProfileLink = new LiteralControl("<li><a href=\"/customer/customer_panel.aspx\">Profile</a></li>" +
                //                                        "<li><a href=\"/customer/Logout.aspx\"><span class=\"glyphicon glyphicon-log-out\"></span> Logout</a></li>");
                //LoginPlaceholder.Controls.Add(userProfileLink);

                var username = HttpContext.Current.Session["user"].ToString();
                int cartItemCount = GetCartItemCount();

                var userDropdown = new LiteralControl("<li class='dropdown' style='left: 235px;'><a href='#' class='dropdown-toggle' data-toggle='dropdown' role='button' aria-haspopup='true' aria-expanded='false'><span class='glyphicon glyphicon-user'></span> " + username + "&nbsp;<span class='caret'></span></a>" +
                                               "<ul class='dropdown-menu'>" +
                                                   "<li><a href='/customer/customer_panel.aspx'>Profile</a></li>" +

                                                   "<li><a href='/customer/Logout.aspx' onclick='return confirm(\"Logout Successfull !\");'><span class='glyphicon glyphicon-log-out'></span> Logout</a></li>" +
                                               "</ul>" +
                                             "</li>");
                LoginPlaceholder.Controls.Add(userDropdown);

                var cartIcon = new LiteralControl("<li><a href='/customer/shopping_cart.aspx' class='cart-icon'><i class='glyphicon glyphicon-shopping-cart'></i><span>" + cartItemCount + "</span></a></li>");
                LoginPlaceholder.Controls.Add(cartIcon);

            }
            else
            {
                // If the user is not logged in, show register and login options
                var userProfileLink = new LiteralControl("<li class=\"reg-btn\"><a href=\"/customer/Registration.aspx\"><span class=\"glyphicon glyphicon-user\"></span> Register</a></li>" +
                                                        "<li class=\"login-btn\"><a href=\"/customer/Login.aspx\"><span class=\"glyphicon glyphicon-log-in\"></span> Login</a></li>");
                LoginPlaceholder.Controls.Add(userProfileLink);
            }
        }
        public int GetCartItemCount()
        {
            // Replace these with your actual database connection and query
            //string conString = "your_connection_string_here";
            string query = "SELECT COUNT(*) FROM tbl_add_cart WHERE customer_name = @customerName";

            using (con)
            {
                con.Open();

                using (var cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@customerName", HttpContext.Current.Session["user"].ToString());

                    return Convert.ToInt32(cmd.ExecuteScalar());
                }
            }
        }
    }
}