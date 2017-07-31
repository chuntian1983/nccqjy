/**
* LiceTranCheck.cs
*
* 类 名： LiceTranCheck
*
* Ver    变更日期            负责人           变更内容
* ───────────────────────────────────
* V0.01  2016-4-27 18:11:28   N/A      wanghao
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
	/// LiceTranCheck:实体类(属性说明自动提取数据库字段的描述信息)
	/// </summary>
	[Serializable]
	public partial class LiceTranCheck
	{
		public LiceTranCheck()
		{}
		#region Model
		private int _id;
		private int _fk_licetranid= 0;
		private string _reviewer= string.Empty;
		private string _auditsay= string.Empty;
		private DateTime _auditdate= DateTime.Now;
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
		public string Reviewer
		{
			set{ _reviewer=value;}
			get{return _reviewer;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string AuditSay
		{
			set{ _auditsay=value;}
			get{return _auditsay;}
		}
		/// <summary>
		/// 
		/// </summary>
		public DateTime AuditDate
		{
			set{ _auditdate=value;}
			get{return _auditdate;}
		}
		#endregion Model

	}
}

