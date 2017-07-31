using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using NCPEP.Dal;
using System.Web;
using NCPEP.Model;

namespace NCPEP.Bll
{
    public class AuditOpinionBll
    {
        private dynamic dal = null;
        private dynamic adminUser = null;
        public AuditOpinionBll()
        {
            dal = new AuditOpinionDal();
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
                    returnDate = JsonHelper<AuditOpinion>.JsonDataTable(GetAllList(context), "rows");
                    break;
                case "add":
                    returnDate = Create(context);
                    break;
                case "by":
                    returnDate = JsonHelper<AuditOpinion>.JsonWriter(GetById(context));
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
                SysLogBll.Create("会员审核意见", "返回单个会员审核意见操作", adminUser.AdminName);
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
                SysLogBll.Create("会员审核意见", "添加会员审核意见操作", adminUser.AdminName);
                AuditOpinion models = GetModels(context);
                bool check = false;
                WebUserVeri wv = new WebUserVeriDal().GetModel(models.FK_WebUserVeriId);
                switch (wv.MemberTypeId)
                {
                    case 1:
                        if (!string.IsNullOrEmpty(wv.VeriIDCardScan))
                            check = true;
                        break;
                    case 2:
                        if (!string.IsNullOrEmpty(wv.VeriIDCardScan))
                            check = true;
                        break;
                    case 3:
                        if (!string.IsNullOrEmpty(wv.VeriCorporateIDCardScan) && !string.IsNullOrEmpty(wv.VeriCreditCodeScan))
                            check = true;
                        break;
                }
                if (check)
                {
                    if (dal.Create(models))
                    {
                        string row = "AuditType";
                        string values = context.Request.QueryString["AuditType"];
                        string where = models.FK_WebUserVeriId.ToString();
                        string value = (values == "0" ? "1" : "0");
                        if (new WebUserVeriDal().UpdateState(row, value, where))
                        {
                            return "添加成功，审核成功！";
                        }
                        else
                        {
                            return "审核失败!";
                        }
                    }
                    else
                    {
                        return "添加失败请重新操作! ";
                    }
                }
                else
                {
                    return "注册会员的扫描件没有上传无法审核通过，请上传扫描件！";
                }
            }
            catch (Exception ex)
            {
                SystemErrorPlug.ErrorRecord("时间:[" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "]类名:[" + this.GetType().Name + "],行号:[" + Component.GetLineNum().ToString() + "行],错误信息:[" + ex.Message + "]");
                return "添加失败请重新操作，错误代码：500 ";
            }
        }
        //
        private dynamic GetAllList(HttpContext context)
        {
            try
            {
                SysLogBll.Create("会员审核意见", "获取所有的会员审核意见操作", adminUser.AdminName);
                int WebUserVeriId = 0;
                try { WebUserVeriId = int.Parse(context.Request.QueryString["WebUserVeriId"]); }
                catch { }
                return dal.GetAllList(WebUserVeriId);
            }
            catch (Exception ex)
            {
                SystemErrorPlug.ErrorRecord("时间:[" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "]类名:[" + this.GetType().Name + "],行号:[" + Component.GetLineNum().ToString() + "行],错误信息:[" + ex.Message + "]");
                return null;
            }
        }

        private dynamic GetModels(HttpContext context)
        {
            dynamic model = new AuditOpinion();
            try { model.FK_WebUserVeriId = int.Parse(context.Request.QueryString["WebUserVeriId"].ToString()); }
            catch { }
            model.CheckOpinion = context.Request.QueryString["CheckOpinion"].ToString();
            model.OpinionDate = DateTime.Now;
            model.CheckName = adminUser.AdminName;
            try { model.Id = int.Parse(context.Request.QueryString["Id"].ToString()); }
            catch { model.Id = 0; }
            return model;
        }
    }
}
