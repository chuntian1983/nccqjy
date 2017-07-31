using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.IO;

namespace NCPEP.Bll
{
    public class SystemErrorPlug
    {
        public static void ErrorRecord(string mess)
        {
            try
            {
                mess += "\r\n-----------------------------------------------------------------------------------------------\r\n";
                string fileLogPath = HttpContext.Current.Server.MapPath("~/Logs/");
                if (!Directory.Exists(fileLogPath))
                {
                    Directory.CreateDirectory(fileLogPath);
                }
                fileLogPath = Path.Combine(fileLogPath, "SystemErrorRecord.log");
                File.AppendAllText(fileLogPath, mess, System.Text.Encoding.UTF8);
            }
            catch
            {
                throw;
            }
        }
    }
}
