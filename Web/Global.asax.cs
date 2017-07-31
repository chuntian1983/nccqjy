using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;
using NCPEP.Bll;

namespace Web
{
    public class Global : System.Web.HttpApplication
    {

        void Application_Start(object sender, EventArgs e)
        {
            Application["OnlineNumber"] = new TOnlineNumberBll().GetModel();
            Application["OrgShortName"] = new OrganizationBll().GetHighestLevelOrgName(Component.ReadXml("OrgCode").InnerText);
            Application["AllTitle"] = Component.ReadXml("AllTitle").InnerText;
            new CheckUserBll().CheckUserThere();
        }

        void Application_End(object sender, EventArgs e)
        {
            int OnlineNumber = 0;
            if (Application["OnlineNumber"] != null)
            {
                try { OnlineNumber = Convert.ToInt32(Application["OnlineNumber"].ToString()); }
                catch { OnlineNumber = 0; }
            }
            new TOnlineNumberBll().Update(OnlineNumber);
        }

        void Application_Error(object sender, EventArgs e)
        {
            int OnlineNumber = 0;
            if (Application["OnlineNumber"] != null)
            {
                try { OnlineNumber = Convert.ToInt32(Application["OnlineNumber"].ToString()); }
                catch { OnlineNumber = 0; }
            }
           new TOnlineNumberBll().Update(OnlineNumber);
        }

        void Session_Start(object sender, EventArgs e)
        {
            if (Application["OnlineNumber"] != null)
            {
                try { Application["OnlineNumber"] = Convert.ToInt32(Application["OnlineNumber"].ToString()) + 1; }
                catch { Application["OnlineNumber"] = 0; }
            }
            else
            {
                Application["OnlineNumber"] = 0;
            }
        }

        void Session_End(object sender, EventArgs e)
        {

        }
    }
}
