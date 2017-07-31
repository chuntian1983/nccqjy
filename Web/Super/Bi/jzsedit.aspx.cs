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
    public partial class jzsedit : System.Web.UI.Page
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
                if (Request.QueryString["p"]!=null)
                {
                    string strid = Request.QueryString["p"];
                    NCPEP.Bll.T_Jzs bll = new NCPEP.Bll.T_Jzs();
                    DataTable dt = bll.GetList(" binid='"+Request.QueryString["p"]+"'").Tables[0];
                    if (dt.Rows.Count>0)
                    {
                        try
                        {
                            this.txtbeizhu.Value = dt.Rows[0]["beizhu"].ToString();
                        }
                        catch { }
                        this.txtcjje.Value = dt.Rows[0]["cjje"].ToString();
                        this.txtEndDatejzs.Value =DateTime.Parse( dt.Rows[0]["zcdatez"].ToString()).ToString("yyyy-MM-dd");
                        this.txthtbh.Value=dt.Rows[0]["htbh"].ToString();
                        this.txtStartDatejzs.Value = DateTime.Parse(dt.Rows[0]["zcdate"].ToString()).ToString("yyyy-MM-dd");
                        try
                        {
                            this.txtzffs.Value = dt.Rows[0]["beiyong"].ToString();
                        }
                        catch { }
                        try
                        {
                            this.txtjydj.Value = dt.Rows[0]["beiyong2"].ToString();
                        }
                        catch { }
                    }
                }
            }
        }

        protected void btnadd_Click(object sender, EventArgs e)
        {
            SysLogBll.Create("检证书修改", "检证书修改", adminUser.AdminName);
            NCPEP.Bll.T_Jzs bll = new NCPEP.Bll.T_Jzs();
            NCPEP.Model.T_Jzs model = new NCPEP.Model.T_Jzs();
            DataTable dt = bll.GetList(" binid='" + Request.QueryString["p"] + "'").Tables[0];
            if (dt.Rows.Count>0)
            {
                foreach (DataRow dr in dt.Rows)
                {
                    bll.Delete(int.Parse(dr["id"].ToString()));
                }
                
            }
            try { model.beizhu = this.txtbeizhu.Value; }
            catch { }
            try { model.binid = Request.QueryString["p"].ToString(); }
            catch { }
            model.cjje = this.txtcjje.Value;
            model.htbh = this.txthtbh.Value;
            model.zcdate = this.txtStartDatejzs.Value;
            model.zcdatez = this.txtEndDatejzs.Value;
            model.beiyong = this.txtbeizhu.Value.Trim();
            //int id = (int)dal.Create(GetModels(context));
            int id = bll.Add(model);
            if (id > 0)
            {

                MessageBox.Show(this, "更新成功！");
            }
            else
            {
                MessageBox.Show(this, "更新失败！");
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SysLogBll.Create("检证书修改", "检证书修改", adminUser.AdminName);
            NCPEP.Bll.T_Jzs bll = new NCPEP.Bll.T_Jzs();
            NCPEP.Model.T_Jzs model = new NCPEP.Model.T_Jzs();
            DataTable dt = bll.GetList(" binid='" + Request.QueryString["p"] + "'").Tables[0];
            if (dt.Rows.Count > 0)
            {
                foreach (DataRow dr in dt.Rows)
                {
                    bll.Delete(int.Parse(dr["id"].ToString()));
                }

            }
            try { model.beizhu = this.txtbeizhu.Value; }
            catch { }
            try { model.binid = Request.QueryString["p"].ToString(); }
            catch { }
            model.cjje = this.txtcjje.Value;
            model.htbh = this.txthtbh.Value;
            model.zcdate = this.txtStartDatejzs.Value;
            model.zcdatez = this.txtEndDatejzs.Value;
            model.beiyong = this.txtzffs.Value.Trim();
            model.beiyong2 = this.txtjydj.Value.Trim();
            //int id = (int)dal.Create(GetModels(context));
            int id = bll.Add(model);
            if (id > 0)
            {

                MessageBox.Show(this, "更新成功！");
            }
            else
            {
                MessageBox.Show(this, "更新失败！");
            }
        }
    }
}