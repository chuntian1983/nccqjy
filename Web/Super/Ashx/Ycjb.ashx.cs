using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using NCPEP.Bll;
using System.Web.SessionState;
using NCPEP.Model;
using NCPEP.Dal;
using System.Data;

namespace Web.Super.Ashx
{
    /// <summary>
    /// Ycjb 的摘要说明
    /// </summary>
    public class Ycjb : IHttpHandler, IReadOnlySessionState, IRequiresSessionState
    {

        //public void ProcessRequest(HttpContext context)
        //{
        //    context.Response.ContentType = "text/plain";
        //    context.Response.Write("Hello World");
        //}
        NCPEP.Model.T_LiceTran model = new NCPEP.Model.T_LiceTran();
        public void ProcessRequest(HttpContext context)
        {
            if (context.Session["jbyhm"]!=null)
            {
                model =(NCPEP.Model.T_LiceTran)context.Session["jbyhm"];
            }
            string action = context.Request.QueryString["action"].ToString();
            string returnDate = string.Empty;
            switch (action)
            {
                
                case "ycjbuser":
                    //str = "\"total\":" + SumCount(context) + ",";
                    returnDate = JsonHelper<Bid>.JsonDataTable(GetAllListByYCJBuser(context), "rows");
                    break;
                
                default:
                    returnDate = "请求错误!";
                    break;
            }
            
            context.Response.Write(returnDate);
        }
        private DataTable GetAllListByYCJBuser(HttpContext context)
        {
            try
            {
                NCPEP.Dal.BidDal dal = new BidDal();
                string sqlWhere = string.Empty;
                int startIndex = 0;
                try { startIndex = int.Parse(context.Request.Form["page"]) - 1; }
                catch { }
                int pageSize = 10;
                try { pageSize = int.Parse(context.Request.Form["rows"].ToString()); }
                catch { }

                string order = "";
                if (context.Request.QueryString["BidName"] != null)
                {
                    sqlWhere += string.Format(" and BidName like '%{0}%'", context.Request.QueryString["BidName"]);
                }

                sqlWhere += " and DepaStatus ='3' and StandardMode='2' and jbzt='1'";
                
                if (model.JBYhm!=null)
                {
                    sqlWhere += " and jbyhm='"+model.JBYhm+"'";
                }
                return dal.GetAllListByDzjb(sqlWhere, startIndex, pageSize, order);

            }
            catch (Exception ex)
            {
                SystemErrorPlug.ErrorRecord("时间:[" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "]类名:[" + this.GetType().Name + "],行号:[" + Component.GetLineNum().ToString() + "行],错误信息:[" + ex.Message + "]");
                return null;
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