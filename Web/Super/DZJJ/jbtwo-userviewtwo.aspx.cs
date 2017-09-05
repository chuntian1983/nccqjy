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
    public partial class jbtwo_userviewtwo : System.Web.UI.Page
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
            //if (!string.IsNullOrEmpty(this.TextBox1.Text))
            //{
            //    sb.Append(" and NewsTitle like '%" + this.TextBox1.Text + "%'");
            //}
            //if (this.DropDownList2.SelectedValue != "全部")
            //{
            //    sb.Append(" and IsCheck='" + this.DropDownList2.SelectedValue + "'");
            //}
            sb.Append(" and jbbs='2' and bid='" + Request.QueryString["st"] + "' ");
            NCPEP.Bll.T_JBTWO bll = new NCPEP.Bll.T_JBTWO();

            DataTable dt = bll.GetList(sb.ToString()).Tables[0];

            this.rep.DataSource = dt;
            this.rep.DataBind();


        }


        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("jbtwo-user.aspx");
        }

        protected void rep_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
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
                //NCPEP.Model.T_NewsType xwlxmodel = new NCPEP.Model.T_NewsType();
                //NCPEP.Bll.T_NewsType xwlxbll = new NCPEP.Bll.T_NewsType();
                //xwlxmodel = xwlxbll.GetModel(int.Parse(lbxwlx.Text));
                //if (xwlxmodel != null)
                //{
                //    lbxwlx.Text = xwlxmodel.NewsTypeName;
                //}
            }
        }

        
    }
}