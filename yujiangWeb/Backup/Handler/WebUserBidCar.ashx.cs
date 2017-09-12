using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.SessionState;
using NCPEP.Bll;

namespace Web.Handler
{
    /// <summary>
    /// WebUserBidCar 的摘要说明
    /// </summary>
    public class WebUserBidCar : IHttpHandler, IReadOnlySessionState, IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.Write(new WebUserBidCarBll().ProcessRequest(context));
        }
        //
        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}