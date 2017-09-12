using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using NCPEP.Bll;
using System.Web.SessionState;

namespace Web.Super.Ashx
{
    /// <summary>
    /// BidPlac 的摘要说明
    /// </summary>
    public class BidPlac : IHttpHandler, IReadOnlySessionState, IRequiresSessionState
    {
        public void ProcessRequest(HttpContext context)
        {
             context.Response.Write(new BidPlacardBll().ProcessRequest(context));
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