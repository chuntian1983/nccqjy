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
    /// Dzjj 的摘要说明
    /// </summary>
    public class Dzjj : IHttpHandler, IReadOnlySessionState, IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            string action = context.Request.QueryString["action"].ToString();
            string returnDate = string.Empty;
            switch (action)
            {

                case "paging":
                    //str = "\"total\":" + SumCount(context) + ",";
                    returnDate = JsonHelper<Bid>.JsonDataTable(Getlist(context), "rows");
                    break;

                default:
                    returnDate = "请求错误!";
                    break;
            }

            context.Response.Write(returnDate);
        }
        private DataTable Getlist(HttpContext context)
        {
            NCPEP.Bll.T_JBONE bll = new NCPEP.Bll.T_JBONE();
            DataTable dt = bll.GetList(" bid='" + context.Request.QueryString["BidId"] + "'").Tables[0];
            return dt;
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