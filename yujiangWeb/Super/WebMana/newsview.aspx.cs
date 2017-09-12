using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Web.Super.WebMana
{
    public partial class newsview : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["id"]!=null)
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
                this.txtsj.Text = model.CreateDate.ToString("yyyy-MM-dd");
                this.content1.Text = model.NewsContent;
                this.fileNewsImg.ImageUrl = "../../newsimg/max/" + model.NewsImg;
                NCPEP.Bll.T_Fujian fjbll = new NCPEP.Bll.T_Fujian();
                DataSet ds = fjbll.GetList("fid='"+model.Id+"'");
                if (ds.Tables[0].Rows.Count>0)
                {
                    this.repfujian.Visible = true;
                    this.repfujian.DataSource = ds;
                    this.repfujian.DataBind();
                }
                
            }
        }

        protected void btncanel_Click(object sender, EventArgs e)
        {
            Response.Redirect("newslist.aspx");
        }
    }
}