using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using NCPEP.Bll;
using NCPEP.Model;
using System.Data;
using System.Text;

namespace Web.chumoping
{
    public partial class newslist : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                BindDate();
            }
        }
        private void BindDate()
        {
            StringBuilder sb = new StringBuilder();
            sb.Append(" 1=1");

            NCPEP.Bll.T_News bll = new NCPEP.Bll.T_News();
            DataTable dt = new DataTable();
            if (Request.QueryString["type"] != null)
            {
                NCPEP.Bll.T_NewsType tbll = new NCPEP.Bll.T_NewsType();
                NCPEP.Model.T_NewsType tmodel = new NCPEP.Model.T_NewsType();
                tmodel = tbll.GetModel(int.Parse(Request.QueryString["type"]));
                this.lbtype.Text = tmodel.NewsTypeName;
                dt = bll.GetList("NewsTypeId='" + Request.QueryString["type"] + "'").Tables[0];
            }
            else
            {
                dt = bll.GetList("NewsTypeId='1'").Tables[0];
            }
            PagedDataSource ps = new PagedDataSource();
            ps.DataSource = dt.DefaultView;
            ps.AllowPaging = true;
            ps.PageSize = 11;
            this.pg.RecordCount = dt.Rows.Count;
            this.pg.PageSize = ps.PageSize;
            this.pg.UrlPageIndexName = "pg";
            if (!string.IsNullOrEmpty(hdpage.Value) && hdpage.Value != "1")
            {
                pg.CurrentPageIndex = int.Parse(hdpage.Value);
            }

            int sindex = (this.pg.CurrentPageIndex - 1) * this.pg.PageSize + 1;
            int eindex = this.pg.CurrentPageIndex * this.pg.PageSize;
            this.repnews.DataSource = ps;
            this.repnews.DataBind();


        }
        protected void Pager_PageChanged(object sender, EventArgs e)
        {
            hdpage.Value = "1";
            BindDate();
        }
    }
}