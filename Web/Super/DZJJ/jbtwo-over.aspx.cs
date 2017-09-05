﻿using System;
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
    public partial class jbtwo_over : System.Web.UI.Page
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
            sb.Append(" and jbbs='1' and bid='" + Request.QueryString["id"] + "' ");
            NCPEP.Bll.T_JBTWO bll = new NCPEP.Bll.T_JBTWO();

            DataTable dt = bll.GetList(sb.ToString()).Tables[0];

            this.rep.DataSource = dt;
            this.rep.DataBind();


        }


        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("addnews.aspx");
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

        protected void btndel_Click(object sender, EventArgs e)
        {
            int i = 0;
            string sysID = string.Empty;
            NCPEP.Bll.T_News bll = new NCPEP.Bll.T_News();

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
                        bll.Delete(int.Parse(sysID));

                    }

                }


            }
            if (i == 0)
            {
                MessageBox.Show(this, "请选择需要删除的项!");
            }
            else
            {
                MessageBox.Show(this, "已成功删除所选项!");
                BindDate();
            }
        }

        protected void btnedit_Click(object sender, EventArgs e)
        {
            Response.Redirect("jbtwo.aspx");
        }

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
                model.zbzt = "1";
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
                modelb.Jbzt = "2";
                bllb.Update(modelb);
                MessageBox.ShowAndRedirect(this, "一次竞标完成", "jbtwo.aspx");
            }

        }

        protected void btnview_Click(object sender, EventArgs e)
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

                Response.Redirect("jbtwo-over.aspx?id=" + sysID + "");
            }
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            BindDate();
        }

        protected void btnnotice_Click(object sender, EventArgs e)
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
                MessageBox.Show(this, "请选择需要操作的项!");
            }
            else if (i > 1)
            {
                MessageBox.Show(this, "只能选择一项进行操作");
            }
            else
            {
                NCPEP.Bll.T_News newsbll = new NCPEP.Bll.T_News();
                NCPEP.Model.T_News newsmodel = new NCPEP.Model.T_News();
                newsmodel = newsbll.GetModel(int.Parse(sysID));
                if (newsmodel != null)
                {
                    if (newsmodel.NewsTypeId != 9)
                    {
                        MessageBox.Show(this, "请选择通知公告类型的信息进行设置！");
                    }
                    else
                    {
                        NCPEP.Bll.T_Notice bllnotice = new NCPEP.Bll.T_Notice();
                        NCPEP.Model.T_Notice modelnotice = new NCPEP.Model.T_Notice();
                        modelnotice.newsid = sysID;
                        if (bllnotice.Add(modelnotice) > 0)
                        {
                            MessageBox.Show(this, "设置成功！");
                        }
                    }
                }

            }
        }

        protected void btnquxiao_Click(object sender, EventArgs e)
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
                MessageBox.Show(this, "请选择需要查看的项!");
            }
            else if (i > 1)
            {
                MessageBox.Show(this, "只能选择一项进行操作");
            }
            else
            {
                NCPEP.Bll.T_News newsbll = new NCPEP.Bll.T_News();
                NCPEP.Model.T_News newsmodel = new NCPEP.Model.T_News();
                newsmodel = newsbll.GetModel(int.Parse(sysID));
                if (newsmodel != null)
                {
                    if (newsmodel.NewsTypeId != 9)
                    {
                        MessageBox.Show(this, "请选择通知公告类型的信息进行设置！");
                    }
                    else
                    {
                        NCPEP.Bll.T_Notice bllnotice = new NCPEP.Bll.T_Notice();


                        if (bllnotice.DeleteNotice(sysID))
                        {
                            MessageBox.Show(this, "取消成功！");
                        }
                    }
                }

            }
        }
    }
}