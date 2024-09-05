using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShoesShopSystem
{
    public partial class WebForm45 : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            string connectionString = "Data Source=HPPAVILION5600\\SQLEXPRESS;Initial Catalog=db_shoes_shop;Integrated Security=True;Encrypt=False";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                // Count users
                using (SqlCommand command = new SqlCommand("SELECT COUNT(*) FROM tbl_reg", connection))
                {
                    int userCount = (int)command.ExecuteScalar();
                    userCountLabel.InnerText = userCount.ToString();
                }

                // Count staffCount
                using (SqlCommand command = new SqlCommand("SELECT COUNT(*) FROM tbl_staff", connection))
                {
                    int staffCount = (int)command.ExecuteScalar();
                    staffCountLabel.InnerText = staffCount.ToString();
                }

                // Count products
                using (SqlCommand command = new SqlCommand("SELECT COUNT(*) FROM tbl_add_pro", connection))
                {
                    int productCount = (int)command.ExecuteScalar();
                    productCountLabel.InnerText = productCount.ToString();
                }

                // Count orders
                using (SqlCommand command = new SqlCommand("SELECT COUNT(*) FROM tbl_order1", connection))
                {
                    int orderCount = (int)command.ExecuteScalar();
                    orderCountLabel.InnerText = orderCount.ToString();
                }

                // Count feedback
                using (SqlCommand command = new SqlCommand("SELECT COUNT(*) FROM tbl_feedback", connection))
                {
                    int feedbackCount = (int)command.ExecuteScalar();
                    feedbackCountLabel.InnerText = feedbackCount.ToString();
                }

                // Count completed payments
                using (SqlCommand command = new SqlCommand("SELECT SUM(total_amount) FROM tbl_payment WHERE payment_status = 'Completed'", connection))
                {
                    object completedPaymentObject = command.ExecuteScalar();
                    if (completedPaymentObject != null && completedPaymentObject != DBNull.Value)
                    {
                        decimal completedPaymentAmount = Convert.ToDecimal(completedPaymentObject);
                        completePaymentLabel.InnerText = completedPaymentAmount.ToString("C");
                    }
                    else
                    {
                        completePaymentLabel.InnerText = "₹ 0";
                    }
                }

                // Count pending payments
                using (SqlCommand command = new SqlCommand("SELECT SUM(total_amount) FROM tbl_payment WHERE payment_status = 'Incomplete'", connection))
                {
                    object pendingPaymentObject = command.ExecuteScalar();
                    if (pendingPaymentObject != null && pendingPaymentObject != DBNull.Value)
                    {
                        decimal pendingPaymentAmount = Convert.ToDecimal(pendingPaymentObject);
                        pendingPaymentLabel.InnerText = pendingPaymentAmount.ToString("C");
                    }
                    else
                    {
                        pendingPaymentLabel.InnerText = "₹ 0";
                    }
                }
            }

        }
    }
}