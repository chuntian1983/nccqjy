using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;
using Maticsoft.Common;
using NCPEP.Bll;
using NCPEP.Model;

namespace Web.Super.hzs
{
    public partial class list : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindDate();
            }
        }
        //搜索
        protected void Button5_Click(object sender, EventArgs e)
        {

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
            
            NCPEP.Bll.T_hzs bll = new NCPEP.Bll.T_hzs();
            this.pg.RecordCount = bll.GetRecordCount(sb.ToString());
            this.pg.PageSize = 10;
            this.pg.UrlPageIndexName = "pg";
            if (!string.IsNullOrEmpty(hdpage.Value) && hdpage.Value == "1")
            {
                if (Request.QueryString["pg"] != null)
                {
                    pg.CurrentPageIndex = int.Parse(Request.QueryString["pg"]);
                }
            }
            int sindex = (this.pg.CurrentPageIndex - 1) * this.pg.PageSize + 1;
            int eindex = this.pg.CurrentPageIndex * this.pg.PageSize;

            DataSet ds = bll.GetListByPage(sb.ToString(), "id asc", sindex, eindex);
            //DataSet ds = bll.GetList(this.AspNetPager1.PageSize, this.AspNetPager1.CurrentPageIndex, sb.ToString());
            this.rep.DataSource = ds;
            this.rep.DataBind();


        }
        protected void Pager_PageChanged(object sender, EventArgs e)
        {
            hdpage.Value = "2";
            BindDate();
        }
        protected void rep_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Label lbshzt = (Label)e.Item.FindControl("lbxmzt");
                // Label lbxwlx = (Label)e.Item.FindControl("lbxwlx");
                //if (lbshzt.Text == "1")
                //{
                //    lbshzt.Text = "竞价中";
                //}
                //else
                //{
                //    lbshzt.Text = "未竞价";
                //}
                //NCPEP.Model.T_NewsType xwlxmodel = new NCPEP.Model.T_NewsType();
                //NCPEP.Bll.T_NewsType xwlxbll = new NCPEP.Bll.T_NewsType();
                //xwlxmodel = xwlxbll.GetModel(int.Parse(lbxwlx.Text));
                //if (xwlxmodel != null)
                //{
                //    lbxwlx.Text = xwlxmodel.NewsTypeName;
                //}
            }
        }
        protected void btnedit_Click(object sender, EventArgs e)
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
                //ClientScript.RegisterClientScriptBlock(this.GetType(), "dd", " <script>$(\".alert\").alert()</script>");
            }
            else if (i > 1)
            {
                MessageBox.Show(this, "只能选择一项进行竞标");
                //ClientScript.RegisterClientScriptBlock(this.GetType(), "dd", " <script>$(\".alert\").alert()</script>");
            }
            else
            {

                Response.Redirect("oneagreeuserjb.aspx?st=" + sysID + "");
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

        }

        protected void btndel_Click(object sender, EventArgs e)
        {

        }

        protected void btnjieguo_Click(object sender, EventArgs e)
        {

        }

        protected void btnmap_Click(object sender, EventArgs e)
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
                MessageBox.Show(this, "请选择需要设置的项目!");
                //ClientScript.RegisterClientScriptBlock(this.GetType(), "dd", " <script>$(\".alert\").alert()</script>");
            }
            else if (i > 1)
            {
                MessageBox.Show(this, "只能选择一项进行设置");
                //ClientScript.RegisterClientScriptBlock(this.GetType(), "dd", " <script>$(\".alert\").alert()</script>");
            }
            else
            {

                Response.Redirect("mapset.aspx?st=" + sysID + "&pg=" + this.pg.CurrentPageIndex + "");
            }
        }
    }
}