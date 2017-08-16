using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using NCPEP.Model;
using NCPEP.Bll;
using System.Data;
using Maticsoft.Common;
using System.IO;
using NCPEP.Dal;

namespace Web.Super.DZJJ
{
    public partial class jbone_add : System.Web.UI.Page
    {
        AdminUser adminUser = new AdminUser();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                adminUser = Session["SuperAdminUserSession"] as AdminUser;
                if (null == adminUser)
                {
                    if (!string.IsNullOrEmpty(Request.Cookies["AdminCookies"].Value))
                    {
                        adminUser = new GetUserCookiesPlug().GetUserCookies(Request.Cookies["AdminCookies"]["SuperAdminUserSession"]);
                        Session["SuperAdminUserSession"] = adminUser;
                    }
                }
            }
            catch
            {
                adminUser = null;
            }
            if (null == adminUser)
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "reload", " <script>parent.location.reload();</script>");
            }
            if (!IsPostBack)
            {
                BindDll();
                BindData();

            }

        }
        protected void BindDll()
        {
            
        }
        private void BindData()
        {
            if (Request.QueryString["id"] != null)
            {

            }
        }
        private void Bindfj()
        {
            
        }

        protected void repsfz_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "del")
            {

                string strid = e.CommandArgument.ToString();
                NCPEP.Model.T_Fujian model = new NCPEP.Model.T_Fujian();
                NCPEP.Bll.T_Fujian bll = new NCPEP.Bll.T_Fujian();
                model = bll.GetModel(int.Parse(strid));
                if (model != null)
                {



                    try
                    {
                        File.Delete(MapPath("../../newsfile/" + model.fjpath));
                    }
                    catch { }
                    bll.Delete(int.Parse(strid));
                    Bindfj();
                }


            }
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            NCPEP.Model.T_Bid model = new NCPEP.Model.T_Bid();
            NCPEP.Dal.T_Bid dal = new NCPEP.Dal.T_Bid();
            model = dal.GetModel(int.Parse(Request.QueryString["id"]));
            model.Jbjzsj = System.DateTime.Now.AddMinutes(double.Parse(this.ddljjsj.SelectedValue)).ToString();
            model.Jbqbj = this.txtjjdj.Text;
            model.Jbzt = "1";
            if (dal.Update(model))
            {
                MessageBox.ShowAndRedirect(this, "设置成功", "jbone.aspx");
            }
            else
            {
                
                MessageBox.Show(this, "设置失败");
            }

        }

        protected void btncanel_Click(object sender, EventArgs e)
        {
            Response.Redirect("jbone.aspx");
        }
    }
}