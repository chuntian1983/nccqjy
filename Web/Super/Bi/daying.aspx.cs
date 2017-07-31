using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using NCPEP.Bll;
using NCPEP.Model;
using System.Data;

namespace Web.Super.Bi
{
    public partial class daying : System.Web.UI.Page
    {
        public string nian = string.Empty;
        public string yue = string.Empty;
        public string ri = string.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {
            nian = System.DateTime.Now.Year.ToString();
            yue = System.DateTime.Now.Month.ToString();
            ri = DateTime.Now.Day.ToString();
            if (Request.QueryString["id"] != null)
            {
                NCPEP.Bll.T_Jzs bll = new NCPEP.Bll.T_Jzs();
                DataTable dt = bll.GetList("binid='" + Request.QueryString["id"] + "'").Tables[0];
                if (dt.Rows.Count > 0)
                {
                    this.lbbeizhu.Text = dt.Rows[0]["beizhu"].ToString();
                    this.lbcjje.Text = dt.Rows[0]["cjje"].ToString();
                    this.lbhtbh.Text = dt.Rows[0]["htbh"].ToString();
                    this.lbzcqx.Text = "自" + DateTime.Parse(dt.Rows[0]["zcdate"].ToString()).ToString("yyyy年MM月dd日") + "起 至" + DateTime.Parse(dt.Rows[0]["zcdatez"].ToString()).ToString("yyyy年MM月dd日") + "止";
                }
            }
        }
    }
}