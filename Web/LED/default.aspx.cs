using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Maticsoft.DBUtility;
using System.Data;
using System.Data.SqlClient;

namespace Web.LED
{
    public partial class _default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                string strsql = "select * from view_guapai where DepaStatusId=2";

                DataTable dt = DbHelperSQL.Query(strsql).Tables[0];
                this.repgp.DataSource = dt;
                this.repgp.DataBind();
                string strsql2 = "select * from view_guapai where DepaStatusId=7";



                DataTable dt2 = DbHelperSQL.Query(strsql2).Tables[0];
                this.repwc.DataSource = dt2;
                this.repwc.DataBind();
            }
            
            
        }
    }
}