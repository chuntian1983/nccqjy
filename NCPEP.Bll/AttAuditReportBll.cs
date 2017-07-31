using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using NCPEP.Model;
using System.Web;
using NCPEP.Dal;
using System.Data;
using System.Web.SessionState;

namespace NCPEP.Bll
{
    public class AttAuditReportBll : IReadOnlySessionState, IRequiresSessionState
    {
        private BidDal bidDal = null;
        private dynamic adminUser = null;
        public AttAuditReportBll()
        {
            bidDal = new BidDal();
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
                    string str = "\"total\":" + SumCount(context) + ",";
                    returnDate = JsonHelper<Bid>.JsonDataTable(GetAllList(context), "rows").Insert(1, (str));
                    break;
                case "AuRep":
                    returnDate = BidAuRep(context);
                    break;
                case "AssuranceList":
                    string count = "\"total\":" + AssuranceCount(context) + ",";
                    returnDate = JsonHelper<Bid>.JsonDataTable(GetAssuranceList(context), "rows").Insert(1, (count));
                    break;
                case "ContractNoList":
                    string nocount = "\"total\":" + ContractNoCount(context) + ",";
                    returnDate = JsonHelper<Bid>.JsonDataTable(GetContractNoList(context), "rows").Insert(1, (nocount));
                    break;
                case "ConNo":
                    returnDate = BidConNo(context);
                    break;
                case "sum":
                    returnDate = JsonHelper<Bid>.JsonDataTable(Summary(context), "rows");
                    break;
                default:
                    returnDate = "请求错误!";
                    break;
            }
            return returnDate;
        }
        //
        private DataTable Summary(HttpContext context)
        {
            try
            {
                string OrgCode = context.Request.QueryString["OrgCode"];
                return bidDal.Summary(OrgCode);
            }
            catch (Exception ex)
            {
                SystemErrorPlug.ErrorRecord("时间:[" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "]类名:[" + this.GetType().Name + "],行号:[" + Component.GetLineNum().ToString() + "行],错误信息:[" + ex.Message + "]");
                return null;
            }
        }
        //
        private string BidConNo(HttpContext context)
        {
            try
            {
                string Id = context.Request.QueryString["Id"];
                int ContractNo = bidDal.GetMaxContractNo();
                string orgcode = adminUser.OrgCode.ToString().Length == 6 ? adminUser.OrgCode : adminUser.OrgCode + "00";
                string ContNo = orgcode + DateTime.Now.Year.ToString() + ContractNo.ToString().PadLeft(6, '0');
                string rows = string.Format(" ContractDate = '{0}',ContractNo='{1}'", DateTime.Now, ContNo);
                string where = string.Format(" Id = {0} ", Id);
                if (bidDal.UpdateState(rows, where))
                {
                    return "生成成功";
                }
                else
                {
                    return "生成失败，请重新操作！";
                }
            }
            catch (Exception ex)
            {
                SystemErrorPlug.ErrorRecord("时间:[" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "]类名:[" + this.GetType().Name + "],行号:[" + Component.GetLineNum().ToString() + "行],错误信息:[" + ex.Message + "]");
                return "生成失败，505错误！";
            }
        }
        //
        private dynamic ContractNoCount(HttpContext context)
        {
            try
            {
                SysLogBll.Create("出让标", "获取出让标总和", adminUser.AdminName);
                string sqlWhere = string.Empty;
                if (1 == adminUser.IsCheck)
                {
                    sqlWhere = string.Format(" OrgCode like '{0}%' ", adminUser.OrgCode);
                }
                else
                {
                    sqlWhere = string.Format(" OrgCode = '{0}'  ", adminUser.OrgCode);
                }
                if (context.Request.QueryString["BidName"] != null)
                {
                    sqlWhere += string.Format(" and BidName like '%{0}%'", context.Request.QueryString["BidName"]);
                }
                string DepaStatus = context.Request.QueryString["DepaStatus"];
                sqlWhere += string.Format(" and DepaStatus = {0}", DepaStatus);

                if (!string.IsNullOrEmpty(context.Request.QueryString["bt"]))
                {
                    sqlWhere += " and a.Id in(select FK_BidId from T_BidTrans where TradingStatus=1)";
                }
                sqlWhere += " and ContractNo = '' and NoAssurance != '' ";
                return bidDal.SumCount(sqlWhere);
            }
            catch (Exception ex)
            {
                SystemErrorPlug.ErrorRecord("时间:[" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "]类名:[" + this.GetType().Name + "],行号:[" + Component.GetLineNum().ToString() + "行],错误信息:[" + ex.Message + "]");
                return 0;
            }
        }
        //
        private DataTable GetContractNoList(HttpContext context)
        {
            try
            {
                string sqlWhere = string.Empty;
                if (1 == adminUser.IsCheck)
                {
                    sqlWhere = string.Format(" a.OrgCode like '{0}%' ", adminUser.OrgCode);
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
                SysLogBll.Create("出让标", "获取所有的出让标操作", adminUser.AdminName);
                string order = string.Format(" order by a.{0} {1}", context.Request.Form["sort"].ToString(), context.Request.Form["order"].ToString());
                if (context.Request.QueryString["BidName"] != null)
                {
                    sqlWhere += string.Format(" and a.BidName like '%{0}%'", context.Request.QueryString["BidName"]);
                }
                string DepaStatus = context.Request.QueryString["DepaStatus"];
                sqlWhere += string.Format(" and a.DepaStatus = {0}", DepaStatus);

                if (!string.IsNullOrEmpty(context.Request.QueryString["bt"]))
                {
                    sqlWhere += " and a.Id in(select FK_BidId from T_BidTrans where TradingStatus=1)";
                }
                //sqlWhere += " and a.ContractNo = '' and a.NoAssurance != ''";
                return bidDal.GetAllList(sqlWhere, startIndex, pageSize, order);

            }
            catch (Exception ex)
            {
                SystemErrorPlug.ErrorRecord("时间:[" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "]类名:[" + this.GetType().Name + "],行号:[" + Component.GetLineNum().ToString() + "行],错误信息:[" + ex.Message + "]");
                return null;
            }
        }
        //
        private dynamic AssuranceCount(HttpContext context)
        {
            try
            {
                SysLogBll.Create("出让标", "获取出让标总和", adminUser.AdminName);
                string sqlWhere = string.Empty;
                if (1 == adminUser.IsCheck)
                {
                    sqlWhere = string.Format(" OrgCode like '{0}%' ", adminUser.OrgCode);
                }
                else
                {
                    sqlWhere = string.Format(" OrgCode = '{0}'  ", adminUser.OrgCode);
                }
                if (context.Request.QueryString["BidName"] != null)
                {
                    sqlWhere += string.Format(" and BidName like '%{0}%'", context.Request.QueryString["BidName"]);
                }
                string DepaStatus = context.Request.QueryString["DepaStatus"];
                sqlWhere += string.Format(" and DepaStatus = {0}", DepaStatus);

                if (!string.IsNullOrEmpty(context.Request.QueryString["bt"]))
                {
                    sqlWhere += " and a.Id in(select FK_BidId from T_BidTrans where TradingStatus=1)";
                }
                sqlWhere += " and NoAssurance = '' ";
                return bidDal.SumCount(sqlWhere);
            }
            catch (Exception ex)
            {
                SystemErrorPlug.ErrorRecord("时间:[" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "]类名:[" + this.GetType().Name + "],行号:[" + Component.GetLineNum().ToString() + "行],错误信息:[" + ex.Message + "]");
                return 0;
            }
        }
        //
        private DataTable GetAssuranceList(HttpContext context)
        {
            try
            {
                string sqlWhere = string.Empty;
                if (1 == adminUser.IsCheck)
                {
                    sqlWhere = string.Format(" a.OrgCode like '{0}%' ", adminUser.OrgCode);
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
                SysLogBll.Create("出让标", "获取所有的出让标操作", adminUser.AdminName);
                string order = string.Format(" order by a.{0} {1}", context.Request.Form["sort"].ToString(), context.Request.Form["order"].ToString());
                if (context.Request.QueryString["BidName"] != null)
                {
                    sqlWhere += string.Format(" and a.BidName like '%{0}%'", context.Request.QueryString["BidName"]);
                }
                string DepaStatus = context.Request.QueryString["DepaStatus"];
                sqlWhere += string.Format(" and a.DepaStatus = {0}", DepaStatus);

                if (!string.IsNullOrEmpty(context.Request.QueryString["bt"]))
                {
                    sqlWhere += " and a.Id in(select FK_BidId from T_BidTrans where TradingStatus=1)";
                }
                //2016-10-12 合同号码条件去掉
                //sqlWhere += "  and a.ContractNo != '' ";
                return bidDal.GetAllList(sqlWhere, startIndex, pageSize, order);

            }
            catch (Exception ex)
            {
                SystemErrorPlug.ErrorRecord("时间:[" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "]类名:[" + this.GetType().Name + "],行号:[" + Component.GetLineNum().ToString() + "行],错误信息:[" + ex.Message + "]");
                return null;
            }
        }
        //
        private string BidAuRep(HttpContext context)
        {
            try
            {
                string Id = context.Request.QueryString["Id"];
                int NoAssurance = bidDal.GetMaxNoAssurance();
                string rows = string.Format(" NoAssurance={0}", DateTime.Now.Year + NoAssurance.ToString().PadLeft(6, '0'));
                string where = string.Format(" Id = {0} ", Id);
                if (bidDal.UpdateState(rows, where))
                {
                    return "鉴证成功";
                }
                else
                {
                    return "鉴证失败，请重新操作！";
                }
            }
            catch (Exception ex)
            {
                SystemErrorPlug.ErrorRecord("时间:[" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "]类名:[" + this.GetType().Name + "],行号:[" + Component.GetLineNum().ToString() + "行],错误信息:[" + ex.Message + "]");
                return "鉴证失败，505错误！";
            }
        }
        //
        private dynamic SumCount(HttpContext context)
        {
            try
            {
                SysLogBll.Create("出让标", "获取出让标总和", adminUser.AdminName);
                string sqlWhere = string.Empty;
                if (1 == adminUser.IsCheck)
                {
                    sqlWhere = string.Format(" OrgCode like '{0}%' ", adminUser.OrgCode);
                }
                else
                {
                    sqlWhere = string.Format(" OrgCode = '{0}'  ", adminUser.OrgCode);
                }
                if (context.Request.QueryString["BidName"] != null)
                {
                    sqlWhere += string.Format(" and BidName like '%{0}%'", context.Request.QueryString["BidName"]);
                }
                string DepaStatus = context.Request.QueryString["DepaStatus"];
                sqlWhere += string.Format(" and DepaStatus = {0}", DepaStatus);

                if (!string.IsNullOrEmpty(context.Request.QueryString["bt"]))
                {
                    sqlWhere += " and a.Id in(select FK_BidId from T_BidTrans where TradingStatus=1)";
                }
                sqlWhere += " and ContractNo != '' and NoAssurance != '' ";
                return bidDal.SumCount(sqlWhere);
            }
            catch (Exception ex)
            {
                SystemErrorPlug.ErrorRecord("时间:[" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "]类名:[" + this.GetType().Name + "],行号:[" + Component.GetLineNum().ToString() + "行],错误信息:[" + ex.Message + "]");
                return 0;
            }
        }
        //
        private DataTable GetAllList(HttpContext context)
        {
            try
            {
                string sqlWhere = string.Empty;
                if (1 == adminUser.IsCheck)
                {
                    sqlWhere = string.Format(" a.OrgCode like '{0}%' ", adminUser.OrgCode);
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
                SysLogBll.Create("出让标", "获取所有的出让标操作", adminUser.AdminName);
                string order = string.Format(" order by a.{0} {1}", context.Request.Form["sort"].ToString(), context.Request.Form["order"].ToString());
                if (context.Request.QueryString["BidName"] != null)
                {
                    sqlWhere += string.Format(" and a.BidName like '%{0}%'", context.Request.QueryString["BidName"]);
                }
                string DepaStatus = context.Request.QueryString["DepaStatus"];
                sqlWhere += string.Format(" and a.DepaStatus = {0}", DepaStatus);

                if (!string.IsNullOrEmpty(context.Request.QueryString["bt"]))
                {
                    sqlWhere += " and a.Id in(select FK_BidId from T_BidTrans where TradingStatus=1)";
                }

               // sqlWhere += " and a.ContractNo != '' and a.NoAssurance != '' ";
                //2016-10-12 去掉合同编号
                //sqlWhere += "  and a.NoAssurance != '' ";
                return bidDal.GetAllList(sqlWhere, startIndex, pageSize, order);

            }
            catch (Exception ex)
            {
                SystemErrorPlug.ErrorRecord("时间:[" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "]类名:[" + this.GetType().Name + "],行号:[" + Component.GetLineNum().ToString() + "行],错误信息:[" + ex.Message + "]");
                return null;
            }
        }
    }
}
