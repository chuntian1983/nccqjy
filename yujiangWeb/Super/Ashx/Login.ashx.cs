using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.SessionState;
using NCPEP.Bll;

namespace Web.Super.Ashx
{
    /// <summary>
    /// 
    /// </summary>
    public class Login : IHttpHandler, IReadOnlySessionState, IRequiresSessionState
    {
        public void ProcessRequest(HttpContext context)
        {
            context.Response.Write(new AdminUserLogin().ProcessRequest(context));
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