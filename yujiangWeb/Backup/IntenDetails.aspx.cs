using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using NCPEP.Bll;
using NCPEP.Model;

namespace Web
{
    public partial class IntenDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    string t = Request.QueryString["t"];
                    if (t.Equals("1"))
                    {
                        lbl_Details_TypeName.InnerHtml = "意向受让信息";
                        lblDetailsTypeName.InnerHtml = "意向受让信息";
                    }
                    if (t.Equals("2"))
                    {
                        lbl_Details_TypeName.InnerHtml = "意向转让信息";
                        lblDetailsTypeName.InnerHtml = "意向转让信息";
                    }
                    if (t.Equals("3"))
                    {
                        lbl_Details_TypeName.InnerHtml = "抵押融资信息";
                        lblDetailsTypeName.InnerHtml = "抵押融资信息";
                    }
                    int id = 0;
                    try { id = int.Parse(Request.QueryString["id"]); }
                    catch { }
                    WebSiteBll webSite = new WebSiteBll();
                    WebIntention model = webSite.GetIntenModel(id, t);                  
                    if (!string.IsNullOrEmpty(model.Title))
                    {
                        lbl_Details_TitleName.InnerHtml = model.Title;
                        lblTitle.InnerHtml = model.Title;
                        lblContent.InnerHtml = model.Content;
                        dynamic user = webSite.GetUserVeriModel(model.FK_WebUserVeriId);
                        lblWebUser.InnerHtml = user.UserName;
                        lblTel.InnerHtml = user.UserTel;
                        lblRegDate.InnerHtml = model.RegDate.ToString("yyyy-MM-dd");
                        lblEndDte.InnerHtml = model.EndDte.ToString("yyyy-MM-dd");
                    }
                    else
                    {
                        lblDetailsTypeName.InnerHtml = "暂无数据！";
                    }
                }
            }
            catch (Exception ex)
            {
                SystemErrorPlug.ErrorRecord("时间:[" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "]类名:[" + this.GetType().Name + "],行号:[" + Component.GetLineNum().ToString() + "行],错误信息:[" + ex.Message + "]");
            }
        }
    }
}