using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using NCPEP.Bll;
using System.Web.SessionState;

namespace Web.Super.Ashx
{
    /// <summary>
    /// BidPrint 的摘要说明
    /// </summary>
    public class BidPrint : IHttpHandler, IReadOnlySessionState, IRequiresSessionState
    {
        public void ProcessRequest(HttpContext context)
        {
            context.Response.Write(new BidPrintGroundsBll().ProcessRequest(context));
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