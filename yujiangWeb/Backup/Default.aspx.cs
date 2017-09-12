using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using NCPEP.Bll;

namespace Web
{
    public partial class _Default : System.Web.UI.Page
    {
        public string p = string.Empty;
        public string l = string.Empty;
        public string t = string.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DataTable dataTable = new WebSiteBll().GetImgList();
                for (int i = 0; i < dataTable.Rows.Count; i++)
                {
                    p += "../newsImg/max/" + dataTable.Rows[i]["NewsImg"];
                    l += "NewsDetails.aspx?t=" + dataTable.Rows[i]["NewsTypeId"] + "&id=" + dataTable.Rows[i]["Id"];
                    t += dataTable.Rows[i]["NewsTitle"];
                    if (i < dataTable.Rows.Count - 1)
                    {
                        p += "|";
                        l += "|";
                        t += "|";
                    }
                }
            }
        }
    }
}
