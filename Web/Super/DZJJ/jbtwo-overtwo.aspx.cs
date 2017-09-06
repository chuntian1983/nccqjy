using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Data;
using Maticsoft.Common;

namespace Web.Super.DZJJ
{
    public partial class jbtwo_overtwo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {

                BindDate();

            }
        }

        /// <summary>
        /// 初始绑定数据
        /// </summary>
        private void BindDate()
        {
            StringBuilder sb = new StringBuilder();
            sb.Append(" 1=1");
            //if (this.ddlxwlx.SelectedValue != "请选择")
            //{
            //    sb.Append(" and NewsTypeId='" + this.ddlxwlx.SelectedValue + "'");
            //}
            //if (!string.IsNullOrEmpty(this.TextBox1.Text))
            //{
            //    sb.Append(" and NewsTitle like '%" + this.TextBox1.Text + "%'");
            //}
            //if (this.DropDownList2.SelectedValue != "全部")
            //{
            //    sb.Append(" and IsCheck='" + this.DropDownList2.SelectedValue + "'");
            //}
            sb.Append(" and jbbs='2' and bid='" + Request.QueryString["id"] + "' ");
            NCPEP.Bll.T_JBTWO bll = new NCPEP.Bll.T_JBTWO();

            DataTable dt = bll.GetList(sb.ToString()).Tables[0];

            this.rep.DataSource = dt;
            this.rep.DataBind();


        }


        

        protected void rep_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                //Label lbzzdw = (Label)e.Item.FindControl("lbzzdw");
                //Label lbcrfxm = (Label)e.Item.FindControl("lbcrfxm");
                //Label lbjbzt = (Label)e.Item.FindControl("lbjbzt");
                //lbjbzt.Style.Add("color", "red");
                //if (lbjbzt.Text == "1")
                //{
                //    lbjbzt.Text = "竞标中";
                //}
                //else if (lbjbzt.Text == "2")
                //{
                //    lbjbzt.Text = "竞标完成";
                //}
                //else
                //{
                //    lbjbzt.Text = "未开始竞标";
                //}
                //NCPEP.Model.T_Organization modelo = new NCPEP.Model.T_Organization();
                //NCPEP.Bll.T_Organization bllo = new NCPEP.Bll.T_Organization();
                //modelo = bllo.GetModel(lbzzdw.Text);
                //if (modelo != null)
                //{
                //    lbzzdw.Text = modelo.OrgShortName;
                //}
                //NCPEP.Model.T_LiceTran modell = new NCPEP.Model.T_LiceTran();
                //NCPEP.Bll.T_LiceTran blll = new NCPEP.Bll.T_LiceTran();
                //modell = blll.GetModel(int.Parse(lbcrfxm.Text));
                //if (modell != null)
                //{
                //    lbcrfxm.Text = modell.Name;
                //}
            }
        }

    
        //返回
        protected void btnedit_Click(object sender, EventArgs e)
        {
            Response.Redirect("jbtwo.aspx");
        }
        //竞标结果选择
        protected void btnshenhe_Click(object sender, EventArgs e)
        {
            int i = 0;
            string sysID = string.Empty;
            foreach (RepeaterItem row in this.rep.Items)
            {
                if (row.ItemType == ListItemType.Item || row.ItemType == ListItemType.AlternatingItem)
                {
                    CheckBox chk = (CheckBox)row.FindControl("cbx");
                    Label lbid = (Label)row.FindControl("lbid");
                    if (chk.Checked)
                    {
                        i++;
                        sysID = lbid.Text;
                    }

                }


            }
            if (i == 0)
            {
                MessageBox.Show(this, "请选择需要竞标的项目!");
            }
            else if (i > 1)
            {
                MessageBox.Show(this, "只能选择一项进行设置");
            }
            else
            {
                NCPEP.Model.T_JBTWO model = new NCPEP.Model.T_JBTWO();
                NCPEP.Bll.T_JBTWO bll = new NCPEP.Bll.T_JBTWO();
                model = bll.GetModel(int.Parse(sysID));
                model.zbzt = "4";
                bll.Update(model);
                NCPEP.Model.T_BidTrans modelt = new NCPEP.Model.T_BidTrans();
                NCPEP.Bll.T_BidTrans bllt = new NCPEP.Bll.T_BidTrans();
                DataTable dt = bllt.GetList(" FK_BidId='" + Request.QueryString["id"] + "' and FK_LiceTranId='" + model.tid + "'").Tables[0];
                if (dt.Rows.Count > 0)
                {
                    modelt = bllt.GetModel(int.Parse(dt.Rows[0]["id"].ToString()));
                    modelt.TradingStatus = 1;
                    bllt.Update(modelt);
                }
                NCPEP.Bll.T_Bid bllb = new NCPEP.Bll.T_Bid();
                NCPEP.Model.T_Bid modelb = new NCPEP.Model.T_Bid();
                modelb = bllb.GetModel(int.Parse(Request.QueryString["id"]));
                modelb.Jbzt = "4";
                bllb.Update(modelb);
                MessageBox.ShowAndRedirect(this, "二次竞标完成", "jbtwo.aspx");
            }

        }
        

        protected void Button5_Click(object sender, EventArgs e)
        {
            BindDate();
        }

    }
}