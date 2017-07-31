/**
* WebIntention.cs
*
* 类 名： WebIntention
*
* Ver    变更日期            负责人           变更内容
* ───────────────────────────────────
* V0.01  2016-4-27 18:11:49   N/A      wanghao
*
* Copyright (c) wanghao Corporation. All rights reserved.
*┌───────────────────────────────────┐
*│　此代码信息为机密信息             │
*│  未经书面同意禁止向第三方披露     │
*│　设计研发：wanghao　　　　　　　　 │
*└───────────────────────────────────┘
*/
using System;
namespace NCPEP.Model
{
	/// <summary>
	/// WebIntention:实体类(属性说明自动提取数据库字段的描述信息)
	/// </summary>
	[Serializable]
	public partial class WebIntention
	{
		public WebIntention()
		{}
		#region Model
		private int _id;
		private int _fk_webuserveriid = 0;
		private int _intentiontype = 0;
		private string _title = string.Empty;
		private string _content = string.Empty;
		private DateTime _regdate ;
		private DateTime _enddte ;
		private int _checkstatus=0;
		private int _clicknum=0;
		private string _checkname = string.Empty;
		private DateTime _checkdate= DateTime.Now;
		/// <summary>
		/// 
		/// </summary>
		public int Id
		{
			set{ _id=value;}
			get{return _id;}
		}
		/// <summary>
		/// 
		/// </summary>
		public int FK_WebUserVeriId
		{
			set{ _fk_webuserveriid=value;}
			get{return _fk_webuserveriid;}
		}
		/// <summary>
		/// 
		/// </summary>
		public int IntentionType
		{
			set{ _intentiontype=value;}
			get{return _intentiontype;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string Title
		{
			set{ _title=value;}
			get{return _title;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string Content
		{
			set{ _content=value;}
			get{return _content;}
		}
		/// <summary>
		/// 
		/// </summary>
		public DateTime RegDate
		{
			set{ _regdate=value;}
			get{return _regdate;}
		}
		/// <summary>
		/// 
		/// </summary>
		public DateTime EndDte
		{
			set{ _enddte=value;}
			get{return _enddte;}
		}
		/// <summary>
		/// 
		/// </summary>
		public int CheckStatus
		{
			set{ _checkstatus=value;}
			get{return _checkstatus;}
		}
		/// <summary>
		/// 
		/// </summary>
		public int ClickNum
		{
			set{ _clicknum=value;}
			get{return _clicknum;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string CheckName
		{
			set{ _checkname=value;}
			get{return _checkname;}
		}
		/// <summary>
		/// 
		/// </summary>
		public DateTime CheckDate
		{
			set{ _checkdate=value;}
			get{return _checkdate;}
		}
		#endregion Model

	}
}

