﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using NCPEP.Bll;
using System.Web.SessionState;

namespace Web.Super.Ashx
{
    /// <summary>
    /// BidH 的摘要说明
    /// </summary>
    public class BidH : IHttpHandler, IReadOnlySessionState, IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.Write(new BidBll().ProcessRequest(context));
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