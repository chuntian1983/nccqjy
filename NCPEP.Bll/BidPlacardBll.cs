using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using NCPEP.Dal;
using NCPEP.Model;
using System.Data;

namespace NCPEP.Bll
{
    public class BidPlacardBll
    {
        private BidPlacardDal dal = null;
        private dynamic adminUser = null;
        public BidPlacardBll()
        {
            dal = new BidPlacardDal();
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
                case "byId":
                    returnDate = JsonHelper<AdminType>.JsonWriter(GetById(context));
                    break;
                case "yxsrf":
                    returnDate = JsonHelper<Bid>.JsonDataTable(Getyxsrf(context));
                    break;
                default:
                    returnDate = "请求错误!";
                    break;
            }
            return returnDate;
        }

        private DataTable  Getyxsrf(HttpContext context)
        {
            DataTable dt = new DataTable();
            try
            {
                //SysLogBll.Create("招标公告", "添加招标公告操作", adminUser.AdminName);
                int binid=0;
                try {
                    binid = int.Parse(context.Request.Form["Id"].ToString());
                }
                catch { }
                dt= dal.GetYxsrf(binid);
            }
            catch (Exception ex)
            {
                SystemErrorPlug.ErrorRecord("时间:[" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "]类名:[" + this.GetType().Name + "],行号:[" + Component.GetLineNum().ToString() + "行],错误信息:[" + ex.Message + "]");
                //return "添加失败请重新操作，错误代码：500 ";
            }
            return dt;
        }
        private string Create(HttpContext context)
        {
            try
            {
                SysLogBll.Create("招标公告", "添加招标公告操作", adminUser.AdminName);
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
        private dynamic GetById(HttpContext context)
        {
            try
            {
                SysLogBll.Create("标公告", "返回单个标公告信息操作", adminUser.AdminName);
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

        private string Update(HttpContext context)
        {
            try
            {
                SysLogBll.Create("标公告", "更新标公告操作", adminUser.AdminName);
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

        private dynamic GetModels(HttpContext context)
        {
            dynamic model = new BidPlacard();
            model.FK_BidId = int.Parse(context.Request.QueryString["FK_BidId"].ToString());
            model.BidPlacardTitle = context.Request.QueryString["BidPlacardTitle"].ToString();
            model.BidPlacardContent = context.Request.QueryString["BidPlacardContent"].ToString();
            model.ReleaseTime = DateTime.Now;
            model.Publisher = adminUser.AdminName;
            try
            {
                model.fujian = context.Request["fujian"];
            }
            catch { }
            try { model.Id = int.Parse(context.Request.QueryString["Id"].ToString()); }
            catch { model.Id = 0; }
            return model;
        }
    }
}
