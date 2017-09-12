using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.SessionState;
using System.Data;
using NCPEP.Bll;

namespace Web.Super.Ashx
{
    /// <summary>
    /// OneAgreeH 的摘要说明
    /// </summary>
    public class OneAgreeH : IHttpHandler, IReadOnlySessionState, IRequiresSessionState
    {
        public void ProcessRequest(HttpContext context)
        {
            context.Response.Write(new OneAgreeBll().ProcessRequest(context));
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