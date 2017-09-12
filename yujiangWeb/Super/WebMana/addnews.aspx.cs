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
    public partial class addnews : System.Web.UI.Page
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
            }
        }
        protected void BindDll()
        {
            NCPEP.Bll.T_NewsType bll = new NCPEP.Bll.T_NewsType();
            DataTable dt = bll.GetAllList().Tables[0];
            this.txtNewsTypeId.DataSource = dt;
            this.txtNewsTypeId.DataTextField = "NewsTypeName";
            this.txtNewsTypeId.DataValueField = "Id";
            this.txtNewsTypeId.DataBind();
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            NCPEP.Model.T_News model = new NCPEP.Model.T_News();
            model.Content = content1.Value;
            try
            {
                model.CreateDate = DateTime.Parse(this.txtsj.Text);
            }
            catch { }
            model.Editor = adminUser.AdminName;
            model.IsCheck = 0;
            model.Keyword = this.txtKeyword.Text;
            model.NewsContent = this.content1.Value;
            model.Content = this.txtContent.Text;
            
            model.NewsImg = "";
            model.NewsSource = this.txtNewsSource.Text;
            model.NewsSubheading = this.txtNewsSubheading.Text;
            model.NewsTitle = this.txtNewsTitle.Text;
            try
            {
                model.NewsTypeId = int.Parse(this.txtNewsTypeId.SelectedValue);
            }
            catch { }
            if (fileNewsImg.HasFile)
            {
                string newsImgName = new UpLoadNewsImgPlug().UploadImg("147", "147");
                model.NewsImg = newsImgName == string.Empty ? fileNewsImg.FileName : newsImgName;
                
            }
            
            model.NumClicks = 0;
            model.OrgCode = adminUser.OrgCode;
            NCPEP.Bll.T_News bll = new NCPEP.Bll.T_News();
            int fid= bll.Add(model);
            if (fid>0)
            {
                if (!string.IsNullOrEmpty(this.hdfile.Value) && !string.IsNullOrEmpty(this.hdfilename.Value))
                {
                    string[] strs = hdfile.Value.Split('|');
                    string[] strsname = hdfilename.Value.Split('|');
                    NCPEP.Bll.T_Fujian fjbll = new NCPEP.Bll.T_Fujian();
                    for (int i = 1; i < strs.Length; i++)
                    {
                        NCPEP.Model.T_Fujian fjmodel = new NCPEP.Model.T_Fujian();
                        fjmodel.fid = fid.ToString();
                        fjmodel.fjlx = "";
                        fjmodel.fjname = strsname[i];
                        fjmodel.fjpath = strs[i];
                        fjbll.Add(fjmodel);

                    }
                }
            }
            MessageBox.ShowAndRedirect(this,"保存成功","newslist.aspx");
            
        }

        protected void btncanel_Click(object sender, EventArgs e)
        {
            Response.Redirect("newslist.aspx");
        }
    }
}