using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Maticsoft.Common;
using Maticsoft.DBUtility;

namespace Web.Super.DZJJ
{
    public partial class jbtwo_add : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        //保存
        protected void Button1_Click(object sender, EventArgs e)
        {
            if (Request.QueryString["id"]!=null)
            {
                NCPEP.Model.T_Bid model = new NCPEP.Model.T_Bid();
                NCPEP.Dal.T_Bid dal = new NCPEP.Dal.T_Bid();
                model = dal.GetModel(int.Parse(Request.QueryString["id"]));
                model.Jbjzsj = System.DateTime.Now.AddMinutes(double.Parse(this.ddljjsj.SelectedValue)).ToString();
                model.Jbqbj = this.txtjjdj.Text;
                model.Jbzt = "1";
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