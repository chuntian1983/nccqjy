using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using NCPEP.Model;
using NCPEP.Dal;
using System.Web;
using System.Data;

namespace NCPEP.Bll
{
    public class LiceTranBll
    {
        private LiceTranDal dal = null;
        private dynamic adminUser = null;
        public LiceTranBll()
        {
            dal = new LiceTranDal();
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

                case "checkadd":
                    returnDate = LiTrCheckCreate(context);
                    break;
                case "fanshenhe":
                    returnDate = fanshenhe(context);
                    break;
                case "add":
                    returnDate = Create(context);
                    break;
                case "up":
                    returnDate = Update(context);
                    break;
                case "by":
                    returnDate = JsonHelper<LiceTran>.JsonWriter(GetById(context));
                    break;
                case "byId":
                    returnDate = JsonHelper<LiceTran>.JsonDataTable(GetModelId(context), "rows");
                    break;
                case "t":
                    returnDate = GetLiceTranType();
                    break;
                case "del":
                    returnDate = Delete(context);
                    break;
                case "combo":
                    returnDate = GetComno(context);
                    break;
                case "ltcombo":
                    returnDate = GetLiceTranComno(context);
                    break;
                case "paging":
                    string str = "\"total\":" + SumCount(context) + ",";
                    returnDate = JsonHelper<LiceTran>.JsonDataTable(GetAllList(context), "rows").Insert(1, (str));
                    break;
                default:
                    returnDate = "请求错误!";
                    break;
            }
            return returnDate;
        }
        private string GetLiceTranComno(HttpContext context)
        {
            try
            {
                SysLogBll.Create("出让/受让方", "返回出让/受让方类型combo数据操作", adminUser.AdminName);
                StringBuilder strb = new StringBuilder();
                strb.Append("[");
                DataTable dataTable = null;
                string OrgCode = context.Request.QueryString["OrgCode"];
                int LiceTranType = 1;
                try { LiceTranType = int.Parse(context.Request.QueryString["LiceTranType"]); }
                catch { }
                dataTable = dal.GetLiceTranComno(OrgCode, LiceTranType);

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
        private string fanshenhe(HttpContext context)
        {
            try
            {
                SysLogBll.Create("出让/受让方", "出让/受让方反审核操作", adminUser.AdminName);
               
                int FK_LiceTranId = int.Parse(context.Request.QueryString["id"]);
                
                //if (0 == dal.GetComnoData(ltc.FK_LiceTranId).Rows.Count)
                //{

                if (dal.UpdateState("AuditType", "0", FK_LiceTranId))
                    {
                        return "反审核成功";
                    }
                    else
                    {
                        return "反审核失败";
                    }
               
            }
            catch (Exception ex)
            {
                SystemErrorPlug.ErrorRecord("时间:[" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "]类名:[" + this.GetType().Name + "],行号:[" + Component.GetLineNum().ToString() + "行],错误信息:[" + ex.Message + "]");
                return string.Empty;
            }
        }
        //
        private string LiTrCheckCreate(HttpContext context)
        {
            try
            {
                SysLogBll.Create("出让/受让方", "出让/受让方审核操作", adminUser.AdminName);
                LiceTranCheck ltc = new LiceTranCheck();
                ltc.AuditDate = DateTime.Now;
                ltc.AuditSay = context.Request.QueryString["AuditSay"];
                ltc.FK_LiceTranId = int.Parse(context.Request.QueryString["FK_LiceTranId"]);
                ltc.Reviewer = adminUser.AdminName;
                //if (0 == dal.GetComnoData(ltc.FK_LiceTranId).Rows.Count)
                //{
                if (new LiceTranCheckDal().Create(ltc))
                {
                    if (dal.UpdateState("AuditType", "1", ltc.FK_LiceTranId))
                    {
                        return "审核意见添加成功，审核操作完成。";
                    }
                    else
                    {
                        return "审核意见添加成功，审核操作没有完成！";
                    }
                }
                else
                {
                    return "审核意见添加失败，审核操作未完成！";
                }
                //}
                //else
                //{
                //    return "出让,受让方需要上传的扫描件没有上传全面还有[" + dal.GetComnoData(ltc.FK_LiceTranId).Rows.Count.ToString() + "]个附件需要上传，无法通过审核！";
                //}
            }
            catch (Exception ex)
            {
                SystemErrorPlug.ErrorRecord("时间:[" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "]类名:[" + this.GetType().Name + "],行号:[" + Component.GetLineNum().ToString() + "行],错误信息:[" + ex.Message + "]");
                return string.Empty;
            }
        }

        //
        private string GetComno(HttpContext context)
        {
            try
            {
                SysLogBll.Create("出让/受让方", "返回上传指标类型combo数据操作", adminUser.AdminName);
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
        //
        private string GetLiceTranType()
        {
            return "[{\"id\": 1,\"text\": \"出让方\",\"selected\":true}, {\"id\": 2,\"text\": \"意向受让方\"}] ";
        }

        private dynamic SumCount(HttpContext context)
        {
            try
            {
                string LiceTranType = "1";
                SysLogBll.Create("出让/受让方", "获取出让/受让方总和", adminUser.AdminName);
                string sqlWhere = string.Empty;
                if (1 == adminUser.IsCheck)
                {
                    sqlWhere = string.Format(" OrgCode like '{0}%' ", adminUser.OrgCode);
                }
                else
                {
                    sqlWhere = string.Format(" OrgCode = '{0}'  ", adminUser.OrgCode);
                }
                if (!string.IsNullOrEmpty(context.Request.QueryString["LiceTranType"] as string))
                {
                    LiceTranType = context.Request.QueryString["LiceTranType"] as string;
                }
                sqlWhere += string.Format(" and LiceTranType = {0}", LiceTranType);
                string Name = context.Request.QueryString["Name"];
                if (!string.IsNullOrEmpty(Name))
                {
                    sqlWhere += string.Format(" and Name like '%{0}'", Name);
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
        private dynamic GetModelId(HttpContext context)
        {
            try
            {
                SysLogBll.Create("出让/受让方", "查询出让/受让方comno数据", adminUser.AdminName);
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
                string sqlWhere = string.Empty;
                //if (1 == adminUser.IsCheck)
                //{
                    sqlWhere += string.Format(" a.OrgCode like '{0}%' ", adminUser.OrgCode);
                //}
                //else
                //{
                //    sqlWhere += string.Format(" a.OrgCode = '{0}'  ", adminUser.OrgCode);
                //}
                if (!string.IsNullOrEmpty(context.Request.QueryString["LiceTranType"] as string))
                {
                    LiceTranType = context.Request.QueryString["LiceTranType"];
                }
                sqlWhere += string.Format(" and a.LiceTranType = {0}", LiceTranType);
                string Name = context.Request.QueryString["Name"];
                if (!string.IsNullOrEmpty(Name))
                {
                    sqlWhere += string.Format(" and a.Name like '%{0}%'", Name);
                }
                SysLogBll.Create("出让/受让方", "查询所有的出让/受让方数据", adminUser.AdminName);
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
                SysLogBll.Create("出让/受让方", "增加出让/受让方操作", adminUser.AdminName);
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
                SysLogBll.Create("出让/受让方", "更新出让/受让方操作", adminUser.AdminName);
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
        private dynamic GetById(HttpContext context)
        {
            try
            {
                SysLogBll.Create("出让/受让方", "查询出让/受让方单个操作", adminUser.AdminName);
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
        private dynamic Delete(HttpContext context)
        {
            try
            {
                SysLogBll.Create("出让/受让方", "删除出让/受让方操作", adminUser.AdminName);
                int Id = 0;
                try { Id = int.Parse(context.Request.QueryString["Id"].ToString()); }
                catch { }
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
            try { model.FK_WebUserVeriId = int.Parse(context.Request.Form["FK_WebUserVeriId"].ToString()); }
            catch { }
            return model;
        }
    }
}


