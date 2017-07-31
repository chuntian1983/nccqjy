using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web
{
    public partial class SiteMaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["t"]!=null)
            {
                string t = Request.QueryString["t"];
                switch (t)
                {
                    case "2":
                        strli2.Attributes.Add("class", "menu_nav_ligb");
                        stra2.Attributes.Add("class", "menu_nav_white menus2");
                        break;
                    case "3":
                        strli3.Attributes.Add("class", "menu_nav_ligb");
                        stra3.Attributes.Add("class", "menu_nav_white menus3");
                        break;
                    case "4":
                        strli4.Attributes.Add("class", "menu_nav_ligb");
                        stra4.Attributes.Add("class", "menu_nav_white menus4");
                        break;
                    case "5":
                        strli5.Attributes.Add("class", "menu_nav_ligb");
                        stra5.Attributes.Add("class", "menu_nav_white menus5");
                        break;
                    case "6":
                        strli6.Attributes.Add("class", "menu_nav_ligb");
                        stra6.Attributes.Add("class", "menu_nav_white menus6");
                        break;
                    case "7":
                        strli7.Attributes.Add("class", "menu_nav_ligb");
                        stra7.Attributes.Add("class", "menu_nav_white menus7");
                        break;
                   
                   
                    default:
                        break;
                }
            }
        }
    }
}
