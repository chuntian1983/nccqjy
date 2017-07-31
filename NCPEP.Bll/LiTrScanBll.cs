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
    public class LiTrScanBll
    {
        private dynamic user = null;
        private string UserName = string.Empty;
        public LiTrScanBll()
        {

        }
        //
        public string ProcessRequest(HttpContext context)
        {
            try
            {
                user = context.Session["UserSession"] as WebUserVeri;
                if (null == user)
                {
                    if (!string.IsNullOrEmpty(context.Request.Cookies["UserCookies"].Value))
                    {
                        user = new GetUserCookiesPlug().GetVeriUserCookies(context.Request.Cookies["UserCookies"]["UserSession"]);
                        context.Session["UserSession"] = user;
                    }
                }
            }
            catch (Exception ex)
            {
                SystemErrorPlug.ErrorRecord("时间:[" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "]类名:[" + this.GetType().Name + "],行号:[" + Component.GetLineNum().ToString() + "行],错误信息:[" + ex.Message + "]");
                return null;
            }
            UserName = !string.IsNullOrEmpty(user.UserName) ? user.UserName : user.VeriName;

            string action = context.Request.QueryString["action"].ToString();
            string returnDate = string.Empty;
            switch (action)
            {
                case "LiTrScanpaging":
                    returnDate = JsonHelper<LiceTranScan>.JsonDataTable(GetLiceTranScanList(context), "rows");
                    break;
                case "bidInfopaging":
                    returnDate = JsonHelper<BidReturnInfo>.JsonDataTable(GetBidReturnInfoList(context), "rows");
                    break;
                case "TranProcessby":
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
                SysLogBll.Create("web标信息审核流程", "返回单个标信息审核流程", UserName);
                int BidId = 0;
                try { BidId = int.Parse(context.Request.QueryString["BidId"]); }
                catch { }
                return new TranProcessDal().GetModel(BidId);
            }
            catch (Exception ex)
            {
                SystemErrorPlug.ErrorRecord("时间:[" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "]类名:[" + this.GetType().Name + "],行号:[" + Component.GetLineNum().ToString() + "行],错误信息:[" + ex.Message + "]");
                return null;
            }
        }
        //
        private DataTable GetBidReturnInfoList(HttpContext context)
        {
            try
            {
                SysLogBll.Create("web标审核返回信息", "获取标审核返回信息操作", UserName);
                int BidId = 0;
                try { BidId = int.Parse(context.Request.QueryString["BidId"]); }
                catch { }
                return new BidReturnInfoDal().GetAllList(BidId);
            }
            catch (Exception ex)
            {
                SystemErrorPlug.ErrorRecord("时间:[" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "]类名:[" + this.GetType().Name + "],行号:[" + Component.GetLineNum().ToString() + "行],错误信息:[" + ex.Message + "]");
                return null;
            }
        }
        //
        private dynamic GetLiceTranScanList(HttpContext context)
        {
            try
            {
                int LiceTranId = 0;
                LiceTranId = int.Parse(context.Request.QueryString["LiceTranId"]);
                SysLogBll.Create("web出让/受让方上传附件", "查询所有的出让/受让方上传附件数据", UserName);
                return new LiceTranScanDal().GetAllList(LiceTranId);
            }
            catch (Exception ex)
            {
                SystemErrorPlug.ErrorRecord("时间:[" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "]类名:[" + this.GetType().Name + "],行号:[" + Component.GetLineNum().ToString() + "行],错误信息:[" + ex.Message + "]");
                return null;
            }
        }
    }
}
