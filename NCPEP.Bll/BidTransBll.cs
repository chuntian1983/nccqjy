using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using NCPEP.Dal;
using NCPEP.Model;
using System.Data;

namespace NCPEP.Bll
{
    public class BidTransBll
    {
        private BidTransDal dal = null;
        private dynamic adminUser = null;
        public BidTransBll()
        {
            dal = new BidTransDal();
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
                    returnDate = JsonHelper<BidTrans>.JsonDataTable(GetAllList(context), "rows").Insert(1, (str));
                    break;
                case "add":
                    returnDate = Create(context);
                    break;
                case "up":
                    returnDate = Update(context);
                    break;
                case "del":
                    returnDate = Delete(context);
                    break;
                case "by":
                    returnDate = JsonHelper<BidTrans>.JsonDataTable(GetById(context));
                    break;
                case "list":
                    returnDate = JsonHelper<BidTrans>.JsonDataTable(GetList(context), "rows");
                    break;
                case "combo":
                    returnDate = GetComboData(context);
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
        private string GetComboData(HttpContext context)
        {
            try
            {
                SysLogBll.Create("意向受让标信息", "返回意向受让标信息combo数据操作", adminUser.AdminName);
                StringBuilder strb = new StringBuilder();
                strb.Append("[");
                DataTable dataTable = null;
                int id = 0;
                try { id = int.Parse(context.Request.QueryString["Id"]); }
                catch { }
                dataTable = dal.GetList(id);
                for (int i = 0; i < dataTable.Rows.Count; i++)
                {
                    strb.Append("{\"id\":\"" + dataTable.Rows[i]["FK_LiceTranId"] + "\", \"text\":\"" + dataTable.Rows[i]["Name"] + "\"}");
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
        private string Exists(HttpContext context)
        {
            try
            {
                SysLogBll.Create("意向受让标信息", "返回成交信息", adminUser.AdminName);
                int Id = 0;
                try { Id = int.Parse(context.Request.QueryString["Id"]); }
                catch { }
                return dal.Exists(Id).ToString();
            }
            catch (Exception ex)
            {
                SystemErrorPlug.ErrorRecord("时间:[" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "]类名:[" + this.GetType().Name + "],行号:[" + Component.GetLineNum().ToString() + "行],错误信息:[" + ex.Message + "]");
                return null;
            }
        }

        private DataTable GetList(HttpContext context)
        {

            try
            {
                SysLogBll.Create("意向受让标信息", "返回意向受让标信息列表操作", adminUser.AdminName);
                int id = 0;
                try { id = int.Parse(context.Request.QueryString["Id"]); }
                catch { }
                return dal.GetList(id);
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
                SysLogBll.Create("意向受让标信息", "返回单个意向受让标信息操作", adminUser.AdminName);
                int id = 0;
                try { id = int.Parse(context.Request.QueryString["Id"]); }
                catch { }
                return dal.GetById(id);
            }
            catch (Exception ex)
            {
                SystemErrorPlug.ErrorRecord("时间:[" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "]类名:[" + this.GetType().Name + "],行号:[" + Component.GetLineNum().ToString() + "行],错误信息:[" + ex.Message + "]");
                return null;
            }
        }
        //
        private string Delete(HttpContext context)
        {
            try
            {
                SysLogBll.Create("意向受让标信息", "删除意向受让标信息操作", adminUser.AdminName);
                int id = 0;
                try { id = int.Parse(context.Request.QueryString["Id"].ToString()); }
                catch { }
                if (dal.Delete(id))
                {
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
        private string Update(HttpContext context)
        {
            try
            {
                SysLogBll.Create("意向受让标信息", "更新意向受让标信息操作", adminUser.AdminName);
                dynamic dModels = GetModels(context);
                if (dal.Update(dModels))
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
        private dynamic SumCount(HttpContext context)
        {
            try
            {
                SysLogBll.Create("意向受让标信息", "获取意向受让标信息总和", adminUser.AdminName);
                string sqlWhere = string.Empty;
                if (1 == adminUser.IsCheck)
                {
                    sqlWhere = string.Format(" a.OrgCode like '{0}%' ", adminUser.OrgCode);
                }
                else
                {
                    sqlWhere = string.Format(" a.OrgCode = '{0}'  ", adminUser.OrgCode);
                }
                if (context.Request.QueryString["BidName"] != null)
                {
                    sqlWhere += string.Format(" and a.BidName like '%{0}%'", context.Request.QueryString["BidName"]);
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
                    //sqlWhere = string.Format(" a.OrgCode like '{0}%' ", adminUser.OrgCode);
                }
                int startIndex = 0;
                try { startIndex = int.Parse(context.Request.Form["page"]) - 1; }
                catch { }
                int pageSize = 10;
                try { pageSize = int.Parse(context.Request.Form["rows"].ToString()); }
                catch { }
                SysLogBll.Create("意向受让标信息", "获取所有的意向受让标信息操作", adminUser.AdminName);
                string order = string.Format(" order by a.{0} {1}", context.Request.Form["sort"].ToString(), context.Request.Form["order"].ToString());
                if (context.Request.QueryString["BidName"] != null)
                {
                    sqlWhere += string.Format(" and a.BidName like '%{0}%'", context.Request.QueryString["BidName"]);
                }
                return dal.GetAllList(sqlWhere, startIndex, pageSize, order);

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
                SysLogBll.Create("意向受让标信息", "添加意向受让标信息操作", adminUser.AdminName);
                if (dal.Create(GetModels(context)))
                {
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

        private dynamic GetModels(HttpContext context)
        {
            dynamic model = new BidTrans();
            try { model.Id = int.Parse(context.Request.Form["Id"].ToString()); }
            catch { }
            model.FK_BidId = int.Parse(context.Request.Form["FK_BidId"].ToString());
            try { model.FK_LiceTranId = int.Parse(context.Request.Form["FK_LiceTranId"].ToString()); }
            catch { }
            try { model.TradingStatus = int.Parse(context.Request.Form["TradingStatus"].ToString()); }
            catch { model.TradingStatus = 0; }
            model.CreateDate = DateTime.Now;
            model.ApplyDate = DateTime.Now;
            model.Editor = adminUser.AdminName;
            return model;
        }
    }
}