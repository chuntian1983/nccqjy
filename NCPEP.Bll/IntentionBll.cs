using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using NCPEP.Dal;
using NCPEP.Model;

namespace NCPEP.Bll
{
    public class IntentionBll
    {
        private dynamic dal = null;
        private dynamic user = null;
        private string UserName = string.Empty;
        public IntentionBll()
        {
            dal = new WebIntentionDal();
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
                case "paging":
                    string str = "\"total\":" + SumCount(context) + ",";
                    returnDate = JsonHelper<WebIntention>.JsonDataTable(GetAllList(context), "rows").Insert(1, (str));
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
                    returnDate = JsonHelper<WebIntention>.JsonWriter(GetById(context));
                    break;
                default:
                    returnDate = "请求错误!";
                    break;
            }
            return returnDate;
        }
        //
        private int SumCount(HttpContext context)
        {
            try
            {
                SysLogBll.Create("User意向转出-转入", "获取信息总和", UserName);
                string sqlWhere = string.Format(" FK_WebUserVeriId={0} ", user.Id);
                string Title = context.Request.QueryString["Title"] as string;
                if (!string.IsNullOrEmpty(Title)) { sqlWhere = string.Format(" and Title like '{0}%' ", Title); }
                return dal.Count(sqlWhere);
            }
            catch (Exception ex) { SystemErrorPlug.ErrorRecord("时间:[" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "]类名:[" + this.GetType().Name + "],行号:[" + Component.GetLineNum().ToString() + "行],错误信息:[" + ex.Message + "]"); return 0; }
        }
        //
        private dynamic GetAllList(HttpContext context)
        {
            try
            {
                SysLogBll.Create("User意向转出-转入", "意向转出-转入信息列表", UserName);
                string sqlWhere = string.Format(" FK_WebUserVeriId={0} ", user.Id);

                string Title = context.Request.QueryString["Title"] as string;

                if (!string.IsNullOrEmpty(Title)) { sqlWhere += string.Format(" and a.Title like '{0}%' ", Title); }

                int startIndex = 0;
                try { startIndex = int.Parse(context.Request.Form["page"]) - 1; }
                catch { }
                int pageSize = 10;
                try { pageSize = int.Parse(context.Request.Form["rows"].ToString()); }
                catch { }
                string order = string.Format(" order by a.{0} {1}", context.Request.Form["sort"].ToString(), context.Request.Form["order"].ToString());
                return dal.GetAllList(sqlWhere, startIndex, pageSize, order);
            }
            catch (Exception ex)
            {
                SystemErrorPlug.ErrorRecord("时间:[" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "]类名:[" + this.GetType().Name + "],行号:[" + Component.GetLineNum().ToString() + "行],错误信息:[" + ex.Message + "]");
                return null;
            }
        }
        //
        private string Create(HttpContext context)
        {
            try
            {
                SysLogBll.Create("User意向转出-转入", "添加意向转出-转入信息", UserName);
                if (dal.Create(GetModel(context)))
                {
                    return "添加成功！";
                }
                else
                {
                    return "添加失败，请重新操作！";
                }
            }
            catch (Exception ex)
            {
                SystemErrorPlug.ErrorRecord("时间:[" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "]类名:[" + this.GetType().Name + "],行号:[" + Component.GetLineNum().ToString() + "行],错误信息:[" + ex.Message + "]");
                return "添加失败，错误代码：500 ";
            }
        }
        //
        private string Update(HttpContext context)
        {
            try
            {
                SysLogBll.Create("User意向转出-转入", "更新意向转出-转入信息操作", UserName);
                if (dal.Update(GetModel(context)))
                {
                    return "更新成功！";
                }
                else
                {
                    return "更新失败，请重新操作！";
                }
            }
            catch (Exception ex)
            {
                SystemErrorPlug.ErrorRecord("时间:[" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "]类名:[" + this.GetType().Name + "],行号:[" + Component.GetLineNum().ToString() + "行],错误信息:[" + ex.Message + "]");
                return "更新失败，错误代码：500 ";
            }
        }
        //
        private string Delete(HttpContext context)
        {
            try
            {
                SysLogBll.Create("User意向转出-转入", "删除意向转出-转入信息操作", UserName);
                string idList = context.Request.QueryString["idList"];
                if (dal.Delete(idList))
                {
                    return "删除成功！";
                }
                else
                {
                    return "删除失败，请重新操作！";
                }
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
                SysLogBll.Create("User意向转出-转入", "查询单个意向转出-转入信息", UserName);
                int id = 0;
                try { id = int.Parse(context.Request.QueryString["id"].ToString()); }
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
        private dynamic GetModel(HttpContext context)
        {
            WebIntention model = new WebIntention();
            model.FK_WebUserVeriId = user.Id;
            try { model.IntentionType = int.Parse(context.Request.Form["IntentionType"].ToString()); }
            catch { model.IntentionType = 0; }
            model.Title = context.Request.Form["Title"].ToString();
            model.Content = context.Request.Form["Content"].ToString();
            model.RegDate = DateTime.Parse(context.Request.Form["RegDate"].ToString());
            model.EndDte = DateTime.Parse(context.Request.Form["EndDte"].ToString());
            try { model.CheckStatus = int.Parse(context.Request.Form["CheckStatus"].ToString()); }
            catch { model.CheckStatus = 0; }
            try { model.ClickNum = int.Parse(context.Request.Form["ClickNum"].ToString()); }
            catch { model.ClickNum = 0; }
            model.CheckName = context.Request.Form["CheckName"].ToString();
            model.CheckDate = DateTime.Now;
            try { model.Id = int.Parse(context.Request.Form["Id"]); }
            catch { }
            return model;
        }
    }
}