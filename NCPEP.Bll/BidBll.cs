using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using NCPEP.Dal;
using System.Web;
using NCPEP.Model;
using System.Data;
using Maticsoft.DBUtility;

namespace NCPEP.Bll
{
    public class BidBll
    {
        private BidDal dal = null;
        private dynamic adminUser = null;
        
        public BidBll()
        {
            dal = new BidDal();
        }
        public DataTable GetListby(string strWhere)
        {
            return dal.GetListby(strWhere);
        }
        /// <summary>
        /// 分页获取数据列表
        /// </summary>
        public int GetRecordCount(string strWhere)
        {
            return dal.GetRecordCount(strWhere);
        }
        /// <summary>
        /// 分页获取数据列表
        /// </summary>
        public DataSet GetListByPage(string strWhere, string orderby, int startIndex, int endIndex)
        {
            return dal.GetListByPage(strWhere, orderby, startIndex, endIndex);
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
                case "del":
                    returnDate = Delete(context);
                    break;
                case "yicijingbiao":
                    string str = "\"total\":" + SumCount(context) + ",";
                    returnDate = JsonHelper<Bid>.JsonDataTable(GetAllList(context), "rows").Insert(1, (str));
                    break;
                case "paging":
                     str = "\"total\":" + SumCount(context) + ",";
                    returnDate = JsonHelper<Bid>.JsonDataTable(GetAllList(context), "rows").Insert(1, (str));
                    break;
                case "pagingld":
                    str = "\"total\":" + SumCount(context) + ",";
                    returnDate = JsonHelper<Bid>.JsonDataTable(GetAllListld(context), "rows").Insert(1, (str));
                    break;
                case "super":
                    str = "\"total\":" + SumCount(context) + ",";
                    returnDate = JsonHelper<Bid>.JsonDataTable(GetAllListsuper(context), "rows").Insert(1, (str));
                    break;
                case "ycjbuser":
                    //str = "\"total\":" + SumCount(context) + ",";
                    returnDate = JsonHelper<Bid>.JsonDataTable(GetAllListByYCJBuser(context), "rows");
                    break;
                case "dyzt":
                    str = "\"total\":" + SumCountByDyzt(context) + ",";
                    returnDate = JsonHelper<Bid>.JsonDataTable(GetAllListByDyzt(context), "rows").Insert(1, (str));
                    break;
                case "paging2":
                    string str2 = "\"total\":" + SumCount(context) + ",";
                    returnDate = JsonConverterwh.ToJson(GetAllList(context), "rows").Insert(1, (str2));
                    break;
                case "pagingA":
                    str = "\"total\":" + SumCountA(context) + ",";
                    returnDate = JsonHelper<Bid>.JsonDataTable(GetAllListA(context), "rows").Insert(1, (str));
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
                case "sqs":
                    returnDate = GetIdBysqs(context);
                    break;
                case "print":
                    returnDate = JsonHelper<Bid>.JsonDataTable(GetModelPrint(context));
                    break;
                case "by":
                    returnDate = JsonHelper<Bid>.JsonWriter(GetById(context));
                    break;
                case "max":
                    returnDate = GetMaxId();
                    break;
                case "change":
                    returnDate =Changezt(context);
                    break;
                case "changezg":
                    returnDate = Changeztzg(context);
                    break;
                default:
                    returnDate = "请求错误!";
                    break;
            }
            return returnDate;
        }
        //
        private DataTable GetModelPrint(HttpContext context)
        {
            try
            {
                int Id = 0;
                try { Id = int.Parse(context.Request.QueryString["Id"]); }
                catch { }
                return dal.GetModelPrint(Id);
            }
            catch (Exception ex)
            {
                SystemErrorPlug.ErrorRecord("时间:[" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "]类名:[" + this.GetType().Name + "],行号:[" + Component.GetLineNum().ToString() + "行],错误信息:[" + ex.Message + "]");
                return null;
            }
        }
        //
        private dynamic SumCountA(HttpContext context)
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
                string standardMode = context.Request.QueryString["StandardMode"];
                sqlWhere += string.Format(" and StandardMode = {0}", standardMode);
                return dal.SumCount(sqlWhere);
            }
            catch (Exception ex)
            {
                SystemErrorPlug.ErrorRecord("时间:[" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "]类名:[" + this.GetType().Name + "],行号:[" + Component.GetLineNum().ToString() + "行],错误信息:[" + ex.Message + "]");
                return 0;
            }
        }
        //
        private DataTable GetAllListA(HttpContext context)
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
                //string standardMode = context.Request.QueryString["StandardMode"];
                //sqlWhere += string.Format(" and a.StandardMode = {0}", standardMode);
                //交易方式
               // sqlWhere += " and a.StandardMode in (1,6) ";
                return dal.GetAllList(sqlWhere, startIndex, pageSize, order);
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
                return dal.GetId(Id);
            }
            catch (Exception ex)
            {
                SystemErrorPlug.ErrorRecord("时间:[" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "]类名:[" + this.GetType().Name + "],行号:[" + Component.GetLineNum().ToString() + "行],错误信息:[" + ex.Message + "]");
                return null;
            }
        }
        private string GetIdBysqs(HttpContext context)
        {
            try
            {
                int Id = 0;
                try { Id = int.Parse(context.Request.QueryString["Id"]); }
                catch { }
                NCPEP.Bll.T_Dysq bllsq = new T_Dysq();
                DataTable dt = bllsq.GetList(" fid='" + Id + "' order by id desc").Tables[0];
                return dt.Rows[0]["dysqnr"].ToString();
            }
            catch (Exception ex)
            {
                SystemErrorPlug.ErrorRecord("时间:[" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "]类名:[" + this.GetType().Name + "],行号:[" + Component.GetLineNum().ToString() + "行],错误信息:[" + ex.Message + "]");
                return null;
            }
        }
        private string Changeztzg(HttpContext context)
        {
            string str = "0";
            string id = context.Request.QueryString["id"];
            NCPEP.Bll.T_Dyzt blldyzt = new T_Dyzt();
            NCPEP.Model.T_Dyzt modeldyzt = new Model.T_Dyzt();
            modeldyzt = blldyzt.GetModel(int.Parse(id));
            modeldyzt.dyzt = "4";
            if (blldyzt.Update(modeldyzt))
            {
                str = "0";
            }
            else { str = "1"; }
            return str;
        }
        private string Changezt(HttpContext context)
        {
            string str = "0";
            string id = context.Request.QueryString["id"];
            NCPEP.Bll.T_Dyzt blldyzt = new T_Dyzt();
            NCPEP.Model.T_Dyzt modeldyzt = new Model.T_Dyzt();
            modeldyzt = blldyzt.GetModel(int.Parse(id));
            modeldyzt.dyzt = "3";
            if (blldyzt.Update(modeldyzt))
            {
                str= "0";
            }
            else { str= "1"; }
            return str;
        }
        //
        private string GetMaxId()
        {
            try
            {
                int Admissibility = dal.GetMaxAdmissibility();
                return "{\"N\":\"" + DateTime.Now.Year.ToString() + Admissibility.ToString().PadLeft(6, '0') + "\",\"O\":\"" + new OrganizationDal().GetHighestLevelOrgName(adminUser.OrgCode) + "\"}";
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
                SysLogBll.Create("出让标", "删除出让标操作", adminUser.AdminName);
                int UpManager = 0;
                UpManager = int.Parse(context.Request.QueryString["UpManager"]);
                string OrgCode = context.Request.QueryString["OrgCode"];
                if (UpManager == 1 || OrgCode == adminUser.OrgCode)
                {
                    int id = 0;
                    try { id = int.Parse(context.Request.QueryString["Id"].ToString()); }
                    catch { }
                    if (dal.Delete(id))
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
                    return "该标的信息没有提交上级审核！";
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
                    sqlWhere += " and Id in(select FK_BidId from T_BidTrans where TradingStatus=1)";
                }
                return dal.SumCount(sqlWhere);
            }
            catch (Exception ex)
            {
                SystemErrorPlug.ErrorRecord("时间:[" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "]类名:[" + this.GetType().Name + "],行号:[" + Component.GetLineNum().ToString() + "行],错误信息:[" + ex.Message + "]");
                return 0;
            }
        }
        private dynamic SumCountByDyzt(HttpContext context)
        {
            try
            {
                SysLogBll.Create("出让标", "获取出让标总和", adminUser.AdminName);
                string sqlWhere = string.Empty;
                if (1 == adminUser.IsCheck)
                {
                    sqlWhere = string.Format(" b.OrgCode like '{0}%' ", adminUser.OrgCode);
                }
                else
                {
                    sqlWhere = string.Format(" b.OrgCode = '{0}'  ", adminUser.OrgCode);
                }
                if (context.Request.QueryString["BidName"] != null)
                {
                    sqlWhere += string.Format(" and b.BidName like '%{0}%'", context.Request.QueryString["BidName"]);
                }
                string DepaStatus = context.Request.QueryString["DepaStatus"];
                sqlWhere += string.Format(" and b.DepaStatus = {0}", DepaStatus);
                if (context.Request.QueryString["dyzt"] != null)
                {
                    sqlWhere += " and a.dyzt='" + context.Request.QueryString["dyzt"] + "'";
                }
                
                return dal.SumCountByDyzt(sqlWhere);
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
                SysLogBll.Create("出让标", "返回单个出让标信息操作", adminUser.AdminName);
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
        private string GetComboData(HttpContext context)
        {
            try
            {
                string OrgCode = context.Request.QueryString["OrgCode"].ToString();
                SysLogBll.Create("出让标", "返回出让标combo数据操作", adminUser.AdminName);
                StringBuilder strb = new StringBuilder();
                strb.Append("[");
                DataTable dataTable = dal.GetAllList(OrgCode);
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
                SysLogBll.Create("出让标", "更新出让标操作", adminUser.AdminName);
                dynamic dModels = GetModels(context);
                if (dModels.UpManager == 1 || dModels.OrgCode == adminUser.OrgCode)
                {
                    NCPEP.Bll.T_Bid bll = new T_Bid();
                    if (bll.Update(dModels))
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
                    return "该标的信息没有提交上级审核！";
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
                SysLogBll.Create("出让标", "添加出让标操作", adminUser.AdminName);
                NCPEP.Bll.T_Bid bllbid = new T_Bid();
                //int id = (int)dal.Create(GetModels(context));
                int id = (int)bllbid.Add(GetModels(context));
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
                string sqlWhere = string.Empty;
                if (1 == adminUser.IsCheck)
                {
                    sqlWhere = string.Format(" a.OrgCode like '{0}%' ", adminUser.OrgCode);
                }
                else
                {
                    sqlWhere = string.Format(" a.OrgCode = '{0}'  ", adminUser.OrgCode);
                    //sqlWhere = string.Format(" a.OrgCode like '{0}%'  ", adminUser.OrgCode);
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
                if (context.Request.QueryString["StandardMode"] != null)
                {
                    sqlWhere += string.Format(" and a.StandardMode = '{0}'", context.Request.QueryString["StandardMode"]);
                }
                string DepaStatus = context.Request.QueryString["DepaStatus"];
                if (DepaStatus == "2" || DepaStatus == "1")
                {

                }
                else
                {
                    sqlWhere += string.Format(" and a.DepaStatus = {0}", DepaStatus);
                }

                if (!string.IsNullOrEmpty(context.Request.QueryString["bt"]))
                {
                    sqlWhere += " and a.Id in(select FK_BidId from T_BidTrans where TradingStatus=1)";
                }
                return dal.GetAllList(sqlWhere, startIndex, pageSize, order);

            }
            catch (Exception ex)
            {
                SystemErrorPlug.ErrorRecord("时间:[" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "]类名:[" + this.GetType().Name + "],行号:[" + Component.GetLineNum().ToString() + "行],错误信息:[" + ex.Message + "]");
                return null;
            }
        }
        private DataTable GetAllListld(HttpContext context)
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
                    //sqlWhere = string.Format(" a.OrgCode like '{0}%'  ", adminUser.OrgCode);
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
                if (context.Request.QueryString["StandardMode"] != null)
                {
                    sqlWhere += string.Format(" and a.StandardMode = '{0}'", context.Request.QueryString["StandardMode"]);
                }
                string DepaStatus = context.Request.QueryString["DepaStatus"];
                if (DepaStatus == "5" )
                {
                    sqlWhere += string.Format(" and a.DepaStatus>={0}", DepaStatus);
                }
                
                

                if (!string.IsNullOrEmpty(context.Request.QueryString["bt"]))
                {
                    sqlWhere += " and a.Id in(select FK_BidId from T_BidTrans where TradingStatus=1)";
                }
                return dal.GetAllList(sqlWhere, startIndex, pageSize, order);

            }
            catch (Exception ex)
            {
                SystemErrorPlug.ErrorRecord("时间:[" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "]类名:[" + this.GetType().Name + "],行号:[" + Component.GetLineNum().ToString() + "行],错误信息:[" + ex.Message + "]");
                return null;
            }
        }
        private DataTable GetAllListsuper(HttpContext context)
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
                    //sqlWhere = string.Format(" a.OrgCode like '{0}%'  ", adminUser.OrgCode);
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
                if (context.Request.QueryString["StandardMode"] != null)
                {
                    sqlWhere += string.Format(" and a.StandardMode = '{0}'", context.Request.QueryString["StandardMode"]);
                }
                string DepaStatus = context.Request.QueryString["DepaStatus"];
                if (DepaStatus == "6")
                {
                    sqlWhere += string.Format(" and a.DepaStatus>={0}", DepaStatus);
                }



                if (!string.IsNullOrEmpty(context.Request.QueryString["bt"]))
                {
                    sqlWhere += " and a.Id in(select FK_BidId from T_BidTrans where TradingStatus=1)";
                }
                return dal.GetAllList(sqlWhere, startIndex, pageSize, order);

            }
            catch (Exception ex)
            {
                SystemErrorPlug.ErrorRecord("时间:[" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "]类名:[" + this.GetType().Name + "],行号:[" + Component.GetLineNum().ToString() + "行],错误信息:[" + ex.Message + "]");
                return null;
            }
        }
        private DataTable GetAllListByYCJBuser(HttpContext context)
        {
            try
            {
                string sqlWhere = string.Empty;
                int startIndex = 0;
                try { startIndex = int.Parse(context.Request.Form["page"]) - 1; }
                catch { }
                int pageSize = 10;
                try { pageSize = int.Parse(context.Request.Form["rows"].ToString()); }
                catch { }
                SysLogBll.Create("出让标", "获取所有的出让标操作", adminUser.AdminName);
                string order = string.Format(" order by {0} {1}", context.Request.Form["sort"].ToString(), context.Request.Form["order"].ToString());
                if (context.Request.QueryString["BidName"] != null)
                {
                    sqlWhere += string.Format(" and BidName like '%{0}%'", context.Request.QueryString["BidName"]);
                }
                if (context.Request.QueryString["StandardMode"] != null)
                {
                    sqlWhere += string.Format(" and StandardMode = '{0}'", context.Request.QueryString["StandardMode"]);
                }
                string DepaStatus = context.Request.QueryString["DepaStatus"];
                if (DepaStatus == "2" || DepaStatus == "1")
                {

                }
                else
                {
                    sqlWhere += string.Format(" and DepaStatus = {0}", DepaStatus);
                }
                return dal.GetAllListByDzjb(sqlWhere, startIndex, pageSize, order);

            }
            catch (Exception ex)
            {
                SystemErrorPlug.ErrorRecord("时间:[" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "]类名:[" + this.GetType().Name + "],行号:[" + Component.GetLineNum().ToString() + "行],错误信息:[" + ex.Message + "]");
                return null;
            }
        }
        private DataTable GetAllListByDyzt(HttpContext context)
        {
            try
            {
                string sqlWhere = string.Empty;
                if (1 == adminUser.IsCheck)
                {
                    sqlWhere = string.Format(" b.OrgCode like '{0}%' ", adminUser.OrgCode);
                }
                else
                {
                    sqlWhere = string.Format(" b.OrgCode = '{0}'  ", adminUser.OrgCode);
                }
                int startIndex = 0;
                try { startIndex = int.Parse(context.Request.Form["page"]) - 1; }
                catch { }
                int pageSize = 10;
                try { pageSize = int.Parse(context.Request.Form["rows"].ToString()); }
                catch { }
                SysLogBll.Create("出让标", "获取所有的出让标操作", adminUser.AdminName);
                string order = string.Format(" order by b.{0} {1}", context.Request.Form["sort"].ToString(), context.Request.Form["order"].ToString());
                if (context.Request.QueryString["BidName"] != null)
                {
                    sqlWhere += string.Format(" and b.BidName like '%{0}%'", context.Request.QueryString["BidName"]);
                }
                if (context.Request.QueryString["dyzt"]!=null)
                {
                    sqlWhere += " and a.dyzt='"+context.Request.QueryString["dyzt"]+"'";
                }
                string DepaStatus = context.Request.QueryString["DepaStatus"];
                if (DepaStatus == "2" || DepaStatus == "1")
                {

                }
                else
                {
                    sqlWhere += string.Format(" and b.DepaStatus = {0}", DepaStatus);
                }

                return dal.GetAllListByDyzt(sqlWhere, startIndex, pageSize, order);

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
            //Bid model = new Bid();
            NCPEP.Model.T_Bid model = new Model.T_Bid();
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
            try
            {
                model.RightsBodies = context.Request.Form["RightsBodies"].ToString();
            }
            catch { }
            try
            {
                model.FeedingMechanism = context.Request.Form["FeedingMechanism"].ToString();
                model.WarrantNumber = context.Request.Form["WarrantNumber"].ToString();
            }
            catch { }
            try { model.StandardMode = int.Parse(context.Request.Form["StandardMode"].ToString()); }
            catch { }
            try { model.StandardType = int.Parse(context.Request.Form["StandardType"].ToString()); }
            catch { }
            try
            {
                model.LowTransaction = context.Request.Form["LowTransaction"].ToString();
            }
            catch { }
            try { model.Turnover = decimal.Parse(context.Request.Form["Turnover"].ToString()); }
            catch { }

            try
            {
                model.ContractDate = context.Request.Form["ContractDate"].ToString();
                model.ContractNo = context.Request.Form["ContractNo"].ToString();

            }
            catch { }
            //鉴证号生成有问题进行调整
            DataTable dt = DbHelperSQL.Query("select Admissibility from T_Bid order by id desc").Tables[0];
            if (dt.Rows.Count>0)
            {
                try
                {
                    int bh = int.Parse(dt.Rows[0]["Admissibility"].ToString()) + 1;
                    // model.Admissibility = context.Request.Form["Admissibility"].ToString();
                    model.Admissibility = bh.ToString("0000000000");
                }
                catch { }
            }

            
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
            try { model.guimo = context.Request.Form["guimo"].ToString(); }
            catch { }
            try { model.danwei = context.Request.Form["gmdw"].ToString(); }
            catch { }
            try { model.sfzclz = context.Request.Form["sfzclz"].ToString(); }
            catch { }
            try { model.srfjbtj = context.Request.Form["srfjbtj"].ToString(); }
            catch { }
            return model;
        }
    }
}