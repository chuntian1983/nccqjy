using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using NCPEP.Bll;
using System.Text;
using Maticsoft.Common;

namespace Web
{
    public partial class _Default : System.Web.UI.Page
    {
        public string p = string.Empty;
        public string l = string.Empty;
        public string t = string.Empty;
        public string tzgg;
        public string zxzt1,zxzt2,zttp; 
        public string wqzt,wqzt2;
        public string zcfg, jygz;
        public string fzjg1, fzjg2;//分支机构
        public string strxw = string.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DataTable dataTable = new WebSiteBll().GetImgList();
                for (int i = 0; i < dataTable.Rows.Count; i++)
                {
                    //p += "../newsImg/max/" + dataTable.Rows[i]["NewsImg"];
                    //l += "NewsDetails.aspx?t=" + dataTable.Rows[i]["NewsTypeId"] + "&id=" + dataTable.Rows[i]["Id"];
                    //t += dataTable.Rows[i]["NewsTitle"];
                    //if (i < dataTable.Rows.Count - 1)
                    //{
                    //    p += "|";
                    //    l += "|";
                    //    t += "|";
                    //}
                    string strimg = "../newsImg/max/" + dataTable.Rows[i]["NewsImg"];
                    strxw += "<li><a target=\"_blank\" href=\"NewsDetails.aspx?t=" + dataTable.Rows[i]["NewsTypeId"] + "&id=" + dataTable.Rows[i]["Id"] + "\"><img src=\"" + strimg + "\" alt=\"" + dataTable.Rows[i]["NewsTitle"] + "\" /></a></li>";
                }
                BindDll();
                BindGpRep();
                Bindxz();
                Bindzc();
                Bindbszn();
            }
        }
        protected void BindDll()
        {
            //NCPEP.Bll.OrganizationBll orgbll = new OrganizationBll();
            //DataTable dt = orgbll.GetAllList();
            //this.ddlquyu.DataSource = dt;
            //this.ddlquyu.DataTextField = "OrgShortName";
            //this.ddlquyu.DataValueField = "OrgCode";
            //this.ddlquyu.DataBind();
            //this.ddlquyu.Items.Insert(0, new ListItem("全部"));
            //NCPEP.Bll.PropertyTypeBll pbll = new PropertyTypeBll();
            //DataTable dtp = pbll.GetList("");
            //this.ddlleibie.DataSource = dtp;
            //this.ddlleibie.DataTextField = "PropertyTypeName";
            //this.ddlleibie.DataValueField = "id";
            //this.ddlleibie.DataBind();
            //this.ddlleibie.Items.Insert(0, new ListItem("全部"));
            NCPEP.Bll.T_XMGG bll = new T_XMGG();
            DataTable dt = bll.GetList(10," xmby='1'"," xmsj desc").Tables[0];
            this.repxmgg.DataSource = dt;
            this.repxmgg.DataBind();

        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            string quyu, leibie, mianji, jiage;
            quyu = leibie = mianji = jiage = string.Empty;
            //if (this.ddlquyu.SelectedValue!="全部")
            //{
            //    quyu =HttpUtility.HtmlEncode( this.ddlquyu.SelectedValue);
            //}
            //if (this.ddlleibie.SelectedValue!="全部")
            //{
            //    leibie =HttpUtility.HtmlEncode( this.ddlleibie.SelectedValue);
            //}
            if (!string.IsNullOrEmpty(this.txtmj.Text))
            {
                mianji =HttpUtility.HtmlEncode(this.txtmj.Text);
            }
            else
            {
                MessageBox.Show(this, "请填写信息进行查询");
                return;
            }
            if (!string.IsNullOrEmpty(this.txtje.Text))
            {
                jiage =HttpUtility.HtmlEncode(this.txtje.Text);
            }
            Response.Redirect("searchlist.aspx?quyu=" + quyu + "&leibie=" + leibie + "&mianji=" + mianji + "&jiage=" + jiage + "");
        }
        protected void BindGpRep()
        {

            StringBuilder sb = new StringBuilder();
            sb.Append(" 1=1");

            NCPEP.Bll.BidBll bll = new NCPEP.Bll.BidBll();


            DataTable ds = bll.GetListby(" DepaStatus='7'");
            PagedDataSource ps = new PagedDataSource();
            ps.AllowPaging = true;
            ps.PageSize = 5;
            ps.DataSource = ds.DefaultView;
            ps.CurrentPageIndex = 0;
            //this.rep1.DataSource = ps;
            //this.rep1.DataBind();
        }
        protected void Bindxz()
        {
            NCPEP.Bll.OrganizationBll orgbll = new OrganizationBll();
            DataTable dt = orgbll.GetAllList();
            this.repxz.DataSource = dt;
            this.repxz.DataBind();
        }
        protected void Bindzc()
        {
            NCPEP.Bll.T_News newsbll = new T_News();
            DataTable dt = newsbll.GetList(6, " NewsTypeId=2", "CreateDate desc").Tables[0];
            //this.repzcfg.DataSource = dt;
            //this.repzcfg.DataBind();
            
        }
        /// <summary>
        /// 
        /// </summary>
        protected void Bindbszn()
        {
            NCPEP.Bll.T_News newsbll = new T_News();
            DataTable dt = newsbll.GetList(6, " NewsTypeId=4", "CreateDate").Tables[0];
            //this.repbszn.DataSource = dt;
            //this.repbszn.DataBind();
            DataTable dtxw = newsbll.GetList(10, "NewsTypeId=1 and IsCheck='1'", "CreateDate desc").Tables[0];
            this.repxinwen.DataSource = dtxw;
            this.repxinwen.DataBind();
             dtxw = new DataTable();
            dtxw=newsbll.GetList(12, "NewsTypeId=9 and IsCheck='1'", "CreateDate desc").Tables[0];
            this.repnotice.DataSource = dtxw;
            this.repnotice.DataBind();
            DataTable dtgz = newsbll.GetListNotice(3, "NewsTypeId=9 and IsCheck='1'", "CreateDate desc").Tables[0];
            StringBuilder sb = new StringBuilder();
            if (dtgz.Rows.Count > 0)
            {
                for (int i = 0; i < dtgz.Rows.Count; i++)
                {
                    sb.Append("<a target=\"_blank\" href=\"NewsDetails.aspx?t=9&id=" + dtgz.Rows[i]["id"] + "\">");
                    string strtitle = dtgz.Rows[i]["NewsTitle"].ToString();
                    strtitle = strtitle.Length > 35 ? strtitle.Substring(0, 35)+"..." : strtitle;
                    sb.Append("" + strtitle + "    ");
                    sb.Append("</a>");
                }
            }
            //通知公告
            tzgg =  sb.ToString();//"<a href=\"\">dddd</a>";
            //专题活动
            dt = new DataTable();
            dt = newsbll.GetList(4, " NewsTypeId=5 and ztbz!='是' and IsCheck='1'", "CreateDate desc").Tables[0];
            zxzt1=zxzt2=""; 
            wqzt=wqzt2="";
            if (dt.Rows.Count>0)
            {
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    #region 专题活动
                    if (i==0)
                    {
                        zxzt1 = "<a href=\"NewsDetails.aspx?t=5&id="+dt.Rows[i]["id"]+"\" class=\"zt_img\" target=\"_blank\"><img src=\"newsImg/max/"+dt.Rows[i]["NewsImg"]+"\" style=\"width:196px; height:128px;\"></a><div class=\"fl\"><a href=\"NewsDetails.aspx?t=5&id="+dt.Rows[i]["id"]+"\" class=\"zt_t\" target=\"_blank\">"+dt.Rows[i]["NewsTitle"]+"</a><p>"+dt.Rows[i]["NewsContent"]+"</p></div>";
                    }
                    if (i==1)
                    {
                        zxzt2 = "<a href=\"NewsDetails.aspx?t=5&id="+dt.Rows[i]["id"]+"\" class=\"zt_img\" target=\"_blank\"><img src=\"newsImg/max/"+dt.Rows[i]["NewsImg"]+"\" style=\"width:196px; height:128px;\"></a><div class=\"fl\"><a href=\"NewsDetails.aspx?t=5&id="+dt.Rows[i]["id"]+"\" class=\"zt_t\" target=\"_blank\">"+dt.Rows[i]["NewsTitle"]+"</a><p>"+dt.Rows[i]["NewsContent"]+"</p></div>";
                    }
                    if (i==2)
                    {
                        wqzt = "<a href=\"NewsDetails.aspx?t=5&id="+dt.Rows[i]["id"]+"\" class=\"zt_img\" target=\"_blank\"><img src=\"newsImg/max/"+dt.Rows[i]["NewsImg"]+"\" style=\"width:196px; height:128px;\"></a><div class=\"fl\"><a href=\"NewsDetails.aspx?t=5&id="+dt.Rows[i]["id"]+"\" class=\"zt_t\" target=\"_blank\">"+dt.Rows[i]["NewsTitle"]+"</a><p>"+dt.Rows[i]["NewsContent"]+"</p></div>";
                    }
                    if (i == 3)
                    {
                        wqzt2 = "<a href=\"NewsDetails.aspx?t=5&id=" + dt.Rows[i]["id"] + "\" class=\"zt_img\" target=\"_blank\"><img src=\"newsImg/max/" + dt.Rows[i]["NewsImg"] + "\" style=\"width:196px; height:128px;\"></a><div class=\"fl\"><a href=\"NewsDetails.aspx?t=5&id=" + dt.Rows[i]["id"] + "\" class=\"zt_t\" target=\"_blank\">" + dt.Rows[i]["NewsTitle"] + "</a><p>" + dt.Rows[i]["NewsContent"] + "</p></div>";
                    }
                    #endregion
                }
            }
            #region 专题通栏图片
            zttp = "<img src=\"images/ban.jpg\"/>";
            dt = new DataTable();
            dt = newsbll.GetList(1, " NewsTypeId=5 and ztbz='是' and IsCheck='1'", "CreateDate desc").Tables[0];
            if (dt.Rows.Count>0)
            {
                zttp = "<a href=\"NewsDetails.aspx?t=5&id="+dt.Rows[0]["id"]+"\" target=\"_blank\"><img src=\"newsImg/max/" + dt.Rows[0]["NewsImg"] + "\" style=\" width:1000px; height:154px;\"/></a> ";
            }
            #endregion
            #region 业务办理
            dt = new DataTable();
            zcfg = "<li><a href=\"\" target=\"_blank\" ></a><span></span></li>";
            dt = newsbll.GetList(11, "NewsTypeId=11  and IsCheck='1'", "CreateDate desc").Tables[0];
            if (dt.Rows.Count>0)
            {
                zcfg="";
                foreach (DataRow dr in dt.Rows)
                {
                    string biaoti = dr["NewsTitle"].ToString().Length > 24 ? dr["NewsTitle"].ToString().Substring(0, 24) + ".." : dr["NewsTitle"].ToString();
                    zcfg += "<li><a href=\"newsdetails.aspx?ntid=" + dr["NewsTypeId"] + "&id=" + dr["id"] + "\" target=\"_blank\" >" + biaoti + "</a><span>" + DateTime.Parse(dr["CreateDate"].ToString()).ToString("yyyy-MM-dd") + "</span></li>";
                }
            }
            #endregion
            #region //日常工作
            dt = new DataTable();
            jygz = "<li><a href=\"\" target=\"_blank\" ></a><span></span></li>";
            dt = newsbll.GetList(11, "NewsTypeId=12  and IsCheck='1'", "CreateDate desc").Tables[0];
            if (dt.Rows.Count > 0)
            {
                jygz = "";
                foreach (DataRow dr in dt.Rows)
                {
                    string biaoti = dr["NewsTitle"].ToString().Length > 24 ? dr["NewsTitle"].ToString().Substring(0, 24) + ".." : dr["NewsTitle"].ToString();
                    jygz += "<li><a href=\"newsdetails.aspx?ntid=" + dr["NewsTypeId"] + "&id=" + dr["id"] + "&t=" + dr["NewsTypeId"] + "\" target=\"_blank\" >" + biaoti + "</a><span>" + DateTime.Parse(dr["CreateDate"].ToString()).ToString("yyyy-MM-dd") + "</span></li>";
                }
            }
            #endregion
            #region 分支机构
            //fzjg1 = "<li id=\"jg2\" onmouseover=\"shitabs('jg','jgc','3','2','frist')\">南昌市1</li>";
            dt = new DataTable();
            NCPEP.Bll.T_Organization bllorg = new T_Organization();
            dt = bllorg.GetList("UpOrgCode='3601'").Tables[0];
            if (dt.Rows.Count>0)
            {
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    int nu = i + 2;
                    int nu2 = nu + 1;
                    fzjg1 += "<li id=\"jg" + nu + "\" onmouseover=\"shitabs('jg','jgc','" + nu2 + "','" + nu + "','frist')\">" + dt.Rows[i]["OrgShortName"] + "</li>";
                    DataTable dtzhen = new DataTable();
                    dtzhen = bllorg.GetList("UpOrgCode='" + dt.Rows[i]["OrgCode"] + "'").Tables[0];
                    fzjg2 += "<ul  id=\"jgc"+nu+"\"  style=\"display:none; \">";
                    if (dtzhen.Rows.Count>0)
                    {
                        for (int j = 0; j < dtzhen.Rows.Count; j++)
                        {
                            fzjg2 += "<li><a href=\"\">" + dtzhen.Rows[j]["OrgShortName"] + "</a></li>";
                        }
                    }
                    fzjg2 += "</ul>";
                }
            }
            #endregion

        }
    }
}
