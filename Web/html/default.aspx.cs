using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Maticsoft.Common;
using NCPEP.Bll;
using NCPEP.Model;
using System.Data;

namespace Web.html
{
    public partial class _default : System.Web.UI.Page
    {
        public string jieguo;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            string strqu = Request.Form["seldq"];
            string strtxt = Request.Form["txthzs"];
            //MessageBox.Show(this, strqu+"<br>"+strtxt);
            DataTable dt = new DataTable();
            
            string strwhere = " 1=1 and zuobiaox!='' ";
            if (!string.IsNullOrEmpty(strtxt))
            {
                strwhere += " and mingcheng like '%"+ strtxt+"%'";
            }
            if (!string.IsNullOrEmpty(strqu))
            {
                if (strqu!="威海市")
                {
                    strwhere += " and quyu='" + strqu + "'";
                }
                
            }
            if (!string.IsNullOrEmpty(this.sellb.SelectedValue))
            {
                if (this.sellb.SelectedValue=="合作社")
                {
                    NCPEP.Bll.T_hzs bll = new NCPEP.Bll.T_hzs();
                    dt = bll.GetList(strwhere).Tables[0];
                }
                else
                {
                    NCPEP.Bll.T_jtnc bll = new NCPEP.Bll.T_jtnc();
                    dt = bll.GetList(strwhere).Tables[0];
                }
            }
            
            jieguo = dt.Rows.Count.ToString();
            this.repjg.DataSource = dt;
            this.repjg.DataBind();
            string strzuobiao = "";
            string strneirong = "";
            foreach (DataRow dr in dt.Rows)
            {
                if (!string.IsNullOrEmpty(dr["zuobiaox"].ToString()))
                {
                    strzuobiao += dr["zuobiaox"] + "," + dr["zuobiaoy"] + "|";
                    strneirong += dr["mingcheng"] + "," + dr["dizhi"] + "," + dr["lishizhang"] + "," + dr["lianxidianhua"]+"|";
                }
            }
            hdzuobiao.Value = strzuobiao.TrimEnd('|');
            hdneirong.Value = strneirong.TrimEnd('|');

            
        }
    }
}