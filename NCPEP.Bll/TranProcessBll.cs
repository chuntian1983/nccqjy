using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using NCPEP.Dal;
using System.Web;
using NCPEP.Model;

namespace NCPEP.Bll
{
    public class TranProcessBll
    {
        private dynamic dal = null;
        private dynamic adminUser = null;
        public TranProcessBll()
        {
            dal = new TranProcessDal();
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
                case "by":
                    returnDate = JsonHelper<TranProcess>.JsonWriter(GetById(context));
                    break;
                default:
                    returnDate = "请求错误!";
                    break;
            }
            return returnDate;
        }

        private dynamic GetById(HttpContext context)
        {
            try
            {
                SysLogBll.Create("标信息审核流程", "返回单个标信息审核流程", adminUser.AdminName);
                int BidId = 0;
                try { BidId = int.Parse(context.Request.QueryString["BidId"]); }
                catch { }
                return dal.GetModel(BidId);
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
                SysLogBll.Create("标信息审核流程", "添加标信息审核流程操作", adminUser.AdminName);
                int BidId = 0;
                int UpManager = 0;
                int DepaStatusId = 1;
                BidId = int.Parse(context.Request.QueryString["BidId"]);
                UpManager = int.Parse(context.Request.QueryString["UpManager"]);
                string OrgCode = context.Request.QueryString["OrgCode"];
                DepaStatusId = int.Parse(context.Request.QueryString["DepaStatusId"]);
                if (UpManager == 1 || OrgCode == adminUser.OrgCode)
                {
                    string column = "";
                    switch (DepaStatusId)
                    {
                        case 1:
                            string[] strArray = new string[] { adminUser.AdminName, context.Request.QueryString["AcceptSay"], DateTime.Now.ToString(), DateTime.Now.ToString() };
                            column = string.Format(" AcceptName ='{0}',AcceptSay='{1}',AcceptSayDate='{2}',AuditDate='{3}'", strArray);
                            break;
                        case 2:
                            strArray = new string[] { adminUser.AdminName, context.Request.QueryString["AuditSay"], DateTime.Now.ToString(), DateTime.Now.ToString() };
                            column = string.Format(" AuditName ='{0}',AuditSay='{1}',AuditSayDate='{2}',TradingDate='{3}'", strArray);
                            break;
                        case 3:
                            strArray = new string[] { adminUser.AdminName, context.Request.QueryString["TradingSay"], DateTime.Now.ToString(), DateTime.Now.ToString() };
                            column = string.Format(" TradingName ='{0}',TradingSay='{1}',TradingSayDate='{2}',AttestationDate='{3}'", strArray);
                            break;
                        case 4:
                            strArray = new string[] { adminUser.AdminName, context.Request.QueryString["AttestationSay"], DateTime.Now.ToString(), DateTime.Now.ToString() };
                            column = string.Format(" AttestationName ='{0}',AttestationSay='{1}',AttestationSayDate='{2}',HeadDate='{3}'", strArray);
                            break;
                        case 5:
                            strArray = new string[] { adminUser.AdminName, context.Request.QueryString["HeadSay"], DateTime.Now.ToString(), DateTime.Now.ToString() };
                            column = string.Format(" HeadName ='{0}',HeadSay='{1}',HeadSayDate='{2}',SuperDate='{3}'", strArray);
                            break;
                        case 6:
                            strArray = new string[] { adminUser.AdminName, context.Request.QueryString["SuperSay"], DateTime.Now.ToString() };
                            column = string.Format(" SuperName ='{0}',SuperSay='{1}',SuperSayDate='{2}'", strArray);
                            break;
                    }
                    //
                    TranProcessDal tpd = new TranProcessDal();
                    if (!tpd.Exists(BidId))
                    {
                        string col = "FK_BidId,AcceptDate";
                        string values = string.Format("{0},'{1}'", BidId, DateTime.Now.ToString());
                        tpd.Create(col, values);
                    }
                    //
                    if (dal.Update(column, BidId))
                    {
                        int value = (DepaStatusId + 1);
                        if (new BidDal().UpdateState("DepaStatus", value, BidId))
                        {
                            new BidDal().UpdateState("ReturnStatus", 0, BidId);
                            return "审核成功，信息上报成功！";
                        }
                        else
                        {
                            return "审核失败，信息上报失败!";
                        }
                    }
                    else
                    {
                        return "失败请重新操作! ";
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
    }
}
