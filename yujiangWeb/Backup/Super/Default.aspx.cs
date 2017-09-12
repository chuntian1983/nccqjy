using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using NCPEP.Bll;

namespace Web.Super
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            v.InnerHtml = Version.Ver();
            try
            {/*
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
                }*/
            }
            catch
            {
                Response.Redirect("~/Super/SoftReg.aspx");
            }
        }
    }
}