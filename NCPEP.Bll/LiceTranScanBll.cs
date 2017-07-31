using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using NCPEP.Dal;
using NCPEP.Model;
using System.Web;

namespace NCPEP.Bll
{
    public class LiceTranScanBll
    {
        private LiceTranScanDal dal = null;
        private dynamic adminUser = null;
        public LiceTranScanBll()
        {
            dal = new LiceTranScanDal();
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
                    returnDate = JsonHelper<LiceTranScan>.JsonWriter(GetById(context));
                    break;
                case "del":
                    returnDate = Delete(context);
                    break;
                case "paging":
                    returnDate = JsonHelper<LiceTranScan>.JsonDataTable(GetAllList(context), "rows");
                    break;
                default:
                    returnDate = "请求错误!";
                    break;
            }
            return returnDate;
        }
        //

        private dynamic GetAllList(HttpContext context)
        {
            try
            {
                int LiceTranId = 0;
                LiceTranId = int.Parse(context.Request.QueryString["LiceTranId"]);
                SysLogBll.Create("出让/受让方上传附件", "查询所有的出让/受让方上传附件数据", adminUser.AdminName);
                return dal.GetAllList(LiceTranId);
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
                SysLogBll.Create("出让/受让方上传附件", "增加出让/受让方上传附件操作", adminUser.AdminName);
                if (dal.Create(GetModels(context)))
                {
                    return "上传成功。";
                }
                else
                {
                    return "上传失败，请重新操作! ";
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
                SysLogBll.Create("出让/受让方上传附件", "更新出让/受让方上传附件操作", adminUser.AdminName);
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
                SysLogBll.Create("出让/受让方上传附件", "查询出让/受让方上传附件单个操作", adminUser.AdminName);
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
                SysLogBll.Create("出让/受让方上传附件", "删除出让/受让方上传附件操作", adminUser.AdminName);
                int Id = 0;
                try { Id = int.Parse(context.Request.QueryString["Id"].ToString()); }
                catch { }
                if (dal.Exists(Id))
                {
                    LiceTranScan obj = dal.GetModel(Id);
                    if (dal.Delete(Id))
                    {
                        Component.DeleteImg("~/Super/Scan/lt/" + obj.FK_LiceTranId + "/" + obj.ScanUrl);
                        return "删除成功！";
                    }
                    else
                    {
                        return "删除失败请重新操作! ";
                    }
                }
                else
                {
                    return "数据已经开始受理中无法删除操作！";
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
            LiceTranScan model = new LiceTranScan();
            try { model.Id = int.Parse(context.Request.Form["Id"].ToString()); }
            catch { }
            model.FK_LiceTranId = int.Parse(context.Request.Form["FK_LiceTranId"].ToString());
            model.FK_UploadTypeIndicatorId = int.Parse(context.Request.Form["FK_UploadTypeIndicatorId"].ToString());
            string ImgName = new UpLoadImgPlug().UploadImg("~/Super/Scan/lt/" + model.FK_LiceTranId + "/", 0);
            string imgUrl = HttpContext.Current.Server.MapPath("~/Super/Scan/lt/" + model.FK_LiceTranId + "/" + ImgName);
            string pdfUrl = "~/Super/Scan/lt/" + model.FK_LiceTranId + "/";
            new ProducePdfPlug().CreatePdf(imgUrl, pdfUrl, ImgName.Split('.')[0] + ".pdf");
            model.ScanUrl = ImgName.Split('.')[0] + ".pdf";
            model.UploadName = adminUser.AdminName;
            model.UploadDate = DateTime.Now;
            return model;
        }
    }
}