using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShoesShopSystem.customer
{
    public partial class Logout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //ScriptManager.RegisterStartupScript(this, GetType(), "custdelete", "alert('Logout Successfull !'); ", true);
            if (Session["user"] != null)
            {
                Session.Remove("user");
                Response.Redirect("/customer/Home1.aspx");
            }

            if (Session["admin"] != null)
            {
                Session.Remove("admin");
                Response.Redirect("/customer/Home1.aspx");
            }
        }
    }
}