using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Xml;
using NCPEP.Bll;

namespace Web.Controls
{
    public partial class WebFoot : System.Web.UI.UserControl
    {
        public string OrgShortName = string.Empty;
        int num = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                OrgShortName = Application["OrgShortName"] as string;
                lblHost.Text = "南昌市农村综合产权交易中心";
                lblAdd.Text = Component.ReadXml("GovAddress").InnerText;
                lblTel.Text = Component.ReadXml("GovTel").InnerText;
                lblFiling.Text = Component.ReadXml("GovFiling").InnerText;
                if (Application["OnlineNumber"] != null)
                {
                    lblNumber.Text = Application["OnlineNumber"].ToString().Length < 6 ? Application["OnlineNumber"].ToString().PadLeft(6, '0') : Application["OnlineNumber"].ToString();
                }
                else
                {
                    lblNumber.Text = num.ToString().PadLeft(6, '0');
                }
            }
        }
    }
}