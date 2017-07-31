using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using NCPEP.Bll;
using System.Web.SessionState;
using NCPEP.Model;

namespace Web.Super.Ashx
{
    /// <summary>
    /// Jzs 的摘要说明
    /// </summary>
    public class Jzs : IHttpHandler, IReadOnlySessionState, IRequiresSessionState
    {
        private dynamic adminUser = null;
        public void ProcessRequest(HttpContext context)
        {
            context.Response.Write(strrequest(context));
        }
        public string strrequest(HttpContext context)
        {
            try
            {
                adminUser = context.Session["SuperAdminUserSession"] as AdminUser;
                if (null == adminUser)
                {
                    if (!string.IsNullOrEmpty(context.Request.Cookies["AdminCookies"].Value))
                    {
                        adminUser = new GetUserCookiesPlug().GetUserCookies(context.Request.Cookies["AdminCookies"]["SuperAdminUserCookies"]);
                        context.Session["SuperAdminUserSession"] = adminUser;
                    }
                }
            }
            catch (Exception ex)
            {
                SystemErrorPlug.ErrorRecord("时间:[" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "]类名:[" + this.GetType().Name + "],行号:[" + Component.GetLineNum().ToString() + "行],错误信息:[" + ex.Message + "]");
                return null;
            }

            string action = context.Request.QueryString["action"].ToString();
            string returnDate = string.Empty;
            switch (action)
            {
                
                case "add":
                    returnDate = Create(context);
                    break;
                
                default:
                    returnDate = "请求错误!";
                    break;
            }
            return returnDate;
        }
        private string Create(HttpContext context)
        {
            try
            {
                SysLogBll.Create("检证书修改", "检证书修改", adminUser.AdminName);
                NCPEP.Bll.T_Jzs bll = new NCPEP.Bll.T_Jzs();
                NCPEP.Model.T_Jzs model = new NCPEP.Model.T_Jzs();
                try { model.beizhu = context.Request.Form["beizhu"].ToString(); }
                catch { }
                try { model.binid = context.Request.Form["Id"].ToString(); }
                catch { }
                model.cjje = context.Request.Form["cjje"].ToString();
                model.htbh = context.Request.Form["htbh"].ToString();
                model.zcdate = context.Request.Form["jzsStartDate"].ToString();
                model.zcdatez = context.Request.Form["jzsEndDate"].ToString();
                //int id = (int)dal.Create(GetModels(context));
                int id = bll.Add(model);
                if (id > 0)
                {
                    
                    return "添加成功！";
                }
                else
                {
                    return "添加失败请重新操作! ";
                }
            }
            catch (Exception ex)
            {
                SystemErrorPlug.ErrorRecord("时间:[" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "]类名:[" + this.GetType().Name + "],行号:[" + Component.GetLineNum().ToString() + "行],错误信息:[" + ex.Message + "]");
                return "添加失败请重新操作，错误代码：500 ";
            }
        }
        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}