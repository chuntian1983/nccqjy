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
    public class IndicatorsRelationsBll
    {
        private IndicatorsRelationsDal dal = null;
        private dynamic adminUser = null;
        public IndicatorsRelationsBll()
        {
            dal = new IndicatorsRelationsDal();
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
                    returnDate = JsonHelper<IndicatorsRelations>.JsonDataTable(GetAllList(context), "rows");
                    break;
                case "add":
                    returnDate = Create(context);
                    break;              
                case "list":

                    returnDate = JsonHelper<IndicatorsRelations>.JsonDataTable(GetList(context));
                    break;
                default:
                    returnDate = "请求错误!";
                    break;
            }
            return returnDate;
        }

        private DataTable GetList(HttpContext context)
        {
            try
            {
                int ApplicationType = Convert.ToInt32(context.Request.QueryString["ApplicationType"]);
                int FK_MemberTypeCertificationId = Convert.ToInt32(context.Request.QueryString["FK_MemberTypeCertificationId"]);
                SysLogBll.Create("指标对应关系", "获取所有的指标对应关系操作", adminUser.AdminName);
                return dal.GetAllList(ApplicationType, FK_MemberTypeCertificationId);
            }
            catch (Exception ex)
            {
                SystemErrorPlug.ErrorRecord("时间:[" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "]类名:[" + this.GetType().Name + "],行号:[" + Component.GetLineNum().ToString() + "行],错误信息:[" + ex.Message + "]");
                return null;
            }
        }


        private DataTable GetAllList(HttpContext context)
        {
            try
            {
                SysLogBll.Create("指标对应关系", "获取所有的指标对应关系操作", adminUser.AdminName);
                string ApplicationType = context.Request.QueryString["ApplicationType"];
                string FK_MemberTypeCertificationId = context.Request.QueryString["FK_MemberTypeCertificationId"];
                return dal.GetAllList(ApplicationType, FK_MemberTypeCertificationId);
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
                SysLogBll.Create("指标对应关系", "创建指标对应关系操作", adminUser.AdminName);
                IndicatorsRelations model = null;
                int err = 0;
                int succ = 0;
                string ApplicationType = context.Request.QueryString["ApplicationType"];
                string FK_MemberTypeCertificationId = context.Request.QueryString["FK_MemberTypeCertificationId"];
                Delete(ApplicationType, FK_MemberTypeCertificationId);
                string[] SysFunId = context.Request.QueryString["FunId"].ToString().Split('|');
                for (int i = 0; i < SysFunId.Length - 1; i++)
                {
                    model = new IndicatorsRelations();
                    model.ApplicationType = int.Parse(ApplicationType);
                    model.FK_TypeIndicatorNameId = int.Parse(SysFunId[i].ToString());
                    model.FK_MemberTypeCertificationId = int.Parse(FK_MemberTypeCertificationId);
                    model.Editor = adminUser.AdminLogName;
                    if (dal.Create(model)) { succ++; } else { err++; }
                }
                return "授权操作成功了[" + succ.ToString() + "]条，失败了[" + err.ToString() + "]条！";
            }
            catch (Exception ex)
            {
                SystemErrorPlug.ErrorRecord("时间:[" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "]类名:[" + this.GetType().Name + "],行号:[" + Component.GetLineNum().ToString() + "行],错误信息:[" + ex.Message + "]");
                return "操作失败，错误代码：500 ";
            }
        }

        private void Delete(string ApplicationType, string FK_MemberTypeCertificationId)
        {
            try
            {
                SysLogBll.Create("指标对应关系", "删除指标对应关系操作", adminUser.AdminName);
                dal.Delete(ApplicationType, FK_MemberTypeCertificationId);
            }
            catch (Exception ex)
            {
                SystemErrorPlug.ErrorRecord("时间:[" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "]类名:[" + this.GetType().Name + "],行号:[" + Component.GetLineNum().ToString() + "行],错误信息:[" + ex.Message + "]");
            }
        }

    }
}
