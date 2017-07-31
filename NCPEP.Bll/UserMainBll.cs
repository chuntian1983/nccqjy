using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using NCPEP.Dal;
using NCPEP.Model;
using System.Data;

namespace NCPEP.Bll
{
    public class UserMainBll
    {
        private dynamic user = null;
        private dynamic userDal = null;
        private dynamic orgDal = null;
        private dynamic veriUserDal = null;
        private string UserName = string.Empty;
        public UserMainBll()
        {
            orgDal = new OrganizationDal();
            userDal = new WebUserDal();
            veriUserDal = new WebUserVeriDal();
        }
        //
        public string ProcessRequest(HttpContext context)
        {
            try
            {
                user = context.Session["UserSession"] as WebUserVeri;
                if (null == user)
                {
                    if (!string.IsNullOrEmpty(context.Request.Cookies["UserCookies"].Value))
                    {
                        user = new GetUserCookiesPlug().GetVeriUserCookies(context.Request.Cookies["UserCookies"]["UserSession"]);
                        context.Session["UserSession"] = user;
                    }
                }
                UserName = !string.IsNullOrEmpty(user.UserName) ? user.UserName : user.VeriName;
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
                case "UsById":
                    returnDate = JsonHelper<WebUserVeri>.JsonWriter(GetUsersById());
                    break;
                case "membertypecombo":
                    returnDate = GetMemberTypeComboData();
                    break;
                case "userup":
                    returnDate = UserUpdate(context);
                    break;
                case "orgtree":
                    returnDate = GetOrgTree();
                    break;
                case "veriuserbyid":
                    returnDate = GetVeriUserById();
                    break;
                case "out":
                    returnDate = LoginOut(context);
                    break;
                case "veriuserup":
                    returnDate = VeriUserUpdate(context);
                    break;
                default:
                    returnDate = "请求错误!";
                    break;
            }
            return returnDate;
        }
        //
        private dynamic GetVeriUserModel(HttpContext context)
        {
            dynamic model = new WebUserVeri();
            try
            {
                try { model.Id = int.Parse(context.Request.Form["Id"].ToString()); }
                catch { }
                model.LoginName = context.Request.Form["LoginName"].ToString();
                model.LoginPass = context.Request.Form["LoginPass"].ToString();
                model.UserName = context.Request.Form["UserName"].ToString();
                model.UserTel = context.Request.Form["UserTel"].ToString();
                model.UserEmail = context.Request.Form["UserEmail"].ToString();
                try { model.UserStatus = int.Parse(context.Request.Form["UserStatus"].ToString()); }
                catch { }
                try { model.LoginDate = DateTime.Parse(context.Request.Form["LoginDate"].ToString()); }
                catch { }
                try { model.LoginnNum = int.Parse(context.Request.Form["LoginnNum"].ToString()); }
                catch { }
                try { model.OutDate = DateTime.Parse(context.Request.Form["OutDate"].ToString()); }
                catch { }
                try { model.Veri = int.Parse(context.Request.Form["Veri"].ToString()); }
                catch { }
                try { model.MemberTypeId = int.Parse(context.Request.Form["MemberTypeId"].ToString()); }
                catch { }
                model.VeriName = context.Request.Form["VeriName"].ToString();
                model.VeriSex = context.Request.Form["VeriSex"].ToString();
                model.VeriIDCard = context.Request.Form["VeriIDCard"].ToString();
                if (!string.IsNullOrEmpty(context.Request.Form["VeriIDCard"].ToString()))
                {

                    string ImgName = new UpLoadImgPlug().UploadImg("~/Super/Scan/us/" + model.LoginName + "/", 0);
                    if (!string.IsNullOrEmpty(ImgName))
                    {
                        string imgUrl = HttpContext.Current.Server.MapPath("~/Super/Scan/us/" + model.LoginName + "/" + ImgName);
                        string pdfUrl = "~/Super/Scan/us/" + model.LoginName + "/";
                        new ProducePdfPlug().CreatePdf(imgUrl, pdfUrl, ImgName.Split('.')[0] + ".pdf");
                        model.VeriIDCardScan = ImgName.Split('.')[0] + ".pdf";
                    }
                    else
                    {
                        model.VeriIDCardScan = context.Request.Form["tVeriIDCardScan"].ToString();
                    }
                }
                model.OrgCode = context.Request.Form["OrgCode"].ToString();
                model.VeriAddress = context.Request.Form["VeriAddress"].ToString();
                model.VeriTel = context.Request.Form["VeriTel"].ToString();
                model.VeriCorporate = context.Request.Form["VeriCorporate"].ToString();
                model.VeriCorporateIDCard = context.Request.Form["VeriCorporateIDCard"].ToString();
                if (!string.IsNullOrEmpty(context.Request.Form["VeriCorporateIDCard"].ToString()))
                {

                    string ImgName = new UpLoadImgPlug().UploadImg("~/Super/Scan/us/" + model.LoginName + "/", 0);
                    if (!string.IsNullOrEmpty(ImgName))
                    {
                        string imgUrl = HttpContext.Current.Server.MapPath("~/Super/Scan/us/" + model.LoginName + "/" + ImgName);
                        string pdfUrl = "~/Super/Scan/us/" + model.LoginName + "/";
                        new ProducePdfPlug().CreatePdf(imgUrl, pdfUrl, ImgName.Split('.')[0] + ".pdf");
                        model.VeriCorporateIDCardScan = ImgName.Split('.')[0] + ".pdf";
                    }
                    else
                    {
                        model.VeriCorporateIDCardScan = context.Request.Form["tVeriCorporateIDCardScan"].ToString();
                    }
                }
                model.VeriCreditCode = context.Request.Form["VeriCreditCode"].ToString();
                if (!string.IsNullOrEmpty(context.Request.Form["VeriCreditCode"].ToString()))
                {

                    string ImgName = new UpLoadImgPlug().UploadImg("~/Super/Scan/us/" + model.LoginName + "/", 0);
                    if (!string.IsNullOrEmpty(ImgName))
                    {
                        string imgUrl = HttpContext.Current.Server.MapPath("~/Super/Scan/us/" + model.LoginName + "/" + ImgName);
                        string pdfUrl = "~/Super/Scan/us/" + model.LoginName + "/";
                        new ProducePdfPlug().CreatePdf(imgUrl, pdfUrl, ImgName.Split('.')[0] + ".pdf");
                        model.VeriCreditCodeScan = ImgName.Split('.')[0] + ".pdf";
                    }
                    else
                    {
                        model.VeriCreditCodeScan = context.Request.Form["tVeriCreditCodeScan"].ToString();
                    }
                }
                try { model.VeriStatus = int.Parse(context.Request.Form["VeriStatus"].ToString()); }
                catch { }
                try { model.AuditType = int.Parse(context.Request.Form["AuditType"].ToString()); }
                catch { }
                model.VeriCheckName = context.Request.Form["VeriCheckName"].ToString();
                try { model.VeriApplyDate = DateTime.Parse(context.Request.Form["VeriApplyDate"].ToString()); }
                catch { }
                try { model.VeriCheckDate = DateTime.Parse(context.Request.Form["VeriCheckDate"].ToString()); }
                catch { }
                return model;
            }
            catch (Exception ex)
            {
                SystemErrorPlug.ErrorRecord("时间:[" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "]类名:[" + this.GetType().Name + "],行号:[" + Component.GetLineNum().ToString() + "行],错误信息:[" + ex.Message + "]");
                return model;
            }
        }
        //
        private dynamic VeriUserUpdate(HttpContext context)
        {
            try
            {
                SysLogBll.Create("认证会员", "更新认证会员操作", UserName);
                if (veriUserDal.Update(GetVeriUserModel(context)))
                {
                    return "更新成功！";
                }
                else
                {
                    return "更新失败，请重新操作！";
                }
            }
            catch (Exception ex)
            {
                SystemErrorPlug.ErrorRecord("时间:[" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "]类名:[" + this.GetType().Name + "],行号:[" + Component.GetLineNum().ToString() + "行],错误信息:[" + ex.Message + "]");
                return "更新失败,错误代码：500 ";
            }
        }
        //
        private dynamic GetVeriUserById()
        {
            try
            {
                SysLogBll.Create("认证会员", "返回单个认证会员信息操作", UserName);
                int id = 0;
                try { id = user.Id; }
                catch { }
                return JsonHelper<WebUserVeri>.JsonWriter(veriUserDal.GetModel(id));
            }
            catch (Exception ex)
            {
                SystemErrorPlug.ErrorRecord("时间:[" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "]类名:[" + this.GetType().Name + "],行号:[" + Component.GetLineNum().ToString() + "行],错误信息:[" + ex.Message + "]");
                return null;
            }
        }
        //
        private dynamic GetOrgTree()
        {
            try
            {
                SysLogBll.Create("组织单位", "获取组织单位树形数据2", UserName);
                string OrgCode = orgDal.GetHighestOrgCode();
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.Append("[");
                Organization modelData = new OrganizationDal().GetModel(OrgCode);
                stringBuilder.Append("{\"id\":\"" + modelData.OrgCode + "\", \"text\":\"" + modelData.OrgShortName + "\",\"children\":[" + AddNodes(modelData.OrgCode) + "]}");
                stringBuilder.Append("]");
                return stringBuilder.ToString();
            }
            catch (Exception ex)
            {
                SystemErrorPlug.ErrorRecord("时间:[" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "]类名:[" + this.GetType().Name + "],行号:[" + Component.GetLineNum().ToString() + "行],错误信息:[" + ex.Message + "]");
                return string.Empty;
            }
        }
        //
        private string AddNodes(string OrgCode)
        {
            try
            {
                StringBuilder stringBuilder = new StringBuilder();
                DataTable dataTable = orgDal.GetLower(OrgCode);
                foreach (DataRow rows in dataTable.Rows)
                {
                    stringBuilder.Append("{\"id\":\"" + rows["OrgCode"] + "\",\"text\":\"" + rows["OrgShortName"] + "\",\"children\":[" + AddNodes(rows["OrgCode"].ToString()) + "]}");
                    stringBuilder.Append(",");
                }
                if (stringBuilder.Length > 0)
                {
                    stringBuilder.Remove(stringBuilder.Length - 1, 1);
                }
                return stringBuilder.ToString();
            }
            catch (Exception ex)
            {
                SystemErrorPlug.ErrorRecord("时间:[" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "]类名:[" + this.GetType().Name + "],行号:[" + Component.GetLineNum().ToString() + "行],错误信息:[" + ex.Message + "]");
                return string.Empty;
            }
        }
        //
        private string GetMemberTypeComboData()
        {
            try
            {
                SysLogBll.Create("会员类型", "返回会员类型combo数据操作", UserName);
                StringBuilder strb = new StringBuilder();
                strb.Append("[");
                DataTable dataTable = new MemberTypeCertificationDal().GetAllList();
                for (int i = 0; i < dataTable.Rows.Count; i++)
                {
                    strb.Append("{\"id\":\"" + dataTable.Rows[i]["Id"] + "\", \"text\":\"" + dataTable.Rows[i]["TypeCertificationName"] + "\"}");
                    if (i < dataTable.Rows.Count - 1)
                    {
                        strb.Append(",");
                    }
                }
                strb.Append("]");
                return strb.ToString();
            }
            catch (Exception ex)
            {
                SystemErrorPlug.ErrorRecord("时间:[" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "]类名:[" + this.GetType().Name + "],行号:[" + Component.GetLineNum().ToString() + "行],错误信息:[" + ex.Message + "]");
                return string.Empty;
            }
        }
        //
        private dynamic GetUserModel(HttpContext context)
        {
            dynamic model = new WebUserVeri();
            try { model.Id = user.Id; }
            catch { }
            model.LoginName = context.Request.Form["LoginName"].ToString();
            model.LoginPass = context.Request.Form["LoginPass"].ToString();
            model.UserName = context.Request.Form["UserName"].ToString();
            model.UserTel = context.Request.Form["UserTel"].ToString();
            model.UserEmail = context.Request.Form["UserEmail"].ToString();
            try { model.UserStatus = int.Parse(context.Request.Form["UserStatus"].ToString()); }
            catch { model.UserStatus = 0; }
            try { model.LoginDate = DateTime.Parse(context.Request.Form["LoginDate"].ToString()); }
            catch { model.LoginDate = DateTime.Now; }
            try { model.LoginnNum = int.Parse(context.Request.Form["LoginnNum"].ToString()); }
            catch { model.LoginnNum = 0; }
            try { model.OutDate = DateTime.Parse(context.Request.Form["OutDate"].ToString()); }
            catch { model.OutDate = DateTime.Now; }
            try { model.Veri = int.Parse(context.Request.Form["Veri"].ToString()); }
            catch { model.Veri = 0; }
            return model;
        }
        //
        private string UserUpdate(HttpContext context)
        {
            try
            {
                SysLogBll.Create("前台会员", "更新网站会员操作", UserName);
                if (userDal.Update(GetUserModel(context)))
                {
                    return "更新成功！";
                }
                else
                {
                    return "更新失败，请重新操作！";
                }
            }
            catch (Exception ex)
            {
                SystemErrorPlug.ErrorRecord("时间:[" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "]类名:[" + this.GetType().Name + "],行号:[" + Component.GetLineNum().ToString() + "行],错误信息:[" + ex.Message + "]");
                return "更新失败,错误代码：500 ";
            }
        }
        //
        private dynamic GetUsersById()
        {
            try
            {
                SysLogBll.Create("前台会员", "返回单个网站会员信息操作", UserName);
                int id = 0;
                try { id = user.Id; }
                catch { }
                return userDal.GetModel(id);
            }
            catch (Exception ex)
            {
                SystemErrorPlug.ErrorRecord("时间:[" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "]类名:[" + this.GetType().Name + "],行号:[" + Component.GetLineNum().ToString() + "行],错误信息:[" + ex.Message + "]");
                return null;
            }
        }
        //
        public string LoginOut(HttpContext context)
        {
            try
            {
                context.Request.Cookies.Remove("UserCookies");
                context.Session.Remove("UserSession");
                return "Y";
            }
            catch (Exception ex)
            {
                SystemErrorPlug.ErrorRecord("时间:[" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "]类名:[" + this.GetType().Name + "],行号:[" + Component.GetLineNum().ToString() + "行],错误信息:[" + ex.Message + "]");
                return "N";
            }
        }
    }
}
