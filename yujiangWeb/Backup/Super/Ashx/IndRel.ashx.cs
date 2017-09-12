using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.SessionState;
using NCPEP.Bll;

namespace Web.Super.Ashx
{
    /// <summary>
    /// IndRel 的摘要说明
    /// </summary>
    public class IndRel : IHttpHandler, IReadOnlySessionState, IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.Write(new IndicatorsRelationsBll().ProcessRequest(context));
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