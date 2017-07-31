using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using NCPEP.Bll;

namespace Web.Super.rg
{
    public partial class rg : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                this.TextBox2.Text = System.DateTime.Now.ToString("yyyy-MM-dd");
                this.TextBox3.Text = DateTime.Now.AddMonths(1).ToString("yyyy-MM-dd");
                if (Session["rg"] != null)
                {
                    if (Session["rg"].ToString() == "woshiwanghao")
                    {
                        this.Button1.Enabled = true;
                    }
                }
                else
                {
                    this.Button1.Enabled = false;
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            string strjqm = this.TextBox1.Text.Trim();
            string strkssj = this.TextBox2.Text.Trim();
            string strjssj = this.TextBox3.Text.Trim();
            string strall = strjqm + "|" + strkssj + "|" + strjssj;
            this.TextBox4.Text = NCPEP.Bll.DESEncrypt.Encrypt(strall);
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            if (this.TextBox5.Text.Trim()=="woshiwanghao")
            {
                Session["rg"] = "woshiwanghao";
                this.Button1.Enabled = true;
            }
        }
    }
}