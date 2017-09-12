using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;

namespace Web.chumoping
{
    public partial class gplist : System.Web.UI.Page
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

            NCPEP.Bll.T_Bid bll = new NCPEP.Bll.T_Bid();

            this.pg.RecordCount = bll.GetRecordCount(sb.ToString(), "View_Bid");
            this.pg.PageSize = 11;
            this.pg.UrlPageIndexName = "pg";
            if (!string.IsNullOrEmpty(hdpage.Value) && hdpage.Value != "1")
            {
                pg.CurrentPageIndex = int.Parse(hdpage.Value);
            }

            int sindex = (this.pg.CurrentPageIndex - 1) * this.pg.PageSize + 1;
            int eindex = this.pg.CurrentPageIndex * this.pg.PageSize;

            DataSet ds = bll.GetListByPage(sb.ToString(), "id desc", sindex, eindex, "View_Bid");
            //DataSet ds = bll.GetList(this.AspNetPager1.PageSize, this.AspNetPager1.CurrentPageIndex, sb.ToString());
            this.repgp.DataSource = ds;
            this.repgp.DataBind();


        }
        protected void Pager_PageChanged(object sender, EventArgs e)
        {
            hdpage.Value = "1";
            BindDate();
        }
    }
}