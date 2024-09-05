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
    public partial class WebForm12 : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=HPPAVILION5600\\SQLEXPRESS;Initial Catalog=db_shoes_shop;Integrated Security=True;Encrypt=False");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGridView();
            }
        }
        private void BindGridView()
        {
            string connectionString = "Data Source=HPPAVILION5600\\SQLEXPRESS;Initial Catalog=db_shoes_shop;Integrated Security=True;Encrypt=False";
            string query = "SELECT * FROM tbl_staff";
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        GridView2.DataSource = dt;
                        GridView2.DataBind();
                    }
                }
            }
        }
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            LinkButton btnDelete = (LinkButton)sender;

            // Get the ID from the CommandArgument property
            int customerId = Convert.ToInt32(btnDelete.CommandArgument);

            // Call the DeleteCustomer method with the customerId
            DeleteCustomer(customerId);
        }
        private void DeleteCustomer(int customerId)
        {
            string deleteQuery = "DELETE FROM tbl_staff WHERE id = @r_id";

            using (con)
            {
                con.Open();

                using (SqlCommand cmd = new SqlCommand(deleteQuery, con))
                {
                    cmd.Parameters.AddWithValue("@r_id", customerId);
                    int result = cmd.ExecuteNonQuery();

                    if (result > 0)
                    {
                        ScriptManager.RegisterStartupScript(this, GetType(), "custdelete", "alert('Staff Member has been Removed !'); window.location ='/Admin/view_staff.aspx';", true);
                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "error", "alert('Error While Deleting Customer!');", true);
                    }
                }
            }
        }
        protected void GridView2_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.EmptyDataRow)
            {
                e.Row.Cells[0].ColumnSpan = GridView2.Columns.Count;
                e.Row.Cells[0].Text = "No Staff Yet !";
                e.Row.Cells[0].HorizontalAlign = HorizontalAlign.Left;
            }
        }
        protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
        {
             
        }
    }
}