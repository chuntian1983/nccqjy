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
    public class BidAuctionBll
    {
        private dynamic dal = null;
        private dynamic adminUser = null;
        public BidAuctionBll()
        {
            dal = new BidAuctionDal();
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
                    returnDate = JsonHelper<BidAuction>.JsonDataTable(GetAllList(context));
                    break;
                case "add":
                    returnDate = Create(context);
                    break;
                case "up":
                    returnDate = Update(context);
                    break;
                case "by":
                    returnDate = JsonHelper<BidAuction>.JsonWriter(GetById(context));
                    break;
                case "is":
                    returnDate = Exists(context);
                    break;
                default:
                    returnDate = "请求错误!";
                    break;
            }
            return returnDate;
        }
        //
        private string Exists(HttpContext context)
        {
            try
            {
                SysLogBll.Create("意向受让标信息", "返回成交信息", adminUser.AdminName);
                int BidId = 0;
                int SeveralBid = 0;
                try { BidId = int.Parse(context.Request.QueryString["BidId"]); }
                catch { }
                try { SeveralBid = int.Parse(context.Request.QueryString["SeveralBid"]); }
                catch { }
                return dal.Existence(BidId, SeveralBid).ToString();
            }
            catch (Exception ex)
            {
                SystemErrorPlug.ErrorRecord("时间:[" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "]类名:[" + this.GetType().Name + "],行号:[" + Component.GetLineNum().ToString() + "行],错误信息:[" + ex.Message + "]");
                return null;
            }
        }

        //
        private dynamic GetById(HttpContext context)
        {
            try
            {
                SysLogBll.Create("竞价单", "返回单个竞价单信息操作", adminUser.AdminName);
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
        private string Update(HttpContext context)
        {
            try
            {
                SysLogBll.Create("竞价单", "更新竞价单操作", adminUser.AdminName);
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
        private string Create(HttpContext context)
        {
            try
            {
                SysLogBll.Create("竞价单", "添加竞价单操作", adminUser.AdminName);
                BidAuction mde = GetModels(context);
                if (dal.Create(mde))
                {
                    BidTransDal btd = new BidTransDal();
                    btd.UpdateState(" TradingStatus = 2 ", string.Format(" FK_BidId={0} ", mde.FK_BidId));
                    btd.UpdateState(" TradingStatus = 1 ", string.Format(" FK_BidId={0} and FK_LiceTranId={1} ", mde.FK_BidId, mde.LiceTranId));
                    return "交易成功！";
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
        private DataTable GetAllList(HttpContext context)
        {
            try
            {
                SysLogBll.Create("竞价单", "获取所有的竞价单操作", adminUser.AdminName);
                int Id = 0;
                Id = int.Parse(context.Request.QueryString["Id"]);
                return dal.GetAllList(Id);
            }
            catch (Exception ex)
            {
                SystemErrorPlug.ErrorRecord("时间:[" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "]类名:[" + this.GetType().Name + "],行号:[" + Component.GetLineNum().ToString() + "行],错误信息:[" + ex.Message + "]");
                return null;
            }
        }

        private dynamic GetModels(HttpContext context)
        {
            BidAuction model = new BidAuction();
            try { model.Id = int.Parse(context.Request.QueryString["Id"].ToString()); }
            catch { model.Id = 0; }
            model.FK_BidId = int.Parse(context.Request.QueryString["FK_BidId"].ToString());
            model.LiceTranId = int.Parse(context.Request.QueryString["LiceTranId"].ToString());
            model.SeveralBid = int.Parse(context.Request.QueryString["SeveralBid"].ToString());
            model.Price = decimal.Parse(context.Request.QueryString["Price"].ToString());
            model.AuctionDate = DateTime.Now;
            model.Editor = adminUser.AdminName;
            model.CreateDate = DateTime.Now;
            return model;
        }
    }
}