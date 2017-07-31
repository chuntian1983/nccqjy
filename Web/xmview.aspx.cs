using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using NCPEP.Bll;
using NCPEP.Model;

namespace Web
{
    public partial class xmview : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["id"] != null)
            {
                string id = Request.QueryString["id"];

                NCPEP.Model.T_XMGG model = new NCPEP.Model.T_XMGG();
                NCPEP.Bll.T_XMGG bll = new NCPEP.Bll.T_XMGG();
                model = bll.GetModel(int.Parse(id));
                if (model!=null)
                {
                    lblTitle.InnerText = model.xmtitle;
                    lblBidPlacardContent.InnerText = model.xmneirong;
                    NCPEP.Bll.T_Bid bllb = new NCPEP.Bll.T_Bid();
                    NCPEP.Model.T_Bid modelb = new NCPEP.Model.T_Bid();
                    modelb = bllb.GetModel(model.bid);
                    lblBidName.InnerText = modelb.BidName;
                    lblReleaseTime.InnerText = model.xmsj;
                }


            }

        }
    }
}