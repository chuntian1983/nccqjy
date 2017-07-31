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
    public class UploadTypeIndicatorBll
    {
        private UploadTypeIndicatorDal dal = null;
        private dynamic adminUser = null;
        public UploadTypeIndicatorBll()
        {
            dal = new UploadTypeIndicatorDal();
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
                    returnDate = JsonHelper<UploadTypeIndicator>.JsonDataTable(GetAllList(context), "rows");
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
                case "combo":
                    returnDate = GetComboData();
                    break;
                case "by":
                    returnDate = JsonHelper<UploadTypeIndicator>.JsonWriter(GetById(context));
                    break;
                default:
                    returnDate = "请求错误!";
                    break;
            }
            return returnDate;
        }
        private string Delete(HttpContext context)
        {
            try
            {
                string str = "删除成功！";
                SysLogBll.Create("上传指标类型", "删除上传指标类型信息操作", adminUser.AdminName);
                string[] idList = context.Request.QueryString["idList"].Split(',');
                for (int i = 0; i < idList.Length; i++)
                {
                    int id = int.Parse(idList[i]);
                    NCPEP.Bll.T_IndicatorsRelations blldy = new T_IndicatorsRelations();
                    DataTable dtdy = new DataTable();
                    dtdy = blldy.GetList("FK_TypeIndicatorNameId='"+id+"'").Tables[0];
                    if (dtdy.Rows.Count > 0)
                    {
                        str= "指标对应关系中编号为[" + id + "]的指标类型已经被使用不能删除，请先删除对应关系再删除。";
                        return str;
                    }
                    else
                    {
                        //删除操作
                        NCPEP.Bll.T_UploadTypeIndicator blltype = new T_UploadTypeIndicator();
                        blltype.Delete(id);
                        
                    }
                }
                return str;
                
            }
            catch (Exception ex)
            {
                SystemErrorPlug.ErrorRecord("时间:[" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "]类名:[" + this.GetType().Name + "],行号:[" + Component.GetLineNum().ToString() + "行],错误信息:[" + ex.Message + "]");
                return "错误代码：500 ";
            }
        }
        //
        private dynamic GetById(HttpContext context)
        {
            try
            {
                SysLogBll.Create("上传指标类型", "返回单个上传指标类型信息操作", adminUser.AdminName);
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
        private string GetComboData()
        {
            try
            {
                SysLogBll.Create("上传指标类型", "返回上传指标类型combo数据操作", adminUser.AdminName);
                StringBuilder strb = new StringBuilder();
                strb.Append("[");
                DataTable dataTable = dal.GetAllList();

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
        private string Update(HttpContext context)
        {
            try
            {
                SysLogBll.Create("上传指标类型", "更新上传指标类型操作", adminUser.AdminName);
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
                SysLogBll.Create("上传指标类型", "添加上传指标类型操作", adminUser.AdminName);
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
        private DataTable GetAllList(HttpContext context)
        {
            try
            {

                SysLogBll.Create("上传指标类型", "获取所有的上传指标类型操作", adminUser.AdminName);
                string sort = context.Request.Form["sort"];
                string order = context.Request.Form["order"];
                NCPEP.Bll.T_UploadTypeIndicator blltype = new T_UploadTypeIndicator();
                return blltype.GetAllList().Tables[0];
               // return dal.GetAllList(sort, order);

            }
            catch (Exception ex)
            {
                SystemErrorPlug.ErrorRecord("时间:[" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "]类名:[" + this.GetType().Name + "],行号:[" + Component.GetLineNum().ToString() + "行],错误信息:[" + ex.Message + "]");
                return null;
            }
        }

        private dynamic GetModels(HttpContext context)
        {
            dynamic model = new UploadTypeIndicator();
            model.TypeIndicatorName = context.Request.Form["TypeIndicatorName"];
            model.Editor = adminUser.AdminName;
            try { model.Id = int.Parse(context.Request.Form["Id"].ToString()); }
            catch { model.Id = 0; }
            return model;
        }
    }
}
