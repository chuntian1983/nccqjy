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
    public class WebLiTrBll
    {
        private dynamic dal = null;
        private dynamic user = null;
        private string UserName = string.Empty;
        public WebLiTrBll()
        {
            dal = new LiceTranDal();
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
                case "add":
                    returnDate = Create(context);
                    break;
                case "up":
                    returnDate = Update(context);
                    break;
                case "by":
                    returnDate = JsonHelper<LiceTran>.JsonWriter(GetModel(context));
                    break;
                case "byId":
                    returnDate = JsonHelper<LiceTran>.JsonDataTable(GetById(context));
                    break;
                case "t":
                    returnDate = GetLiceTranType();
                    break;
                case "del":
                    returnDate = Delete(context);
                    break;
                case "paging":
                    string str = "\"total\":" + SumCount(context) + ",";
                    returnDate = JsonHelper<LiceTran>.JsonDataTable(GetAllList(context), "rows").Insert(1, (str));
                    break;
                case "combo":
                    returnDate = GetComno(context);
                    break;
                case "ltcombo":
                    returnDate = GetLiTrComno(context);
                    break;
                default:
                    returnDate = "请求错误!";
                    break;
            }
            return returnDate;
        }
        private string GetLiTrComno(HttpContext context)
        {
            try
            {
                SysLogBll.Create("web出让/受让方", "返回上传指标类型combo数据操作", UserName);
                StringBuilder strb = new StringBuilder();
                strb.Append("[");
                DataTable dataTable = null;
                int LiceTranId = 0;
                try { LiceTranId = int.Parse(context.Request.QueryString["LiceTranId"]); }
                catch { }
                dataTable = dal.GetLiceTranComno(user.Id, LiceTranId);
                for (int i = 0; i < dataTable.Rows.Count; i++)
                {
                    strb.Append("{\"id\":\"" + dataTable.Rows[i]["Id"] + "\", \"text\":\"" + dataTable.Rows[i]["Name"] + "\"}");
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
        private string GetComno(HttpContext context)
        {
            try
            {
                SysLogBll.Create("web出让/受让方", "返回上传指标类型combo数据操作", UserName);
                StringBuilder strb = new StringBuilder();
                strb.Append("[");
                DataTable dataTable = null;
                int LiceTranId = 0;
                try { LiceTranId = int.Parse(context.Request.QueryString["LiceTranId"]); }
                catch { }
                dataTable = dal.GetComnoData(LiceTranId);
                for (int i = 0; i < dataTable.Rows.Count; i++)
                {
                    strb.Append("{\"id\":\"" + dataTable.Rows[i]["Id"] + "\", \"text\":\"" + dataTable.Rows[i]["TypeIndicatorName"] + "\"}");
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
        private dynamic GetModel(HttpContext context)
        {
            try
            {
                SysLogBll.Create("web出让/受让方", "查询出让/受让方单个操作", UserName);
                int Id = 0;
                try { Id = int.Parse(context.Request.QueryString["Id"].ToString()); }
                catch { }
                return dal.GetModel(Id);
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
                SysLogBll.Create("web出让/受让方", "查询出让/受让方单个操作", UserName);
                int Id = 0;
                try { Id = int.Parse(context.Request.QueryString["Id"].ToString()); }
                catch { }
                return dal.GetById(Id);
            }
            catch (Exception ex)
            {
                SystemErrorPlug.ErrorRecord("时间:[" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "]类名:[" + this.GetType().Name + "],行号:[" + Component.GetLineNum().ToString() + "行],错误信息:[" + ex.Message + "]");
                return null;
            }
        }
        //
        private string GetLiceTranType()
        {
            return "[{\"id\": 1,\"text\": \"出让方\"}, {\"id\": 2,\"text\": \"意向受让方\"}] ";
        }
        //
        private dynamic SumCount(HttpContext context)
        {
            try
            {
                string LiceTranType = "1";
                SysLogBll.Create("Web出让/受让方", "获取出让/受让方总和", UserName);
                string sqlWhere = string.Format(" FK_WebUserVeriId ={0}", user.Id);
                if (!string.IsNullOrEmpty(context.Request.QueryString["LiceTranType"] as string))
                {
                    LiceTranType = context.Request.QueryString["LiceTranType"] as string;
                }
                sqlWhere += string.Format(" and LiceTranType = {0}", LiceTranType);
                return dal.SumCount(sqlWhere);
            }
            catch (Exception ex)
            {
                SystemErrorPlug.ErrorRecord("时间:[" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "]类名:[" + this.GetType().Name + "],行号:[" + Component.GetLineNum().ToString() + "行],错误信息:[" + ex.Message + "]");
                return 0;
            }
        }
        //
        private dynamic GetAllList(HttpContext context)
        {
            try
            {
                int startIndex = 0;
                try { startIndex = int.Parse(context.Request.Form["page"]) - 1; }
                catch { }
                int pageSize = 10;
                try { pageSize = int.Parse(context.Request.Form["rows"].ToString()); }
                catch { }
                string LiceTranType = "1";
                string order = string.Format(" order by {0} {1}", context.Request.Form["sort"].ToString(), context.Request.Form["order"].ToString());
                string sqlWhere = string.Format(" FK_WebUserVeriId ={0}", user.Id);
                if (!string.IsNullOrEmpty(context.Request.QueryString["LiceTranType"] as string))
                {
                    LiceTranType = context.Request.QueryString["LiceTranType"];
                }
                sqlWhere += string.Format(" and a.LiceTranType = {0}", LiceTranType);
                SysLogBll.Create("Web出让/受让方", "查询所有的出让/受让方数据", UserName);
                return dal.GetAllList(sqlWhere, startIndex, pageSize, order);
            }
            catch (Exception ex)
            {
                SystemErrorPlug.ErrorRecord("时间:[" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "]类名:[" + this.GetType().Name + "],行号:[" + Component.GetLineNum().ToString() + "行],错误信息:[" + ex.Message + "]");
                return null;
            }
        }
        //
        private dynamic Create(HttpContext context)
        {
            try
            {
                SysLogBll.Create("Web出让/受让方", "增加出让/受让方操作", UserName);
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
        //
        private dynamic Update(HttpContext context)
        {
            try
            {
                SysLogBll.Create("Web出让/受让方", "更新出让/受让方操作", UserName);
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
        private dynamic Delete(HttpContext context)
        {
            try
            {
                SysLogBll.Create("Web出让/受让方", "删除出让/受让方操作", UserName);
                int Id = 0;
                try { Id = int.Parse(context.Request.QueryString["Id"].ToString()); }
                catch { }
                /*
                if (dal.Delete(Id))
                {
                    new LiceTranScanDal().Deletes(Id);
                    new LiceTranCheckDal().Deletes(Id);
                    Component.DeleteFile("~/Super/Scan/lt/" + Id + "/");
                    return "删除成功！";
                }
                else
                {
                    return "删除失败请重新操作! ";
                }
                 * */
                return "暂未开放！";
            }
            catch (Exception ex)
            {
                SystemErrorPlug.ErrorRecord("时间:[" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "]类名:[" + this.GetType().Name + "],行号:[" + Component.GetLineNum().ToString() + "行],错误信息:[" + ex.Message + "]");
                return "删除失败请重新操作，错误代码：500 ";
            }
        }
        //
        private dynamic GetModels(HttpContext context)
        {
            LiceTran model = new LiceTran();
            try { model.Id = int.Parse(context.Request.Form["Id"].ToString()); }
            catch { }
            try { model.LiceTranType = int.Parse(context.Request.Form["LiceTranType"].ToString()); }
            catch { model.LiceTranType = 1; }
            model.OrgCode = context.Request.Form["OrgCode"].ToString();
            try { model.MemberTypeId = int.Parse(context.Request.Form["MemberTypeId"].ToString()); }
            catch { }
            model.Name = context.Request.Form["Name"].ToString();
            model.Addr = context.Request.Form["Addr"].ToString();
            model.Contact = context.Request.Form["Contact"].ToString();
            model.Corporate = context.Request.Form["Corporate"].ToString();
            model.IDCard = context.Request.Form["IDCard"].ToString();
            model.OrganizationCode = context.Request.Form["OrganizationCode"].ToString();
            model.Tel = context.Request.Form["Tel"].ToString();
            model.Owner = context.Request.Form["Owner"].ToString();
            model.Capital = context.Request.Form["Capital"].ToString();
            try { model.ApplyDate = DateTime.Parse(context.Request.Form["ApplyDate"].ToString()); }
            catch { }
            try { model.AuditType = int.Parse(context.Request.Form["AuditType"].ToString()); }
            catch { }
            try { model.FK_WebUserVeriId = user.Id; }
            catch { }
            return model;
        }
    }
}



