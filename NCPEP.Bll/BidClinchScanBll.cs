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
    public class BidClinchScanBll
    {
        private dynamic dal = null;
        private dynamic adminUser = null;
        public BidClinchScanBll()
        {
            dal = new BidClinchScanDal();
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
                    returnDate = JsonHelper<BidClinchScan>.JsonDataTable(GetAllList(context), "rows");
                    break;
                case "add":
                    returnDate = Create(context);
                    break;
                case "up":
                    returnDate = Update(context);
                    break;
                case "del":
                    returnDate = Delete(context);
                    break;
                case "by":
                    returnDate = JsonHelper<BidClinchScan>.JsonWriter(GetById(context));
                    break;
                default:
                    returnDate = "请求错误!";
                    break;
            }
            return returnDate;
        }

        //
        private dynamic GetById(HttpContext context)
        {
            try
            {
                SysLogBll.Create("成交附件", "返回成交附件标信息操作", adminUser.AdminName);
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
                SysLogBll.Create("成交附件", "删除成交附件信息操作", adminUser.AdminName);
                int id = 0;
                try { id = int.Parse(context.Request.QueryString["Id"].ToString()); }
                catch { }
                if (dal.Delete(id))
                {
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
        //
        private string Update(HttpContext context)
        {
            try
            {
                SysLogBll.Create("成交附件", "更新成交附件信息操作", adminUser.AdminName);
                dynamic dModels = GetModels(context);
                if (dal.Update(dModels))
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
        private DataTable GetAllList(HttpContext context)
        {
            try
            {
                int FK_BidId = 0;
                SysLogBll.Create("成交附件", "获取所有的成交附件信息操作", adminUser.AdminName);
                FK_BidId = int.Parse(context.Request.QueryString["FK_BidId"]);
                return dal.GetAllList(FK_BidId);

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
                SysLogBll.Create("成交附件", "添加成交附件信息操作", adminUser.AdminName);
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

        private dynamic GetModels(HttpContext context)
        {
            dynamic model = new BidClinchScan();
            try { model.Id = int.Parse(context.Request.Form["Id"].ToString()); }
            catch { }
            model.FK_BidId = int.Parse(context.Request.Form["FK_BidId"].ToString());
            model.ScanName = context.Request.Form["ScanName"].ToString();
            string ImgName = new UpLoadImgPlug().UploadImg("~/Super/Scan/biscan/" + model.FK_BidId + "/", 0);
            if (!string.IsNullOrEmpty(ImgName))
            {
                string imgUrl = HttpContext.Current.Server.MapPath("~/Super/Scan/biscan/" + model.FK_BidId + "/" + ImgName);
                string pdfUrl = "~/Super/Scan/biscan/" + model.FK_BidId + "/";
                new ProducePdfPlug().CreatePdf(imgUrl, pdfUrl, ImgName.Split('.')[0] + ".pdf");
                model.ScanUrl = ImgName.Split('.')[0] + ".pdf";
            }
            else
            {
                model.ScanUrl = context.Request.Form["ScanUrl"].ToString();
            }
            model.Editor = adminUser.AdminName;
            model.CreateDate = DateTime.Now;
            return model;
        }
    }
}