using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using NCPEP.Model;
using NCPEP.Dal;
using System.Web;
using System.IO;
using System.Data;
using System.Net;

namespace NCPEP.Bll
{
    public class SysLogBll
    {
        private dynamic dal = null;
        private dynamic adminUser = null;
        public SysLogBll()
        {
            dal = new SysLogDal();
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
                    returnDate = JsonHelper<SysLog>.JsonDataTable(GetAllList(context), "rows").Insert(1, (str));
                    break;
                case "del":
                    returnDate = Delete();
                    break;
                case "sel":
                    returnDate = GetSelAddress(context);
                    break;
                default:
                    returnDate = "请求错误!";
                    break;
            }
            return returnDate;
        }
        //
        private string GetSelAddress(HttpContext context)
        {
            try
            {
                string url = "http://apis.baidu.com/chazhao/ipsearch/ipsearch";
                string ip = context.Request.QueryString["Ip"] as string;
                string param = string.Format("ip={0}", ip);
                string strURL = url + '?' + param;
                HttpWebRequest request = (HttpWebRequest)WebRequest.Create(strURL);
                request.Method = "GET";
                request.Headers.Add("apikey", "778b1d20cd69be9bd621235a9cfe6b9c");
                HttpWebResponse response = (HttpWebResponse)request.GetResponse();
                Stream stream = response.GetResponseStream();
                string StrDate = string.Empty;
                string strValue = string.Empty;
                StreamReader Reader = new StreamReader(stream, Encoding.UTF8);
                while ((StrDate = Reader.ReadLine()) != null)
                {
                    strValue += StrDate + "\r\n";
                }
                return strValue;
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
                SysLogBll.Create("操作日志", "获取操作日志总和数据", adminUser.AdminName);
                string sqlWhere = string.Empty;
                if (1 == adminUser.AdminTypeId)
                {
                    sqlWhere = " 1=1 ";
                }
                else
                {
                    sqlWhere = string.Format(" Editor='{0}'", adminUser.AdminName);
                }
                if (context.Request.QueryString["StateDate"] != null || context.Request.QueryString["EndDate"] != null)
                {
                    sqlWhere = string.Format(" and CreateDate between '{0} 00:00:00' and '{1} 23:59:59'", context.Request.QueryString["StateDate"], context.Request.QueryString["EndDate"]);
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
        private dynamic GetAllList(HttpContext context)
        {
            try
            {
                SysLogBll.Create("操作日志", "获取所有的操作日志信息", adminUser.AdminName);
                string sqlWhere = string.Empty;
                if (1 == adminUser.AdminTypeId)
                {
                    sqlWhere = " 1=1 ";
                }
                else
                {
                    sqlWhere = string.Format(" Editor='{0}'", adminUser.AdminName);
                }
                int startIndex = 0;
                int pageSize = 10;
                try { startIndex = int.Parse(context.Request.Form["page"].ToString()) - 1; }
                catch (Exception) { }
                try { pageSize = int.Parse(context.Request.Form["rows"].ToString()); }
                catch (Exception) { }
                if (context.Request.QueryString["StateDate"] != null || context.Request.QueryString["EndDate"] != null)
                {
                    sqlWhere += string.Format(" and CreateDate between '{0} 00:00:00' and '{1} 23:59:59'", context.Request.QueryString["StateDate"], context.Request.QueryString["EndDate"]);
                }
                string order = string.Format(" order by {0} {1}", context.Request.Form["sort"].ToString(), context.Request.Form["order"].ToString());
                return dal.GetAllList(sqlWhere, startIndex, pageSize, order);
            }
            catch (Exception ex)
            {
                SystemErrorPlug.ErrorRecord("时间:[" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "]类名:[" + this.GetType().Name + "],行号:[" + Component.GetLineNum().ToString() + "行],错误信息:[" + ex.Message + "]");
                return null;
            }
        }
        //
        private dynamic Delete()
        {
            try
            {
                SysLogBll.Create("操作日志", "删除操作日志信息", adminUser.AdminName);
                string sqlWhere = string.Empty;
                if (1 == adminUser.AdminTypeId)
                {
                    sqlWhere = " 1=1 ";
                }
                else
                {
                    sqlWhere = string.Format(" Editor='{0}'", adminUser.AdminLogName);
                }
                DataTable dt = dal.GetAllList();
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    string mess = "[" + dt.Rows[i]["Id"] + "][" + dt.Rows[i]["LogValue"] + "][" + dt.Rows[i]["Operates"] + "][" + dt.Rows[i]["IpAdd"] + "][" + dt.Rows[i]["MacAdd"] + "][" + dt.Rows[i]["Editor"] + "][" + dt.Rows[i]["CreateDate"] + "]\r\n";
                    SysLogs(mess);
                }
                dal.Delete();
                return "清空日志操作成功！";
            }
            catch (Exception ex)
            {
                SystemErrorPlug.ErrorRecord("时间:[" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "]类名:[" + this.GetType().Name + "],行号:[" + Component.GetLineNum().ToString() + "行],错误信息:[" + ex.Message + "]");
                return "清空日志操作失败！错误代码：500 ";
            }
        }
        //
        private void SysLogs(string mess)
        {
            try
            {
                SysLogBll.Create("操作日志", "生成静态操作日志文件", adminUser.AdminName);
                string fileLogPath = HttpContext.Current.Server.MapPath("~/Logs/");
                if (!Directory.Exists(fileLogPath))
                {
                    Directory.CreateDirectory(fileLogPath);
                }
                fileLogPath = Path.Combine(fileLogPath, "SystemLogs" + DateTime.Now.ToString("yyyyMMddhh") + ".log");
                File.AppendAllText(fileLogPath, mess, System.Text.Encoding.UTF8);
            }
            catch (Exception ex)
            {
                SystemErrorPlug.ErrorRecord("时间:[" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "]类名:[" + this.GetType().Name + "],行号:[" + Component.GetLineNum().ToString() + "行],错误信息:[" + ex.Message + "]");
            }
        }
        //
        public static void Create(string logValue, string operates, string editor)
        {
            SysLog model = new SysLog();
            model.Editor = editor;
            model.IpAdd = Component.GetClientIP();
            model.LogValue = logValue;
            model.MacAdd = Component.GetMac();
            model.Operates = operates;
            new SysLogDal().Create(model);
        }
    }
}

