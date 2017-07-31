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
using System.IO;

namespace Web.Super.WebMana
{
    public partial class editnews : System.Web.UI.Page
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
                BindData();
                
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
        private void BindData()
        {
            if (Request.QueryString["id"] != null)
            {
                NCPEP.Model.T_News model = new NCPEP.Model.T_News();
                NCPEP.Bll.T_News bll = new NCPEP.Bll.T_News();
                model = bll.GetModel(int.Parse(Request.QueryString["id"]));
                this.txtContent.Text = model.Content;
                this.txtKeyword.Text = model.Keyword;
                this.txtNewsSource.Text = model.NewsSource;
                this.txtNewsSubheading.Text = model.NewsSubheading;
                this.txtNewsTitle.Text = model.NewsTitle;
                this.txtNewsTypeId.Text = model.NewsTypeId.ToString();//新闻类型
                this.ddlzt.SelectedValue = model.ztbz;
                this.txtsj.Text = model.CreateDate.ToString("yyyy-MM-dd");
                this.content1.Value = model.NewsContent;
                this.HyperLink1.NavigateUrl = "../../newsimg/max/"+model.NewsImg;
                this.HyperLink1.Text = model.NewsImg;
                NCPEP.Bll.T_Fujian fjbll = new NCPEP.Bll.T_Fujian();
                DataSet ds = fjbll.GetList("fid='" + model.Id + "'");
                if (ds.Tables[0].Rows.Count > 0)
                {
                    this.repsfz.Visible = true;
                    this.repsfz.DataSource = ds;
                    this.repsfz.DataBind();
                }

            }
        }
        private void Bindfj()
        {
            if (Request.QueryString["id"] != null)
            {
                NCPEP.Model.T_News model = new NCPEP.Model.T_News();
                NCPEP.Bll.T_News bll = new NCPEP.Bll.T_News();
                model = bll.GetModel(int.Parse(Request.QueryString["id"]));
               
                NCPEP.Bll.T_Fujian fjbll = new NCPEP.Bll.T_Fujian();
                DataSet ds = fjbll.GetList("fid='" + model.Id + "'");
                if (ds.Tables[0].Rows.Count > 0)
                {
                    this.repsfz.Visible = true;
                    this.repsfz.DataSource = ds;
                    this.repsfz.DataBind();
                }

            }
        }

        protected void repsfz_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "del")
            {

                string strid = e.CommandArgument.ToString();
                NCPEP.Model.T_Fujian model = new NCPEP.Model.T_Fujian();
                NCPEP.Bll.T_Fujian bll = new NCPEP.Bll.T_Fujian();
                model = bll.GetModel(int.Parse(strid));
                if (model != null)
                {


                    
                    try
                    {
                        File.Delete(MapPath("../../newsfile/"+model.fjpath));
                    }
                    catch { }
                    bll.Delete(int.Parse(strid));
                    Bindfj();
                }

                
            }
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            NCPEP.Model.T_News model = new NCPEP.Model.T_News();
            NCPEP.Bll.T_News bll = new NCPEP.Bll.T_News();
            if (Request.QueryString["id"]!=null)
            {
                model = bll.GetModel(int.Parse(Request.QueryString["id"]));
            }
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
            
            bool fid = bll.Update(model);
            if (fid)
            {
                if (!string.IsNullOrEmpty(this.hdfile.Value) && !string.IsNullOrEmpty(this.hdfilename.Value))
                {
                    string[] strs = hdfile.Value.Split('|');
                    string[] strsname = hdfilename.Value.Split('|');
                    NCPEP.Bll.T_Fujian fjbll = new NCPEP.Bll.T_Fujian();
                    for (int i = 1; i < strs.Length; i++)
                    {
                        NCPEP.Model.T_Fujian fjmodel = new NCPEP.Model.T_Fujian();
                        fjmodel.fid = model.Id.ToString();
                        fjmodel.fjlx = "";
                        fjmodel.fjname = strsname[i];
                        fjmodel.fjpath = strs[i];
                        fjbll.Add(fjmodel);

                    }
                }
            }
            MessageBox.ShowAndRedirect(this, "修改成功", "newslist.aspx");

        }

        protected void btncanel_Click(object sender, EventArgs e)
        {
            Response.Redirect("newslist.aspx");
        }
    }
}