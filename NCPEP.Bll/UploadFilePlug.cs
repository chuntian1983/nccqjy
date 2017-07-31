using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.IO;

namespace NCPEP.Bll
{
    public class UpLoadFilePlug
    {
        public string UploadFile(string url)
        {
            try
            {
                string strFileName = DateTime.Now.ToString("yyyyMMddhhmmss");
                HttpPostedFile hf = HttpContext.Current.Request.Files[1];
                if (hf.ContentLength > 0)
                {
                    int fileSize = 0;
                    fileSize = hf.ContentLength;
                    if (fileSize < 2097152)
                    {
                        string fileType = Path.GetExtension(hf.FileName);
                        if (".doc" == fileType || ".txt" == fileType || ".xls" == fileType || ".pdf" == fileType || ".rtf" == fileType)
                        {
                            if (!Directory.Exists(HttpContext.Current.Server.MapPath(url)))
                            {
                                Directory.CreateDirectory(HttpContext.Current.Server.MapPath(url));
                            }
                            string path = HttpContext.Current.Server.MapPath(url + strFileName + fileType);
                            hf.SaveAs(path);
                            return strFileName + fileType;
                        }
                    }
                    return string.Empty;
                }
                else
                {
                    return string.Empty;
                }
            }
            catch(Exception ex){
                SystemErrorPlug.ErrorRecord("时间:[" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "]类名:[" + this.GetType().Name + "],行号:[" + Component.GetLineNum().ToString() + "行],错误信息:[" + ex.Message + "]");
                return string.Empty; }
        }
    }
}
