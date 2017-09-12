using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.SessionState;
using NCPEP.Bll;

namespace Web.Handler
{
    /// <summary>
    /// IntentionH 的摘要说明
    /// </summary>
    public class IntentionH : IHttpHandler, IReadOnlySessionState, IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.Write(new IntentionBll().ProcessRequest(context));
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