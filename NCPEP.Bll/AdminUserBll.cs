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
    public class AdminUserBll
    {
        private dynamic dal = null;
        private dynamic adminUser = null;
        private dynamic roleDal = null;
        //
        public AdminUserBll()
        {
            dal = new AdminUserDal();
            roleDal = new RolePermissionsDal();
        }
        //
        public NCPEP.Model.AdminUser GetById(int Id)
        {
            return dal.GetModel(Id);
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
                case "paging":
                    string str = "\"total\":" + SumCount(context) + ",";
                    returnDate = JsonHelper<AdminUser>.JsonDataTable(GetAllList(context), "rows").Insert(1, (str));
                    break;
                case "del":
                    returnDate = Delete(context);
                    break;
                case "by":
                    returnDate = JsonHelper<AdminUser>.JsonWriter(GetById(context));
                    break;
                case "rs":
                    returnDate = RowsState(context);
                    break;
                case "add":
                    returnDate = Create(context);
                    break;
                case "up":
                    returnDate = Update(context);
                    break;
                case "logname":
                    returnDate = GetAdminLogName(context);
                    break;
                case "uppass":
                    returnDate = UpdatePass(context);
                    break;
                default:
                    returnDate = "请求错误!";
                    break;
            }
            return returnDate;
        }
        //
        private string UpdatePass(HttpContext context)
        {
            AdminUser adminUser = context.Session["SuperAdminUserSession"] as AdminUser;
            string Pass = context.Request.QueryString["Pass"];
            if (dal.UpdatePass(Pass, adminUser.Id))
            {
                return "密码更新成功";
            }
            else
            {
                return "密码更新失败，请重新操作！";
            }
        }
        //
        private string GetAdminLogName(HttpContext context)
        {
            try
            {
                AdminUser adminUser = context.Session["SuperAdminUserSession"] as AdminUser;
                return adminUser.AdminLogName;
            }
            catch (Exception ex)
            {
                SystemErrorPlug.ErrorRecord("时间:[" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "]类名:[" + this.GetType().Name + "],行号:[" + Component.GetLineNum().ToString() + "行],错误信息:[" + ex.Message + "]");
                return "Administrator";
            }
        }
        //
        private string Update(HttpContext context)
        {
            try
            {
                int succ = 0;
                int err = 0;
                if (1 == adminUser.AdminTypeId)
                {
                    SysLogBll.Create("系统管理员", "更新系统管理员操作", adminUser.AdminName);
                    AdminUser model = GetModel(context);
                    if (dal.Update(model))
                    {
                        dynamic role = null;
                        DataTable dt = new PermissionsDal().GetAllList(model.AdminTypeId);
                        roleDal.Delete(model.Id);
                        foreach (dynamic row in dt.Rows)
                        {
                            role = new RolePermissions();
                            role.AdminUserId = model.Id;
                            role.SysFunId = int.Parse(row["SysFunId"].ToString());
                            role.Editor = adminUser.AdminLogName;
                            if (roleDal.Create(role)) { succ++; } else { err++; }
                        }
                        return "更新成功！— 授权操作成功了[" + succ.ToString() + "]条，失败了[" + err.ToString() + "]条！";
                    }
                    else
                    {
                        return "更新失败，请重新操作！";
                    }
                }
                else
                {
                    return "您没有管理员权限！";
                }
            }
            catch (Exception ex)
            {
                SystemErrorPlug.ErrorRecord("时间:[" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "]类名:[" + this.GetType().Name + "],行号:[" + Component.GetLineNum().ToString() + "行],错误信息:[" + ex.Message + "]");
                return "更新失败,错误代码：500 ";
            }
        }
        //
        private string Create(HttpContext context)
        {
            try
            {
                int err = 0;
                int succ = 0;
                SysLogBll.Create("系统管理员", "增加系统管理员操作", adminUser.AdminName);
                AdminUser model = GetModel(context);
                int id = (int)dal.CreateScalar(model);
                if (id > 0)
                {
                    dynamic role = null;
                    DataTable dt = new PermissionsDal().GetAllList(model.AdminTypeId);
                    roleDal.Delete(id);
                    foreach (dynamic row in dt.Rows)
                    {
                        role = new RolePermissions();
                        role.AdminUserId = id;
                        role.SysFunId = int.Parse(row["SysFunId"].ToString());
                        role.Editor = adminUser.AdminLogName;
                        if (roleDal.Create(role)) { succ++; } else { err++; }
                    }
                    return "添加成功！— 授权操作成功了[" + succ.ToString() + "]条，失败了[" + err.ToString() + "]条！";
                }
                else
                {
                    return "添加失败，请重新操作！";
                }
            }
            catch (Exception ex)
            {
                SystemErrorPlug.ErrorRecord("时间:[" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "]类名:[" + this.GetType().Name + "],行号:[" + Component.GetLineNum().ToString() + "行],错误信息:[" + ex.Message + "]");
                return "添加失败，错误代码：500 ";
            }
        }
        //
        private string RowsState(HttpContext context)
        {
            try
            {
                SysLogBll.Create("系统管理员", "更新系统管理员状态操作", adminUser.AdminName);
                if (1 == adminUser.AdminTypeId)
                {
                    string row = context.Request.QueryString["Rows"];
                    string values = context.Request.QueryString["Vale"];
                    string where = context.Request.QueryString["id"];
                    string value = (values == "0" ? "1" : "0");
                    if (dal.UpdateState(row, value, where))
                    {
                        return "修改权限状态设置成功！";
                    }
                    else
                    {
                        return "修改权限状态设置失败!";
                    }
                }
                else
                {
                    return "您没有管理员权限！";
                }
            }
            catch (Exception ex)
            {
                SystemErrorPlug.ErrorRecord("时间:[" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "]类名:[" + this.GetType().Name + "],行号:[" + Component.GetLineNum().ToString() + "行],错误信息:[" + ex.Message + "]");
                return string.Empty;
            }
        }
        //
        private dynamic GetById(HttpContext context)
        {
            try
            {
                SysLogBll.Create("系统管理员", "返回单个系统管理员信息操作", adminUser.AdminName);
                int id = 0;
                try { id = int.Parse(context.Request.QueryString["Id"]); }
                catch { }
                return dal.GetModel(id);
            }
            catch (Exception ex)
            {
                SystemErrorPlug.ErrorRecord("时间:[" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "]类名:[" + this.GetType().Name + "],行号:[" + Component.GetLineNum().ToString() + "行],错误信息:[" + ex.Message + "]");
                return null;
            }
        }
        //
        private string Delete(HttpContext context)
        {
            try
            {
                SysLogBll.Create("系统管理员", "删除系统管理员操作", adminUser.AdminName);
                if (1 == adminUser.AdminTypeId)
                {
                    string id = context.Request.QueryString["Id"].ToString();
                    if (dal.Delete(id))
                    {
                        return "删除操作成功！";
                    }
                    else
                    {
                        return "删除失败请重新操作，错误代码：500 ";
                    }
                }
                else
                {
                    return "您没有管理员权限！";
                }
            }
            catch (Exception ex)
            {
                SystemErrorPlug.ErrorRecord("时间:[" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "]类名:[" + this.GetType().Name + "],行号:[" + Component.GetLineNum().ToString() + "行],错误信息:[" + ex.Message + "]");
                return string.Empty;
            }
        }
        //
        private dynamic GetModel(HttpContext context)
        {
            dynamic model = new AdminUser();
            try { model.Id = int.Parse(context.Request.Form["Id"].ToString()); }
            catch { }
            model.AdminLogName = context.Request.Form["AdminLogName"].ToString();
            model.AdminLogPass = context.Request.Form["AdminLogPass"].ToString();
            model.AdminName = context.Request.Form["AdminName"].ToString();
            model.AdminTel = context.Request.Form["AdminTel"].ToString();
            model.OrgCode = context.Request.Form["OrgCode"].ToString();
            try { model.AdminTypeId = int.Parse(context.Request.Form["AdminTypeId"].ToString()); }
            catch { }
            try { model.JobId = int.Parse(context.Request.Form["JobId"].ToString()); }
            catch { }
            try { model.AdminState = int.Parse(context.Request.Form["AdminState"].ToString()); }
            catch { }
            try { model.AdminLogNum = int.Parse(context.Request.Form["AdminLogNum"].ToString()); }
            catch { }
            try { model.IsCheck = int.Parse(context.Request.Form["IsCheck"].ToString()); }
            catch { }
            model.Editor = adminUser.AdminName;
            return model;
        }
        //
        private dynamic SumCount(HttpContext context)
        {
            try
            {
                SysLogBll.Create("系统管理员", "获取系统管理员总和", adminUser.AdminName);
                string sqlWhere = string.Empty;
                if (1 == adminUser.IsCheck)
                {
                    sqlWhere = string.Format(" a.OrgCode like '{0}%' ", adminUser.OrgCode);
                }
                else
                {
                    sqlWhere = string.Format(" a.OrgCode = '{0}'  ", adminUser.OrgCode);
                }
                if (1 == adminUser.AdminTypeId)
                {
                    if (context.Request.QueryString["AdminLogName"] != null)
                    {
                        sqlWhere += string.Format(" and a.AdminLogName like '%{0}%'", context.Request.QueryString["AdminLogName"]);

                    }
                }
                else
                {
                    sqlWhere += string.Format(" and a.Id = {0}", adminUser.Id);
                }
                return dal.SumCount(sqlWhere);
            }
            catch (Exception ex)
            {
                SystemErrorPlug.ErrorRecord("时间:[" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "]类名:[" + this.GetType().Name + "],行号:[" + Component.GetLineNum().ToString() + "行],错误信息:[" + ex.Message + "]");
                return 0;
            }
        }
        //
        private dynamic GetAllList(HttpContext context)
        {
            try
            {
                SysLogBll.Create("系统管理员", "返回所有系统管理员数据", adminUser.AdminName);
                string sqlWhere = string.Empty;
                //if (1 == adminUser.IsCheck)
                //{
                    sqlWhere = string.Format(" a.OrgCode like '{0}%' ", adminUser.OrgCode);
                //}
                //else
                //{
                //    sqlWhere = string.Format(" a.OrgCode = '{0}'  ", adminUser.OrgCode);
                //}
                int startIndex = 0;
                try { startIndex = int.Parse(context.Request.Form["page"]) - 1; }
                catch { }
                int pageSize = 10;
                try { pageSize = int.Parse(context.Request.Form["rows"].ToString()); }
                catch { }
                string order = string.Format(" order by a.{0} {1}", context.Request.Form["sort"].ToString(), context.Request.Form["order"].ToString());
                if (1 == adminUser.AdminTypeId)
                {
                    if (context.Request.QueryString["AdminLogName"] != null)
                    {
                        sqlWhere += string.Format(" and a.AdminLogName like '%{0}%'", context.Request.QueryString["AdminLogName"]);
                    }
                }
                else
                {
                    sqlWhere += string.Format(" and a.Id = {0}", adminUser.Id);
                }
                return dal.GetAllList(sqlWhere, startIndex, pageSize, order);
            }
            catch (Exception ex)
            {
                SystemErrorPlug.ErrorRecord("时间:[" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "]类名:[" + this.GetType().Name + "],行号:[" + Component.GetLineNum().ToString() + "行],错误信息:[" + ex.Message + "]");
                return null;
            }
        }
    }
}
