using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using NCPEP.Model;
using NCPEP.Bll;

namespace Web.Super.Us
{
    public partial class UpPass : System.Web.UI.Page
    {
        public AdminUser adminUser = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            
            try
            {
                adminUser = Session["SuperAdminUserSession"] as AdminUser;
                if (null == adminUser)
                {
                    if (!string.IsNullOrEmpty(Request.Cookies["AdminCookies"].Value))
                    {
                        adminUser = new GetUserCookiesPlug().GetUserCookies(Request.Cookies["AdminCookies"]["SuperAdminUserCookies"]);
                        Session["SuperAdminUserSession"] = adminUser;
                    }
                }
                this.lbadminlogname.Text = adminUser.AdminLogName;
            }
            catch { }
            if (null == adminUser)
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "reload", " <script>parent.location.reload();</script>");
            }
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (this.lbadminlogname.Text == adminUser.AdminLogName && this.txtoldpass.Text == adminUser.AdminLogPass)
            {
                NCPEP.Model.T_AdminUser model = new NCPEP.Model.T_AdminUser();
                NCPEP.Bll.T_AdminUser bll = new NCPEP.Bll.T_AdminUser();
                model = bll.GetModel(adminUser.Id);
                model.AdminLogPass = this.TextBox1.Text.Trim();
                bll.Update(model);
                ClientScript.RegisterClientScriptBlock(this.GetType(), "reload", " <script>msgShow(\"提示\", \"修改成功\", \"info\");</script>");

            }
            else {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "reload", " <script>msgShow(\"提示\", \"原密码输入错误\", \"info\");</script>");

            }
        }
    }
}