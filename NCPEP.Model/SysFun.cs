/**
* SysFun.cs
*
* 类 名： SysFun
*
* Ver    变更日期            负责人           变更内容
* ───────────────────────────────────
* V0.01  2016-4-27 18:11:41   N/A      wanghao
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
	/// SysFun:实体类(属性说明自动提取数据库字段的描述信息)
	/// </summary>
	[Serializable]
	public partial class SysFun
	{
		public SysFun()
		{}
		#region Model
		private int _nodeid;
		private string _displayname= string.Empty;
		private string _nodeurl= string.Empty;
		private int _displayorder= 0;
		private int _parentnodeid= 0;
		private string _funimgnum= string.Empty;
		private string _editor= string.Empty;
		private DateTime _createdate= DateTime.Now;
		/// <summary>
		/// 
		/// </summary>
		public int NodeId
		{
			set{ _nodeid=value;}
			get{return _nodeid;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string DisplayName
		{
			set{ _displayname=value;}
			get{return _displayname;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string NodeURL
		{
			set{ _nodeurl=value;}
			get{return _nodeurl;}
		}
		/// <summary>
		/// 
		/// </summary>
		public int DisplayOrder
		{
			set{ _displayorder=value;}
			get{return _displayorder;}
		}
		/// <summary>
		/// 
		/// </summary>
		public int ParentNodeId
		{
			set{ _parentnodeid=value;}
			get{return _parentnodeid;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string FunImgNum
		{
			set{ _funimgnum=value;}
			get{return _funimgnum;}
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

