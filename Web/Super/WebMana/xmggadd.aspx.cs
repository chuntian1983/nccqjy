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
    public partial class xmggadd : System.Web.UI.Page
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
                BindDll();
                if (Request.QueryString["id"]!=null)
                {
                    NCPEP.Model.T_XMGG model = new NCPEP.Model.T_XMGG();
                    NCPEP.Bll.T_XMGG bll = new NCPEP.Bll.T_XMGG();
                    model = bll.GetModel(int.Parse(Request.QueryString["id"]));
                    if (model!=null)
                    {
                        this.txtNewsTypeId.SelectedValue = model.bid.ToString();
                        this.txtNewsTitle.Text = model.xmtitle;
                        this.txtsj.Text = model.xmsj;
                        this.content1.Value = model.xmneirong;
                    }
                }
            }
        }
        protected void BindDll()
        {
            NCPEP.Bll.T_Bid bll = new NCPEP.Bll.T_Bid();
            DataTable dt = bll.GetList(" DepaStatus<6").Tables[0];
            this.txtNewsTypeId.DataSource = dt;
            this.txtNewsTypeId.DataTextField = "bidname";
            this.txtNewsTypeId.DataValueField = "Id";
            this.txtNewsTypeId.DataBind();
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            NCPEP.Bll.T_XMGG bll = new NCPEP.Bll.T_XMGG();
            NCPEP.Model.T_XMGG model = new NCPEP.Model.T_XMGG();
            if (Request.QueryString["id"]!=null)
            {
                model = bll.GetModel(int.Parse(Request.QueryString["id"]));
            }
            model.bid = int.Parse(this.txtNewsTypeId.SelectedValue);
            model.xmby = "0";
            model.xmneirong = this.content1.Value;
            try
            {
                model.xmsj = DateTime.Parse(this.txtsj.Text).ToString("yyyy-MM-dd");
            }
            catch { }

            model.xmtitle = this.txtNewsTitle.Text.Trim();

            if (Request.QueryString["id"] != null)
            {
                if (bll.Update(model))
                {
                    MessageBox.ShowAndRedirect(this, "更新成功", "xmgglist.aspx");
                }
            }
            else
            {
                int fid = bll.Add(model);
                if (fid > 0)
                {
                    MessageBox.ShowAndRedirect(this, "保存成功", "xmgglist.aspx");
                }
            }
            

        }

        protected void btncanel_Click(object sender, EventArgs e)
        {
            Response.Redirect("xmgglist.aspx");
        }
    }
}