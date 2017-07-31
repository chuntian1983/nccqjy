using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using NCPEP.Model;
using NCPEP.Bll;
using System.Data;
using Maticsoft.Common;

namespace Web.Super.WebMana
{
    public partial class yqadd : System.Web.UI.Page
    {
        AdminUser adminUser = new AdminUser();
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
            if (!IsPostBack)
            {
                if (Request.QueryString["id"]!=null)
                {
                    NCPEP.Bll.T_YQ bll = new NCPEP.Bll.T_YQ();
                    NCPEP.Model.T_YQ model = new NCPEP.Model.T_YQ();
                    model = bll.GetModel(int.Parse(Request.QueryString["id"]));
                    this.txtNewsSubheading.Text = model.yqlianjie;
                    this.txtNewsTitle.Text = model.yqname;
                    this.txtNewsTypeId.SelectedValue = model.yqleixing;
                }
            }
        }
        
        protected void Button1_Click(object sender, EventArgs e)
        {
            NCPEP.Model.T_YQ model = new NCPEP.Model.T_YQ();
            NCPEP.Bll.T_YQ bll = new NCPEP.Bll.T_YQ();
            if (Request.QueryString["id"]!=null)
            {
                model = bll.GetModel(int.Parse(Request.QueryString["id"]));
            }
            model.yqleixing = this.txtNewsTypeId.SelectedValue;
            model.yqlianjie = this.txtNewsSubheading.Text.Trim();
            model.yqname = this.txtNewsTitle.Text.Trim();
            if (Request.QueryString["id"] != null)
            {
                if (bll.Update(model))
                {
                    MessageBox.ShowAndRedirect(this, "更新成功", "yqlist.aspx");
                }
            }
            else
            {
                int fid = bll.Add(model);
                if (fid > 0)
                {
                    MessageBox.ShowAndRedirect(this, "保存成功", "yqlist.aspx");
                }
            }
            

        }

        protected void btncanel_Click(object sender, EventArgs e)
        {
            Response.Redirect("yqlist.aspx");
        }
    }
}