using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Maticsoft.Common;
using Maticsoft.DBUtility;
using System.Data;

namespace Web.Super.DZJJ
{
    public partial class jbtwo_addtwo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["id"]!=null)
                {
                    NCPEP.Model.T_JBTWO model = new NCPEP.Model.T_JBTWO();
                    NCPEP.Bll.T_JBTWO bll = new NCPEP.Bll.T_JBTWO();
                    DataTable dt = bll.GetList(" jbbs='1' and zbzt='1'").Tables[0];
                    if (dt.Rows.Count>0)
                    {
                        this.txtjjdj.Text = dt.Rows[0]["jbjg"].ToString();
                    }
                }
            }
        }
        //保存
        protected void Button1_Click(object sender, EventArgs e)
        {
            if (Request.QueryString["id"] != null)
            {
                NCPEP.Model.T_Bid model = new NCPEP.Model.T_Bid();
                NCPEP.Dal.T_Bid dal = new NCPEP.Dal.T_Bid();
                model = dal.GetModel(int.Parse(Request.QueryString["id"]));
                model.Jbjzsj = System.DateTime.Now.AddMinutes(double.Parse(this.ddljjsj.SelectedValue)).ToString();
                model.Jbqbj = this.txtjjdj.Text;
                model.Jbzt = "3";
                if (dal.Update(model))
                {
                    MessageBox.ShowAndRedirect(this, "设置成功", "jbtwo.aspx");
                }
                else
                {

                    MessageBox.Show(this, "设置失败");
                }
            }
        }

        protected void btncanel_Click(object sender, EventArgs e)
        {
            Response.Redirect("jbtwo.aspx");
        }
    }
}