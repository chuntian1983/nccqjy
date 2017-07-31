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
    public class BidReturnInfoBll
    {
        private dynamic dal = null;
        private dynamic adminUser = null;
        public BidReturnInfoBll()
        {
            dal = new BidReturnInfoDal();
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
                    returnDate = JsonHelper<BidReturnInfo>.JsonDataTable(GetAllList(context), "rows");
                    break;
                case "add":
                    returnDate = Create(context);
                    break;
                default:
                    returnDate = "请求错误!";
                    break;
            }
            return returnDate;
        }

        private string Create(HttpContext context)
        {
            try
            {
                SysLogBll.Create("标审核返回信息", "添加标审核返回信息操作", adminUser.AdminName);
                int BidId = 0;
                int UpManager = 0;
                int DepaStatusId = 1;
                BidId = int.Parse(context.Request.QueryString["FK_BidId"]);
                UpManager = int.Parse(context.Request.QueryString["UpManager"]);
                string OrgCode = context.Request.QueryString["OrgCode"];
                DepaStatusId = int.Parse(context.Request.QueryString["DepaStatusId"]);
                if (UpManager == 1 || OrgCode == adminUser.OrgCode)
                {
                    if (dal.Create(GetModels(context)))
                    {
                        BidDal bd = new BidDal();
                        bd.UpdateState("DepaStatus", (DepaStatusId - 1), BidId);
                        bd.UpdateState("ReturnStatus", 1, BidId);
                        return "添加成功！";
                    }
                    else
                    {
                        return "添加失败请重新操作! ";
                    }
                }
                else
                {
                    return "该标的信息没有提交上级审核！";
                }
            }
            catch (Exception ex)
            {
                SystemErrorPlug.ErrorRecord("时间:[" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "]类名:[" + this.GetType().Name + "],行号:[" + Component.GetLineNum().ToString() + "行],错误信息:[" + ex.Message + "]");
                return "添加失败请重新操作，错误代码：500 ";
            }
        }
        private DataTable GetAllList(HttpContext context)
        {
            try
            {
                SysLogBll.Create("标审核返回信息", "获取标审核返回信息操作", adminUser.AdminName);
                int BidId = 0;
                try { BidId = int.Parse(context.Request.QueryString["BidId"]); }
                catch { }
                return dal.GetAllList(BidId);
            }
            catch (Exception ex)
            {
                SystemErrorPlug.ErrorRecord("时间:[" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "]类名:[" + this.GetType().Name + "],行号:[" + Component.GetLineNum().ToString() + "行],错误信息:[" + ex.Message + "]");
                return null;
            }
        }

        private dynamic GetModels(HttpContext context)
        {
            dynamic model = new BidReturnInfo();
            try { model.FK_BidId = int.Parse(context.Request.QueryString["FK_BidId"].ToString()); }
            catch { }
            try { model.FK_JobId = adminUser.JobId; }
            catch { }
            model.ReturnDepaName = adminUser.AdminName;
            model.ReturnDepaSay = context.Request.QueryString["ReturnDepaSay"].ToString();
            model.ReturnDate = DateTime.Now;
            return model;
        }
    }
}
