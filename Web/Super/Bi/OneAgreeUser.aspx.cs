using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web.Super.Bi
{
    public partial class OneAgreeUser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
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