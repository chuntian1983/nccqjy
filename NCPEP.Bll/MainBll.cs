using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using NCPEP.Model;
using System.Data;

namespace NCPEP.Bll
{
    public class MainBll
    {
        private AdminUser adminUser = null;
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
                case "fun":
                    returnDate = GetSysFun();
                    break;
                default:
                    returnDate = "请求错误!";
                    break;
            }
            return returnDate;
        }
        //
        private string GetSysFun()
        {
            try
            {
                SysLogBll.Create("系统后台主页面", "用户登录获取权限列表", adminUser.AdminName);
                int parentNodeId = 0;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.Append("[");

                DataTable dataTable = new DataTable();
                if (adminUser.Id == 1)
                {
                    dataTable = new RolePermissionsBll().GetAllList(0);
                }
                else
                {
                    dataTable = new RolePermissionsBll().GetAllList(adminUser.Id, parentNodeId);
                }
                for (int i = 1; i < dataTable.Rows.Count + 1; i++)
                {
                    stringBuilder.Append("{\"menuid\":\"" + dataTable.Rows[i - 1]["NodeId"] + "\",\"menuname\":\"" + dataTable.Rows[i - 1]["DisplayName"] + "\",\"menus\":" + AddMenusNodes(int.Parse(dataTable.Rows[i - 1]["NodeId"].ToString())) + "}");
                    if (i < dataTable.Rows.Count)
                    {
                        stringBuilder.Append(",");
                    }
                }
                stringBuilder.Append("]");
                return stringBuilder.ToString();
            }
            catch (Exception ex)
            {
                SystemErrorPlug.ErrorRecord("时间:[" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "]类名:[" + this.GetType().Name + "],行号:[" + Component.GetLineNum().ToString() + "行],错误信息:[" + ex.Message + "]");
                return string.Empty;
            }
        }
        //
        private string AddMenusNodes(int parentNodeId)
        {
            try
            {
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.Append("[");
                DataTable dataTable = new DataTable();
                if (adminUser.Id == 1)
                {
                    dataTable = new RolePermissionsBll().GetAllList(parentNodeId);
                }
                else
                {
                    dataTable = new RolePermissionsBll().GetAllList(adminUser.Id, parentNodeId);
                }
                for (int i = 1; i < dataTable.Rows.Count + 1; i++)
                {
                    stringBuilder.Append("{\"menuid\":\"" + dataTable.Rows[i - 1]["NodeId"] + "\",\"menuname\":\"" + dataTable.Rows[i - 1]["DisplayName"] + "\",\"url\":\"" + dataTable.Rows[i - 1]["NodeURL"] + "\"}");
                    if (i < dataTable.Rows.Count)
                    {
                        stringBuilder.Append(",");
                    }
                }
                stringBuilder.Append("]");
                return stringBuilder.ToString();
            }
            catch (Exception ex)
            {
                SystemErrorPlug.ErrorRecord("时间:[" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "]类名:[" + this.GetType().Name + "],行号:[" + Component.GetLineNum().ToString() + "行],错误信息:[" + ex.Message + "]");
                return string.Empty;
            }
        }
    }
}
