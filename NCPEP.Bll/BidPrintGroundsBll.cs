using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using NCPEP.Dal;
using System.Web;
using NCPEP.Model;
using System.Data;

namespace NCPEP.Bll
{
    public class BidPrintGroundsBll
    {
        private BidPrintGroundsDal dal = null;
        private AdminUser adminUser = null;
        public BidPrintGroundsBll()
        {
            dal = new BidPrintGroundsDal();
        }
        public string ProcessRequest(HttpContext context)
        {
            try
            {
                adminUser = context.Session["SuperAdminUserSession"] as AdminUser;
                if (null == adminUser)
                {
                    if (!string.IsNullOrEmpty(context.Request.Cookies["AdminCookies"].Value))
                    {
                        adminUser = new GetUserCookiesPlug().GetUserCookies(context.Request.Cookies["AdminCookies"]["SuperAdminUserCookies"]);
                        context.Session["SuperAdminUserSession"] = adminUser;
                    }
                }
            }
            catch (Exception ex)
            {
                SystemErrorPlug.ErrorRecord("时间:[" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "]类名:[" + this.GetType().Name + "],行号:[" + Component.GetLineNum().ToString() + "行],错误信息:[" + ex.Message + "]");
                return null;
            }

            string action = context.Request.QueryString["action"].ToString();
            string returnDate = string.Empty;
            switch (action)
            {
                case "add":
                    returnDate = Create(context);
                    break;
                case "sqs":
                    returnDate = Sqs(context);
                    break;
                default:
                    returnDate = "请求错误!";
                    break;
            }
            return returnDate;
        }
        private string Sqs(HttpContext context)
        {
            try {
                SysLogBll.Create("产权交易鉴证书再次申请", "产权交易鉴证书再次申请", adminUser.AdminName);
                string binid = context.Request["pid"].ToString();
                DataTable dt = new DataTable();
                NCPEP.Bll.T_Dyzt blldyzt = new T_Dyzt();
                dt = blldyzt.GetList(" binid='" + binid + "'").Tables[0];
                if (dt.Rows.Count > 0)
                {
                    string strdyzt = dt.Rows[0]["dyzt"].ToString();
                    if (strdyzt!="1"&&strdyzt!="4")
                    {
                        return "2";
                    }
                    //打印申请
                    NCPEP.Bll.T_Dysq blldysq = new T_Dysq();
                    DataTable dtdysq = blldysq.GetList("fid='" + binid + "' order by id desc").Tables[0];
                    if (dtdysq.Rows.Count > 0)
                    {
                        int dysqcs = int.Parse(dtdysq.Rows[0]["dycs"].ToString());
                        int dyzcs = dysqcs * 3;
                        NCPEP.Bll.T_Dyjl blldyjl = new T_Dyjl();
                        DataTable dtdyjl = blldyjl.GetList("fid='" + binid + "'").Tables[0];
                        if (dtdyjl.Rows.Count >= dyzcs)
                        {
                            return "OK";
                        }
                        else
                        {
                            return "1";

                        }
                    }
                    else
                    {
                        return "1";
                    }
                }
                else
                {
                    return "1";
                }

                

            }
            catch (Exception ex)
            {
                SystemErrorPlug.ErrorRecord("时间:[" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "]类名:[" + this.GetType().Name + "],行号:[" + Component.GetLineNum().ToString() + "行],错误信息:[" + ex.Message + "]");
                return "添加失败请重新操作，错误代码：500 ";
            }
 
        }
        private string Create(HttpContext context)
        {
            try
            {
                SysLogBll.Create("产权交易鉴证书打印理由", "添加产权交易鉴证书打印理由操作", adminUser.AdminName);
                if (dal.Create(GetModels(context)))
                {
                    string binid = context.Request.QueryString["id"];
                    DataTable dt = new DataTable();
                    NCPEP.Bll.T_Dyzt blldyzt = new T_Dyzt();
                    dt = blldyzt.GetList(" binid='"+binid+"'").Tables[0];
                    if (dt.Rows.Count > 0)
                    {
                        try
                        {
                            string dyzt = dt.Rows[0]["dyzt"].ToString();
                            if (dyzt!="1"&&dyzt!="4")
                            {
                                return "2";
                            }
                        }
                        catch { }
                    }
                    else
                    {
                        NCPEP.Model.T_Dyzt modeldyzt = new Model.T_Dyzt();
                        modeldyzt.binid = binid;
                        modeldyzt.dyzt = "1";
                        blldyzt.Add(modeldyzt);
                    }
                    //打印申请
                    NCPEP.Bll.T_Dysq blldysq = new T_Dysq();
                    DataTable dtdysq = blldysq.GetList("fid='"+binid+"' order by id desc").Tables[0];
                    if (dtdysq.Rows.Count > 0)
                    {
                        int dysqcs =int.Parse( dtdysq.Rows[0]["dycs"].ToString());
                        int dyzcs = dysqcs * 3;
                        NCPEP.Bll.T_Dyjl blldyjl = new T_Dyjl();
                        DataTable dtdyjl = blldyjl.GetList("fid='"+binid+"'").Tables[0];
                        if (dtdyjl.Rows.Count >= dyzcs)
                        {
                            return "1";
                        }
                        else
                        {
                            NCPEP.Model.T_Dyjl modeldyjl = new Model.T_Dyjl();
                            modeldyjl.dyr = adminUser.AdminName;
                            modeldyjl.dysj = DateTime.Now.ToString();
                            modeldyjl.dysqid = "1";//暂时不用
                            modeldyjl.fid = binid;
                            blldyjl.Add(modeldyjl);
                            
                        }
                    }
                    else
                    {
                        NCPEP.Model.T_Dysq modeldysq = new Model.T_Dysq();
                        modeldysq.dycs = "1";
                        modeldysq.dysqnr = "第一次打印";
                        modeldysq.dysqsj = DateTime.Now.ToString("yyyy-MM-dd");
                        modeldysq.dyzt = "1";
                        modeldysq.fid = binid;
                        blldysq.Add(modeldysq);
                    }
                    return "OK";
                }
                else
                {
                    return "添加失败请重新操作! ";
                }
            }
            catch (Exception ex)
            {
                SystemErrorPlug.ErrorRecord("时间:[" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "]类名:[" + this.GetType().Name + "],行号:[" + Component.GetLineNum().ToString() + "行],错误信息:[" + ex.Message + "]");
                return "添加失败请重新操作，错误代码：500 ";
            }
        }
        //
        private dynamic GetModels(HttpContext context)
        {
            dynamic model = new BidPrintGrounds();
            model.FK_BidId = int.Parse(context.Request.Form["FK_BidId"].ToString());
            model.PrintNum = (dal.SumCount(model.FK_BidId) + 1);
            model.PrintName = adminUser.AdminName;
            model.Reason = context.Request.Form["Reason"].ToString();
            model.PrintDate = DateTime.Now;
            try { model.Id = int.Parse(context.Request.Form["Id"].ToString()); }
            catch { model.Id = 0; }
            return model;
        }
    }
}
