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

namespace Web.Super.DZJJ
{
    public partial class yxsrf : System.Web.UI.Page
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

            string strsql = "select * from T_LiceTran where id in (select FK_LiceTranId from T_BidTrans where FK_BidId='" + strid + "')";
            DataTable dtfujian = DbHelperSQL.Query(strsql).Tables[0];
            if (dtfujian.Rows.Count > 0)
            {
                this.GridView1.DataSource = dtfujian;

                this.GridView1.DataBind();
            }
            else { this.Label2.Text = "暂无数据"; }
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)//判定当前的行是否属于datarow类型的行
            {
                Label lborg = (Label)e.Row.FindControl("lborg");
                Label lbjjlx = (Label)e.Row.FindControl("lbjjlx");
                NCPEP.Model.T_Organization modelorg = new NCPEP.Model.T_Organization();
                NCPEP.Bll.T_Organization bllorg = new NCPEP.Bll.T_Organization();
                modelorg = bllorg.GetModel(lborg.Text);
                if (modelorg!=null)
                {
                    lborg.Text = modelorg.OrgShortName;
                }
                string strsql = "select TypeCertificationName from T_MemberTypeCertification where id='"+lbjjlx.Text+"'";
                DataTable dt = DbHelperSQL.Query(strsql).Tables[0];
                if (dt.Rows.Count>0)
                {
                    lbjjlx.Text = dt.Rows[0]["TypeCertificationName"].ToString();
                }
            }
        }
    }
}