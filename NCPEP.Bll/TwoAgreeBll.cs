using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.SessionState;
using NCPEP.BidCar;
using System.Web;
using NCPEP.Model;
using System.Data;
using NCPEP.Dal;

namespace NCPEP.Bll
{
    public class TwoAgreeBll : IReadOnlySessionState, IRequiresSessionState
    {
        private dynamic adminUser = null;
        private dynamic bidCarData = null;
        public TwoAgreeBll()
        {
            bidCarData = new BidCarData();
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
                        adminUser = new GetUserCookiesPlug().GetUserCookies(context.Request.Cookies["AdminCookies"]["SuperAdminUserCookies"]);
                        context.Session["SuperAdminUserSession"] = adminUser;
                    }
                }
            }
            catch (Exception ex)
            {
                SystemErrorPlug.ErrorRecord("时间:[" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "]类名:[" + this.GetType().Name + "],行号:[" + Component.GetLineNum().ToString() + "行],错误信息:[" + ex.Message + "]");
                context.Response.Write("非法请求!");
            }
            string action = context.Request.QueryString["action"].ToString();
            string returnDate = string.Empty;
            switch (action)
            {
                case "one":
                    returnDate = JsonHelper<BidAuction>.JsonDataTable(GetOneBidding(context));
                    break;
                case "two":
                    returnDate = JsonHelper<BidAuction>.JsonDataTable(GetTwoBidding(context));
                    break;
                case "tree":
                    returnDate = GetLiceTranTree(context);
                    break;
                case "add":
                    returnDate = AddBidTransaction(context);
                    break;
                default:
                    context.Response.Write("请求错误!");
                    break;
            }
            return returnDate;
        }
        //
        private string AddBidTransaction(HttpContext context)
        {
            try
            {
                SysLogBll.Create("成交", "标成交操作", adminUser.AdminName);
                string LiceTran = context.Request.QueryString["LiceTran"];
                string BidId = context.Request.QueryString["BidId"];
                DataTable dataTable = context.Application[BidId] as DataTable;
                string row = " TradingStatus= 2 ";
                string where = string.Format(" FK_BidId = {0}", BidId);
                new BidTransDal().UpdateState(row, where);
                row = " TradingStatus= 1 ";
                where = string.Format(" FK_BidId = {0} and FK_LiceTranId ={1}", BidId, LiceTran);
                new BidTransDal().UpdateState(row, where);
                bidCarData.CopyDataTableToSql(dataTable);
                context.Application.Remove(BidId);
                return "成交成功";
            }
            catch (Exception ex)
            {
                SystemErrorPlug.ErrorRecord("时间:[" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "]类名:[" + this.GetType().Name + "],行号:[" + Component.GetLineNum().ToString() + "行],错误信息:[" + ex.Message + "]");
                return "成交失败！";
            }
        }
        //
        private string GetLiceTranTree(HttpContext context)
        {
            try
            {
                SysLogBll.Create("成交", "标成交列表操作", adminUser.AdminName);
                string BidId = context.Request.QueryString["BidId"];
                StringBuilder strb = new StringBuilder();
                strb.Append("[");
                DataTable dataTable = context.Application[BidId] as DataTable;
                for (int i = 0; i < dataTable.Rows.Count; i++)
                {
                    strb.Append("{\"id\":\"" + dataTable.Rows[i]["LiceTranId"] + "\", \"text\":\"" + dataTable.Rows[i]["Name"] + "-" + dataTable.Rows[i]["Price"] + "\"}");
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
        private DataTable GetOneBidding(HttpContext context)
        {
            string Id = context.Request.QueryString["Id"];
            DataTable oneDt = context.Application[Id] as DataTable;
            if (null != oneDt)
            {
                return oneDt;
            }
            else
            {
                dynamic bidCar = bidCarData.CreateBidCar();
                context.Application[Id] = bidCar;
                return bidCar;
            }
        }
        //
        private DataTable GetTwoBidding(HttpContext context)
        {
            string Id = context.Request.QueryString["Id"];
            Id += "T";
            DataTable twoDt = context.Application[Id] as DataTable;
            if (null != twoDt)
            {
                return twoDt;
            }
            else
            {
                DataTable bidCar = bidCarData.CreateBidCar();
                //
                DataTable dataTable = context.Application[context.Request.QueryString["Id"]] as DataTable;
                bidCar = dataTable.Copy();
                //
                context.Application[Id] = bidCar;
                return bidCar;
            }
        }
    }
}

