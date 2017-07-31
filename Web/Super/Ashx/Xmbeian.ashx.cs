using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using NCPEP.Bll;
using System.Web.SessionState;
using NCPEP.Model;
using System.Data;

namespace Web.Super.Ashx
{
    /// <summary>
    /// Xmbeian 的摘要说明
    /// </summary>
    public class Xmbeian : IHttpHandler, IReadOnlySessionState, IRequiresSessionState
    {

        private dynamic adminUser = null;
        public void ProcessRequest(HttpContext context)
        {
            context.Response.Write(strrequest(context));
        }
        public string strrequest(HttpContext context)
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

                case "add":
                    returnDate = Create(context);
                    break;
                case "paging":
                    string str2 = "\"total\":" + Getlist(context).Rows.Count + ",";
                    returnDate = JsonConverterwh.ToJson(Getlist(context), "rows").Insert(1, (str2));
                    break;
                case "pagingxx":
                    string str = "\"total\":" + Getlistxx(context).Rows.Count + ",";
                    returnDate = JsonConverterwh.ToJson(Getlistxx(context), "rows").Insert(1, (str));
                    break;
                case "del":
                    returnDate = Delete(context);
                    break;
                case "by":
                    returnDate = JsonHelper<NCPEP.Model.T_XmBeian>.JsonWriter(GetById(context));
                    break;
                case "up":
                    returnDate = Update(context);
                    break;
                case "shenhe":
                    returnDate = Shenhe(context);
                    break;
                case "shenheSC":
                    returnDate = ShenheSC(context);
                    break;
                default:
                    returnDate = "请求错误!";
                    break;
            }
            return returnDate;
        }
        private string Shenhe(HttpContext context)
        {
            NCPEP.Bll.T_XmBeian bll = new NCPEP.Bll.T_XmBeian();
            NCPEP.Model.T_XmBeian model = new NCPEP.Model.T_XmBeian();
            string id = context.Request.QueryString["BidId"];
            model = bll.GetModel(int.Parse(id));
            model.beiyong = "2";
            if (bll.Update(model))
            {
                return "审核上报成功";
            }
            else
            {
                return "审核上报失败";
            }
        }
        private string ShenheSC(HttpContext context)
        {
            NCPEP.Bll.T_XmBeian bll = new NCPEP.Bll.T_XmBeian();
            NCPEP.Model.T_XmBeian model = new NCPEP.Model.T_XmBeian();
            string id = context.Request.QueryString["BidId"];
            model = bll.GetModel(int.Parse(id));
            model.beiyong = "3";
            if (bll.Update(model))
            {
                return "审核成功";
            }
            else
            {
                return "审核失败";
            }
        }
        private string Update(HttpContext context)
        {
            try
            {
                SysLogBll.Create("项目备案", "更新项目备案信息", adminUser.AdminName);
                NCPEP.Model.T_XmBeian dModels = GetModels(context);
                NCPEP.Bll.T_XmBeian bll = new NCPEP.Bll.T_XmBeian();
                
                    if (bll.Update(dModels))
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
        private NCPEP.Model.T_XmBeian GetModels(HttpContext context)
        {
            //Bid model = new Bid();
            NCPEP.Model.T_XmBeian model = new NCPEP.Model.T_XmBeian();
            try { model.id = int.Parse(context.Request.Form["Id"].ToString()); }
            catch { }
            NCPEP.Bll.T_XmBeian bll = new NCPEP.Bll.T_XmBeian();
            model = bll.GetModel(int.Parse(context.Request.Form["Id"].ToString()));
            model.beizhu = context.Request.Form["beizhu"];
            model.changjiaozongjia = context.Request.Form["zongjia"];
            model.chengjiaodanjia = context.Request.Form["danjia"];
            model.churangfang = context.Request.Form["crf"];
            model.churangfangxingzhi = context.Request.Form["crfxz"];
            model.cqleixing = context.Request.Form["Properties"];
            model.cqname = context.Request.Form["BidName"];
            model.cqquanshu = context.Request.Form["Ownership"];
            model.danwei = context.Request.Form["gmdw"];
            model.guimo = context.Request.Form["guimo"];
            try
            {
                model.hetongjsrq = Convert.ToDateTime(DateTime.Parse(context.Request.Form["EndDate"].ToString()).ToString("yyyy年MM月dd日"));
            }
            catch { }
            try
            {
                model.hetongksrq = Convert.ToDateTime(DateTime.Parse(context.Request.Form["StartDate"].ToString()).ToString("yyyy年MM月dd日"));
            }
            catch { }
            model.jiaoyifangshi = context.Request.Form["StandardMode"];
            model.shourangfang = context.Request.Form["srf"];
            model.shourangfangxingzhi = context.Request.Form["srfxz"];
            model.zhifufangshi = context.Request.Form["zffs"];
            model.orgcode = context.Request.Form["OrgCode"];
            return model;
        }
        private NCPEP.Model.T_XmBeian GetById(HttpContext context)
        {
            try
            {
                SysLogBll.Create("项目备案", "项目备案信息修改", adminUser.AdminName);
                int id = 0;
                try { id = int.Parse(context.Request.QueryString["Id"]); }
                catch { }
                NCPEP.Model.T_XmBeian model = new NCPEP.Model.T_XmBeian();
                NCPEP.Bll.T_XmBeian bll = new NCPEP.Bll.T_XmBeian();
                model = bll.GetModel(id);
                return model;
                
            }
            catch (Exception ex)
            {
                SystemErrorPlug.ErrorRecord("时间:[" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "]类名:[" + this.GetType().Name + "],行号:[" + Component.GetLineNum().ToString() + "行],错误信息:[" + ex.Message + "]");
                return null;
            }
        }
        private string Delete(HttpContext context)
        {
            try
            {
                SysLogBll.Create("项目备案", "删除项目备案信息操作", adminUser.AdminName);
                NCPEP.Bll.T_XmBeian bll = new NCPEP.Bll.T_XmBeian();
                    int id = 0;
                    try { id = int.Parse(context.Request.QueryString["id"].ToString()); }
                    catch { }
                    if (bll.Delete(id))
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
        private DataTable Getlist(HttpContext context)
        {
            DataTable dt = new DataTable();
            NCPEP.Bll.T_XmBeian bll = new NCPEP.Bll.T_XmBeian();
            dt = bll.GetAllList().Tables[0];
            return dt;
        }
        private DataTable Getlistxx(HttpContext context)
        {
            DataTable dt = new DataTable();
            NCPEP.Bll.T_XmBeian bll = new NCPEP.Bll.T_XmBeian();
            dt = bll.GetlistBy("").Tables[0];
            return dt;
        }
        private string Create(HttpContext context)
        {
            try
            {
                SysLogBll.Create("项目备案添加", "项目备案添加", adminUser.AdminName);
                NCPEP.Bll.T_XmBeian bll = new NCPEP.Bll.T_XmBeian();
                NCPEP.Model.T_XmBeian model = new NCPEP.Model.T_XmBeian();
                model.beiyong = "1";//审核状态
                model.beiyongb = "";
                model.beizhu = context.Request.Form["beizhu"];
                model.changjiaozongjia = context.Request.Form["zongjia"];
                model.chengjiaodanjia = context.Request.Form["danjia"];
                model.churangfang = context.Request.Form["crf"];
                model.churangfangxingzhi = context.Request.Form["crfxz"];
                model.cqleixing = context.Request.Form["Properties"];
                model.cqname = context.Request.Form["BidName"];
                model.cqquanshu = context.Request.Form["Ownership"];
                model.danwei = context.Request.Form["gmdw"];
                model.guimo = context.Request.Form["guimo"];
                try
                {
                    model.hetongjsrq =Convert.ToDateTime( DateTime.Parse(context.Request.Form["EndDate"].ToString()).ToString("yyyy年MM月dd日"));
                }
                catch { }
                try
                {
                    model.hetongksrq = Convert.ToDateTime(DateTime.Parse(context.Request.Form["StartDate"].ToString()).ToString("yyyy年MM月dd日")); 
                }
                catch { }
                model.jiaoyifangshi = context.Request.Form["StandardMode"];
                model.shourangfang = context.Request.Form["srf"];
                model.shourangfangxingzhi = context.Request.Form["srfxz"];
                model.zhifufangshi = context.Request.Form["zffs"];
                model.orgcode = context.Request.Form["OrgCode"];
               
                //int id = (int)dal.Create(GetModels(context));
                int id = bll.Add(model);
                if (id > 0)
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

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}