using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.SessionState;
using System.Web;
using NCPEP.Model;
using System.Data;
using NCPEP.BidCar;
using System.Data.SqlClient;

namespace NCPEP.Bll
{
    public class WebUserBidCarBll : IReadOnlySessionState, IRequiresSessionState
    {
        private dynamic user = null;
        private string UserName = string.Empty;
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
                context.Response.Write("非法请求！");
            }
            UserName = !string.IsNullOrEmpty(user.UserName) ? user.UserName : user.VeriName;

            string action = context.Request.QueryString["action"].ToString();
            string returnDate = string.Empty;
            switch (action)
            {
                case "one":
                    returnDate = OneBidTrans(context);
                    break;
                case "two":
                    returnDate = "";
                    break;
                case "list":
                    returnDate = JsonHelper<BidAuction>.JsonDataTable(GetBiddingCar(context));
                    break;
                default:
                    returnDate = "请求错误!";
                    break;
            }
            return returnDate;
        }
        //
        private string OneBidTrans(HttpContext context)
        {
            try
            {
                string BidName = context.Request.QueryString["BidName"];
                string BidId = context.Request.QueryString["BidId"];
                string LiceTranId = context.Request.QueryString["LiceTranId"];
                string SeveralBid = context.Request.QueryString["SeveralBid"];
                string Price = context.Request.QueryString["Price"];
                string Name = context.Request.QueryString["Name"];               
                string[] strArray = new string[] { BidId, LiceTranId, SeveralBid, Price, BidName, Name, UserName };
                DataTable dt = null;
                if (null != context.Application[BidId])
                {
                    dt = context.Application[BidId] as DataTable;
                    if (0 != dt.Rows.Count)
                    {
                        int lt = (int)dt.Compute("Count(LiceTranId)", string.Format("LiceTranId={0}", LiceTranId));
                        if (0 == lt)
                        {

                            new BidCarData().AddBidCar(dt, strArray);
                            return "投标成功";
                        }
                        else
                        {
                            return "您已经投过标了！";
                        }
                    }
                    else
                    {
                        new BidCarData().AddBidCar(dt, strArray);
                        return "投标成功";
                    }
                }
                else
                {
                    return "暂未开标，请耐心等待！";
                }
            }
            catch (Exception ex)
            {
                SystemErrorPlug.ErrorRecord("时间:[" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "]类名:[" + this.GetType().Name + "],行号:[" + Component.GetLineNum().ToString() + "行],错误信息:[" + ex.Message + "]");
                return null;
            }
        }
        //
        private DataTable GetBiddingCar(HttpContext context)
        {
            try
            {
                DataTable dt = null;
                string Id = context.Request.QueryString["Id"];
                if (null != context.Application[Id])
                {
                    dt = context.Application[Id] as DataTable;
                }
                else
                {
                    dt = new BidCarData().CreateBidCar();
                }
                return dt;
            }
            catch (Exception ex)
            {
                SystemErrorPlug.ErrorRecord("时间:[" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "]类名:[" + this.GetType().Name + "],行号:[" + Component.GetLineNum().ToString() + "行],错误信息:[" + ex.Message + "]");
                return null;
            }
        }
    }
}
