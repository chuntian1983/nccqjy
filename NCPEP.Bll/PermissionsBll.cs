using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using NCPEP.Model;
using NCPEP.Dal;
using System.Web;

namespace NCPEP.Bll
{
    public class PermissionsBll
    {
        private dynamic adminUser = null;
        private PermissionsDal dal = null;
        public PermissionsBll()
        {
            adminUser = new AdminUser();
            dal = new PermissionsDal();
        }
        public string ProcessRequest(HttpContext context)
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
                case "list":
                    returnDate = GetAllList(context);
                    break;
                case "add":
                    returnDate = Create(context);
                    break;
                default:
                    returnDate = "请求错误!";
                    break;
            }
            return returnDate;
        }
        public string GetAllList(HttpContext context)
        {
            try
            {
                SysLogBll.Create("系统授权", "返回系统授权数据集", adminUser.AdminName);
                int AdminTypeId = 0;
                try { AdminTypeId = Convert.ToInt32(context.Request.QueryString["AdminTypeId"]); }
                catch { }
                return JsonHelper<Permissions>.JsonDataTable(dal.GetAllList(AdminTypeId));
            }
            catch (Exception ex)
            {
                SystemErrorPlug.ErrorRecord("时间:[" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "]类名:[" + this.GetType().Name + "],行号:[" + Component.GetLineNum().ToString() + "行],错误信息:[" + ex.Message + "]");
                return null;
            }
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="context"></param>
        /// <returns></returns>
        private string Create(HttpContext context)
        {
            try
            {
                SysLogBll.Create("系统授权", "创建系统授权", adminUser.AdminName);
                string mess = "SystemError!";
                int succ = 0;
                int error = 0;
                int AdminTypeId = 0;
                AdminTypeId = int.Parse(context.Request.QueryString["AdminTypeId"].ToString());
                string[] SysFunIdArray = context.Request.QueryString["SysFunId"].Split('|');
                dal.Delete(AdminTypeId);
                for (int i = 0; i < SysFunIdArray.Length; i++)
                {
                    Permissions model = new Permissions();
                    model.AdminTypeId = AdminTypeId;
                    model.Editor = adminUser.AdminLogName;
                    model.SysFunId = Convert.ToInt32(SysFunIdArray[i]);
                    if (dal.Create(model))
                    {
                        succ++;
                    }
                    else
                    {
                        error++;
                    }
                }
                mess = string.Format("授予权限成功了[{0}]条，失败了[{1}]条!", succ, error);
                return mess;
            }
            catch (Exception ex)
            {
                SystemErrorPlug.ErrorRecord("时间:[" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "]类名:[" + this.GetType().Name + "],行号:[" + Component.GetLineNum().ToString() + "行],错误信息:[" + ex.Message + "]");
                return null;
            }
        }
    }
}