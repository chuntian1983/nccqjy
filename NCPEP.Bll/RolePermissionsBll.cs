using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using NCPEP.Model;
using NCPEP.Dal;
using System.Web;
using System.Data;

namespace NCPEP.Bll
{
    public class RolePermissionsBll
    {
        private RolePermissionsDal dal = null;
        private dynamic adminUser = null;
        //
        public RolePermissionsBll()
        {
            dal = new RolePermissionsDal();
        }
        //
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
                    returnDate = JsonHelper<RolePermissions>.JsonDataTable(GetAllList(context));
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
        //      
        private DataTable GetAllList(HttpContext context)
        {
            try
            {
                SysLogBll.Create("用户权限", "查询所有数据操作", adminUser.AdminName);
                int AdminUserId = 0;
                try { AdminUserId = int.Parse(context.Request.QueryString["AdminUserId"].ToString()); }
                catch { }
                return dal.GetAllList(AdminUserId);
            }
            catch (Exception ex)
            {
                SystemErrorPlug.ErrorRecord("时间:[" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "]类名:[" + this.GetType().Name + "],行号:[" + Component.GetLineNum().ToString() + "行],错误信息:[" + ex.Message + "]");
                return null;
            }
        }
        //
        private void Delete(int AdminUserId)
        {
            try
            {
                SysLogBll.Create("用户权限", "删除操作", adminUser.AdminName);
                dal.Delete(AdminUserId);
            }
            catch (Exception ex)
            {
                SystemErrorPlug.ErrorRecord("时间:[" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "]类名:[" + this.GetType().Name + "],行号:[" + Component.GetLineNum().ToString() + "行],错误信息:[" + ex.Message + "]");
            }
        }
        //
        public dynamic GetAllList(int adminUserId, int parentNodeId)
        {
            try
            {
                return dal.GetAllList(adminUserId, parentNodeId);
            }
            catch (Exception ex)
            {
                SystemErrorPlug.ErrorRecord("时间:[" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "]类名:[" + this.GetType().Name + "],行号:[" + Component.GetLineNum().ToString() + "行],错误信息:[" + ex.Message + "]");
                return null;
            }
        }
        public dynamic GetAllList(int parentNodeId)
        {
            try
            {
                return dal.GetAllListByPid(parentNodeId);
            }
            catch (Exception ex)
            {
                SystemErrorPlug.ErrorRecord("时间:[" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "]类名:[" + this.GetType().Name + "],行号:[" + Component.GetLineNum().ToString() + "行],错误信息:[" + ex.Message + "]");
                return null;
            }
        }
        //
        private string Create(HttpContext context)
        {
            try
            {
                SysLogBll.Create("用户权限", "创建用户权限操作", adminUser.AdminName);
                RolePermissions model = null;
                int err = 0;
                int succ = 0;
                int AdminUserId = 0;
                try { AdminUserId = int.Parse(context.Request.QueryString["AdminUserId"]); }
                catch { }
                Delete(AdminUserId);
                string[] SysFunId = context.Request.QueryString["SysFunId"].ToString().Split('|');
                for (int i = 0; i < SysFunId.Length - 1; i++)
                {
                    model = new RolePermissions();
                    model.AdminUserId = AdminUserId;
                    model.SysFunId = int.Parse(SysFunId[i].ToString());
                    model.Editor = adminUser.AdminName;
                    if (dal.Create(model)) { succ++; } else { err++; }
                }
                return "授权操作成功了[" + succ.ToString() + "]条，失败了[" + err.ToString() + "]条！";
            }
            catch (Exception ex)
            {
                SystemErrorPlug.ErrorRecord("时间:[" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "]类名:[" + this.GetType().Name + "],行号:[" + Component.GetLineNum().ToString() + "行],错误信息:[" + ex.Message + "]");
                return "操作失败，错误代码：500 ";
            }
        }
    }
}
