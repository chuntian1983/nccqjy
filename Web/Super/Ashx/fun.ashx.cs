using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.SessionState;
using NCPEP.Bll;
using NCPEP.Model;

namespace Web.Super.Ashx
{
    /// <summary>
    /// fun 的摘要说明
    /// </summary>
    public class fun : IHttpHandler, IReadOnlySessionState, IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            NCPEP.Bll.T_SysFun bll = new NCPEP.Bll.T_SysFun();
            string strid = context.Request["NodeId"];
            
            string strresult = string.Empty;
            if (bll.Delete(int.Parse(strid)))
            {
                strresult = "删除成功！";
            }
            else {
                strresult = "删除失败！";
            }
            context.Response.Write(strresult);
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