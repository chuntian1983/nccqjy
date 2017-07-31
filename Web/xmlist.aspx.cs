using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Data;
using NCPEP.Bll;

namespace Web
{
    public partial class xmlist : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            BindDate();
        }
        protected void Pager_PageChanged(object sender, EventArgs e)
        {
            hdpage.Value = "1";
            BindDate();
        }
        /// <summary>
        /// 初始绑定数据
        /// </summary>
        private void BindDate()
        {
            StringBuilder sb = new StringBuilder();
            sb.Append(" 1=1");
            //sb.Append(" and DepaStatus='2'");
            sb.Append(" and xmby='1'");
            NCPEP.Bll.T_XMGG bll = new T_XMGG();

            this.pg.RecordCount = bll.GetRecordCount(sb.ToString());
            this.pg.PageSize = 12;
            this.pg.UrlPageIndexName = "pg";
            if (!string.IsNullOrEmpty(hdpage.Value) && hdpage.Value != "1")
            {
                pg.CurrentPageIndex = int.Parse(hdpage.Value);
            }

            int sindex = (this.pg.CurrentPageIndex - 1) * this.pg.PageSize + 1;
            int eindex = this.pg.CurrentPageIndex * this.pg.PageSize;

            DataSet ds = bll.GetListByPage(sb.ToString(), "id desc", sindex, eindex);
            //DataSet ds = bll.GetList(this.AspNetPager1.PageSize, this.AspNetPager1.CurrentPageIndex, sb.ToString());
            this.rep.DataSource = ds;
            this.rep.DataBind();


        }
        public string GetLXname(string lxid)
        {
            NCPEP.Bll.T_PropertyType bll = new T_PropertyType();
            NCPEP.Model.T_PropertyType model = new NCPEP.Model.T_PropertyType();
            model = bll.GetModel(int.Parse(lxid));
            return model.PropertyTypeName;
        }
    }
}