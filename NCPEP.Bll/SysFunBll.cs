using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using NCPEP.Dal;
using System.Web;
using NCPEP.Model;
using System.Data;

namespace NCPEP.Bll
{
    public class SysFunBll
    {
        private dynamic dal = null;
        private dynamic adminUser = null;
        public SysFunBll()
        {
            dal = new SysFunDal();
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
                case "tree":
                    returnDate = GetTree();
                    break;
                case "add":
                    returnDate = Create(context);
                    break;
                case "up":
                    returnDate = Update(context);
                    break;
                case "by":
                    returnDate = JsonHelper<SysFun>.JsonWriter(GetById(context));
                    break;
                case "combo":
                    returnDate = GetList();
                    break;
                default:
                    returnDate = "请求错误!";
                    break;
            }
            return returnDate;
        }
        //
        private string GetList()
        {
            try
            {
                SysLogBll.Create("系统菜单", "获取菜单列表信息", adminUser.AdminName);
                string combo = "[{\"id\":\"0\",\"text\":\"请选择\"}";
                if (1 == adminUser.AdminTypeId)
                {
                    combo += "," + AddNodes("0") + "]";
                }
                else
                {
                    combo += "]";
                }
                return combo;
            }
            catch (Exception ex)
            {
                SystemErrorPlug.ErrorRecord("时间:[" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "]类名:[" + this.GetType().Name + "],行号:[" + Component.GetLineNum().ToString() + "行],错误信息:[" + ex.Message + "]");
                return string.Empty;
            }
        }
        //
        private string AddNodes(string ParentNodeId)
        {
            try
            {
                StringBuilder stringBuilder = new StringBuilder();
                DataTable dataTable = dal.GetAllList(ParentNodeId);
                foreach (DataRow rows in dataTable.Rows)
                {
                    stringBuilder.Append("{\"id\":\"" + rows["NodeId"] + "\",\"text\":\"" + rows["DisplayName"] + "\"}");
                    stringBuilder.Append(",");
                }
                if (stringBuilder.Length > 0)
                {
                    stringBuilder.Remove(stringBuilder.Length - 1, 1);
                }
                return stringBuilder.ToString();
            }
            catch (Exception ex)
            {
                SystemErrorPlug.ErrorRecord("时间:[" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "]类名:[" + this.GetType().Name + "],行号:[" + Component.GetLineNum().ToString() + "行],错误信息:[" + ex.Message + "]");
                return string.Empty;
            }
        }
        //
        private string GetTree()
        {
            try
            {
                if (1 == adminUser.AdminTypeId)
                {
                    SysLogBll.Create("系统菜单", "获取系统菜单树形数据", adminUser.AdminName);
                    StringBuilder stringBuilder = new StringBuilder();
                    stringBuilder.Append("[");
                    dynamic dataTable = dal.GetAllList("0");
                    foreach (DataRow rows in dataTable.Rows)
                    {
                        stringBuilder.Append("{\"id\":\"" + rows["NodeId"] + "\", \"text\":\"" + rows["DisplayName"] + "\",\"children\":[" + AddNodes(rows["NodeId"].ToString()) + "]}");
                        stringBuilder.Append(",");
                    }
                    if (stringBuilder.Length > 1)
                    {
                        stringBuilder.Remove(stringBuilder.Length - 1, 1);
                    }
                    stringBuilder.Append("]");
                    return stringBuilder.ToString();
                }
                else { return "[{id:,text: }]"; }
            }
            catch (Exception ex)
            {
                SystemErrorPlug.ErrorRecord("时间:[" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "]类名:[" + this.GetType().Name + "],行号:[" + Component.GetLineNum().ToString() + "行],错误信息:[" + ex.Message + "]");
                return "[{id:,text: }]";
            }
        }
        //
        private string Create(HttpContext context)
        {
            try
            {
                if (1 == adminUser.AdminTypeId)
                {
                    SysLogBll.Create("系统菜单", "增加系统菜单数据", adminUser.AdminName);
                    if (dal.Create(GetModels(context)))
                    {
                        return "添加成功！";
                    }
                    else
                    {
                        return "添加失败请重新操作! ";
                    }
                }
                else
                {
                    return "您没有管理权限！";
                }
            }
            catch (Exception ex)
            {
                SystemErrorPlug.ErrorRecord("时间:[" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "]类名:[" + this.GetType().Name + "],行号:[" + Component.GetLineNum().ToString() + "行],错误信息:[" + ex.Message + "]");
                return "添加失败请重新操作，错误代码：500 ";
            }
        }
        //
        private string Update(HttpContext context)
        {
            try
            {
                if (1 == adminUser.AdminTypeId)
                {
                    SysLogBll.Create("系统菜单", "更新系统菜单", adminUser.AdminName);
                    if (dal.Update(GetModels(context)))
                    {
                        return "修改成功！";
                    }
                    else
                    {
                        return "修改失败请重新操作! ";
                    }
                }
                else
                {
                    return "您没有管理权限！";
                }
            }
            catch (Exception ex)
            {
                SystemErrorPlug.ErrorRecord("时间:[" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "]类名:[" + this.GetType().Name + "],行号:[" + Component.GetLineNum().ToString() + "行],错误信息:[" + ex.Message + "]");
                return "修改失败请重新操作，错误代码：500 ";
            }
        }
        //
        private dynamic GetById(HttpContext context)
        {
            try
            {
                SysLogBll.Create("系统菜单", "查询系统菜单单个数据", adminUser.AdminName);
                int NodeId = 0;
                try { NodeId = int.Parse(context.Request.QueryString["NodeId"].ToString()); }
                catch { }
                return dal.GetModel(NodeId);
            }
            catch (Exception ex)
            {
                SystemErrorPlug.ErrorRecord("时间:[" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "]类名:[" + this.GetType().Name + "],行号:[" + Component.GetLineNum().ToString() + "行],错误信息:[" + ex.Message + "]");
                return null;
            }
        }
        //
        private SysFun GetModels(HttpContext context)
        {
            SysFun model = new SysFun();
            model.DisplayName = context.Request.Form["DisplayName"];
            model.NodeURL = context.Request.Form["NodeURL"];
            try { model.DisplayOrder = int.Parse(context.Request.Form["DisplayOrder"]); }
            catch { }
            try { model.ParentNodeId = int.Parse(context.Request.Form["ParentNodeId"]); }
            catch { }
            model.Editor = adminUser.AdminName;
            try { model.NodeId = int.Parse(context.Request.Form["NodeId"]); }
            catch { }
            return model;
        }
    }
}
