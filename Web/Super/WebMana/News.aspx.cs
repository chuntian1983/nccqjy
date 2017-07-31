using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using NCPEP.Model;
using NCPEP.Bll;

namespace Web.Super.WebMana
{
    public partial class News : System.Web.UI.Page
    {
        dynamic adminUser = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            
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

        protected void Button1_Click(object sender, EventArgs e)
        {
            NCPEP.Model.T_News model = new NCPEP.Model.T_News();
            model.Content = Request.Form["Content"];
            try
            {
                model.CreateDate = DateTime.Parse(Request.Form["txtshijian"]);
            }
            catch { }
            model.Editor = "";
            model.IsCheck = 0;
            model.Keyword = Request.Form["Keyword"];
            model.NewsContent = Request.Form["NewsContent"];
            model.NewsFile = "";
            model.NewsImg = "";
            model.NewsSource = "";
            model.NewsSubheading = "";
            model.NewsTitle = Request.Form["NewsTitle"];
            try
            {
                model.NewsTypeId = int.Parse(Request.Form["NewsTypeId"]);
            }
            catch { }
            model.NumClicks = 0;
            model.OrgCode = adminUser.OrgCode;
            NCPEP.Bll.T_News bll = new NCPEP.Bll.T_News();
            bll.Add(model);
            ClientScript.RegisterStartupScript(this.GetType(), "myscript", "<script>MyFun();</script>");
        }
    }
}