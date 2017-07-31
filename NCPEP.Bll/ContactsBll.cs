using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using NCPEP.Model;
using NCPEP.Dal;

namespace NCPEP.Bll
{
    public class ContactsBll
    {
        private dynamic dal = null;
        private dynamic adminUser = null;
        public ContactsBll()
        {
            dal = new ContactsDal();
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
                case "add":
                    returnDate = Create(context);
                    break;
                case "up":
                    returnDate = Update(context);
                    break;
                case "by":
                    returnDate = JsonHelper<Contacts>.JsonWriter(GetById(context));
                    break;
                case "del":
                    returnDate = Delete(context);
                    break;
                case "paging":
                    string str = "\"total\":" + SumCount(context) + ",";
                    returnDate = JsonHelper<Contacts>.JsonDataTable(GetAllList(context), "rows").Insert(1, (str));
                    break;
                default:
                    returnDate = "请求错误!";
                    break;
            }
            return returnDate;
        }


        private dynamic SumCount(HttpContext context)
        {
            try
            {
                string OrgCode = context.Request.QueryString["OrgCode"];
                SysLogBll.Create("通讯录", "获取通讯录总和", adminUser.AdminName);              
                return dal.SumCount(OrgCode);
            }
            catch (Exception ex)
            {
                SystemErrorPlug.ErrorRecord("时间:[" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "]类名:[" + this.GetType().Name + "],行号:[" + Component.GetLineNum().ToString() + "行],错误信息:[" + ex.Message + "]");
                return 0;
            }
        }
        private dynamic GetAllList(HttpContext context)
        {
            try
            {
                int startIndex = 0;
                try { startIndex = int.Parse(context.Request.Form["page"]) - 1; }
                catch { }
                int pageSize = 10;
                try { pageSize = int.Parse(context.Request.Form["rows"].ToString()); }
                catch { }
                string OrgCode = context.Request.QueryString["OrgCode"];
                string order = string.Format(" order by a.{0} {1}", context.Request.Form["sort"].ToString(), context.Request.Form["order"].ToString());
                SysLogBll.Create("通讯录", "查询所有的通讯录数据", adminUser.AdminName);
                return dal.GetAllList(OrgCode, startIndex, pageSize, order);
            }
            catch (Exception ex)
            {
                SystemErrorPlug.ErrorRecord("时间:[" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "]类名:[" + this.GetType().Name + "],行号:[" + Component.GetLineNum().ToString() + "行],错误信息:[" + ex.Message + "]");
                return null;
            }
        }
        //
        private dynamic Create(HttpContext context)
        {
            try
            {
                SysLogBll.Create("通讯录", "增加通讯录操作", adminUser.AdminName);
                if (dal.Create(GetModels(context)))
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
        //
        private dynamic Update(HttpContext context)
        {
            try
            {
                SysLogBll.Create("通讯录", "更新通讯录操作", adminUser.AdminName);
                if (dal.Update(GetModels(context)))
                {
                    return "更新成功！";
                }
                else
                {
                    return "更新失败请重新操作! ";
                }
            }
            catch (Exception ex)
            {
                SystemErrorPlug.ErrorRecord("时间:[" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "]类名:[" + this.GetType().Name + "],行号:[" + Component.GetLineNum().ToString() + "行],错误信息:[" + ex.Message + "]");
                return "更新失败请重新操作，错误代码：500 ";
            }
        }
        //
        private dynamic GetById(HttpContext context)
        {
            try
            {
                SysLogBll.Create("通讯录", "查询通讯录单个操作", adminUser.AdminName);
                int Id = 0;
                try { Id = int.Parse(context.Request.QueryString["Id"].ToString()); }
                catch { }
                return dal.GetModel(Id);
            }
            catch (Exception ex)
            {
                SystemErrorPlug.ErrorRecord("时间:[" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "]类名:[" + this.GetType().Name + "],行号:[" + Component.GetLineNum().ToString() + "行],错误信息:[" + ex.Message + "]");
                return null;
            }
        }
        //
        private dynamic Delete(HttpContext context)
        {
            try
            {
                SysLogBll.Create("通讯录", "删除通讯录操作", adminUser.AdminName);
                int Id = 0;
                try { Id = int.Parse(context.Request.QueryString["Id"].ToString()); }
                catch { }              
                if (dal.Delete(Id))
                {
                    return "删除成功！";
                }
                else
                {
                    return "删除失败请重新操作! ";
                }
            }
            catch (Exception ex)
            {
                SystemErrorPlug.ErrorRecord("时间:[" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "]类名:[" + this.GetType().Name + "],行号:[" + Component.GetLineNum().ToString() + "行],错误信息:[" + ex.Message + "]");
                return "删除失败请重新操作，错误代码：500 ";
            }
        }
        //
        private dynamic GetModels(HttpContext context)
        {
            dynamic model = new Contacts();
            try { model.Id = int.Parse(context.Request.Form["Id"].ToString()); }
            catch { }
            model.FK_OrganizationId = context.Request.Form["FK_OrganizationId"].ToString();
            model.UserName = context.Request.Form["UserName"].ToString();
            model.UserTel = context.Request.Form["UserTel"].ToString();
            model.ConsContent = context.Request.Form["ConsContent"].ToString();
            model.Editor = adminUser.AdminName;
            model.CreateDate = DateTime.Now;
            return model;
        }
    }
}

