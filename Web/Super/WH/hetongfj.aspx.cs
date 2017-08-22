using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using NCPEP.Dal;
using System.Data;
using Maticsoft.Common;
using NCPEP.Model;
using NCPEP.Bll;
using System.IO;
using Maticsoft.DBUtility;

namespace Web.Super.WH
{
    public partial class BidClinchScan : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindFujian(Request.QueryString["p"]);
            }
        }
        protected void BindFujian(string strid)
        {
            NCPEP.Bll.T_FujianBiao bllfujian = new NCPEP.Bll.T_FujianBiao();
            string strsql = "select * from T_BidContractScan where FK_BidId='"+strid+"'";
            DataTable dtfujian = DbHelperSQL.Query(strsql).Tables[0];
            if (dtfujian.Rows.Count > 0)
            {
                this.GridView1.DataSource = dtfujian;

                this.GridView1.DataBind();
            }
            else { this.Label2.Text = "暂无数据"; }
        }
    }
}