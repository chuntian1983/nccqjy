using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web.Super.WebMana
{
    public partial class xmggview : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["id"] != null)
                {
                    NCPEP.Model.T_XMGG model = new NCPEP.Model.T_XMGG();
                    NCPEP.Bll.T_XMGG bll = new NCPEP.Bll.T_XMGG();
                    model = bll.GetModel(int.Parse(Request.QueryString["id"]));
                    if (model != null)
                    {
                        this.lbxmmc.Text = model.bid.ToString();
                        NCPEP.Model.T_Bid modelb = new NCPEP.Model.T_Bid();
                        NCPEP.Bll.T_Bid bllb = new NCPEP.Bll.T_Bid();
                        modelb = bllb.GetModel(model.bid);
                        this.lbxmmc.Text = modelb.BidName;
                        this.txtNewsTitle.Text = model.xmtitle;
                        this.txtsj.Text = model.xmsj;
                        this.lbconten.Text = model.xmneirong;
                    }
                }

            }
        }

        protected void btncanel_Click(object sender, EventArgs e)
        {
            Response.Redirect("xmgglist.aspx");
        }
    }
}