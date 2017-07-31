using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using NCPEP.Bll;
using System.Data;

namespace Web
{
    public partial class NewsDetails : System.Web.UI.Page
    {
        public string fjpath, fjname;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    int id = 0;
                    string t = Request.QueryString["ntid"];
                    try { id = int.Parse(Request.QueryString["id"]); }
                    catch { }
                    WebSiteBll webSite = new WebSiteBll();
                    dynamic model = webSite.GetNewsModel(id);
                    if (!string.IsNullOrEmpty(model.NewsTitle))
                    {
                        this.Title = model.NewsTitle;
                        this.MetaDescription = model.Content;
                        this.MetaKeywords = model.Keyword;
                        lbl_Details_NewsTypeName.InnerHtml = webSite.GetNewsTypeName(model.NewsTypeId);
                        lbl_Details_NewsTitleName.InnerHtml = model.NewsTitle;
                        lbl_Details_NewsTitle.InnerHtml = model.NewsTitle;
                        lbl_Details_NewsSource.InnerHtml = model.NewsSource;
                        lbl_Details_CreateDate.InnerHtml = model.CreateDate.ToString("yyyy年MM月dd日");
                        lbl_Details_NumClicks.InnerHtml = model.NumClicks.ToString();
                        lbl_Details_NewsContent.InnerHtml = model.NewsContent;
                        if (!string.IsNullOrEmpty(model.NewsImg))
                        {
                            img_Details_NewsImg.Src = "newsImg/max/" + model.NewsImg;                            
                            img_Details_NewsImg.Width = 900;
                        }
                        else
                        {
                            img_Details_NewsImg.Attributes.Add("style", "display:none");
                        }
                        NCPEP.Bll.T_Fujian fjbll = new T_Fujian();
                        DataSet ds = fjbll.GetList("fid='"+id+"'");
                        if (ds.Tables[0].Rows.Count>0)
                        {
                            this.repfujian.Visible = true;
                            this.repfujian.DataSource = ds;
                            this.repfujian.DataBind();
                        }
                        //if (!string.IsNullOrEmpty(model.NewsFile))
                        //{
                        //    fuj.Text = model.NewsFile;
                        //    fuj.NavigateUrl = "newsFile/" + model.NewsFile;
                            
                        //}
                        //else
                        //{
                        //    fuj.Visible = false;
                            
                        //}
                    }
                    else
                    {
                        lbl_Details_NewsContent.InnerHtml = "暂无数据！";
                    }
                }
                catch (Exception ex)
                {
                    SystemErrorPlug.ErrorRecord("时间:[" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "]类名:[" + this.GetType().Name + "],行号:[" + Component.GetLineNum().ToString() + "行],错误信息:[" + ex.Message + "]");
                }
            }
        }
    }
}