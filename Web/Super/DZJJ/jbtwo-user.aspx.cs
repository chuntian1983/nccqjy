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
    public partial class jbtwo_user : System.Web.UI.Page
    {
        NCPEP.Model.T_LiceTran model = new NCPEP.Model.T_LiceTran();
        protected void Page_Load(object sender, EventArgs e)
        {

            try
            {
                model = Session["jbyhm"] as NCPEP.Model.T_LiceTran;
                if (null == model)
                {
                    Response.Redirect("~/Super/loginuser.aspx", true);
                }
                else
                {

                }
            }
            catch
            {
                model = null;
            }
            if (null == model)
            {
                Response.Redirect("~/Super/loginuser.aspx", true);
            }
            if (!IsPostBack)
            {
                //BindDll();
                BindDate();

            }
        }

        //protected void BindDll()
        //{
        //    NCPEP.Bll.T_NewsType bll = new NCPEP.Bll.T_NewsType();
        //    DataTable dt = bll.GetAllList().Tables[0];
        //    this.ddlxwlx.DataSource = dt;
        //    this.ddlxwlx.DataTextField = "NewsTypeName";
        //    this.ddlxwlx.DataValueField = "Id";
        //    this.ddlxwlx.DataBind();
        //    this.ddlxwlx.Items.Insert(0, new ListItem("请选择"));
        //}
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
            if (!string.IsNullOrEmpty(this.TextBox1.Text))
            {
                sb.Append(" and NewsTitle like '%" + this.TextBox1.Text + "%'");
            }
            //if (this.DropDownList2.SelectedValue != "全部")
            //{
            //    sb.Append(" and IsCheck='" + this.DropDownList2.SelectedValue + "'");
            //}
            sb.Append("  and DepaStatus ='3' and StandardMode='3' and jbzt='1' or jbzt='3'");
            if (model.JBYhm != null)
            {
                sb.Append(" and jbyhm='" + model.JBYhm + "'");
            }
            NCPEP.Dal.T_Bid bll = new NCPEP.Dal.T_Bid();

            this.pg.RecordCount = bll.GetRecordCountByUser(sb.ToString());
            this.pg.PageSize = 10;
            this.pg.UrlPageIndexName = "pg";
            if (!string.IsNullOrEmpty(hdpage.Value) && hdpage.Value != "1")
            {
                pg.CurrentPageIndex = int.Parse(hdpage.Value);
            }

            int sindex = (this.pg.CurrentPageIndex - 1) * this.pg.PageSize + 1;
            int eindex = this.pg.CurrentPageIndex * this.pg.PageSize;

            DataSet ds = bll.GetListByPageByUser(sb.ToString(), "id desc", sindex, eindex);
            //DataSet ds = bll.GetList(this.AspNetPager1.PageSize, this.AspNetPager1.CurrentPageIndex, sb.ToString());
            this.rep.DataSource = ds;
            this.rep.DataBind();


        }
        protected void Pager_PageChanged(object sender, EventArgs e)
        {
            hdpage.Value = "1";
            BindDate();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("xmggadd.aspx");
        }

        protected void rep_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Label lbshzt = (Label)e.Item.FindControl("lbxmzt");
                // Label lbxwlx = (Label)e.Item.FindControl("lbxwlx");
                if (lbshzt.Text == "1")
                {
                    lbshzt.Text = "一次竞价中";
                }
                else if (lbshzt.Text == "3")
                {
                    lbshzt.Text = "二次竞价中";
                }
                else
                {
                    lbshzt.Text = "未竞价";
                }
                //NCPEP.Model.T_NewsType xwlxmodel = new NCPEP.Model.T_NewsType();
                //NCPEP.Bll.T_NewsType xwlxbll = new NCPEP.Bll.T_NewsType();
                //xwlxmodel = xwlxbll.GetModel(int.Parse(lbxwlx.Text));
                //if (xwlxmodel != null)
                //{
                //    lbxwlx.Text = xwlxmodel.NewsTypeName;
                //}
            }
        }

      
        //一次竞价
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

                Response.Redirect("jbtwo-useryici.aspx?st=" + sysID + "");
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
                MessageBox.Show(this, "请选择需要查看的项!");
            }
            else if (i > 1)
            {
                MessageBox.Show(this, "只能选择一项进行查看");
            }
            else
            {

                Response.Redirect("jbtwo-useryicijg.aspx?st=" + sysID + "");
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
                NCPEP.Bll.T_XMGG bll = new NCPEP.Bll.T_XMGG();
                NCPEP.Model.T_XMGG model = new NCPEP.Model.T_XMGG();
                model = bll.GetModel(int.Parse(sysID));
                if (model != null)
                {


                    model.xmby = "1";
                    if (bll.Update(model))
                    {
                        MessageBox.Show(this, "设置成功！");
                        BindDate();
                    }

                }

            }
        }

       

        protected void btnjieguo_Click(object sender, EventArgs e)
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
                Response.Redirect("jbtwo-useryiciview.aspx?st=" + sysID);

            }
        }

        protected void btnaddtwo_Click(object sender, EventArgs e)
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

                Response.Redirect("jbtwo-usertwo.aspx?st=" + sysID + "");
            }
        }
        //查看二次竞价价格
        protected void btnviewtwo_Click(object sender, EventArgs e)
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
                MessageBox.Show(this, "只能选择一项进行查看");
            }
            else
            {

                Response.Redirect("jbtwo-userjgtwo.aspx?st=" + sysID + "");
            }
        }

        protected void btnjgtwo_Click(object sender, EventArgs e)
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
                Response.Redirect("jbtwo-userviewtwo.aspx?st=" + sysID);

            }
        }
    }
}