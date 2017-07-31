/**
* SysLog.cs
*
* 类 名： SysLog
*
* Ver    变更日期            负责人           变更内容
* ───────────────────────────────────
* V0.01  2016-4-27 18:11:43   N/A      wanghao
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
	/// SysLog:实体类(属性说明自动提取数据库字段的描述信息)
	/// </summary>
	[Serializable]
	public partial class SysLog
	{
		public SysLog()
		{}
		#region Model
		private int _id;
		private string _logvalue= string.Empty;
		private string _operates= string.Empty;
		private string _ipadd= string.Empty;
		private string _macadd= string.Empty;
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
		public string LogValue
		{
			set{ _logvalue=value;}
			get{return _logvalue;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string Operates
		{
			set{ _operates=value;}
			get{return _operates;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string IpAdd
		{
			set{ _ipadd=value;}
			get{return _ipadd;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string MacAdd
		{
			set{ _macadd=value;}
			get{return _macadd;}
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

