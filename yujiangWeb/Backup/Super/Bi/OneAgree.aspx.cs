using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using NCPEP.Model;
using NCPEP.Bll;

namespace Web.Super.Bi
{
    public partial class OneAgree : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {           
            dynamic adminUser = null;
            try
            {
                adminUser = Session["SuperAdminUserSession"] as AdminUser;
                if (null == adminUser)
                {
                    if (!string.IsNullOrEmpty(Request.Cookies["AdminCookies"].Value))
                    {
                        adminUser = new GetUserCookiesPlug().GetUserCookies(Request.Cookies["AdminCookies"]["SuperAdminUserSession"]);
                        Session["SuperAdminUserSession"] = adminUser;
                    }
                }
            }
            catch
            {
                adminUser = null;
            }
            if (null == adminUser)
            {
                 ClientScript.RegisterClientScriptBlock(this.GetType(), "reload", " <script>parent.location.reload();</script>");
            }
        }
    }
}