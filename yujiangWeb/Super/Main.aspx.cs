using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using NCPEP.Bll;
using NCPEP.Model;

namespace Web.Super
{
    public partial class Main : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            v.InnerHtml = Version.Ver();
            dynamic adminUser = null;
            try
            {
                adminUser = Session["SuperAdminUserSession"] as AdminUser;
                if (null == adminUser)
                {
                    if (!string.IsNullOrEmpty(Request.Cookies["AdminCookies"].Value))
                    {
                        adminUser = new GetUserCookiesPlug().GetUserCookies(Request.Cookies["AdminCookies"]["SuperAdminUserSession"]);
                        Session["SuperAdminUserSession"] = adminUser;
                    }
                }
            }
            catch
            {
                adminUser = null;
            }
            if (null == adminUser)
            {
                Response.Redirect("~/Super/Default.aspx", true);
            }
            if (new GetUserCookiesPlug().ShieldingUsers(Component.GetMac()))
            {
                Response.Redirect("~/Super/Default.aspx", true);
            }
            /*
               try
               {
                   SoftRegBll bll = new SoftRegBll();
                   string sequenceNumber = bll.GetSequenceNumber().Trim();
                   if (!string.IsNullOrEmpty(sequenceNumber))
                   {
                       sequenceNumber = DESEncrypt.Decrypt(sequenceNumber);
                       string[] strList = sequenceNumber.Split('|');
                       if (strList[0].Equals(DESEncrypt.Encrypt(Component.GetMac())))
                       {
                           if (DateTime.Parse(strList[1]) >= System.DateTime.Now && DateTime.Parse(strList[2]) <= System.DateTime.Now)
                           {
                               Response.Redirect("~/Super/SoftReg.aspx");
                           }
                       }
                       else
                       {
                           Response.Redirect("~/Super/SoftReg.aspx");
                       }
                   }
                   else
                   {
                       Response.Redirect("~/Super/SoftReg.aspx");
                   }
               }
               catch
               {
                   Response.Redirect("~/Super/SoftReg.aspx");
               } 
             * */
        }
    }
}