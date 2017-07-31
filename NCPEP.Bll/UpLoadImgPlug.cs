using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.IO;

namespace NCPEP.Bll
{
    public class UpLoadImgPlug
    {
        //
        public string UploadImg(string url, int index)
        {
            try
            {
                string strFileName = DateTime.Now.ToString("yyyyMMddhhmmss");
                HttpPostedFile hf = HttpContext.Current.Request.Files[index];
                if (hf.ContentLength > 0)
                {
                    int fileSize = 0;
                    fileSize = hf.ContentLength;
                    if (fileSize < 2097152)
                    {
                        string fileType = Path.GetExtension(hf.FileName);
                        if (".exe" != fileType || ".EXE" != fileType )
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
            catch (Exception ex)
            {
                SystemErrorPlug.ErrorRecord("时间:[" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "]类名:[" + this.GetType().Name + "],行号:[" + Component.GetLineNum().ToString() + "行],错误信息:[" + ex.Message + "]");
                return string.Empty;
            }
        }
    }
}