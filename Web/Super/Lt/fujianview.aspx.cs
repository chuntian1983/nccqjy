using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web.Super.Lt
{
    public partial class fujianview : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //ShowWord();
            ShowPDF();
            //ShowExcel();
        }
        /// <summary>
        /// 在网页中显示PDF文件
        /// </summary>
        private void ShowPDF()
        {
            //Response.ContentType = "Application/pdf";
            string strfile = "acrobat.pdf";
            if (Request.QueryString["id"] != null)
            {
                string str = Request.QueryString["id"];
                string[] strlist = str.Split('|');
                strfile = "../Scan/lt/" + strlist[0] + "/" + strlist[1];


                string filePath = MapPath(strfile);
                strpdf.Attributes.Add("href", strfile);
            }
            //Response.WriteFile(filePath);
            //Response.End();
        }

        /// <summary>
        /// 在网页中显示WORD文档
        /// </summary>
        private void ShowWord()
        {
            Response.ContentType = "Application/msword";
            string filePath = MapPath("Temp.doc");
            Response.WriteFile(filePath);
            Response.End();
        }

        private void ShowExcel()
        {
            Response.ContentType = "Application/x-msexcel";
            string filePath = MapPath("最新通讯录(2008.12月版).xls");
            Response.WriteFile(filePath);
            Response.End();
        }

        private void ShowHtml()
        {
            Response.ContentType = "text/HTML";
            string filePath = MapPath("GlideView.html");
            Response.WriteFile(filePath);
            Response.End();
        }
    }
}