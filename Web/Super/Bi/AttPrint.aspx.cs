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
    public partial class AttPrint : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["id"] != null)
            {
                NCPEP.Bll.T_Bid bllbid = new NCPEP.Bll.T_Bid();
                NCPEP.Model.T_Bid modelbid = new NCPEP.Model.T_Bid();
                try
                {
                    modelbid = bllbid.GetModel(int.Parse(Request.QueryString["id"]));
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
                    try
                    {
                        //鉴证书号码
                        lbxmbh.Text ="HJNJ"+ modelbid.NoAssurance;
                    }
                    catch { }
                    try
                    {
                        this.lbzcf.Text = modeltr.Contact;
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
                                lbsrffddbr.Text = modeltr.Contact;
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
                            lbnian.Text = "2017";
                            lbyue.Text = "4";
                            lbri.Text = "18";
                        }
                        catch { }
                    }
                    


                }
            }
        }
    }
}