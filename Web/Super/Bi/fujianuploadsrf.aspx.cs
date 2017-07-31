using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using NCPEP.Dal;
using System.Data;
using Maticsoft.Common;
using NCPEP.Model;
using NCPEP.Bll;
using System.IO;

namespace Web.Super.Bi
{
    public partial class fujianuploadsrf : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string strid = Request.QueryString["p"];
                NCPEP.Bll.T_BidTrans blltr = new NCPEP.Bll.T_BidTrans();
                NCPEP.Model.T_BidTrans modeltr = new NCPEP.Model.T_BidTrans();
                modeltr=blltr.GetModel(int.Parse(strid));
                NCPEP.Bll.T_Bid bllbid = new NCPEP.Bll.T_Bid();
                NCPEP.Model.T_Bid modelbid = new NCPEP.Model.T_Bid();
                modelbid = bllbid.GetModel(modeltr.FK_BidId);
                if (modelbid != null)
                {
                    NCPEP.Bll.T_LiceTran bllli = new NCPEP.Bll.T_LiceTran();
                    NCPEP.Model.T_LiceTran modelli = new NCPEP.Model.T_LiceTran();
                    modelli = bllli.GetModel(modelbid.FK_LiceTranId);
                    if (modelli != null)
                    {
                        NCPEP.Bll.T_IndicatorsRelations bllin = new NCPEP.Bll.T_IndicatorsRelations();
                        NCPEP.Model.T_IndicatorsRelations modelin = new NCPEP.Model.T_IndicatorsRelations();
                        DataTable dt = bllin.GetList(" FK_MemberTypeCertificationId='" + modelli.MemberTypeId + "' and ApplicationType='4'").Tables[0];//出让方申请对应关系
                        string strids = "";
                        foreach (DataRow dr in dt.Rows)
                        {
                            strids += dr["FK_TypeIndicatorNameId"].ToString() + ",";
                        }
                        strids = strids.Trim().TrimEnd(',');
                        NCPEP.Bll.T_UploadTypeIndicator bllup = new NCPEP.Bll.T_UploadTypeIndicator();
                        DataTable ddldt = new DataTable();
                        ddldt = bllup.GetList(" id in(" + strids + ")").Tables[0];
                        if (ddldt.Rows.Count > 0)
                        {
                            this.txtFK_UploadTypeIndicatorId.DataSource = ddldt;
                            this.txtFK_UploadTypeIndicatorId.DataTextField = "TypeIndicatorName";
                            this.txtFK_UploadTypeIndicatorId.DataValueField = "id";
                            this.txtFK_UploadTypeIndicatorId.DataBind();

                        }

                    }
                }

                BindFujian(strid);
            }
        }
        protected void BindFujian(string strid)
        {
            NCPEP.Bll.T_FujianBiao bllfujian = new NCPEP.Bll.T_FujianBiao();
            DataTable dtfujian = bllfujian.GetListByType(" a.fid='" + strid + "'");
            if (dtfujian.Rows.Count > 0)
            {
                this.GridView1.DataSource = dtfujian;
                this.GridView1.DataBind();
            }
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            AdminUser adminUser = Session["SuperAdminUserSession"] as AdminUser;
            if (this.FileUpload1.HasFile)
            {
                string strtype = System.IO.Path.GetExtension(FileUpload1.FileName).ToLower();//ToLower转化为小写
                if (strtype == ".jpg" || strtype == ".gif" || strtype == ".jpeg" || strtype == ".png" || strtype == ".pdf")
                {
                    //获得上传文件的大小

                    int filesize = FileUpload1.PostedFile.ContentLength;

                    if (filesize > 1024 * 1024 * 25)
                    {
                        MessageBox.Show(this, "你上传的文件太大！");
                        return;
                    }
                    else
                    {
                        NCPEP.Model.T_FujianBiao model = new NCPEP.Model.T_FujianBiao();

                        try { }
                        catch { }
                        try
                        {
                            model.fid = Request.QueryString["p"];
                        }
                        catch { }
                        model.fjdynameid = this.txtFK_UploadTypeIndicatorId.SelectedValue;
                        string strname = Guid.NewGuid().ToString("N") + System.IO.Path.GetExtension(FileUpload1.FileName);
                        string strpath = Server.MapPath("~/Super/Scan/bsrffujian/" + model.fid + "");
                        if (!System.IO.Directory.Exists(strpath))
                        {
                            System.IO.Directory.CreateDirectory(strpath);
                        }
                        FileUpload1.SaveAs(strpath + "/" + strname);
                        //string ImgName = new UpLoadImgPlug().UploadImg("~/Super/Scan/lt/" + model.FK_LiceTranId + "/", 0);
                        //string imgUrl = HttpContext.Current.Server.MapPath("~/Super/Scan/lt/" + model.FK_LiceTranId + "/" + ImgName);
                        //string pdfUrl = "~/Super/Scan/lt/" + model.FK_LiceTranId + "/";
                        //new ProducePdfPlug().CreatePdf(imgUrl, pdfUrl, ImgName.Split('.')[0] + ".pdf");
                        model.fjpath = strname;
                        model.fjname = adminUser.AdminName;
                        model.fjlx = "4";//意向受让方申请附件
                        try
                        {
                            SysLogBll.Create("意向受让方申请附件", "增加标的意向受让方申请附件上传附件操作", adminUser.AdminName);
                            NCPEP.Bll.T_FujianBiao bll = new NCPEP.Bll.T_FujianBiao();

                            if (bll.Add(model) > 0)
                            {
                                MessageBox.Show(this, "上传成功。");
                                BindFujian(Request.QueryString["p"]);
                            }
                            else
                            {
                                MessageBox.Show(this, "上传失败，请重新操作! ");
                            }

                        }
                        catch (Exception ex)
                        {
                            SystemErrorPlug.ErrorRecord("时间:[" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "]类名:[" + this.GetType().Name + "],行号:[" + Component.GetLineNum().ToString() + "行],错误信息:[" + ex.Message + "]");
                            MessageBox.Show(this, "添加失败请重新操作，错误代码：500 ");
                        }
                    }
                }
                else
                {
                    MessageBox.Show(this, "上传的附件格式后缀名只能为.jpg,.gif,.jpeg,.png,.pdf,其他格式暂不允许上传");
                    return;

                }
            }
            else
            {
                MessageBox.Show(this, "请选择附件进行上传");
                return;
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;//注意控件类型的转换

            string id = btn.CommandArgument;//获取得到控件绑定的对应值

            NCPEP.Bll.T_FujianBiao bllfujian = new NCPEP.Bll.T_FujianBiao();
            bllfujian.Delete(int.Parse(id));
            BindFujian(Request.QueryString["p"]);
        }
    }
}