using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using NCPEP.Bll;

namespace Web.Super.Ashx
{
    /// <summary>
    /// softRegh 的摘要说明
    /// </summary>
    public class SoftRegh : IHttpHandler
    {
        public void ProcessRequest(HttpContext context)
        {
            string action = context.Request.QueryString["action"].ToString();
            switch (action)
            {
                case "sn":
                    context.Response.Write(SerialNumber());
                    break;
                case "reg":
                    context.Response.Write(SoftReg(context));
                    break;
            }
        }
        //
        private string SoftReg(HttpContext context)
        {
            try
            {
                string reg = context.Request.QueryString["r"];
                SoftRegBll softreg = new SoftRegBll();
                softreg.Delete();
                if (softreg.Create(reg)) { return "Y"; } else { return "N"; }
            }
            catch { return "N"; }
        }
        //
        private string SerialNumber()
        {
            return DESEncrypt.Encrypt(Component.GetMac());
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