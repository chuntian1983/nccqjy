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
    public partial class jbtwo_view : System.Web.UI.Page
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


        
        protected void rep_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                //Label lbzzdw = (Label)e.Item.FindControl("lbzzdw");
                //Label lbcrfxm = (Label)e.Item.FindControl("lbcrfxm");
                Label lbzbzt = (Label)e.Item.FindControl("lbzbzt");
                lbzbzt.Style.Add("color", "red");
                //lbjbzt.Style.Add("color", "red");
                if (lbzbzt.Text == "0")
                {
                    lbzbzt.Text = "未中标";
                }
                else if (lbzbzt.Text == "1")
                {
                    lbzbzt.Text = "已中标";
                }
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

       

        protected void btnedit_Click(object sender, EventArgs e)
        {
            Response.Redirect("jbtwo.aspx");
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            BindDate();
        }
    }
}