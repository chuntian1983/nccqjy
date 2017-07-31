using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using iTextSharp;
using iTextSharp.text;
using iTextSharp.text.pdf;
using System.IO;
using System.Web;

namespace NCPEP.Bll
{
    public class ProducePdfPlug
    {
        public string CreatePdf(string imagePath,string pdfUrl,string pdfName)
        {
            try
            {
               
                Document document = new Document(PageSize.B0, 10, 10, 10, 10);
                document.AddAuthor("wanghao");               
                 string newPdfUrl = HttpContext.Current.Server.MapPath(pdfUrl);
                 PdfWriter writer = PdfWriter.GetInstance(document, new FileStream(newPdfUrl + pdfName, FileMode.Create));
                 document.Open();
                Image img = Image.GetInstance(imagePath);
                img.SetAbsolutePosition(500,500);
                writer.DirectContent.AddImage(img);
                Paragraph p = new Paragraph("", new iTextSharp.text.Font(Font.FontFamily.HELVETICA, 22f));
                p.Alignment = Element.ALIGN_CENTER;
                document.Add(p);
                document.Close();
                return "OK";
            }
            catch (Exception ex)
            {
                SystemErrorPlug.ErrorRecord("时间:[" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "]类名:[" + this.GetType().Name + "],行号:[" + Component.GetLineNum().ToString() + "行],错误信息:[" + ex.Message + "]"); 
                return ex.Message.ToString();
            }
        }
    }
}