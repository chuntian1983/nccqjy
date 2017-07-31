using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Xml;
using System.Web;
using System.IO;
using System.Net;
using System.Management;

namespace NCPEP.Bll
{
    public class Component
    {
        //
        public static string GetClientIP()
        {
            string str = HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
            switch (str)
            {
                case null:
                case "":
                    str = HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"];
                    break;
            }
            if ((str != null) && !(str == string.Empty))
            {
                return str;
            }
            return HttpContext.Current.Request.UserHostAddress;
        }
        //
        public static string GetHostName()
        {
            return Dns.GetHostEntry(HttpContext.Current.Request.UserHostName).HostName;
        }
        //
        public static void DeleteImg(string imgUrl)
        {
            try
            {
                string filePath = HttpContext.Current.Server.MapPath(imgUrl);
                File.Delete(filePath);
            }
            catch { }
        }
        //
        public static void DeleteFile(string imgUrl)
        {
            try
            {
                string filePath = HttpContext.Current.Server.MapPath(imgUrl);
                DirectoryInfo di = new DirectoryInfo(filePath);
                di.Delete(true);
            }
            catch { }
        }
        //
        public static string GetMac()
        {
            //获取网卡硬件地址 
            ManagementClass mc = new ManagementClass("Win32_NetworkAdapterConfiguration");
            ManagementObjectCollection moc2 = mc.GetInstances();
            string strmac = "";
            foreach (ManagementObject mo in moc2)
            {
                if ((bool)mo["IPEnabled"] == true)
                    strmac = mo["MacAddress"].ToString();
                mo.Dispose();
            }
            return strmac;
        }
        //
        public static int GetLineNum()
        {
            System.Diagnostics.StackTrace st = new System.Diagnostics.StackTrace(1, true);
            return st.GetFrame(0).GetFileLineNumber();
        }
        //
        public static XmlNode ReadXml(string name)
        {
            try
            {
                XmlDocument xmlDoc = new XmlDocument();
                xmlDoc.Load(HttpContext.Current.Server.MapPath("~/bin/Config.xml"));
                return xmlDoc.SelectSingleNode("WebFoot/Date [@name='" + name + "']");
            }
            catch
            {
                throw new Exception("XML读取错误！");
            }
        }
    }
}
