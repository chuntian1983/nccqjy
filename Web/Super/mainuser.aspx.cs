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
    public partial class mainuser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            v.InnerHtml = Version.Ver();
            NCPEP.Model.T_LiceTran model = new NCPEP.Model.T_LiceTran();
            try
            {
                model = Session["jbyhm"] as NCPEP.Model.T_LiceTran;
                if (null == model)
                {
                    Response.Redirect("~/Super/loginuser.aspx", true);
                }
                else 
                {
                    lblUserName.InnerText = model.JBYhm;
                }
            }
            catch
            {
                model = null;
            }
            if (null == model)
            {
                Response.Redirect("~/Super/loginuser.aspx", true);
            }
            
            
        }
    }
}