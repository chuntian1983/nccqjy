<%@ WebHandler Language="C#" Class="Upload" %>

using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Web;

public class Upload : IHttpHandler, System.Web.SessionState.IReadOnlySessionState
{

    public void ProcessRequest(HttpContext context)
    {
        HttpPostedFile file = context.Request.Files["FileData"];
        string folder = context.Request["folder"];
        int last = folder.LastIndexOf("/");
        //string uploadpath = folder.Substring(0,last);
        string uploadpath = context.Server.MapPath("~/newsfile/");
        string productID = folder.Substring(last + 1);
        string htbh = context.Request.Form["id"];
        string strid = System.DateTime.Now.ToFileTime().ToString();
        
        if (file != null)
        {
            if (!Directory.Exists(uploadpath))
            {
                Directory.CreateDirectory(uploadpath);
            }
            file.SaveAs(uploadpath +strid+ file.FileName.Substring(file.FileName.LastIndexOf('.')));
            
            string FileName = file.FileName;
            string fpath = strid+ FileName.Substring(FileName.LastIndexOf('.'));
            string fname = FileName.Substring(0, FileName.LastIndexOf('.'));
            //string strlx = "";
            context.Response.Write("1|"+fpath+"|"+fname+""); //标志位1标识上传成功，后面的可以返回前台的参数，比如上传后的路径等，中间使用|隔开
           // if (fname.Contains("h"))
           // {
           //     strlx = "h";
                
           // }
           // else if (fname.Contains("t"))
           // {
           //     strlx = "t";
           // }
           // else if (fname.Contains("z"))
           // {
           //     strlx = "z";
           // }
           // else
           // {
           //     strlx = "s";
           // }
           // DataTable dt = MainClass.GetDataTable("select id from land_fujian where mc='" + fname + "' and lx='" + strlx + "' and bz='" + fpath + "' and vid='" + UserInfo.AccountID + "'");
           //if (dt.Rows.Count > 0)
           //{
           //    MainClass.ExecuteSQL("delete from land_fujian where id='" + dt.Rows[0][0] + "'");
           //}

           //MainClass.ExecuteSQL("insert into land_fujian(mc,lx,sj,bz,vid) values('" + fname + "','" + strlx + "','" + System.DateTime.Now.ToString("yyyy-MM-dd") + "','" + fpath + "','" + UserInfo.AccountID + "')");
           
        }
        else
        {
            context.Response.Write("0|");
        }
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}