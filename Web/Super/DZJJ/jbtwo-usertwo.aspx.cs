using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using NCPEP.Model;
using NCPEP.Bll;
using Maticsoft.Common;
using System.Data;

namespace Web.Super.DZJJ
{
    public partial class jbtwo_usertwo : System.Web.UI.Page
    {
        NCPEP.Model.T_Bid model = new NCPEP.Model.T_Bid();
        NCPEP.Bll.T_Bid bll = new NCPEP.Bll.T_Bid();
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                if (Request.QueryString["st"] != null)
                {
                    model = bll.GetModel(int.Parse(Request.QueryString["st"]));
                    if (model != null)
                    {
                        this.lbdijia.Text = model.Jbqbj;
                        this.lbjzsj.Text = model.Jbjzsj;
                        this.lbjzsj2.Text = model.Jbjzsj;
                        this.lbjzsj2.Style.Add("color", "red");
                        this.lbxmmc.Text = model.BidName;
                    }
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("jbtwo-user.aspx");
        }

        protected void btnsave_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(this.txtjingjiajg.Text))
            {
                MessageBox.Show(this, "请填写竞拍价格！");
                return;
            }
            else
            {
                decimal jbjg;
                try
                {
                    jbjg = decimal.Parse(this.txtjingjiajg.Text);
                }
                catch { MessageBox.Show(this, "竞拍价格请填写数字"); return; }
                decimal jbdj = decimal.Parse(this.lbdijia.Text);
                if (jbdj > jbjg)
                {
                    MessageBox.Show(this, "竞拍价格必须大于起价"); return;
                }
                DateTime dtjzsj = DateTime.Parse(this.lbjzsj.Text);
                if (DateTime.Now > dtjzsj)
                {
                    MessageBox.Show(this, "竞价截止时间已到，不能继续竞价！");
                    return;
                }
                NCPEP.Model.T_JBTWO jbmodel = new NCPEP.Model.T_JBTWO();
                jbmodel.bid = Request.QueryString["st"];
                jbmodel.jbbs = "0";
                jbmodel.jbdj = this.lbdijia.Text;
                jbmodel.jbjg = this.txtjingjiajg.Text;
                NCPEP.Model.T_LiceTran tmodel = new NCPEP.Model.T_LiceTran();
                tmodel = Session["jbyhm"] as NCPEP.Model.T_LiceTran;
                jbmodel.jbyhm = tmodel.JBYhm;
                jbmodel.tid = tmodel.Id.ToString();
                jbmodel.zbzt = "0";
                jbmodel.jbbs = "2";
                NCPEP.Bll.T_JBTWO jbbll = new NCPEP.Bll.T_JBTWO();
                DataTable dt = jbbll.GetList(" jbbs='2' and bid='" + Request.QueryString["st"] + "' and tid='" + tmodel.Id + "' and jbyhm='" + tmodel.JBYhm + "'").Tables[0];
                if (dt.Rows.Count > 0)
                {
                    foreach (DataRow item in dt.Rows)
                    {
                        jbbll.Delete(int.Parse(item["sid"].ToString()));
                    }
                }
                if (jbbll.Add(jbmodel) > 0)
                {
                    MessageBox.ShowAndRedirect(this, "二次竞价成功！", "jbtwo-user.aspx");
                    return;
                }
                else
                {
                    MessageBox.Show(this, "竞价失败！请联系管理员"); return;
                }
            }

        }
    }
}