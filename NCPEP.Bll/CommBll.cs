using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using NCPEP.Model;
using NCPEP.Dal;
using System.Data;

namespace NCPEP.Bll
{
    public class CommBll
    {
        private dynamic liceTranScanDal = null;
        private dynamic checkDal = null;
        private dynamic memberTypeDal = null;
        private dynamic orgdal = null;
        private dynamic user = null;
        private string UserName = string.Empty;
        public CommBll()
        {
            memberTypeDal = new MemberTypeCertificationDal();
            orgdal = new OrganizationDal();
            checkDal = new LiceTranCheckDal();
            liceTranScanDal = new LiceTranScanDal();
        }
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
            }
            catch (Exception ex)
            {
                SystemErrorPlug.ErrorRecord("时间:[" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "]类名:[" + this.GetType().Name + "],行号:[" + Component.GetLineNum().ToString() + "行],错误信息:[" + ex.Message + "]");
                return null;
            }
            UserName = !string.IsNullOrEmpty(user.UserName) ? user.UserName : user.VeriName;

            string action = context.Request.QueryString["action"].ToString();
            string returnDate = string.Empty;
            switch (action)
            {
                case "tree":
                    returnDate = GetTree();
                    break;
                case "mtcombo":
                    returnDate = GetMemberTypeComboData();
                    break;
                case "paging":
                    returnDate = JsonHelper<LiceTranCheck>.JsonDataTable(GetLiceTranCheckList(context), "rows");
                    break;
                case "list":
                    returnDate = JsonHelper<LiceTranScan>.JsonDataTable(GetLiceTranScanList(context), "rows");
                    break;
                case "scanadd":
                    returnDate = CreateScan(context);
                    break;
                case "ptcombo":
                    returnDate = GetPropertyTypeComno();
                    break;
                case "ttcombo":
                    returnDate = GetTurnOutTypeComno();
                    break;
                case "smcombo":
                    returnDate = GetStandardModeComno();
                    break;
                case "stcombo":
                    returnDate = GetStandardTypeComno();
                    break;
                default:
                    returnDate = "请求错误!";
                    break;
            }
            return returnDate;
        }
        //
        private string GetStandardTypeComno()
        {
            try
            {
                SysLogBll.Create("挂牌类型", "返回挂牌类型combo数据操作", UserName);
                StringBuilder strb = new StringBuilder();
                strb.Append("[");
                DataTable dataTable = new StandardTypeDal().GetAllList();

                for (int i = 0; i < dataTable.Rows.Count; i++)
                {
                    strb.Append("{\"id\":\"" + dataTable.Rows[i]["Id"] + "\", \"text\":\"" + dataTable.Rows[i]["StandardTypeName"] + "\"}");
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
        private string GetStandardModeComno()
        {
            try
            {
                SysLogBll.Create("web挂牌方式", "返回挂牌方式combo数据操作", UserName);
                StringBuilder strb = new StringBuilder();
                strb.Append("[");
                DataTable dataTable = new StandardModeDal().GetAllList();

                for (int i = 0; i < dataTable.Rows.Count; i++)
                {
                    strb.Append("{\"id\":\"" + dataTable.Rows[i]["Id"] + "\", \"text\":\"" + dataTable.Rows[i]["StandardModeName"] + "\"}");
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
        private string GetTurnOutTypeComno()
        {
            try
            {
                SysLogBll.Create("web转出方式", "返回转出方式combo数据操作", UserName);
                StringBuilder strb = new StringBuilder();
                strb.Append("[");
                DataTable dataTable = new TurnOutTypeDal().GetAllList();
                for (int i = 0; i < dataTable.Rows.Count; i++)
                {
                    strb.Append("{\"id\":\"" + dataTable.Rows[i]["Id"] + "\", \"text\":\"" + dataTable.Rows[i]["TurnOutTypeName"] + "\"}");
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
        private string GetPropertyTypeComno()
        {
            try
            {
                SysLogBll.Create("WEB产权类型", "返回产权类型combo数据操作", UserName);
                StringBuilder strb = new StringBuilder();
                strb.Append("[");
                DataTable dataTable = new PropertyTypeDal().GetAllList();

                for (int i = 0; i < dataTable.Rows.Count; i++)
                {
                    strb.Append("{\"id\":\"" + dataTable.Rows[i]["Id"] + "\", \"text\":\"" + dataTable.Rows[i]["PropertyTypeName"] + "\"}");
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
        private dynamic GetModels(HttpContext context)
        {
            LiceTranScan model = new LiceTranScan();
            try { model.Id = int.Parse(context.Request.Form["Id"].ToString()); }
            catch { }
            model.FK_LiceTranId = int.Parse(context.Request.Form["FK_LiceTranId"].ToString());
            model.FK_UploadTypeIndicatorId = int.Parse(context.Request.Form["FK_UploadTypeIndicatorId"].ToString());
            string ImgName = new UpLoadImgPlug().UploadImg("~/Super/Scan/lt/" + model.FK_LiceTranId + "/", 0);
            string imgUrl = HttpContext.Current.Server.MapPath("~/Super/Scan/lt/" + model.FK_LiceTranId + "/" + ImgName);
            string pdfUrl = "~/Super/Scan/lt/" + model.FK_LiceTranId + "/";
            new ProducePdfPlug().CreatePdf(imgUrl, pdfUrl, ImgName.Split('.')[0] + ".pdf");
            model.ScanUrl = ImgName.Split('.')[0] + ".pdf";
            model.UploadName = UserName;
            model.UploadDate = DateTime.Now;
            return model;
        }
        //
        private dynamic CreateScan(HttpContext context)
        {
            try
            {
                SysLogBll.Create("web出让/受让方上传附件", "增加出让/受让方上传附件操作", UserName);
                if (liceTranScanDal.Create(GetModels(context)))
                {
                    return "上传成功。";
                }
                else
                {
                    return "上传失败，请重新操作! ";
                }

            }
            catch (Exception ex)
            {
                SystemErrorPlug.ErrorRecord("时间:[" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "]类名:[" + this.GetType().Name + "],行号:[" + Component.GetLineNum().ToString() + "行],错误信息:[" + ex.Message + "]");
                return "添加失败请重新操作，错误代码：500 ";
            }
        }
        //
        private dynamic GetLiceTranScanList(HttpContext context)
        {
            try
            {
                int LiceTranId = 0;
                LiceTranId = int.Parse(context.Request.QueryString["LiceTranId"]);
                SysLogBll.Create("web出让/受让方上传附件", "查询所有的出让/受让方上传附件数据", UserName);
                return liceTranScanDal.GetAllList(LiceTranId);
            }
            catch (Exception ex)
            {
                SystemErrorPlug.ErrorRecord("时间:[" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "]类名:[" + this.GetType().Name + "],行号:[" + Component.GetLineNum().ToString() + "行],错误信息:[" + ex.Message + "]");
                return null;
            }
        }
        //
        private DataTable GetLiceTranCheckList(HttpContext context)
        {
            try
            {
                SysLogBll.Create("Web出让/受让方审核", "获取所有的出让/受让方审核操作", UserName);
                int LiceTranId = 0;
                try { LiceTranId = int.Parse(context.Request.QueryString["LiceTranId"]); }
                catch { }
                return checkDal.GetAllList(LiceTranId);
            }
            catch (Exception ex)
            {
                SystemErrorPlug.ErrorRecord("时间:[" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "]类名:[" + this.GetType().Name + "],行号:[" + Component.GetLineNum().ToString() + "行],错误信息:[" + ex.Message + "]");
                return null;
            }
        }
        //
        private string GetMemberTypeComboData()
        {
            try
            {
                SysLogBll.Create("web会员类型", "返回会员类型combo数据操作", UserName);
                StringBuilder strb = new StringBuilder();
                strb.Append("[");
                DataTable dataTable = memberTypeDal.GetAllList();
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
        private string GetTree()
        {
            try
            {
                SysLogBll.Create("web组织单位", "获取组织单位树形数据2", UserName);
                string OrgCode = orgdal.GetHighestOrgCode();
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.Append("[");
                Organization modelData = orgdal.GetModel(OrgCode);
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
                DataTable dataTable = orgdal.GetLower(OrgCode);
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
    }
}
