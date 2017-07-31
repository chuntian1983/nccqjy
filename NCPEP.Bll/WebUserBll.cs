using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using NCPEP.Model;
using NCPEP.Dal;
using System.Web;

namespace NCPEP.Bll
{
    public class WebUserBll
    {
        private dynamic dal = null;
        private dynamic adminUser = null;
        //
        public WebUserBll()
        {
            dal = new WebUserDal();
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
                    returnDate = JsonHelper<WebUserVeri>.JsonDataTable(GetAllList(context), "rows").Insert(1, (str));
                    break;
                case "del":
                    returnDate = Delete(context);
                    break;
                case "by":
                    returnDate = JsonHelper<WebUserVeri>.JsonWriter(GetById(context));
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
                default:
                    returnDate = "请求错误!";
                    break;
            }
            return returnDate;
        }
        private string RowsState(HttpContext context)
        {
            try
            {
                string row = context.Request.QueryString["Rows"];
                string values = context.Request.QueryString["Vale"];
                string where = context.Request.QueryString["id"];
                string value = (values == "0" ? "1" : "0");
                if (dal.UpdateState(row, value, where))
                {
                    return "修改状态设置成功！";
                }
                else
                {
                    return "修改状态设置失败!";
                }
            }
            catch (Exception ex)
            {
                SystemErrorPlug.ErrorRecord("时间:[" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "]类名:[" + this.GetType().Name + "],行号:[" + Component.GetLineNum().ToString() + "行],错误信息:[" + ex.Message + "]");
                return string.Empty;
            }
        }

        private dynamic GetById(HttpContext context)
        {
            try
            {
                SysLogBll.Create("网站会员", "返回单个网站会员信息操作", adminUser.AdminName);
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

        private string Create(HttpContext context)
        {
            try
            {
                SysLogBll.Create("网站会员", "增加网站会员操作", adminUser.AdminName);

                if (dal.Create(GetModel(context)))
                {
                    return "添加成功";
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

        private string Delete(HttpContext context)
        {
            try
            {
                SysLogBll.Create("网站会员", "删除网站会员操作", adminUser.AdminName);
                int id = 0;
                try { id = int.Parse(context.Request.QueryString["Id"].ToString()); }
                catch { }
                WebUserVeri webUser = dal.GetModel(id);
                if (dal.Delete(id))
                {
                    new AuditOpinionDal().Delete(webUser.Id);
                    return "删除操作成功！";
                }
                else
                {
                    return "删除失败请重新操作，错误代码：500 ";
                }

            }
            catch (Exception ex)
            {
                SystemErrorPlug.ErrorRecord("时间:[" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "]类名:[" + this.GetType().Name + "],行号:[" + Component.GetLineNum().ToString() + "行],错误信息:[" + ex.Message + "]");
                return string.Empty;
            }
        }

        private dynamic SumCount(HttpContext context)
        {
            try
            {
                SysLogBll.Create("网站会员", "获取网站会员总和", adminUser.AdminName);
                string sqlWhere = " Veri = 0 ";

                if (context.Request.QueryString["UserName"] != null)
                {
                    sqlWhere += string.Format(" and  UserName like '%{0}%'", context.Request.QueryString["UserName"]);

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
                SysLogBll.Create("网站会员", "返回所有网站会员数据", adminUser.AdminName);
                string sqlWhere = " Veri = 0 ";
                int startIndex = 0;
                try { startIndex = int.Parse(context.Request.Form["page"]) - 1; }
                catch { }
                int pageSize = 10;
                try { pageSize = int.Parse(context.Request.Form["rows"].ToString()); }
                catch { }
                string order = string.Format(" order by {0} {1}", context.Request.Form["sort"].ToString(), context.Request.Form["order"].ToString());
                if (context.Request.QueryString["UserName"] != null)
                {
                    sqlWhere += string.Format(" and UserName like '%{0}%'", context.Request.QueryString["UserName"]);
                }
                return dal.GetAllList(sqlWhere, startIndex, pageSize, order);
            }
            catch (Exception ex)
            {
                SystemErrorPlug.ErrorRecord("时间:[" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "]类名:[" + this.GetType().Name + "],行号:[" + Component.GetLineNum().ToString() + "行],错误信息:[" + ex.Message + "]");
                return null;
            }
        }

        private string Update(HttpContext context)
        {
            try
            {
                SysLogBll.Create("网站会员", "更新网站会员操作", adminUser.AdminName);
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
                return "更新失败,错误代码：500 ";
            }
        }

        private dynamic GetModel(HttpContext context)
        {
            dynamic model = new WebUserVeri();
            try { model.Id = int.Parse(context.Request.Form["Id"].ToString()); }
            catch { }
            model.LoginName = context.Request.Form["LoginName"].ToString();
            model.LoginPass = context.Request.Form["LoginPass"].ToString();
            model.UserName = context.Request.Form["UserName"].ToString();
            model.UserTel = context.Request.Form["UserTel"].ToString();
            model.UserEmail = context.Request.Form["UserEmail"].ToString();
            try { model.UserStatus = int.Parse(context.Request.Form["UserStatus"].ToString()); }
            catch { model.UserStatus = 0; }
            try { model.LoginDate = DateTime.Parse(context.Request.Form["LoginDate"].ToString()); }
            catch { model.LoginDate = DateTime.Now; }
            try { model.LoginnNum = int.Parse(context.Request.Form["LoginnNum"].ToString()); }
            catch { model.LoginnNum = 0; }
            try { model.OutDate = DateTime.Parse(context.Request.Form["OutDate"].ToString()); }
            catch { model.OutDate = DateTime.Now; }
            try { model.Veri = int.Parse(context.Request.Form["Veri"].ToString()); }
            catch { model.Veri = 0; }
            return model;
        }
    }
}