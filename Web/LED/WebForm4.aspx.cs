using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using iTextSharp.text;
using iTextSharp.text.pdf;
using System.IO;

namespace Web.LED
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //string fileName = string.Empty;
            //Microsoft.Win32.SaveFileDialog dlg = new Microsoft.Win32.SaveFileDialog();
            //dlg.FileName = "创建多个Pdf新页";
            //dlg.DefaultExt = ".pdf";
            //dlg.Filter = "Text documents (.pdf)|*.pdf";
            //Nullable<bool> result = dlg.ShowDialog();
            //if (result == true)
            //{
            //    fileName = dlg.FileName;
            //    Document document = new Document(PageSize.NOTE);
            //    PdfWriter writer = PdfWriter.GetInstance(document, new FileStream(fileName, FileMode.Create));
            //    document.Open();
            //    // 第一页
            //    document.Add(new iTextSharp.text.Paragraph("PDF1, PDF1, PDF1, PDF1, PDF1"));
            //    document.Add(new iTextSharp.text.Paragraph("PDF1, PDF1, PDF1, PDF1, PDF1"));
            //    document.Add(new iTextSharp.text.Paragraph("PDF1, PDF1, PDF1, PDF1, PDF1"));
            //    document.Add(new iTextSharp.text.Paragraph("PDF1, PDF1, PDF1, PDF1, PDF1"));
            //    // 添加新页面
            //    document.NewPage();
            //    // 第二页
            //    // 添加第二页内容
            //    document.Add(new iTextSharp.text.Paragraph("PDF2, PDF2, PDF2, PDF2, PDF2"));
            //    document.Add(new iTextSharp.text.Paragraph("PDF2, PDF2, PDF2, PDF2, PDF2"));
            //    document.Add(new iTextSharp.text.Paragraph("PDF2, PDF2, PDF2, PDF2, PDF2"));
            //    document.Add(new iTextSharp.text.Paragraph("PDF2, PDF2, PDF2, PDF2, PDF2"));
            //    document.Add(new iTextSharp.text.Paragraph("PDF2, PDF2, PDF2, PDF2, PDF2"));
            //    document.Add(new iTextSharp.text.Paragraph("PDF2, PDF2, PDF2, PDF2, PDF2"));
            //    // 添加新页面
            //    document.NewPage();
            //    // 第三页
            //    // 添加新内容
            //    document.Add(new iTextSharp.text.Paragraph("PDF3, PDF3, PDF3, PDF3, PDF3"));
            //    document.Add(new iTextSharp.text.Paragraph("PDF3, PDF3, PDF3, PDF3, PDF3"));
            //    document.Add(new iTextSharp.text.Paragraph("PDF3, PDF3, PDF3, PDF3, PDF3"));
            //    document.Add(new iTextSharp.text.Paragraph("PDF3, PDF3, PDF3, PDF3, PDF3"));
            //    // 重新开始页面计数
            //    document.ResetPageCount();
            //    // 新建一页
            //    document.NewPage();
            //    // 第四页
            //    // 添加第四页内容
            //    document.Add(new iTextSharp.text.Paragraph("PDF4, PDF4, PDF4, PDF4, PDF4"));
            //    document.Add(new iTextSharp.text.Paragraph("PDF4, PDF4, PDF4, PDF4, PDF4"));
            //    document.Add(new iTextSharp.text.Paragraph("PDF4, PDF4, PDF4, PDF4, PDF4"));
            //    document.Add(new iTextSharp.text.Paragraph("PDF4, PDF4, PDF4, PDF4, PDF4"));
            //    document.Close();
            //}//end if
        }
    }
}