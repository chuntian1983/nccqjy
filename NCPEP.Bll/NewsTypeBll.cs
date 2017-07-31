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
    public class NewsTypeBll
    {
        private dynamic adminUser = null;
        private dynamic dal = null;
        public NewsTypeBll()
        {
            dal = new NewsTypeDal();
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
                case "paging":
                    returnDate = JsonHelper<NewsType>.JsonDataTable(GetAllList(), "rows");
                    break;
                case "add":
                    returnDate = Create(context);
                    break;
                case "up":
                    returnDate = Update(context);
                    break;
                case "by":
                    returnDate = JsonHelper<NewsType>.JsonWriter(GetById(context));
                    break;
                case "combo":
                    returnDate = GetComboData();
                    break;
                default:
                    returnDate = "请求错误!";
                    break;
            }
            return returnDate;
        }
        //
        private string GetComboData()
        {
            try
            {
                SysLogBll.Create("新闻类型", "获取combo数据列表信息", adminUser.AdminName);
                StringBuilder strb = new StringBuilder();
                strb.Append("[");
                dynamic dataTable = dal.GetAllList();
                for (int i = 0; i < dataTable.Rows.Count; i++)
                {
                    strb.Append("{\"id\":\"" + dataTable.Rows[i]["Id"] + "\", \"text\":\"" + dataTable.Rows[i]["NewsTypeName"] + "\"}");
                    if (i < dataTable.Rows.Count - 1)
                    {
                        strb.Append(",");
                    }
                }
                strb.Append("]");
                return strb.ToString();
            }
            catch (Exception ex)
            {
                SystemErrorPlug.ErrorRecord("时间:[" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "]类名:[" + this.GetType().Name + "],行号:[" + Component.GetLineNum().ToString() + "行],错误信息:[" + ex.Message + "]");
                return string.Empty;
            }
        }
        //
        private dynamic GetAllList()
        {
            try
            {
                SysLogBll.Create("新闻类型", "返回所有数据", adminUser.AdminName);
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.Append("[");
                return dal.GetAllList();
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
                SysLogBll.Create("新闻类型", "新闻类型添加操作", adminUser.AdminName);
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
        private string Update(HttpContext context)
        {
            try
            {
                SysLogBll.Create("新闻类型", "新闻类型更新操作", adminUser.AdminName);
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
                SysLogBll.Create("新闻类型", "获取单个新闻类型数据", adminUser.AdminName);
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
        protected dynamic GetModels(HttpContext context)
        {
            NewsType model = new NewsType();
            model.NewsTypeName = context.Request.Form["NewsTypeName"];
            model.Editor = adminUser.AdminName;
            try { model.Id = int.Parse(context.Request.Form["Id"]); }
            catch { }
            return model;
        }
    }
}