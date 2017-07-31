/**
* TempUser.cs
*
* 类 名： TempUser
*
* Ver    变更日期            负责人           变更内容
* ───────────────────────────────────
* V0.01  2016-4-27 18:11:44   N/A      wanghao
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
	/// TempUser:实体类(属性说明自动提取数据库字段的描述信息)
	/// </summary>
	[Serializable]
	public partial class TempUser
	{
		public TempUser()
		{}
		#region Model
		private int _id;
		private int _fk_licetranid= 0;
		private string _templogname= string.Empty;
		private string _templogpass= string.Empty;
		private int _tempstatus=0;
        private DateTime _closedatetime = DateTime.Now;
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
		public int FK_LiceTranId
		{
			set{ _fk_licetranid=value;}
			get{return _fk_licetranid;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string TempLogName
		{
			set{ _templogname=value;}
			get{return _templogname;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string TempLogPass
		{
			set{ _templogpass=value;}
			get{return _templogpass;}
		}
		/// <summary>
		/// 
		/// </summary>
		public int TempStatus
		{
			set{ _tempstatus=value;}
			get{return _tempstatus;}
		}
		/// <summary>
		/// 
		/// </summary>
		public DateTime CloseDateTime
		{
			set{ _closedatetime=value;}
			get{return _closedatetime;}
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

