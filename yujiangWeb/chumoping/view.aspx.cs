using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web.chumoping
{
    public partial class view : System.Web.UI.Page
    {
        public string strid = "1";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {


                if (Request.QueryString["id"] != null)
                {
                    strid = Request.QueryString["id"];
                    NCPEP.Bll.T_News bll = new NCPEP.Bll.T_News();
                    NCPEP.Model.T_News model = new NCPEP.Model.T_News();
                    model = bll.GetModel(int.Parse(Request.QueryString["id"]));
                    if (model != null)
                    {
                        this.lbneirong.Text = model.NewsContent;
                        this.lbtitle.Text = model.NewsTitle;
                    }
                }
                if (Request.QueryString["type"]!=null)
                {
                    strid = Request.QueryString["type"];
                }
            }
        }
    }
}