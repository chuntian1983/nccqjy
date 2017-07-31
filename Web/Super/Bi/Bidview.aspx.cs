using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using NCPEP.Bll;
using NCPEP.Model;
using Maticsoft.DBUtility;

namespace Web.Super.Bi
{
    public partial class Bidview : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //dynamic adminUser = null;
            //try
            //{
            //    adminUser = Session["SuperAdminUserSession"] as AdminUser;
            //    if (null == adminUser)
            //    {
            //        if (!string.IsNullOrEmpty(Request.Cookies["AdminCookies"].Value))
            //        {
            //            adminUser = new GetUserCookiesPlug().GetUserCookies(Request.Cookies["AdminCookies"]["SuperAdminUserSession"]);
            //            Session["SuperAdminUserSession"] = adminUser;

            //        }
            //    }
            //}
            //catch
            //{
            //    adminUser = null;
            //}
            //if (null == adminUser)
            //{
            //    ClientScript.RegisterClientScriptBlock(this.GetType(), "reload", " <script>parent.location.reload();</script>");
            //}
            if (Request.QueryString["p"] != null)
            {
                #region 鉴证书预览
                Jzs();
                #endregion
                NCPEP.Bll.T_Bid bllbid = new NCPEP.Bll.T_Bid();
                NCPEP.Model.T_Bid modelbid = new NCPEP.Model.T_Bid();
                modelbid = bllbid.GetModel(int.Parse(Request.QueryString["p"]));
                if (modelbid != null)
                {
                    NCPEP.Bll.T_Organization bllorg = new NCPEP.Bll.T_Organization();
                    NCPEP.Model.T_Organization modelorg = new NCPEP.Model.T_Organization();
                    modelorg = bllorg.GetModel(modelbid.OrgCode);
                    if (modelorg!=null)
                    {
                        //组织单位
                        this.lbzzdw.Text = modelorg.OrgName;
                    }
                    //产权名称
                    lbcqmc.Text = modelbid.BidName;
                    //产权类型
                    lbchanquanleixing.Text = modelbid.Properties;
                    NCPEP.Bll.T_PropertyType bllpro = new NCPEP.Bll.T_PropertyType();
                    NCPEP.Model.T_PropertyType modelpro = new NCPEP.Model.T_PropertyType();
                    modelpro = bllpro.GetModel(int.Parse(modelbid.Properties));
                    if (modelpro!=null)
                    {
                        lbchanquanleixing.Text = modelpro.PropertyTypeName;
                    }
                    //产权权属
                    lbchanquanquanshu.Text = modelbid.Ownership;
                    //标的规模
                    lbbiaodeguimo.Text = modelbid.guimo;
                    //出让方
                    lbchurangfang.Text = modelbid.FK_LiceTranId.ToString();

                    NCPEP.Bll.T_LiceTran blltr = new NCPEP.Bll.T_LiceTran();
                    NCPEP.Model.T_LiceTran modeltr = new NCPEP.Model.T_LiceTran();
                    NCPEP.Bll.T_MemberTypeCertification bllm = new NCPEP.Bll.T_MemberTypeCertification();
                    NCPEP.Model.T_MemberTypeCertification modelm = new NCPEP.Model.T_MemberTypeCertification();
                    modeltr = blltr.GetModel(modelbid.FK_LiceTranId);
                    if (modeltr!=null)
                    {
                        lbchurangfang.Text = modeltr.Name;
                        //出让方性质
                        lbchurangfangxingzhi.Text = modeltr.MemberTypeId.ToString();
                        
                        modelm = bllm.GetModel(modeltr.MemberTypeId);
                        lbchurangfangxingzhi.Text = modelm.TypeCertificationName;
                        #region 出让方信息
                        modelorg = new NCPEP.Model.T_Organization();
                        modelorg = bllorg.GetModel(modeltr.OrgCode);
                        lbzzdw_crf.Text = modelorg.OrgName;
                        lbjjlx_crf.Text = bllm.GetModel(modeltr.MemberTypeId).TypeCertificationName;
                        lbxm_crf.Text = modeltr.Name;
                        lbzz_crf.Text = modeltr.Addr;
                        lblxr_crf.Text = modeltr.Contact;
                        lbfrdb_crf.Text = modeltr.Corporate;
                        lbsfz_crf.Text = modeltr.IDCard;
                        lblxdh_crf.Text = modeltr.Tel;
                        lbsyqr_crf.Text = modeltr.Owner;
                        lbzzjg_crf.Text = modeltr.OrganizationCode;
                        lbzczb_crf.Text = modeltr.Capital;
                        #endregion
                    }
                    //受让方
                    lbshourangfang.Text = "";
                    NCPEP.Bll.T_BidTrans blltrans = new NCPEP.Bll.T_BidTrans();
                    DataTable dt = blltrans.GetList("FK_BidId='" + modelbid.Id + "'").Tables[0];
                    if (dt.Rows.Count > 0)
                    {
                        modeltr = new NCPEP.Model.T_LiceTran();
                        try
                        {
                            modeltr = blltr.GetModel(int.Parse(dt.Rows[0]["FK_LiceTranId"].ToString()));
                        }
                        catch { }
                        if (modeltr != null)
                        {
                            try
                            {
                                //受让方
                                lbshourangfang.Text = modeltr.Name;
                            }
                            catch { }
                            try
                            {
                                //受让性质
                                lbshourangfangxingzhi.Text = modeltr.Owner;
                            }
                            catch { }
                            #region 受让方详细信息
                            modelorg = new NCPEP.Model.T_Organization();
                            modelorg = bllorg.GetModel(modeltr.OrgCode);
                            lbzzdw_srf.Text = modelorg.OrgName;
                            lbjjlx_srf.Text = bllm.GetModel(modeltr.MemberTypeId).TypeCertificationName;
                            lbxm_srf.Text = modeltr.Name;
                            lbzz_srf.Text = modeltr.Addr;
                            lblxr_srf.Text = modeltr.Contact;
                            lbfrdb_srf.Text = modeltr.Corporate;
                            lbsfz_srf.Text = modeltr.IDCard;
                            lblxdh_srf.Text = modeltr.Tel;
                            lbsyqr_srf.Text = modeltr.Owner;
                            lbzzjg_srf.Text = modeltr.OrganizationCode;
                            lbzczb_srf.Text = modeltr.Capital;
                            #endregion 

                        }

                    }
                    //交易方式
                    lbjiaoyifangshi.Text = "";
                    DataTable dts = new DataTable();
                    try
                    {
                        dts = DbHelperSQL.Query("select * from T_StandardMode where id='" + modelbid.StandardMode + "'").Tables[0];
                        if (dts.Rows.Count > 0)
                        {
                            lbjiaoyifangshi.Text = dts.Rows[0]["StandardModeName"].ToString();
                        }
                    }
                    catch { lbjiaoyifangshi.Text = ""; }
                    NCPEP.Bll.T_Jzs blljzs = new NCPEP.Bll.T_Jzs();
                    DataTable dtjzs = blljzs.GetList("binid='"+modelbid.Id+"'").Tables[0];
                    if (dtjzs.Rows.Count>0)
                    {
                        
                        //合同起始日期
                        lbqishiriqi.Text= "自" + DateTime.Parse(dtjzs.Rows[0]["zcdate"].ToString()).ToString("yyyy年MM月dd日") + "起至" + DateTime.Parse(dtjzs.Rows[0]["zcdatez"].ToString()).ToString("yyyy年MM月dd日") + "止";
                        try
                        {
                            lbchengjiaodanjia.Text = dtjzs.Rows[0]["beiyong2"].ToString();
                        }
                        catch { }
                        try
                        {
                            //成交总价
                            lbchengjiaozongjia.Text = dtjzs.Rows[0]["cjje"].ToString();
                        }
                        catch { }
                        try
                        {
                            //支付方式
                            lbzhifufangshi.Text = dtjzs.Rows[0]["beiyong"].ToString();
                        }
                        catch { }
                        try
                        {
                            //备注
                            lbbeizhu2.Text = dtjzs.Rows[0]["beizhu"].ToString();
                        }
                        catch { }
                    }
                   
                }
            }
        }
        protected void Jzs()
        {
            if (Request.QueryString["p"] != null)
            {
                NCPEP.Bll.T_Bid bllbid = new NCPEP.Bll.T_Bid();
                NCPEP.Model.T_Bid modelbid = new NCPEP.Model.T_Bid();
                try
                {
                    modelbid = bllbid.GetModel(int.Parse(Request.QueryString["p"]));
                }
                catch { }
                if (modelbid != null)
                {

                    NCPEP.Bll.T_LiceTran blltr = new NCPEP.Bll.T_LiceTran();
                    NCPEP.Model.T_LiceTran modeltr = new NCPEP.Model.T_LiceTran();
                    try
                    {
                        modeltr = blltr.GetModel(modelbid.FK_LiceTranId);
                    }
                    catch { }
                    try
                    {
                        //  lbnjz.Text = System.DateTime.Now.Year.ToString();
                    }
                    catch { }
                    try
                    {
                        lbjycp.Text = modelbid.BidName;
                    }
                    catch { }
                    //try
                    //{
                    //    lbxmbh.Text = "HJNJ" + modelbid.Admissibility;
                    //}
                    //catch { }
                    try
                    {
                        //鉴证书号码
                        lbxmbh.Text = "HJNJ" + modelbid.NoAssurance;
                    }
                    catch { }
                    try
                    {
                        this.lbzcf.Text = modeltr.Owner;
                    }
                    catch { }
                    try
                    {
                        this.lbsyqr.Text = modeltr.Name;
                    }
                    catch { }
                    NCPEP.Bll.T_MemberTypeCertification bllmem = new NCPEP.Bll.T_MemberTypeCertification();
                    NCPEP.Model.T_MemberTypeCertification modelmem = new NCPEP.Model.T_MemberTypeCertification();
                    try
                    {
                        modelmem = bllmem.GetModel(modeltr.MemberTypeId);
                    }
                    catch { }
                    if (modelmem != null)
                    {
                        this.lbzcxwpzjg.Text = modelmem.TypeCertificationName;
                    }
                    // this.lbzcxwpzjg.Text = modeltr.MemberTypeId;
                    try
                    {
                        //转出方资本
                        this.lbzcfdb.Text = modeltr.Capital;
                    }
                    catch { }
                    try
                    {
                        this.lbzcfsfz.Text = modeltr.IDCard;
                    }
                    catch { }
                    try
                    {
                        this.lbcqlx.Text = modelbid.Properties;
                    }
                    catch { }
                    NCPEP.Bll.T_PropertyType bllpro = new NCPEP.Bll.T_PropertyType();
                    NCPEP.Model.T_PropertyType modelpro = new NCPEP.Model.T_PropertyType();
                    try
                    {
                        modelpro = bllpro.GetModel(int.Parse(lbcqlx.Text));
                        if (modelpro != null)
                        {
                            this.lbcqlx.Text = modelpro.PropertyTypeName;
                        }
                    }
                    catch { }

                    NCPEP.Bll.T_BidTrans blltrans = new NCPEP.Bll.T_BidTrans();
                    DataTable dt = blltrans.GetList("FK_BidId='" + modelbid.Id + "'").Tables[0];
                    if (dt.Rows.Count > 0)
                    {
                        modeltr = new NCPEP.Model.T_LiceTran();
                        try
                        {
                            modeltr = blltr.GetModel(int.Parse(dt.Rows[0]["FK_LiceTranId"].ToString()));
                        }
                        catch { }
                        if (modeltr != null)
                        {
                            try
                            {
                                lbsrf.Text = modeltr.Name;
                            }
                            catch { }
                            try
                            {
                                lbsrffddbr.Text = modeltr.Owner;
                            }
                            catch { }
                            try
                            {
                                modelmem = new NCPEP.Model.T_MemberTypeCertification();
                            }
                            catch { }
                            try
                            {
                                modelmem = bllmem.GetModel(modeltr.MemberTypeId);
                            }
                            catch { }
                            if (modelmem != null)
                            {
                                lbgsxz.Text = modelmem.TypeCertificationName;
                            }
                            try
                            {
                                lbzczb.Text = modeltr.Capital;
                            }
                            catch { }
                            try
                            {
                                lbsrfsfz.Text = modeltr.IDCard;
                            }
                            catch { }
                        }

                    }
                    try
                    {
                        lbbdjbqk.Text = modelbid.BidBasic;
                        //lbzcqx.Text = "自" + DateTime.Parse(modelbid.StartDate.ToString()).ToString("yyyy年MM月dd日") + "起  至" + DateTime.Parse(modelbid.EndDate.ToString()).ToString("yyyy年MM月dd日") + "止";
                    }
                    catch { }
                    try
                    {
                        //批准机构
                        lbqqjg.Text = modelbid.FeedingMechanism;
                    }
                    catch { }
                    try
                    {
                        lbguimo.Text = modelbid.guimo + modelbid.danwei;
                    }
                    catch { }

                    NCPEP.Bll.T_TurnOutType bllout = new NCPEP.Bll.T_TurnOutType();
                    NCPEP.Model.T_TurnOutType modelout = new NCPEP.Model.T_TurnOutType();
                    try
                    {
                        modelout = bllout.GetModel(int.Parse(modelbid.TurnOut.ToString()));
                    }
                    catch { }
                    if (modelout != null)
                    {
                        try
                        {
                            lbzcfs.Text = modelout.TurnOutTypeName;
                        }
                        catch { }
                    }
                    else
                    {
                        try
                        {
                            lbzcfs.Text = modelbid.TurnOut.ToString();//转出方式
                        }
                        catch { }
                    }
                    //交易单价
                    try
                    {
                        lbjydj.Text = modelbid.ListingPrice;
                    }
                    catch { }
                    DataTable dts = new DataTable();
                    try
                    {
                        dts = DbHelperSQL.Query("select * from T_StandardMode where id='" + modelbid.StandardMode + "'").Tables[0];
                        if (dts.Rows.Count > 0)
                        {
                            lbjyfs.Text = dts.Rows[0]["StandardModeName"].ToString();
                        }
                    }
                    catch { lbjyfs.Text = ""; }

                    DataTable dtjzs = new DataTable();
                    NCPEP.Bll.T_Jzs blljzs = new NCPEP.Bll.T_Jzs();
                    dtjzs = blljzs.GetList("binid='" + modelbid.Id + "'").Tables[0];
                    if (dtjzs.Rows.Count > 0)
                    {
                        lbcjje.Text = dtjzs.Rows[0]["cjje"].ToString();
                        lbhtbh.Text = dtjzs.Rows[0]["htbh"].ToString();
                        lbbeizhu.Text = dtjzs.Rows[0]["beizhu"].ToString();
                        try
                        {
                            //转出期限
                            lbzcqx.Text = "自" + DateTime.Parse(dtjzs.Rows[0]["zcdate"].ToString()).ToString("yyyy年MM月dd日") + "起至" + DateTime.Parse(dtjzs.Rows[0]["zcdatez"].ToString()).ToString("yyyy年MM月dd日") + "止";
                        }
                        catch { }
                        try
                        {
                            //支付方式
                            lbhtqsrq.Text = dtjzs.Rows[0]["beiyong"].ToString();
                        }
                        catch { }
                        //交易单价
                        try
                        {
                            lbjydj.Text = dtjzs.Rows[0]["beiyong2"].ToString();
                        }
                        catch { }
                        try
                        {
                            //转出开始时间+3天变成打印时间
                            DateTime dysj = DateTime.Parse(dtjzs.Rows[0]["zcdate"].ToString());
                            if (dysj.Day != System.DateTime.Now.Day && dysj.Month != System.DateTime.Now.Month && dysj.Month != System.DateTime.Now.Year)
                            {


                                lbnian.Text = dysj.AddDays(3).Year.ToString();
                                lbyue.Text = dysj.AddDays(3).Month.ToString();
                                lbri.Text = dysj.AddDays(3).Day.ToString();
                            }
                            else
                            {
                                lbnian.Text = System.DateTime.Now.Year.ToString();
                                lbyue.Text = System.DateTime.Now.Month.ToString();
                                lbri.Text = System.DateTime.Now.Day.ToString();
                            }
                        }
                        catch { }
                    }



                }
            }
        }
    }
}