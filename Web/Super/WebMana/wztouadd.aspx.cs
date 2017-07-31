using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using NCPEP.Bll;
using System.Data;
using Maticsoft.Common;

namespace Web.Super.WebMana
{
    public partial class wztouadd : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindDll();
                
            }
        }

        protected void BindDll()
        {
            NCPEP.Bll.T_Organization bll = new T_Organization();
            string strorgcode = System.Configuration.ConfigurationManager.AppSettings["orgcode"];
            DataTable dt = bll.GetList(" UpOrgCode='" + strorgcode + "'").Tables[0];
            if (dt.Rows.Count > 0)
            {
                this.ddlorg.DataSource = dt;
                this.ddlorg.DataTextField = "OrgShortName";
                this.ddlorg.DataValueField = "OrgCode";
                this.ddlorg.DataBind();
            }
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            NCPEP.Model.T_Wztou model = new NCPEP.Model.T_Wztou();
            model.zzcode = this.ddlorg.SelectedValue;
            model.beizhu = this.ddlorg.SelectedItem.Text;
            if (futou.HasFile)
            {
                string strtype = System.IO.Path.GetExtension(futou.FileName).ToLower();//ToLower转化为小写
                if (strtype == ".png")
                {
                    //获得上传文件的大小

                    int filesize = futou.PostedFile.ContentLength;

                    if (filesize > 1024 * 1024 * 2)
                    {
                        MessageBox.Show(this, "你上传的文件太大！");
                        return;
                    }
                    else
                    {

                        string strname = Guid.NewGuid().ToString("N") + System.IO.Path.GetExtension(futou.FileName);
                        string strpath = Server.MapPath("~/upload/touimage");
                        if (!System.IO.Directory.Exists(strpath))
                        {
                            System.IO.Directory.CreateDirectory(strpath);
                        }
                        futou.SaveAs(strpath + "/" + strname);
                        model.wztou = strname;
                        NCPEP.Bll.T_Wztou bll = new T_Wztou();
                        if (bll.Add(model) > 0)
                        {
                            MessageBox.Show(this, "保存成功！");
                        }
                        else { MessageBox.Show(this,"添加失败！"); }
                        
                    }
                }
                else { MessageBox.Show(this,"只能上传.png格式的图片"); }
            }
            else
            {
                MessageBox.Show(this, "请上传网站头图片");
            }
            model.wztou = "";
        }

        protected void btncanel_Click(object sender, EventArgs e)
        {
            Response.Redirect("wztoulist.aspx");
        }
    }
}