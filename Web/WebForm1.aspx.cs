using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Maticsoft.DBUtility;
using System.Data;

namespace Web
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        DataTable dt = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            for (int i = 0; i < 100; i++)
            {
                dt = DbHelperSQL.Query("select * from t_bid").Tables[0];
                Response.Write(i.ToString()+"<br>");
            }
        }
    }
}