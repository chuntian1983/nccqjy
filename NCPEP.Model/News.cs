/**
* News.cs
*
* 类 名： News
*
* Ver    变更日期            负责人           变更内容
* ───────────────────────────────────
* V0.01  2016-4-27 18:11:31   N/A      wanghao
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
	/// News:实体类(属性说明自动提取数据库字段的描述信息)
	/// </summary>
	[Serializable]
	public partial class News
	{
		public News()
		{}
		#region Model
		private int _id;
		private int _newstypeid= 0;
		private string _keyword= string.Empty;
		private string _content= string.Empty;
		private string _orgcode= string.Empty;
		private string _newstitle= string.Empty;
		private string _newssubheading= string.Empty;
		private string _newssource= string.Empty;
		private string _newscontent= string.Empty;
		private string _newsimg= string.Empty;
		private string _newsfile= string.Empty;
		private int _numclicks=0;
		private int _ischeck=0;
		private string _editor= string.Empty;
		private DateTime _createdate= DateTime.Now;
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
		public int NewsTypeId
		{
			set{ _newstypeid=value;}
			get{return _newstypeid;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string Keyword
		{
			set{ _keyword=value;}
			get{return _keyword;}
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
		public string OrgCode
		{
			set{ _orgcode=value;}
			get{return _orgcode;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string NewsTitle
		{
			set{ _newstitle=value;}
			get{return _newstitle;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string NewsSubheading
		{
			set{ _newssubheading=value;}
			get{return _newssubheading;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string NewsSource
		{
			set{ _newssource=value;}
			get{return _newssource;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string NewsContent
		{
			set{ _newscontent=value;}
			get{return _newscontent;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string NewsImg
		{
			set{ _newsimg=value;}
			get{return _newsimg;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string NewsFile
		{
			set{ _newsfile=value;}
			get{return _newsfile;}
		}
		/// <summary>
		/// 
		/// </summary>
		public int NumClicks
		{
			set{ _numclicks=value;}
			get{return _numclicks;}
		}
		/// <summary>
		/// 
		/// </summary>
		public int IsCheck
		{
			set{ _ischeck=value;}
			get{return _ischeck;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string Editor
		{
			set{ _editor=value;}
			get{return _editor;}
		}
		/// <summary>
		/// 
		/// </summary>
		public DateTime CreateDate
		{
			set{ _createdate=value;}
			get{return _createdate;}
		}
		#endregion Model

	}
}

