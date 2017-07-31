using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Data;

namespace Web
{
    public partial class SearchList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                
                BindGpRep();
            }
        }
        protected void BindGpRep()
        {
            StringBuilder sb = new StringBuilder();
            sb.Append(" 1=1");
            string quyu, leibie, mianji, jiage;
            if (!string.IsNullOrEmpty(Request.QueryString["quyu"]))
            {
                quyu =HttpUtility.HtmlDecode( Request.QueryString["quyu"]);
                sb.Append(" and orgcode='"+quyu+"'");
            }
            if (!string.IsNullOrEmpty(Request.QueryString["leibie"]))
            {
                leibie =HttpUtility.HtmlDecode( Request.QueryString["leibie"]);
                sb.Append(" and Properties='"+leibie+"'");
            }
            if (!string.IsNullOrEmpty(Request.QueryString["mianji"]))
            {
                mianji = HttpUtility.HtmlDecode(Request.QueryString["mianji"].ToString());
                sb.Append(" and Admissibility = '" + mianji + "'");
            }
            if (!string.IsNullOrEmpty(Request.QueryString["jiage"]))
            {
                jiage = HttpUtility.HtmlDecode(Request.QueryString["jiage"].ToString());
                sb.Append(" and NoAssurance = '" + jiage + "'");
            }
            

            NCPEP.Bll.BidBll bll = new NCPEP.Bll.BidBll();
            this.pg.RecordCount = bll.GetRecordCount(sb.ToString());
            this.pg.PageSize = 15;
            this.pg.UrlPageIndexName = "pg";
            if (hdpage.Value != "1")
            {
                pg.CurrentPageIndex = int.Parse(hdpage.Value);
            }
            int sindex = (this.pg.CurrentPageIndex - 1) * this.pg.PageSize + 1;
            int eindex = this.pg.CurrentPageIndex * this.pg.PageSize;

            DataSet ds = bll.GetListByPage(sb.ToString(), "id", sindex, eindex);
            this.rep1.DataSource = ds;
            this.rep1.DataBind();
        }
        protected void Pager_PageChanged(object sender, EventArgs e)
        {
            hdpage.Value = "1";

            BindGpRep();

        }
    }
}