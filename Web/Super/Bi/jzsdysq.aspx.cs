using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using NCPEP.Bll;
using NCPEP.Model;
using Maticsoft.Common;
using System.Data;
namespace Web.Super.Bi
{
    public partial class jzsdysq : System.Web.UI.Page
    {
        private dynamic adminUser = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                adminUser = Session["SuperAdminUserSession"] as AdminUser;
                if (null == adminUser)
                {
                    if (!string.IsNullOrEmpty(Request.Cookies["AdminCookies"].Value))
                    {
                        adminUser = new GetUserCookiesPlug().GetUserCookies(Request.Cookies["AdminCookies"]["SuperAdminUserCookies"]);
                        Session["SuperAdminUserSession"] = adminUser;
                    }
                }
            }
            catch (Exception ex)
            {
                SystemErrorPlug.ErrorRecord("时间:[" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "]类名:[" + this.GetType().Name + "],行号:[" + Component.GetLineNum().ToString() + "行],错误信息:[" + ex.Message + "]");
                //return null;
            }
            if (!IsPostBack)
            {
                if (Request.QueryString["p"] != null)
                {
                    //string strid = Request.QueryString["p"];
                    //NCPEP.Bll.T_Jzs bll = new NCPEP.Bll.T_Jzs();
                    //DataTable dt = bll.GetList(" binid='" + Request.QueryString["p"] + "'").Tables[0];
                    //if (dt.Rows.Count > 0)
                    //{
                    //    try
                    //    {
                    //        this.txtbeizhu.Value = dt.Rows[0]["beizhu"].ToString();
                    //    }
                    //    catch { }
                    //    this.txtcjje.Value = dt.Rows[0]["cjje"].ToString();
                    //    this.txtEndDatejzs.Value = DateTime.Parse(dt.Rows[0]["zcdatez"].ToString()).ToString("yyyy-MM-dd");
                    //    this.txthtbh.Value = dt.Rows[0]["htbh"].ToString();
                    //    this.txtStartDatejzs.Value = DateTime.Parse(dt.Rows[0]["zcdate"].ToString()).ToString("yyyy-MM-dd");
                    //}
                }
            }
        }

        protected void btnadd_Click(object sender, EventArgs e)
        {
            SysLogBll.Create("鉴证书打印再次申请", "鉴证书打印再次申请", adminUser.AdminName);
            NCPEP.Bll.T_Dysq bll = new NCPEP.Bll.T_Dysq();
            NCPEP.Model.T_Dysq model = new NCPEP.Model.T_Dysq();
            DataTable dt = bll.GetList(" fid='"+Request.QueryString["p"]+"'").Tables[0];
            model.fid = Request.QueryString["p"];
            model.dysqnr = this.txtbeizhu.Value.Trim();
            model.dysqsj = DateTime.Now.ToString();
            model.dyzt = "1";
            model.dycs = Convert.ToString(dt.Rows.Count + 1);
            //int id = (int)dal.Create(GetModels(context));
            int id = bll.Add(model);
            if (id > 0)
            {
                NCPEP.Bll.T_Dyzt blldyzt = new NCPEP.Bll.T_Dyzt();
                blldyzt.UpdateByBinid(Request.QueryString["p"], "2");

                MessageBox.Show(this, "申请成功！");
                this.btnadd.Visible = false;
            }
            else
            {
                MessageBox.Show(this, "更新失败！");
            }
        }
    }
}