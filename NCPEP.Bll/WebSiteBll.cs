using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using NCPEP.Model;
using System.Data;
using NCPEP.Dal;
using System.Web.UI;
using Maticsoft.DBUtility;

namespace NCPEP.Bll
{
    public class WebSiteBll
    {
        private BidDal bidDal = null;
        private NewsDal newsDal = null;
        private dynamic newsTypeDal = null;
        private dynamic webIntentionDal = null;
        private dynamic webUserDal = null;
        private BidPlacardDal bidPlacardDal = null;
        private dynamic organizationDal = null;
        public WebSiteBll()
        {
            bidPlacardDal = new BidPlacardDal();
            newsDal = new NewsDal();
            newsTypeDal = new Dal.NewsTypeDal();
            webIntentionDal = new WebIntentionDal();
            webUserDal = new WebUserDal();
            bidDal = new BidDal();
            organizationDal = new OrganizationDal();
        }
        public string ProcessRequest(HttpContext context)
        {
            string action = context.Request.QueryString["action"].ToString();
            string returnDate = string.Empty;
            switch (action)
            {
                case "org":
                    returnDate = GetOrgList();
                    break;
                case "link":
                    returnDate = GetLinks();
                    break;
                case "File":
                    returnDate = GetNewsTopFile(context);
                    break;
                case "Filexian":
                    returnDate = GetNewsTopFilexian(context);
                    break;
                case "NewList":
                    returnDate = GetNewsList(context);
                    break;
                case "NewListxian":
                    returnDate = GetNewsList(context);
                    break;
                case "Top":
                    returnDate = GetNewsTop(context);
                    break;
                case "IntenList":
                    returnDate = GetIntenList(context);
                    break;
                case "CheckUser":
                    returnDate = GetCheckUserLogName(context);
                    break;
                case "Login":
                    returnDate = UserLogin(context);
                    break;
                case "send":
                    returnDate = Send(context);
                    break;
                case "add":
                    returnDate = Create(context);
                    break;
                case "IntenTop":
                    returnDate = GetIntenTop(context);
                    break;
                case "BidList":
                    returnDate = GetBidList(context);
                    break;
                case "BidListxian":
                    returnDate = GetBidListxian(context);
                    break;
                case "byId":
                    returnDate = GetById(context);
                    break;
                case "PlacardList":
                    returnDate = GetPlacardList(context);
                    break;
                case "SelAdmissNo":
                    returnDate = GetAdmissibility(context);
                    break;
                default:
                    returnDate = "请求错误!";
                    break;
            }
            return returnDate;
        }
        //
        private string GetAdmissibility(HttpContext context)
        {
            try
            {
                int Admissibility = 0;
                try { Admissibility = Convert.ToInt32(context.Request.QueryString["Admissibility"]); }
                catch { }
                Bid bid = bidDal.GetAdmissibilityModel(Admissibility);
                if (null == bid) { return "没有查询到相关的受理号！"; }
                string mess = string.Empty;
                switch (bid.DepaStatus)
                {
                    case 1:
                        mess = "正在前台受理中";
                        break;
                    case 2:
                        mess = "正在市场受理中";
                        break;
                    case 3:
                        mess = "正在产权交易中";
                        break;
                    case 4:
                        mess = "正在产权鉴证中";
                        break;
                    case 5:
                        mess = "正在分管领导审批中";
                        break;
                    case 6:
                        mess = "正在主管领导审批中";
                        break;
                    case 7:
                        mess = "交易完成，可以打印产权鉴证书";
                        break;
                    default:
                        mess = "没有查询到相关信息";
                        break;
                }
                return "标的名称：[" + bid.BidName + "]" + mess;
            }
            catch (Exception ex)
            {
                SystemErrorPlug.ErrorRecord("时间:[" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "]类名:[" + this.GetType().Name + "],行号:[" + Component.GetLineNum().ToString() + "行],错误信息:[" + ex.Message + "]");
                return "系统异常Error:505";
            }
        }
        //
        public string GetOrgList()
        {
            try
            {
                DataTable orgList = organizationDal.GetLower(Component.ReadXml("OrgCode").InnerText);
                return JsonHelper<Organization>.JsonDataTable(orgList, "T");
            }
            catch (Exception ex)
            {
                SystemErrorPlug.ErrorRecord("时间:[" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "]类名:[" + this.GetType().Name + "],行号:[" + Component.GetLineNum().ToString() + "行],错误信息:[" + ex.Message + "]");
                return null;
            }
        }
        //
        private string GetLinks()
        {
            try
            {
                return JsonHelper<Links>.JsonDataTable(new LinksDal().GetAllList(), "Link");
            }
            catch (Exception ex)
            {
                SystemErrorPlug.ErrorRecord("时间:[" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "]类名:[" + this.GetType().Name + "],行号:[" + Component.GetLineNum().ToString() + "行],错误信息:[" + ex.Message + "]");
                return null;
            }
        }
        //
        private dynamic GetPlacardList(HttpContext context)
        {
            try
            {
                string sqlWhere = string.Empty;
                int startIndex = 0;
                try { startIndex = int.Parse(context.Request.Form["page"]); }
                catch { }
                int pageSize = 20;
                try { pageSize = int.Parse(context.Request.Form["rows"].ToString()); }
                catch { }
                string order = " order by a.ReleaseTime desc ";
                string count = "\"page\":{\"pagecount\":\"" + bidPlacardDal.SumCount(sqlWhere) + "\"},";
                return JsonHelper<BidPlacard>.JsonDataTable(bidPlacardDal.GetAllList(sqlWhere, startIndex, pageSize, order)).Insert(1, count);
            }
            catch (Exception ex)
            {
                SystemErrorPlug.ErrorRecord("时间:[" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "]类名:[" + this.GetType().Name + "],行号:[" + Component.GetLineNum().ToString() + "行],错误信息:[" + ex.Message + "]");
                return null;
            }
        }
        //
        private dynamic GetById(HttpContext context)
        {
            try
            {
                int Id = 0;
                try { Id = int.Parse(context.Request.QueryString["Id"]); }
                catch { }
                //string sqlWhere = string.Format(" a.Id ={0} and a.DepaStatus=3", Id);
                string sqlWhere = string.Format(" a.Id ={0} ", Id);
                return JsonHelper<Bid>.JsonDataTable(bidDal.GetById(sqlWhere));
            }
            catch (Exception ex)
            {
                SystemErrorPlug.ErrorRecord("时间:[" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "]类名:[" + this.GetType().Name + "],行号:[" + Component.GetLineNum().ToString() + "行],错误信息:[" + ex.Message + "]");
                return null;
            }
        }
        //
        private dynamic GetBidList(HttpContext context)
        {
            try
            {
                string sqlWhere = " a.DepaStatus = 2";
                try
                {
                    if (context.Request.QueryString["zt"] != null)
                    {
                        sqlWhere = "a.DepaStatus =" + context.Request.QueryString["zt"] + "";
                    }
                }
                catch { }
                //wh and 201-10-08 添加类别查询
                string lb="0";
                try {
                    if (context.Request.QueryString["type"]!=null)
                    {
                        lb = context.Request.QueryString["type"];
                    }
                     }
                catch { }
                if (lb!="0")
                {
                    sqlWhere += " and a.Properties='"+lb+"'";
                }
                
                int startIndex = 0;
                try { startIndex = int.Parse(context.Request.QueryString["page"]) - 1; }
                catch { }
                int pageSize = 10;
                try { pageSize = int.Parse(context.Request.QueryString["rows"].ToString()); }
                catch { }
                string order = " order by a.Id asc";
                string count = "\"page\":{\"pagecount\":\"" + bidDal.SumCount(sqlWhere) + "\"},";
                return JsonHelper<Bid>.JsonDataTable(bidDal.GetAllList(sqlWhere, startIndex, pageSize, order)).Insert(1, count);
            }
            catch (Exception ex)
            {
                SystemErrorPlug.ErrorRecord("时间:[" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "]类名:[" + this.GetType().Name + "],行号:[" + Component.GetLineNum().ToString() + "行],错误信息:[" + ex.Message + "]");
                return null;
            }
        }
        //
        private dynamic GetBidListxian(HttpContext context)
        {
            try
            {
                string strcode = "0";
                try
                {
                    if (context.Request.QueryString["id"] != null)
                    {
                        strcode = context.Request.QueryString["id"];
                    }
                }
                catch { }
                string sqlWhere = " a.DepaStatus = 2 and a.orgcode='" + strcode + "'";
                //wh and 201-10-08 添加类别查询
                string lb = "0";
                try
                {
                    if (context.Request.QueryString["type"] != null)
                    {
                        lb = context.Request.QueryString["type"];
                    }
                }
                catch { }
                
                if (lb != "0")
                {
                    sqlWhere += " and a.Properties='" + lb + "' ";
                }
                int startIndex = 0;
                try { startIndex = int.Parse(context.Request.QueryString["page"]) - 1; }
                catch { }
                int pageSize = 10;
                try { pageSize = int.Parse(context.Request.QueryString["rows"].ToString()); }
                catch { }
                string order = " order by a.Id asc";
                string count = "\"page\":{\"pagecount\":\"" + bidDal.SumCount(sqlWhere) + "\"},";
                return JsonHelper<Bid>.JsonDataTable(bidDal.GetAllList(sqlWhere, startIndex, pageSize, order)).Insert(1, count);
            }
            catch (Exception ex)
            {
                SystemErrorPlug.ErrorRecord("时间:[" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "]类名:[" + this.GetType().Name + "],行号:[" + Component.GetLineNum().ToString() + "行],错误信息:[" + ex.Message + "]");
                return null;
            }
        }
        private dynamic GetIntenTop(HttpContext context)
        {
            try
            {
                string top = context.Request.QueryString["top"];
                string IntentionType = context.Request.QueryString["IntentionType"];
                string sqlWhere = string.Format(" CheckStatus=1 and IntentionType ={0} ", IntentionType);
                string order = " order by CheckDate desc ";
                return JsonHelper<WebIntention>.JsonDataTable(webIntentionDal.WebGetTopList(top, sqlWhere, order));
            }
            catch (Exception ex)
            {
                SystemErrorPlug.ErrorRecord("时间:[" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "]类名:[" + this.GetType().Name + "],行号:[" + Component.GetLineNum().ToString() + "行],错误信息:[" + ex.Message + "]");
                return null;
            }
        }
        //
        private dynamic Send(HttpContext context)
        {
            try
            {
                string tel = context.Request.QueryString["Tel"];
                Random rnd = new Random();
                int ValidateCode = rnd.Next(10000, 1000000);
                context.Session["TelCode"] = ValidateCode.ToString();
                HttpCookie cookies = new HttpCookie("TelCode");
                cookies.Values.Add("TelCodeCookies", ValidateCode.ToString());
                cookies.Expires = DateTime.Now.AddMinutes(1);
                context.Response.AppendCookie(cookies);
                string mess = "客户您好，验证码是" + ValidateCode.ToString() + "请妥善保管5分钟内有效，" + DateTime.Now.ToString() + "(本条信息免费)";
                return new ShortMessageSendingDal().SendOutWebChinese(tel, mess) + "|" + ValidateCode;
            }
            catch (Exception ex)
            {
                SystemErrorPlug.ErrorRecord("时间:[" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "]类名:[" + this.GetType().Name + "],行号:[" + Component.GetLineNum().ToString() + "行],错误信息:[" + ex.Message + "]");
                return null;
            }
        }
        //
        private dynamic GetCheckUserLogName(HttpContext context)
        {
            try
            {
                string LoginName = context.Request.QueryString["LoginName"] as string;
                if (webUserDal.CheckUserName(LoginName))
                    return "Yes";
                else
                    return "No";
            }
            catch (Exception ex)
            {
                SystemErrorPlug.ErrorRecord("时间:[" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "]类名:[" + this.GetType().Name + "],行号:[" + Component.GetLineNum().ToString() + "行],错误信息:[" + ex.Message + "]");
                return null;
            }
        }
        //
        private void AddCookie(HttpContext context, dynamic UserId)
        {
            try
            {
                HttpCookie cookies = new HttpCookie("UserCookies");
                cookies.Values.Add("UserSession", Key.Encryption(Key.Encryption(UserId)));
                cookies.Expires = DateTime.Now.AddDays(2);
                context.Response.AppendCookie(cookies);
            }
            catch { throw new Exception("添加Cookies失败,请检查您的浏览器设置是否屏蔽Cookies？<br>打开IE浏览器点击→工具→Interner选项→隐私→高级→勾选替代自动cookie处理→第一方cookie还有第三方cookie点击接受→保存"); }
        }
        //
        private dynamic UserLogin(HttpContext context)
        {
            try
            {
                string LoginName = context.Request.Form["LoginName"] as string;
                string LoginPass = context.Request.Form["LoginPass"] as string;
                string CheckImg = context.Request.Form["CheckImg"] as string;
                string CheckCode = context.Session["CheckCode"] as string;
                WebUserVeri user = webUserDal.UserLogin(LoginName, LoginPass);
                if (CheckImg.ToUpper().Equals(CheckCode.ToUpper()))
                {
                    if (webUserDal.CheckUserName(LoginName))
                    {

                        if (!string.IsNullOrEmpty(user.LoginPass))
                        {
                            if (user.Veri == 0)
                            {
                                if (0 != user.UserStatus)
                                {
                                    context.Session.Add("UserSession", user);
                                    webUserDal.NumberLogin(user.Id);
                                    SysLogBll.Create("注册用户登录", "登陆成功", user.UserName != "" ? user.UserName : user.VeriName);
                                    AddCookie(context, user.Id.ToString());
                                    return "Y";
                                }
                                else
                                {
                                    SysLogBll.Create("注册用户登录", "账户禁用", user.UserName != "" ? user.UserName : user.VeriName);
                                    return "账户已经被禁用！";
                                }
                            }
                            else
                            {
                                if (0 != user.VeriStatus)
                                {
                                    context.Session.Add("UserSession", user);
                                    webUserDal.NumberLogin(user.Id);
                                    SysLogBll.Create("注册用户登录", "登陆成功", user.UserName != "" ? user.UserName : user.VeriName);
                                    AddCookie(context, user.Id.ToString());
                                    return "Y";
                                }
                                else
                                {
                                    SysLogBll.Create("注册用户登录", "账户禁用", user.UserName != "" ? user.UserName : user.VeriName);
                                    return "账户已经被禁用！";
                                }

                            }
                        }
                        else
                        {
                            SysLogBll.Create("注册用户登录", "密码错误", user.UserName != "" ? user.UserName : user.VeriName);
                            return "密码不正确请重新输入密码！";
                        }
                    }
                    else
                    {
                        SysLogBll.Create("注册用户登录", "用户名错误", user.UserName != "" ? user.UserName : user.VeriName);
                        return "用户名不存在！";
                    }
                }
                else
                {
                    SysLogBll.Create("注册用户登录", "验证码错误", user.UserName != "" ? user.UserName : user.VeriName);
                    return "验证码错误请重新输入！";
                }
            }
            catch (Exception ex)
            {
                SystemErrorPlug.ErrorRecord("时间:[" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "]类名:[" + this.GetType().Name + "],行号:[" + Component.GetLineNum().ToString() + "行],错误信息:[" + ex.Message + "]");
                return "系统异常错误代码：500 " + ex.Message;
            }
        }
        //
        private dynamic GetIntenList(HttpContext context)
        {
            try
            {
                int IntentionType = 0;
                try { IntentionType = int.Parse(context.Request.Form["IntentionType"] as string); }
                catch { }
                int startIndex = 0;
                try { startIndex = int.Parse(context.Request.Form["page"]); }
                catch { }
                int pageSize = 20;
                try { pageSize = int.Parse(context.Request.Form["rows"].ToString()); }
                catch { }
                string sqlWhere = string.Format(" IntentionType={0} and  CheckStatus=1 ", IntentionType);
                string order = " order by CheckDate desc ";
                string count = "\"page\":{\"pagecount\":\"" + webIntentionDal.Count(sqlWhere) + "\"},";
                return JsonHelper<WebIntention>.JsonDataTable(webIntentionDal.GetAllList(sqlWhere, startIndex, pageSize, order)).Insert(1, count);
            }
            catch (Exception ex)
            {
                SystemErrorPlug.ErrorRecord("时间:[" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "]类名:[" + this.GetType().Name + "],行号:[" + Component.GetLineNum().ToString() + "行],错误信息:[" + ex.Message + "]");
                return null;
            }
        }
        //
        private dynamic GetNewsTopFile(HttpContext context)
        {
            try
            {
                string top = context.Request.QueryString["top"];
                string sqlWhere = " NewsTypeId =8 and IsCheck=1 and NewsFile is not null and NewsFile !='' ";
                string order = " order by CreateDate desc ";
                return JsonHelper<News>.JsonDataTable(newsDal.WebGetTopList(top, sqlWhere, order));
            }
            catch (Exception ex)
            {
                SystemErrorPlug.ErrorRecord("时间:[" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "]类名:[" + this.GetType().Name + "],行号:[" + Component.GetLineNum().ToString() + "行],错误信息:[" + ex.Message + "]");
                return null;
            }
        }
        private dynamic GetNewsTopFilexian(HttpContext context)
        {
            try
            {
                string top = context.Request.QueryString["top"];
                string strcode = "0";
                try
                {
                    strcode = Maticsoft.DBUtility.DESEncrypt.Decrypt(context.Request.QueryString["id"].ToString(), "wztou");
                    string sqlWhere = " NewsTypeId =8 and IsCheck=1 and NewsFile is not null and NewsFile !='' ";
                    string order = " order by CreateDate desc ";
                    return JsonHelper<News>.JsonDataTable(newsDal.WebGetTopList(top, sqlWhere, order));
                }
                catch { return ""; }
                //string sqlWhere = " NewsTypeId =8 and IsCheck=1 and NewsFile is not null and NewsFile !='' ";
                //string order = " order by CreateDate desc ";
                //return JsonHelper<News>.JsonDataTable(newsDal.WebGetTopList(top, sqlWhere, order));
            }
            catch (Exception ex)
            {
                SystemErrorPlug.ErrorRecord("时间:[" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "]类名:[" + this.GetType().Name + "],行号:[" + Component.GetLineNum().ToString() + "行],错误信息:[" + ex.Message + "]");
                return null;
            }
        }
        //
        private dynamic GetNewsTop(HttpContext context)
        {
            try
            {
                string top = context.Request.QueryString["top"];
                string typeId = context.Request.QueryString["TypeId"];
                string sqlWhere = string.Format(" IsCheck=1 and NewsTypeId ={0} ", typeId);
                string order = " order by CreateDate desc ";
                return JsonHelper<News>.JsonDataTable(newsDal.WebGetTopList(top, sqlWhere, order));
            }
            catch (Exception ex)
            {
                SystemErrorPlug.ErrorRecord("时间:[" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "]类名:[" + this.GetType().Name + "],行号:[" + Component.GetLineNum().ToString() + "行],错误信息:[" + ex.Message + "]");
                return null;
            }
        }
        //
        public dynamic GetImgList()
        {
            try
            {
                string sqlWhere = " NewsTypeId=1 and IsCheck=1 and NewsImg is not null and NewsImg !='' ";
                string order = " order by CreateDate desc ";
                return newsDal.WebGetAllList(sqlWhere, order);
            }
            catch (Exception ex)
            {
                SystemErrorPlug.ErrorRecord("时间:[" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "]类名:[" + this.GetType().Name + "],行号:[" + Component.GetLineNum().ToString() + "行],错误信息:[" + ex.Message + "]");
                return null;
            }
        }
        //
        public dynamic GetNewsTypeName(int id)
        {
            try
            {
                return newsTypeDal.GetModel(id).NewsTypeName;
            }
            catch (Exception ex)
            {
                SystemErrorPlug.ErrorRecord("时间:[" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "]类名:[" + this.GetType().Name + "],行号:[" + Component.GetLineNum().ToString() + "行],错误信息:[" + ex.Message + "]");
                return null;
            }
        }
        //
        public dynamic GetNewsModel(int id, string newsTypeId)
        {
            try
            {
                newsDal.UpdateNumClicks(id);
                string sqlWhere = string.Format(" Id={0} and IsCheck=1 and NewsTypeId={1}", id, newsTypeId);
                return newsDal.GetModel(sqlWhere);
            }
            catch (Exception ex)
            {
                SystemErrorPlug.ErrorRecord("时间:[" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "]类名:[" + this.GetType().Name + "],行号:[" + Component.GetLineNum().ToString() + "行],错误信息:[" + ex.Message + "]");
                return null;
            }
        }
        //
        public dynamic GetNewsModel(int id)
        {
            try
            {
                newsDal.UpdateNumClicks(id);
                string sqlWhere = string.Format(" Id={0} and IsCheck=1 ", id);
                return newsDal.GetModel(sqlWhere);
            }
            catch (Exception ex)
            {
                SystemErrorPlug.ErrorRecord("时间:[" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "]类名:[" + this.GetType().Name + "],行号:[" + Component.GetLineNum().ToString() + "行],错误信息:[" + ex.Message + "]");
                return null;
            }
        }
        //
        public dynamic GetUserVeriModel(int id)
        {
            try
            {
                return webUserDal.GetModel(id);
            }
            catch (Exception ex)
            {
                SystemErrorPlug.ErrorRecord("时间:[" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "]类名:[" + this.GetType().Name + "],行号:[" + Component.GetLineNum().ToString() + "行],错误信息:[" + ex.Message + "]");
                return null;
            }
        }
        //
        public dynamic GetIntenModel(int id, string newsTypeId)
        {
            try
            {
                webIntentionDal.UpdateNumClicks(id);
                string sqlWhere = string.Format(" Id={0} and CheckStatus=1 and IntentionType={1}", id, newsTypeId);
                return webIntentionDal.GetModel(sqlWhere);
            }
            catch (Exception ex)
            {
                SystemErrorPlug.ErrorRecord("时间:[" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "]类名:[" + this.GetType().Name + "],行号:[" + Component.GetLineNum().ToString() + "行],错误信息:[" + ex.Message + "]");
                return null;
            }
        }
        //
        private dynamic GetNewsList(HttpContext context)
        {
            try
            {
                int NewsTypeId = 0;
                try { NewsTypeId = int.Parse(context.Request.Form["NewsTypeId"] as string); }
                catch { }
                int startIndex = 0;
                try { startIndex = int.Parse(context.Request.Form["page"]); }
                catch { }
                int pageSize = 20;
                try { pageSize = int.Parse(context.Request.Form["rows"].ToString()); }
                catch { }
                string sqlWhere = string.Format(" NewsTypeId={0} and  IsCheck=1 ", NewsTypeId);
                string order = " order by CreateDate desc ";
                string count = "\"page\":{\"pagecount\":\"" + newsDal.WebSumCount(sqlWhere) + "\",\"type\":\"" + newsTypeDal.GetModel(NewsTypeId).NewsTypeName + "\"},";
                return JsonHelper<News>.JsonDataTable(newsDal.WebGetAllList(sqlWhere, startIndex, pageSize, order)).Insert(1, count);
            }
            catch (Exception ex)
            {
                SystemErrorPlug.ErrorRecord("时间:[" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "]类名:[" + this.GetType().Name + "],行号:[" + Component.GetLineNum().ToString() + "行],错误信息:[" + ex.Message + "]");
                return null;
            }
        }
        //
        private dynamic GetNewsListxian(HttpContext context)
        {
            try
            {
                int NewsTypeId = 0;
                try { NewsTypeId = int.Parse(context.Request.Form["NewsTypeId"] as string); }
                catch { }
                int startIndex = 0;
                try { startIndex = int.Parse(context.Request.Form["page"]); }
                catch { }
                int pageSize = 20;
                try { pageSize = int.Parse(context.Request.Form["rows"].ToString()); }
                catch { }
                string sqlWhere = string.Format(" NewsTypeId={0} and  IsCheck=1 ", NewsTypeId);
                string order = " order by CreateDate desc ";
                string count = "\"page\":{\"pagecount\":\"" + newsDal.WebSumCount(sqlWhere) + "\",\"type\":\"" + newsTypeDal.GetModel(NewsTypeId).NewsTypeName + "\"},";
                return JsonHelper<News>.JsonDataTable(newsDal.WebGetAllList(sqlWhere, startIndex, pageSize, order)).Insert(1, count);
            }
            catch (Exception ex)
            {
                SystemErrorPlug.ErrorRecord("时间:[" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "]类名:[" + this.GetType().Name + "],行号:[" + Component.GetLineNum().ToString() + "行],错误信息:[" + ex.Message + "]");
                return null;
            }
        }
        private dynamic GetModel(HttpContext context)
        {
            dynamic model = new WebUserVeri();
            model.Id = 0;
            model.LoginName = context.Request.Form["LoginName"].ToString();
            model.LoginPass = context.Request.Form["LoginPass"].ToString();
            model.UserName = context.Request.Form["UserName"].ToString();
            model.UserTel = context.Request.Form["UserTel"].ToString();
            model.UserEmail = context.Request.Form["UserEmail"].ToString();
            model.UserStatus = 0;//默认账号禁用的
            //model.UserStatus = 1;//账号启用的
            model.LoginDate = DateTime.Now;
            model.LoginnNum = 0;
            model.OutDate = DateTime.Now;
            model.Veri = 0;
            return model;
        }
        //
        private dynamic Create(HttpContext context)
        {
            try
            {
                dynamic CheckCode = context.Request.Cookies["TelCode"]["TelCodeCookies"];
                dynamic CheckCode1 = context.Session["TelCode"];
                string CheckTelCode = context.Request.Form["CheckTelCode"].ToString();
                if (CheckTelCode.ToUpper().Equals(CheckCode.ToUpper()))
                {
                    if (webUserDal.Create(GetModel(context)))
                    {
                        return "注册成功";
                    }
                    else
                    {
                        return "注册失败，请重新操作！";
                    }
                }
                else
                {
                    return "验证码错误请重新输入！";
                }
            }
            catch (Exception ex)
            {
                SystemErrorPlug.ErrorRecord("时间:[" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "]类名:[" + this.GetType().Name + "],行号:[" + Component.GetLineNum().ToString() + "行],错误信息:[" + ex.Message + "]");
                return "添加失败，错误代码：500 ";
            }
        }
        //
        public dynamic GetPlacardModel(int Id)
        {
            return bidPlacardDal.GetModels(Id);
        }
        //
        public dynamic GetBidModel(int Id)
        {
            return bidDal.GetModel(Id);
        }
    }
}
