using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Data;
using Maticsoft.Common;

namespace Web.Super.WebMana
{
    public partial class newslist : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (!IsPostBack)
            {
                BindDll();
                BindDate();
                
            }
        }
        protected void BindDll()
        {
            NCPEP.Bll.T_NewsType bll = new NCPEP.Bll.T_NewsType();
            DataTable dt = bll.GetAllList().Tables[0];
            this.ddlxwlx.DataSource = dt;
            this.ddlxwlx.DataTextField = "NewsTypeName";
            this.ddlxwlx.DataValueField = "Id";
            this.ddlxwlx.DataBind();
            this.ddlxwlx.Items.Insert(0, new ListItem("请选择"));
        }
        /// <summary>
        /// 初始绑定数据
        /// </summary>
        private void BindDate()
        {
            StringBuilder sb = new StringBuilder();
            sb.Append(" 1=1");
            if (this.ddlxwlx.SelectedValue != "请选择")
            {
                sb.Append(" and NewsTypeId='"+this.ddlxwlx.SelectedValue+"'");
            }
            if (!string.IsNullOrEmpty(this.TextBox1.Text))
            {
                sb.Append(" and NewsTitle like '%"+this.TextBox1.Text+"%'");
            }
            if (this.DropDownList2.SelectedValue!="全部")
            {
                sb.Append(" and IsCheck='"+this.DropDownList2.SelectedValue+"'");
            }
            NCPEP.Bll.T_News bll = new NCPEP.Bll.T_News();
            
            this.pg.RecordCount = bll.GetRecordCount(sb.ToString());
            this.pg.PageSize = 12;
            this.pg.UrlPageIndexName = "pg";
            if (!string.IsNullOrEmpty(hdpage.Value) && hdpage.Value != "1")
            {
                pg.CurrentPageIndex = int.Parse(hdpage.Value);
            }

            int sindex = (this.pg.CurrentPageIndex - 1) * this.pg.PageSize + 1;
            int eindex = this.pg.CurrentPageIndex * this.pg.PageSize;

            DataSet ds = bll.GetListByPage(sb.ToString(), "id desc", sindex, eindex);
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
            Response.Redirect("addnews.aspx");
        }

        protected void rep_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Label lbshzt = (Label)e.Item.FindControl("lbshzt");
                Label lbxwlx = (Label)e.Item.FindControl("lbxwlx");
                if (lbshzt.Text == "0")
                {
                    lbshzt.Text = "未审核";
                }
                else
                {
                    lbshzt.Text = "审核通过";
                }
                NCPEP.Model.T_NewsType xwlxmodel = new NCPEP.Model.T_NewsType();
                NCPEP.Bll.T_NewsType xwlxbll = new NCPEP.Bll.T_NewsType();
                xwlxmodel = xwlxbll.GetModel(int.Parse(lbxwlx.Text));
                if (xwlxmodel!=null)
                {
                    lbxwlx.Text = xwlxmodel.NewsTypeName;
                }
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
                MessageBox.Show(this, "请选择需要修改的项!");
            }
            else if (i > 1)
            {
                MessageBox.Show(this, "只能选择一项进行修改");
            }
            else
            {
               
              Response.Redirect("editnews.aspx?id=" + sysID + "");
            }
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
                        NCPEP.Bll.T_News bll = new NCPEP.Bll.T_News();
                        NCPEP.Model.T_News model = bll.GetModel(int.Parse(sysID));
                        model.IsCheck = 1;
                        bll.Update(model);
                    }

                }



            }
            if (i == 0)
            {
                MessageBox.Show(this, "请选择需要审核的项!");
            }
            else
            {
                MessageBox.Show(this, "已成功审核所选项!");
                BindDate();
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
                
                Response.Redirect("newsview.aspx?id=" + sysID + "");
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
                if (newsmodel!=null)
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