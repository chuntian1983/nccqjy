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
    public partial class PlacardDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    int id = 0;
                    try { id = int.Parse(Request.QueryString["id"]); }
                    catch { }
                    dynamic webSite = new WebSiteBll();
                    dynamic dTable = webSite.GetPlacardModel(id);
                    if (!string.IsNullOrEmpty(dTable.Rows[0]["BidPlacardTitle"].ToString()))
                    {
                        lblTitle.InnerHtml = dTable.Rows[0]["BidPlacardTitle"].ToString();
                        lblBidPlacardTitle.InnerHtml = dTable.Rows[0]["BidPlacardTitle"].ToString();
                        lblBidName.InnerHtml = webSite.GetBidModel(Convert.ToInt32(dTable.Rows[0]["FK_BidId"].ToString())).BidName;
                        lblReleaseTime.InnerHtml = Convert.ToDateTime(dTable.Rows[0]["ReleaseTime"]).ToString("yyyy年MM月dd日");
                        lblBidPlacardContent.InnerHtml = dTable.Rows[0]["BidPlacardContent"].ToString();
                    }
                    else
                    {
                        lblBidPlacardContent.InnerHtml = "暂无数据！";
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