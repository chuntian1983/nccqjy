using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using NCPEP.Dal;
using NCPEP.Model;
using System.Web;
using System.Data;


namespace NCPEP.Bll
{
    public class NewsBll
    {
        private dynamic dal = null;
        private dynamic adminUser = null;
        private dynamic orgdal = null;
        public NewsBll()
        {
            dal = new NewsDal();
            orgdal = new OrganizationDal();
        }
        public string ProcessRequest(HttpContext context)
        {
            string action = context.Request.QueryString["action"].ToString();
            string returnDate = string.Empty;

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

            switch (action)
            {
                case "paging":
                    string str = "\"total\":" + SumCount(context) + ",";
                    returnDate = JsonHelper<News>.JsonDataTable(GetAllList(context), "rows").Insert(1, (str));
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
                    returnDate = JsonHelper<News>.JsonWriter(GetById(context));
                    break;
                case "rs":
                    returnDate = RowsState(context);
                    break;
                default:
                    returnDate = "请求错误!";
                    break;
            }
            return returnDate;
        }

        //
        private string RowsState(HttpContext context)
        {
            try
            {
                SysLogBll.Create("新闻", "更新新闻状态操作", adminUser.AdminName);
                string row = context.Request.QueryString["Rows"];
                string values = context.Request.QueryString["Vale"];
                string where = context.Request.QueryString["id"];
                string value = (values == "0" ? "1" : "0");
                if (row.Equals("IsCheck"))
                {
                    if (dal.UpdateState(row, value, where))
                    {
                        return "修改状态设置成功！";
                    }
                    else
                    {
                        return "修改状态设置失败!";
                    }
                }
                else
                {
                    if (dal.UpdateState(row, value, where))
                    {
                        return "修改状态设置成功！";
                    }
                    else
                    {
                        return "修改状态设置失败!";
                    }
                }
            }
            catch (Exception ex)
            {
                SystemErrorPlug.ErrorRecord("时间:[" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "]类名:[" + this.GetType().Name + "],行号:[" + Component.GetLineNum().ToString() + "行],错误信息:[" + ex.Message + "]");
                return "修改状态设置失败，错误代码：500";
            }
        }
        //
        private int SumCount(HttpContext context)
        {
            try
            {
                SysLogBll.Create("新闻", "获取信息总和", adminUser.AdminName);
                string sqlWhere =" 1=1 ";
              
                string _NewsTitle = context.Request.QueryString["NewsTitle"] as string;
                string _NewsTypeId = context.Request.QueryString["NewsTypeId"] as string;
                string _IsCheck = context.Request.QueryString["IsCheck"] as string;
                if (!string.IsNullOrEmpty(_NewsTitle)) { sqlWhere += string.Format(" and NewsTitle like '{0}%' ", _NewsTitle); }
                if (!string.IsNullOrEmpty(_NewsTypeId)) { sqlWhere += string.Format(" and NewsTypeId={0}", _NewsTypeId); }
                if (!string.IsNullOrEmpty(_IsCheck)) { sqlWhere += string.Format(" and IsCheck={0}", _IsCheck); }
                return dal.Count(sqlWhere);
            }
            catch (Exception ex) { SystemErrorPlug.ErrorRecord("时间:[" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "]类名:[" + this.GetType().Name + "],行号:[" + Component.GetLineNum().ToString() + "行],错误信息:[" + ex.Message + "]"); return 0; }
        }
        //
        private dynamic GetAllList(HttpContext context)
        {
            try
            {
                SysLogBll.Create("新闻", "新闻信息列表", adminUser.AdminName);
                string sqlWhere = " 1=1 ";
               
                string _NewsTitle = context.Request.QueryString["NewsTitle"] as string;
                string _NewsTypeId = context.Request.QueryString["NewsTypeId"] as string;
                string _IsCheck = context.Request.QueryString["IsCheck"] as string;
                if (!string.IsNullOrEmpty(_NewsTitle)) { sqlWhere += string.Format(" and a.NewsTitle like '{0}%' ", _NewsTitle); }
                if (!string.IsNullOrEmpty(_NewsTypeId)) { sqlWhere += string.Format(" and a.NewsTypeId={0}", _NewsTypeId); }
                if (!string.IsNullOrEmpty(_IsCheck)) { sqlWhere += string.Format(" and a.IsCheck={0}", _IsCheck); }
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
                SysLogBll.Create("新闻", "添加新闻信息", adminUser.AdminName);
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
                SysLogBll.Create("新闻", "更新新闻信息操作", adminUser.AdminName);
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
                int succ = 0;
                int err = 0;
                SysLogBll.Create("新闻", "删除新闻信息操作", adminUser.AdminName);
                string[] idList = context.Request.QueryString["idList"].Split(',');
                for (int i = 0; i < idList.Length; i++)
                {
                    int id = int.Parse(idList[i]);
                    News model = dal.GetModel(id);
                    if (dal.Delete(id))
                    {
                        Component.DeleteImg("~/newsImg/min/" + model.NewsImg);
                        Component.DeleteImg("~/newsImg/max/" + model.NewsImg);
                        Component.DeleteImg("~/newsFile/" + model.NewsFile);
                        succ++;
                    }
                    else
                    {
                        err++;
                    }
                }
                return "删除操作成功了[" + succ.ToString() + "]条，失败了[" + err.ToString() + "]条！";
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
                SysLogBll.Create("新闻", "查询单个新闻信息", adminUser.AdminName);
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

        private News GetModel(HttpContext context)
        {
            News model = new News();
            try { model.NewsTypeId = int.Parse(context.Request.Form["NewsTypeId"]); }
            catch { }
            model.Keyword = context.Request.Form["Keyword"];
            model.Content = context.Request.Form["Content"];
            model.OrgCode = adminUser.OrgCode;
            model.NewsTitle = context.Request.Form["NewsTitle"];
            model.NewsSubheading = context.Request.Form["NewsSubheading"];
            model.NewsSource = context.Request.Form["NewsSource"];
            model.NewsContent = context.Request.Form["NewsContent"];
            try
            {
                model.CreateDate = DateTime.Parse(context.Request.Form["txtshijian"]);
            }
            catch { }
            try { model.NumClicks = int.Parse(context.Request.Form["NumClicks"]); }
            catch { }
            string newsImgName = new UpLoadNewsImgPlug().UploadImg("147", "147");
            model.NewsImg = newsImgName == string.Empty ? context.Request.Form["NewsImg"] : newsImgName;
            string newsFileName = new UpLoadFilePlug().UploadFile("~/newsFile/");
            model.NewsFile = newsFileName == string.Empty ? context.Request.Form["NewsFile"] : newsFileName;
            model.IsCheck = adminUser.IsCheck;
            model.Editor = adminUser.AdminName;
            try { model.Id = int.Parse(context.Request.Form["Id"]); }
            catch { }
            return model;
        }
    }
}