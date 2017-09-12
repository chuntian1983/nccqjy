using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using NCPEP.Bll;
using System.Configuration;

namespace Web
{
    public partial class _Default : System.Web.UI.Page
    {
        public string p = string.Empty;
        public string l = string.Empty;
        public string t = string.Empty;
        public string url1, url2, url3, url4;
        protected void Page_Load(object sender, EventArgs e)
        {
            url1 = System.Configuration.ConfigurationManager.AppSettings["url1"];
            url2 = System.Configuration.ConfigurationManager.AppSettings["url2"];
            url3 = System.Configuration.ConfigurationManager.AppSettings["url3"];
            url4 = System.Configuration.ConfigurationManager.AppSettings["url4"];
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
                BindBanshi();
            }
        }
        protected void BindBanshi()
        {
            NCPEP.Bll.T_News bllnews = new T_News();
            DataTable dt = bllnews.GetList(9, " NewsTypeId='4' and IsCheck=1", "id").Tables[0];

            this.repbanshi.DataSource = dt;
            this.repbanshi.DataBind();
        }
    }
}
