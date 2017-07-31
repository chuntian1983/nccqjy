using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using NCPEP.Bll;
using System.Web.SessionState;
using System.Text;
using System.Data;


namespace Web.Handler
{
    /// <summary>
    /// _default 的摘要说明
    /// </summary>
    public class _default : IHttpHandler, IReadOnlySessionState, IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.Write(new OrganizationBll().ProcessRequest(context));
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