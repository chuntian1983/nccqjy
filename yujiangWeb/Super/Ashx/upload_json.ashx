<%@ webhandler Language="C#" class="Upload" %>
using System;
using System.Collections;
using System.Web;
using System.IO;
using System.Globalization;
using LitJson;

public class Upload : IHttpHandler
{
	private HttpContext context;

	public void ProcessRequest(HttpContext context)
	{		
        string savePath = "~/upload/";
		//文件保存目录URL
        string saveUrl = "../../upload/";
		//定义允许上传的文件扩展名
		Hashtable extTable = new Hashtable();
		extTable.Add("image", "gif,jpg,jpeg,png,bmp");
		extTable.Add("flash", "swf,flv");
		extTable.Add("media", "swf,flv,mp3,wav,wma,wmv,mid,avi,mpg,asf,rm,rmvb");
		extTable.Add("file", "doc,docx,xls,xlsx,ppt,htm,html,txt,zip,rar,gz,bz2");
		//最大文件大小
		int maxSize = 1000000;
		this.context = context;
		HttpPostedFile imgFile = context.Request.Files["imgFile"];
		if (imgFile == null)
		{
			showError("请选择文件。");
		}
        string dirPath = context.Server.MapPath(savePath);
		if (!Directory.Exists(dirPath))
		{
			showError("上传目录不存在。");
		}
        string dirName = context.Request.QueryString["dir"];
        if (string.IsNullOrEmpty(dirName))
        {
			dirName = "image";
		}
		if (!extTable.ContainsKey(dirName)) {
			showError("目录名不正确。");
		}
        string fileName = imgFile.FileName;
        string fileExt = Path.GetExtension(fileName).ToLower();
		if (imgFile.InputStream == null || imgFile.InputStream.Length > maxSize)
		{
			showError("上传文件大小超过限制。");
		}
        if (string.IsNullOrEmpty(fileExt) || Array.IndexOf(((string)extTable[dirName]).Split(','), fileExt.Substring(1).ToLower()) == -1)
		{
            showError("上传文件扩展名是不允许的扩展名。\n只允许" + ((string)extTable[dirName]) + "格式。");
		}
		//创建文件夹
		dirPath += dirName + "/";
		saveUrl += dirName + "/";
		if (!Directory.Exists(dirPath)) {
			Directory.CreateDirectory(dirPath);
		}
        string ymd = DateTime.Now.ToString("yyyyMMdd", DateTimeFormatInfo.InvariantInfo);
		dirPath += ymd + "/";
		saveUrl += ymd + "/";
		if (!Directory.Exists(dirPath)) {
			Directory.CreateDirectory(dirPath);
		}
        string newFileName = DateTime.Now.ToString("yyyyMMddHHmmss_ffff", DateTimeFormatInfo.InvariantInfo) + fileExt;
        string filePath = dirPath + newFileName;
		imgFile.SaveAs(filePath);
        string fileUrl = saveUrl + newFileName;
		Hashtable hash = new Hashtable();
		hash["error"] = 0;
		hash["url"] = fileUrl;
		context.Response.AddHeader("Content-Type", "text/html; charset=UTF-8");
		context.Response.Write(JsonMapper.ToJson(hash));
		context.Response.End();
	}

	private void showError(string message)
	{
		Hashtable hash = new Hashtable();
		hash["error"] = 1;
		hash["message"] = message;
		context.Response.AddHeader("Content-Type", "text/html; charset=UTF-8");
		context.Response.Write(JsonMapper.ToJson(hash));
		context.Response.End();
	}

	public bool IsReusable
	{
		get
		{
			return true;
		}
	}
}
