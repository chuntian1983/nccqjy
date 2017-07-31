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

namespace Web.Super.Lt
{
    public partial class fujianUpload : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string strid = Request.QueryString["p"];
                NCPEP.Dal.LiceTranDal dal = new LiceTranDal();
                DataTable dt = dal.GetComnoData(int.Parse(strid));
                this.txtFK_UploadTypeIndicatorId.DataSource = dt;
                this.txtFK_UploadTypeIndicatorId.DataTextField = "TypeIndicatorName";
                this.txtFK_UploadTypeIndicatorId.DataValueField = "id";
                this.txtFK_UploadTypeIndicatorId.DataBind();
                
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

                    if (filesize > 1024 * 1024*25)
                    {
                        MessageBox.Show(this, "你上传的文件太大！");
                        return;
                    }
                    else
                    {
                        LiceTranScan model = new LiceTranScan();
                        try {  }
                        catch { }
                        try
                        {
                            model.FK_LiceTranId = int.Parse(Request.QueryString["p"]);
                        }
                        catch { }
                        model.FK_UploadTypeIndicatorId = int.Parse(this.txtFK_UploadTypeIndicatorId.SelectedValue);
                        string strname = Guid.NewGuid().ToString("N") + System.IO.Path.GetExtension(FileUpload1.FileName);
                        string strpath = Server.MapPath("~/Super/Scan/lt/" + model.FK_LiceTranId + "");
                        if (!System.IO.Directory.Exists(strpath))
                        {
                            System.IO.Directory.CreateDirectory(strpath);
                        }
                        FileUpload1.SaveAs(strpath+"/"+strname);
                        //string ImgName = new UpLoadImgPlug().UploadImg("~/Super/Scan/lt/" + model.FK_LiceTranId + "/", 0);
                        //string imgUrl = HttpContext.Current.Server.MapPath("~/Super/Scan/lt/" + model.FK_LiceTranId + "/" + ImgName);
                        //string pdfUrl = "~/Super/Scan/lt/" + model.FK_LiceTranId + "/";
                        //new ProducePdfPlug().CreatePdf(imgUrl, pdfUrl, ImgName.Split('.')[0] + ".pdf");
                        model.ScanUrl = strname;
                        model.UploadName = adminUser.AdminName;
                        model.UploadDate = DateTime.Now;
                        try
                        {
                            SysLogBll.Create("出让/受让方上传附件", "增加出让/受让方上传附件操作", adminUser.AdminName);
                            LiceTranScanDal dal = new LiceTranScanDal();
                            if (dal.Create(model))
                            {
                                MessageBox.Show(this, "上传成功。");
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
    }
}