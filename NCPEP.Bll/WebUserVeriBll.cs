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
    public class WebUserVeriBll
    {
        private dynamic dal = null;
        private dynamic adminUser = null;
        private dynamic aodal = null;
        //
        public WebUserVeriBll()
        {
            dal = new WebUserVeriDal();
            aodal = new AuditOpinionDal();
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
                        adminUser = new GetUserCookiesPlug().GetVeriUserCookies(context.Request.Cookies["AdminCookies"]["SuperAdminUserCookies"]);
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
        //
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
        //
        private dynamic GetById(HttpContext context)
        {
            try
            {
                SysLogBll.Create("认证会员", "返回单个认证会员信息操作", adminUser.AdminName);
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
        private string Create(HttpContext context)
        {
            try
            {
                SysLogBll.Create("认证会员", "增加认证会员操作", adminUser.AdminName);

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
        //
        private string Delete(HttpContext context)
        {
            try
            {
                SysLogBll.Create("认证会员", "删除认证会员操作", adminUser.AdminName);
                int id = 0;
                try { id = int.Parse(context.Request.QueryString["Id"].ToString()); }
                catch { }
                WebUserVeri webUser = dal.GetModel(id);
                aodal.Delete(id);
                Component.DeleteImg("~/Super/Scan/us/" + webUser.LoginName + "/" + webUser.VeriIDCardScan);
                Component.DeleteImg("~/Super/Scan/us/" + webUser.LoginName + "/" + webUser.VeriCorporateIDCardScan);
                Component.DeleteImg("~/Super/Scan/us/" + webUser.LoginName + "/" + webUser.VeriCreditCodeScan);
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
        //
        private dynamic SumCount(HttpContext context)
        {
            try
            {
                SysLogBll.Create("认证会员", "获取认证会员总和", adminUser.AdminName);
                string sqlWhere = string.Empty;
                if (1 == adminUser.IsCheck)
                {
                    sqlWhere = string.Format(" OrgCode like '{0}%' ", adminUser.OrgCode);
                }
                else
                {
                    sqlWhere = string.Format(" OrgCode = '{0}'  ", adminUser.OrgCode);
                }
                if (context.Request.QueryString["AdminLogName"] != null)
                {
                    sqlWhere += string.Format(" and  a.AdminLogName like '%{0}%'", context.Request.QueryString["AdminLogName"]);

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
                SysLogBll.Create("认证会员", "返回所有认证会员数据", adminUser.AdminName);
                string sqlWhere = string.Empty;
                if (1 == adminUser.IsCheck)
                {
                    sqlWhere = string.Format(" a.OrgCode like '{0}%'  ", adminUser.OrgCode);
                }
                else
                {
                    sqlWhere = string.Format(" a.OrgCode = '{0}'  ", adminUser.OrgCode);
                }
                int startIndex = 0;
                try { startIndex = int.Parse(context.Request.Form["page"]) - 1; }
                catch { }
                int pageSize = 10;
                try { pageSize = int.Parse(context.Request.Form["rows"].ToString()); }
                catch { }
                string order = string.Format(" order by a.{0} {1}", context.Request.Form["sort"].ToString(), context.Request.Form["order"].ToString());
                if (context.Request.QueryString["AdminName"] != null)
                {
                    sqlWhere += string.Format(" and a.AdminName like '%{0}%'", context.Request.QueryString["AdminName"]);
                }
                return dal.GetAllList(sqlWhere, startIndex, pageSize, order);
            }
            catch (Exception ex)
            {
                SystemErrorPlug.ErrorRecord("时间:[" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "]类名:[" + this.GetType().Name + "],行号:[" + Component.GetLineNum().ToString() + "行],错误信息:[" + ex.Message + "]");
                return null;
            }
        }
        //
        private string Update(HttpContext context)
        {
            try
            {
                SysLogBll.Create("认证会员", "更新认证会员操作", adminUser.AdminName);

                if (dal.Update(GetModel(context)))
                {
                    return "提交认证成功！";
                }
                else
                {
                    return "提交认证失败，请重新操作！";
                }
            }
            catch (Exception ex)
            {
                SystemErrorPlug.ErrorRecord("时间:[" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "]类名:[" + this.GetType().Name + "],行号:[" + Component.GetLineNum().ToString() + "行],错误信息:[" + ex.Message + "]");
                return "更新失败,错误代码：500 ";
            }
        }
        //
        private dynamic GetModel(HttpContext context)
        {
            dynamic model = new WebUserVeri();
            try
            {
                try { model.Id = int.Parse(context.Request.Form["Id"].ToString()); }
                catch { }
                model.LoginName = context.Request.Form["LoginName"].ToString();
                model.LoginPass = context.Request.Form["LoginPass"].ToString();
                model.UserName = context.Request.Form["UserName"].ToString();
                model.UserTel = context.Request.Form["UserTel"].ToString();
                model.UserEmail = context.Request.Form["UserEmail"].ToString();
                try { model.UserStatus = int.Parse(context.Request.Form["UserStatus"].ToString()); }
                catch { }
                try { model.LoginDate = DateTime.Parse(context.Request.Form["LoginDate"].ToString()); }
                catch { }
                try { model.LoginnNum = int.Parse(context.Request.Form["LoginnNum"].ToString()); }
                catch { }
                try { model.OutDate = DateTime.Parse(context.Request.Form["OutDate"].ToString()); }
                catch { }
                try { model.Veri = int.Parse(context.Request.Form["Veri"].ToString()); }
                catch { }
                try { model.MemberTypeId = int.Parse(context.Request.Form["MemberTypeId"].ToString()); }
                catch { }
                model.VeriName = context.Request.Form["VeriName"].ToString();
                model.VeriSex = context.Request.Form["VeriSex"].ToString();
                model.VeriIDCard = context.Request.Form["VeriIDCard"].ToString();
                if (!string.IsNullOrEmpty(context.Request.Form["VeriIDCard"].ToString()))
                {

                    string ImgName = new UpLoadImgPlug().UploadImg("~/Super/Scan/us/" + model.LoginName + "/", 0);
                    if (!string.IsNullOrEmpty(ImgName))
                    {
                        string imgUrl = HttpContext.Current.Server.MapPath("~/Super/Scan/us/" + model.LoginName + "/" + ImgName);
                        string pdfUrl = "~/Super/Scan/us/" + model.LoginName + "/";
                        new ProducePdfPlug().CreatePdf(imgUrl, pdfUrl, ImgName.Split('.')[0] + ".pdf");
                        model.VeriIDCardScan = ImgName.Split('.')[0] + ".pdf";
                    }
                    else
                    {
                        model.VeriIDCardScan = context.Request.Form["tVeriIDCardScan"].ToString();
                    }
                }
                model.OrgCode = context.Request.Form["OrgCode"].ToString();
                model.VeriAddress = context.Request.Form["VeriAddress"].ToString();
                model.VeriTel = context.Request.Form["VeriTel"].ToString();
                model.VeriCorporate = context.Request.Form["VeriCorporate"].ToString();
                model.VeriCorporateIDCard = context.Request.Form["VeriCorporateIDCard"].ToString();
                if (!string.IsNullOrEmpty(context.Request.Form["VeriCorporateIDCard"].ToString()))
                {

                    string ImgName = new UpLoadImgPlug().UploadImg("~/Super/Scan/us/" + model.LoginName + "/", 0);
                    if (!string.IsNullOrEmpty(ImgName))
                    {
                        string imgUrl = HttpContext.Current.Server.MapPath("~/Super/Scan/us/" + model.LoginName + "/" + ImgName);
                        string pdfUrl = "~/Super/Scan/us/" + model.LoginName + "/";
                        new ProducePdfPlug().CreatePdf(imgUrl, pdfUrl, ImgName.Split('.')[0] + ".pdf");
                        model.VeriCorporateIDCardScan = ImgName.Split('.')[0] + ".pdf";
                    }
                    else
                    {
                        model.VeriCorporateIDCardScan = context.Request.Form["tVeriCorporateIDCardScan"].ToString();
                    }
                }
                model.VeriCreditCode = context.Request.Form["VeriCreditCode"].ToString();
                if (!string.IsNullOrEmpty(context.Request.Form["VeriCreditCode"].ToString()))
                {

                    string ImgName = new UpLoadImgPlug().UploadImg("~/Super/Scan/us/" + model.LoginName + "/", 0);
                    if (!string.IsNullOrEmpty(ImgName))
                    {
                        string imgUrl = HttpContext.Current.Server.MapPath("~/Super/Scan/us/" + model.LoginName + "/" + ImgName);
                        string pdfUrl = "~/Super/Scan/us/" + model.LoginName + "/";
                        new ProducePdfPlug().CreatePdf(imgUrl, pdfUrl, ImgName.Split('.')[0] + ".pdf");
                        model.VeriCreditCodeScan = ImgName.Split('.')[0] + ".pdf";
                    }
                    else
                    {
                        model.VeriCreditCodeScan = context.Request.Form["tVeriCreditCodeScan"].ToString();
                    }
                }
                try { model.VeriStatus = int.Parse(context.Request.Form["VeriStatus"].ToString()); }
                catch { }
                try { model.AuditType = int.Parse(context.Request.Form["AuditType"].ToString()); }
                catch { }
                model.VeriCheckName = adminUser.AdminName;
                try { model.VeriApplyDate = DateTime.Parse(context.Request.Form["VeriApplyDate"].ToString()); }
                catch { }
                try { model.VeriCheckDate = DateTime.Parse(context.Request.Form["VeriCheckDate"].ToString()); }
                catch { }
                return model;
            }
            catch (Exception ex)
            {
                SystemErrorPlug.ErrorRecord("时间:[" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "]类名:[" + this.GetType().Name + "],行号:[" + Component.GetLineNum().ToString() + "行],错误信息:[" + ex.Message + "]");
                return model;
            }
        }
    }
}
