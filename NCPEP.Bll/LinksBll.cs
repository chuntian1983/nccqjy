using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using NCPEP.Model;
using NCPEP.Dal;

namespace NCPEP.Bll
{
    public class LinksBll
    {
        private dynamic dal = null;
        private dynamic adminUser = null;
        public LinksBll()
        {
            dal = new LinksDal();
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
                    returnDate = JsonHelper<Links>.JsonWriter(GetById(context));
                    break;
                case "del":
                    returnDate = Delete(context);
                    break;
                case "paging":
                    returnDate = JsonHelper<Links>.JsonDataTable(GetAllList(context), "rows");
                    break;
                default:
                    returnDate = "请求错误!";
                    break;
            }
            return returnDate;
        }
        private dynamic GetAllList(HttpContext context)
        {
            try
            {
                SysLogBll.Create("友情链接", "查询所有的友情链接数据", adminUser.AdminName);
                return dal.GetAllList();
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
                SysLogBll.Create("友情链接", "增加友情链接操作", adminUser.AdminName);
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
                SysLogBll.Create("友情链接", "更新友情链接操作", adminUser.AdminName);
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
                SysLogBll.Create("友情链接", "查询友情链接单个操作", adminUser.AdminName);
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
                SysLogBll.Create("友情链接", "删除友情链接操作", adminUser.AdminName);
                int Id = 0;
                try { Id = int.Parse(context.Request.QueryString["Id"].ToString()); }
                catch { }
                dynamic model = dal.GetModel(Id);
                if (dal.Delete(Id))
                {
                    Component.DeleteImg("~/linkImg/" + model.LinkImgUrl);
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
            dynamic model = new Links();
            try { model.Id = int.Parse(context.Request.Form["Id"].ToString()); }
            catch { }
            string linkImgUrl = new UpLoadImgPlug().UploadImg("~/linkImg/", 0);
            model.LinkName = context.Request.Form["LinkName"].ToString();
            model.LinkUrl = context.Request.Form["LinkUrl"].ToString();
            model.LinkImgUrl = linkImgUrl == string.Empty ? context.Request.Form["LinkImgUrl"].ToString() : linkImgUrl;
            model.Editor = adminUser.AdminName;
            return model;
        }
    }
}