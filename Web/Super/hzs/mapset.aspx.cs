using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using NCPEP.Bll;
using NCPEP.Model;
using Maticsoft.Common;

namespace Web.Super.hzs
{
    public partial class mapset : System.Web.UI.Page
    {
        public string strname;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {


                if (Request.QueryString["st"] != null)
                {
                    string strid = Request.QueryString["st"];
                    NCPEP.Model.T_hzs model = new NCPEP.Model.T_hzs();
                    NCPEP.Bll.T_hzs bll = new NCPEP.Bll.T_hzs();
                    model = bll.GetModel(int.Parse(strid));
                    this.hdzb.Value = model.dizhi;
                    strname = model.mingcheng;
                    txtx.Text = model.zuobiaox;
                    txty.Text = model.zuobiaoy;

                }
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("list.aspx?pg="+Request.QueryString["pg"]+"");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (Request.QueryString["st"] != null)
            {
                string strid = Request.QueryString["st"];
                NCPEP.Model.T_hzs model = new NCPEP.Model.T_hzs();
                NCPEP.Bll.T_hzs bll = new NCPEP.Bll.T_hzs();
                model = bll.GetModel(int.Parse(strid));
                if (!string.IsNullOrEmpty(txtx.Text))
                {
                    model.zuobiaox = txtx.Text;
                }
                if (!string.IsNullOrEmpty(txty.Text))
                {
                    model.zuobiaoy = txty.Text;
                }
                bll.Update(model);
                MessageBox.ShowAndRedirect(this, "设置成功！", "list.aspx?pg="+Request.QueryString["pg"]+"");

            }
        }
    }
}