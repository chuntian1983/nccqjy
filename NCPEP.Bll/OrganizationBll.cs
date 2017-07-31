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
    public class OrganizationBll
    {
        private dynamic adminUser = null;
        private OrganizationDal dal = null;
        public OrganizationBll()
        {
            dal = new OrganizationDal();
        }
        public string GetHighestLevelOrgName()
        {
            return dal.GetHighestLevelOrgName();
        }
        public string GetHighestLevelOrgName(string OrgCode)
        {
            return dal.GetHighestLevelOrgName(OrgCode);
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
            string returnDate;
            switch (action)
            {
                case "tree":
                    returnDate = GetTree();
                    break;
                case "seltree":
                    returnDate = GetSelTree(context);
                    break;
                case "by":
                    returnDate = JsonHelper<Organization>.JsonWriter(GetById(context));
                    break;
                case "del":
                    returnDate = Delete(context);
                    break;
                case "add":
                    returnDate = Create(context);
                    break;
                case "up":
                    returnDate = Update(context);
                    break;
                case "lower":
                    returnDate = CreateLower(context);
                    break;
                case "quyu":
                    returnDate = GetRoleList();
                    break;
                default:
                    returnDate = null;
                    break;
            }
            return returnDate;
        }
        private string GetRoleList()
        {
            StringBuilder sb = new StringBuilder();
            DataTable dt = dal.GetList(" UpOrgCode='3601'").Tables[0];
            if (dt.Rows.Count > 0)
            {
                sb.Append("[");
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    sb.Append("{\"OrgCode\":" + dt.Rows[i]["OrgCode"] + ",");
                    sb.Append("\"OrgShortName\":\"" + dt.Rows[i]["OrgShortName"] + "\"}");
                    if (i < dt.Rows.Count - 1)
                    {
                        sb.Append(",");
                    }
                }

                sb.Append("]");
            }


            return sb.ToString();
        }
        public DataTable GetAllList()
        {
            DataTable dt = dal.GetList(" UpOrgCode='3601'").Tables[0];
            return dt;
        }
        //
        private string CreateLower(HttpContext context)
        {
            try
            {
                SysLogBll.Create("组织单位", "获取组织单位树形数据", adminUser.AdminName);
                string OrgCode = context.Request.QueryString["OrgCode"];
                return dal.CreateLower(OrgCode);
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
            Organization model = new Organization();
            model.OrgCode = context.Request.Form["OrgCode"].ToString();
            model.OrgName = context.Request.Form["OrgName"].ToString();
            model.OrgShortName = context.Request.Form["OrgShortName"].ToString();
            model.UpOrgCode = context.Request.Form["UpOrgCode"].ToString();
            try { model.Seq = int.Parse(context.Request.Form["Seq"].ToString()); }
            catch { }
            try { model.Level = int.Parse(context.Request.Form["Level"].ToString()); }
            catch { }
            model.ShengCode = context.Request.Form["ShengCode"].ToString();
            model.ShiCode = context.Request.Form["ShiCode"].ToString();
            model.XianCode = context.Request.Form["XianCode"].ToString();
            model.XiangCode = context.Request.Form["XiangCode"].ToString();
            model.CunCode = context.Request.Form["CunCode"].ToString();
            model.ZuCode = context.Request.Form["ZuCode"].ToString();
            return model;
        }
        //
        private string Update(HttpContext context)
        {
            try
            {
                SysLogBll.Create("组织单位", "更新组织单位信息", adminUser.AdminName);
                if (dal.Update(GetModel(context)))
                {
                    return "更新成功！";
                }
                else
                {
                    return "更新失败，请重新操作！";
                }
            }
            catch (Exception ex)
            {
                SystemErrorPlug.ErrorRecord("时间:[" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "]类名:[" + this.GetType().Name + "],行号:[" + Component.GetLineNum().ToString() + "行],错误信息:[" + ex.Message + "]");
                return "更新失败,错误代码：500 " + ex.Message;
            }
        }
        //
        private string Create(HttpContext context)
        {
            try
            {
                SysLogBll.Create("组织单位", "增加组织单位信息", adminUser.AdminName);
                if (dal.Create(GetModel(context)))
                {
                    return "添加成功！";
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
        private string Delete(HttpContext context)
        {
            try
            {
                SysLogBll.Create("组织单位", "删除组织单位操作", adminUser.AdminName);
                //删除操作需要验证用户和新闻表是否有数据
                string OrgCode = context.Request.QueryString["OrgCode"].ToString();
                if (new AdminUserDal().OrgCount(OrgCode) <= 0)
                {
                    // if (new NewsDal().OrgCount(OrgCode) <= 0)
                    //{
                    if (dal.Delete(OrgCode))
                    {
                        return "删除操作成功！";
                    }
                    else
                    {
                        return "删除失败请重新操作，错误代码：500 ";
                    }
                    //}
                    // else
                    // {
                    //  return "该组织单位下已经发布新闻信息，无法删除操作！";
                    // }
                }
                else
                {
                    return "该组织单位下已经创建了登陆用户信息，无法删除操作！";
                }
            }
            catch (Exception ex)
            {
                SystemErrorPlug.ErrorRecord("时间:[" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "]类名:[" + this.GetType().Name + "],行号:[" + Component.GetLineNum().ToString() + "行],错误信息:[" + ex.Message + "]");
                return "删除失败请重新操作，错误代码：500 " + ex.Message;
            }
        }
        //
        private dynamic GetById(HttpContext context)
        {
            try
            {
                SysLogBll.Create("组织单位", "查询单个组织单位数据", adminUser.AdminName);
                string OrgCode = context.Request.QueryString["OrgCode"];
                return dal.GetModel(OrgCode);
            }
            catch (Exception ex)
            {
                SystemErrorPlug.ErrorRecord("时间:[" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "]类名:[" + this.GetType().Name + "],行号:[" + Component.GetLineNum().ToString() + "行],错误信息:[" + ex.Message + "]");
                return null;
            }
        }
      
        //
        private string GetSelTree(HttpContext context)
        {           
            try
            {
                SysLogBll.Create("组织单位", "返回查询的组织单位树形数据", adminUser.AdminName);
                string level = string.Empty;
                try { level = Component.ReadXml("OrgCode").InnerText; }
                catch { level = "00"; }
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.Append("[");
                dynamic model = dal.GetModel(level);
                stringBuilder.Append("{\"id\":\"" + model.OrgCode + "\", \"text\":\"" + model.OrgShortName + "\",\"children\":[" + AddNodes(model.OrgCode) + "]}");
                stringBuilder.Append(",");
                if (stringBuilder.Length > 1)
                {
                    stringBuilder.Remove(stringBuilder.Length - 1, 1);
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
        private string AddNodes(string OrgCode)
        {
            try
            {
                StringBuilder stringBuilder = new StringBuilder();
                DataTable dataTable = dal.GetLower(OrgCode);
                foreach (DataRow rows in dataTable.Rows)
                {
                    stringBuilder.Append("{\"id\":\"" + rows["OrgCode"] + "\",\"text\":\"" + rows["OrgShortName"] + "\",\"children\":[" + AddNodes(rows["OrgCode"].ToString()) + "]}");
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
                SysLogBll.Create("组织单位", "获取组织单位树形数据2", adminUser.AdminName);
                string OrgCode = dal.GetHighestOrgCode();
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.Append("[");
                Organization modelData = dal.GetModel(OrgCode);
                stringBuilder.Append("{\"id\":\"" + modelData.OrgCode + "\", \"text\":\"" + modelData.OrgShortName + "\",\"children\":[" + AddNodes(modelData.OrgCode) + "]}");
                stringBuilder.Append("]");
                return stringBuilder.ToString();
            }
            catch (Exception ex)
            {
                SystemErrorPlug.ErrorRecord("时间:[" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "]类名:[" + this.GetType().Name + "],行号:[" + Component.GetLineNum().ToString() + "行],错误信息:[" + ex.Message + "]");
                return string.Empty;
            }
        }
        public string GetTree(string orgcode)
        {
            try
            {
                //SysLogBll.Create("组织单位", "获取组织单位树形数据2", adminUser.AdminName);
                string OrgCode = orgcode;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.Append("[");
                Organization modelData = dal.GetModel(OrgCode);
                stringBuilder.Append("{\"id\":\"" + modelData.OrgCode + "\", \"text\":\"" + modelData.OrgShortName + "\",\"children\":[" + AddNodes(modelData.OrgCode) + "]}");
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
