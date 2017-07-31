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
    public class WebBidBll
    {
        private dynamic bidDal = null;
        private dynamic user = null;
        private string UserName = string.Empty;
        public WebBidBll()
        {
            bidDal = new BidDal();
        }
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
                UserName = !string.IsNullOrEmpty(user.UserName) ? user.UserName : user.VeriName;
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
                case "del":
                    returnDate = Delete(context);
                    break;
                case "paging":
                    string str = "\"total\":" + SumCount(context) + ",";
                    returnDate = JsonHelper<Bid>.JsonDataTable(GetAllList(context), "rows").Insert(1, (str));
                    break;
                case "add":
                    returnDate = Create(context);
                    break;
                case "up":
                    returnDate = Update(context);
                    break;
                case "combo":
                    returnDate = GetComboData(context);
                    break;
                case "byId":
                    returnDate = JsonHelper<Bid>.JsonDataTable(GetId(context));
                    break;
                case "by":
                    returnDate = JsonHelper<Bid>.JsonWriter(GetById(context));
                    break;
                case "max":
                    returnDate = GetMaxId();
                    break;
                case "list":
                    string count = "\"total\":" + SumCount(context) + ",";
                    returnDate = JsonHelper<Bid>.JsonDataTable(GetList(context), "rows").Insert(1, (count));
                    break;
                default:
                    returnDate = "请求错误!";
                    break;
            }
            return returnDate;
        }
        //
        private DataTable GetList(HttpContext context)
        {
            try
            {
                int startIndex = 0;
                try { startIndex = int.Parse(context.Request.Form["page"]) - 1; }
                catch { }
                int pageSize = 10;
                try { pageSize = int.Parse(context.Request.Form["rows"].ToString()); }
                catch { }
                SysLogBll.Create("web出让标", "获取所有的出让标操作", UserName);
                string order = string.Format(" order by a.{0} {1}", context.Request.Form["sort"].ToString(), context.Request.Form["order"].ToString());
                return bidDal.GetList(user.Id, startIndex, pageSize, order);
            }
            catch (Exception ex)
            {
                SystemErrorPlug.ErrorRecord("时间:[" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "]类名:[" + this.GetType().Name + "],行号:[" + Component.GetLineNum().ToString() + "行],错误信息:[" + ex.Message + "]");
                return null;
            }
        }
        //
        private DataTable GetId(HttpContext context)
        {
            try
            {
                int Id = 0;
                try { Id = int.Parse(context.Request.QueryString["Id"]); }
                catch { }
                return bidDal.GetId(Id);
            }
            catch (Exception ex)
            {
                SystemErrorPlug.ErrorRecord("时间:[" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "]类名:[" + this.GetType().Name + "],行号:[" + Component.GetLineNum().ToString() + "行],错误信息:[" + ex.Message + "]");
                return null;
            }
        }
        //
        private string GetMaxId()
        {
            try
            {
                int Admissibility = bidDal.GetMaxAdmissibility();
                return "{\"N\":\"" + DateTime.Now.Year.ToString() + Admissibility.ToString().PadLeft(6, '0') + "\",\"O\":\"" + new OrganizationDal().GetHighestLevelOrgName() + "\"}";
            }
            catch (Exception ex)
            {
                SystemErrorPlug.ErrorRecord("时间:[" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "]类名:[" + this.GetType().Name + "],行号:[" + Component.GetLineNum().ToString() + "行],错误信息:[" + ex.Message + "]");
                return string.Empty;
            }
        }
        //
        private string Delete(HttpContext context)
        {
            try
            {
                SysLogBll.Create("web出让标", "删除出让标操作", UserName);
                int UpManager = 0;
                UpManager = int.Parse(context.Request.QueryString["UpManager"]);
                string OrgCode = context.Request.QueryString["OrgCode"];

                int id = 0;
                try { id = int.Parse(context.Request.QueryString["Id"].ToString()); }
                catch { }
                Bid modl = bidDal.GetModel(id);
                if (modl.DepaStatus == 1)
                {
                    if (bidDal.Delete(id))
                    {
                        new BidReturnInfoDal().Delete(id);
                        return "删除操作成功！";
                    }
                    else
                    {
                        return "删除失败请重新操作，错误代码：500 ";
                    }
                }
                else
                {
                    return "信息已经上报无法删除！";
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
                SysLogBll.Create("web出让标", "获取出让标总和", UserName);
                return bidDal.SumCount(user.Id);
            }
            catch (Exception ex)
            {
                SystemErrorPlug.ErrorRecord("时间:[" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "]类名:[" + this.GetType().Name + "],行号:[" + Component.GetLineNum().ToString() + "行],错误信息:[" + ex.Message + "]");
                return 0;
            }
        }
        //
        private dynamic GetById(HttpContext context)
        {
            try
            {
                SysLogBll.Create("web出让标", "返回单个出让标信息操作", UserName);
                int id = 0;
                try { id = int.Parse(context.Request.QueryString["Id"]); }
                catch { }
                return bidDal.GetModel(id);
            }
            catch (Exception ex)
            {
                SystemErrorPlug.ErrorRecord("时间:[" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "]类名:[" + this.GetType().Name + "],行号:[" + Component.GetLineNum().ToString() + "行],错误信息:[" + ex.Message + "]");
                return null;
            }
        }
        //
        private string GetComboData(HttpContext context)
        {
            try
            {
                string OrgCode = context.Request.QueryString["OrgCode"].ToString();
                SysLogBll.Create("web出让标", "返回出让标combo数据操作", UserName);
                StringBuilder strb = new StringBuilder();
                strb.Append("[");
                DataTable dataTable = bidDal.GetAllList(OrgCode);
                for (int i = 0; i < dataTable.Rows.Count; i++)
                {
                    strb.Append("{\"id\":\"" + dataTable.Rows[i]["Id"] + "\", \"text\":\"" + dataTable.Rows[i]["BidName"] + "\"}");
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
        private string Update(HttpContext context)
        {
            try
            {
                SysLogBll.Create("web出让标", "更新出让标操作", UserName);
                Bid dModels = GetModels(context);
                if (dModels.DepaStatus == 1)
                {
                    if (bidDal.Update(dModels))
                    {
                        return "更新成功！";
                    }
                    else
                    {
                        return "更新失败请重新操作! ";
                    }
                }
                else
                {
                    return "出让标信息已经上报无法修改！";
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
                SysLogBll.Create("web出让标", "添加出让标操作", UserName);
                int id = (int)bidDal.Create(GetModels(context));
                if (id > 0)
                {
                    TranProcessDal tpd = new TranProcessDal();
                    if (tpd.Exists(id))
                    {
                        string column = string.Format("AcceptDate='{0}'", DateTime.Now.ToString());
                        tpd.Update(column, id);
                    }
                    else
                    {
                        string column = "FK_BidId,AcceptDate";
                        string values = string.Format("{0},'{1}'", id, DateTime.Now.ToString());
                        tpd.Create(column, values);
                    }
                    return "添加成功！";
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
        //
        private DataTable GetAllList(HttpContext context)
        {
            try
            {
                int startIndex = 0;
                try { startIndex = int.Parse(context.Request.Form["page"]) - 1; }
                catch { }
                int pageSize = 10;
                try { pageSize = int.Parse(context.Request.Form["rows"].ToString()); }
                catch { }
                SysLogBll.Create("web出让标", "获取所有的出让标操作", UserName);
                string order = string.Format(" order by a.{0} {1}", context.Request.Form["sort"].ToString(), context.Request.Form["order"].ToString());
                return bidDal.GetAllList(user.Id, startIndex, pageSize, order);
            }
            catch (Exception ex)
            {
                SystemErrorPlug.ErrorRecord("时间:[" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "]类名:[" + this.GetType().Name + "],行号:[" + Component.GetLineNum().ToString() + "行],错误信息:[" + ex.Message + "]");
                return null;
            }
        }
        //
        private dynamic GetModels(HttpContext context)
        {
            Bid model = new Bid();
            try { model.Id = int.Parse(context.Request.Form["Id"].ToString()); }
            catch { }
            model.OrgCode = context.Request.Form["OrgCode"].ToString();
            try { model.FK_LiceTranId = int.Parse(context.Request.Form["FK_LiceTranId"].ToString()); }
            catch { }
            model.BidName = context.Request.Form["BidName"].ToString();
            model.ListingPrice = context.Request.Form["ListingPrice"].ToString();
            try { model.StartDate = DateTime.Parse(context.Request.Form["StartDate"].ToString()); }
            catch { }
            try { model.EndDate = DateTime.Parse(context.Request.Form["EndDate"].ToString()); }
            catch { }
            model.BidBasic = context.Request.Form["BidBasic"].ToString();
            model.Ownership = context.Request.Form["Ownership"].ToString();
            model.Properties = context.Request.Form["Properties"].ToString();
            try { model.TurnOut = int.Parse(context.Request.Form["TurnOut"].ToString()); }
            catch { }
            model.RightsBodies = context.Request.Form["RightsBodies"].ToString();
            model.FeedingMechanism = context.Request.Form["FeedingMechanism"].ToString();
            model.WarrantNumber = context.Request.Form["WarrantNumber"].ToString();
            try { model.StandardMode = int.Parse(context.Request.Form["StandardMode"].ToString()); }
            catch { }
            try { model.StandardType = int.Parse(context.Request.Form["StandardType"].ToString()); }
            catch { }
            model.LowTransaction = context.Request.Form["LowTransaction"].ToString();
            try { model.Turnover = decimal.Parse(context.Request.Form["Turnover"].ToString()); }
            catch { }
            model.ContractDate = context.Request.Form["ContractDate"].ToString();
            model.ContractNo = context.Request.Form["ContractNo"].ToString();

            model.Admissibility = context.Request.Form["Admissibility"].ToString();

            model.NoAssurance = context.Request.Form["NoAssurance"].ToString();
            model.TradingCenterName = context.Request.Form["TradingCenterName"].ToString();
            model.AreContract = context.Request.Form["AreContract"].ToString();
            model.RelatesNum = context.Request.Form["RelatesNum"].ToString();
            try { model.DepaStatus = int.Parse(context.Request.Form["DepaStatus"].ToString()); }
            catch { model.DepaStatus = 1; }
            try { model.ReturnStatus = int.Parse(context.Request.Form["ReturnStatus"].ToString()); }
            catch { }
            try { model.UpManager = int.Parse(context.Request.Form["UpManager"].ToString()); }
            catch { }
            model.Publicity = context.Request.Form["Publicity"].ToString();
            try { model.Change = int.Parse(context.Request.Form["Change"].ToString()); }
            catch { }
            try { model.Cancel = int.Parse(context.Request.Form["Cancel"].ToString()); }
            catch { }
            try { model.Lost = int.Parse(context.Request.Form["Lost"].ToString()); }
            catch { }
            return model;
        }
    }
}
