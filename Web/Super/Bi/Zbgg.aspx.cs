using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using NCPEP.Bll;
using NCPEP.Model;
using Maticsoft.DBUtility;
using Maticsoft.Common;
using System.Data;

namespace Web.Super.Bi
{
    public partial class Zbgg : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["p"]!=null)
                {
                    NCPEP.Bll.T_BidPlacard bll=new NCPEP.Bll.T_BidPlacard();
                    DataTable dt = bll.GetList("FK_BidId='"+Request.QueryString["p"]+"'").Tables[0];
                    if (dt.Rows.Count > 0)
                    {
                        this.txtBidPlacardContent.Value = dt.Rows[0]["BidPlacardContent"].ToString();
                        this.txtBidPlacardTitle.Value = dt.Rows[0]["BidPlacardTitle"].ToString();
                        this.LinkButton1.Visible = false;
                        this.LinkButton2.Visible = true;
                        this.hidid.Value = dt.Rows[0]["Id"].ToString();

                    }
                    else {
                        this.LinkButton1.Visible = true;
                        this.LinkButton2.Visible = false;
                    }
                }
            }
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            AdminUser adminUser = Session["SuperAdminUserSession"] as AdminUser;
            if (Request.QueryString["p"] != null)
            {
                NCPEP.Model.T_BidPlacard model = new NCPEP.Model.T_BidPlacard();
                model.BidPlacardContent = this.txtBidPlacardContent.Value;
                model.BidPlacardTitle = this.txtBidPlacardTitle.Value;
                model.FK_BidId = int.Parse(Request.QueryString["p"]);
                model.Publisher = adminUser.AdminName;
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
                            model.fujianname = FileUpload1.FileName;
                            string strname = Guid.NewGuid().ToString("N") + System.IO.Path.GetExtension(FileUpload1.FileName);
                            model.fujian = strname;
                            string strpath = Server.MapPath("~/Super/Scan/bcrfujian/" + model.FK_BidId + "");
                            if (!System.IO.Directory.Exists(strpath))
                            {
                                System.IO.Directory.CreateDirectory(strpath);
                            }
                            FileUpload1.SaveAs(strpath + "/" + strname);
                        }
                    }
                }
                NCPEP.Bll.T_BidPlacard bll = new NCPEP.Bll.T_BidPlacard();
                if (bll.Add(model) > 0)
                {
                    MessageBox.Show(this, "添加成功");
                    //Response.Write("<script> function closeParent(){ window.parent.closeIframe(); }</script>");
                    this.LinkButton1.Visible = false;
                }


            }
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(this.hidid.Value))
            {
                NCPEP.Bll.T_BidPlacard bll = new NCPEP.Bll.T_BidPlacard();
                NCPEP.Model.T_BidPlacard model = new NCPEP.Model.T_BidPlacard();
                model = bll.GetModel(int.Parse(this.hidid.Value));
                model.BidPlacardTitle = this.txtBidPlacardTitle.Value;
                model.BidPlacardContent = this.txtBidPlacardContent.Value;
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
                            model.fujianname = FileUpload1.FileName;
                            string strname = Guid.NewGuid().ToString("N") + System.IO.Path.GetExtension(FileUpload1.FileName);
                            model.fujian = strname;
                            string strpath = Server.MapPath("~/Super/Scan/bcrfujian/" + model.FK_BidId + "");
                            if (!System.IO.Directory.Exists(strpath))
                            {
                                System.IO.Directory.CreateDirectory(strpath);
                            }
                            FileUpload1.SaveAs(strpath + "/" + strname);
                        }
                    }
                }
                if (bll.Update(model))
                {
                    MessageBox.Show(this, "修改成功");

                }
                
            }
        }
    }
}