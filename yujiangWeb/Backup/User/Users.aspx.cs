using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using NCPEP.Model;
using NCPEP.Bll;

namespace Web.User
{
    public partial class Users : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            dynamic user = null;
            try
            {
                user = Session["UserSession"] as WebUserVeri;
                if (null == user)
                {
                    if (!string.IsNullOrEmpty(Request.Cookies["UserCookies"].Value))
                    {
                        user = new GetUserCookiesPlug().GetVeriUserCookies(Request.Cookies["UserCookies"]["UserSession"]);
                        Session["UserSession"] = user;

                    }
                }
            }
            catch
            {
                user = null;
            }
            if (null == user)
            {
                Response.Redirect("~/User/UsLogin.aspx", true);
            }
        }
    }
}