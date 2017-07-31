/**
* AuditOpinion.cs
*
* 类 名： AuditOpinion
*
* Ver    变更日期            负责人           变更内容
* ───────────────────────────────────
* V0.01  2016-4-27 18:11:18   N/A      wanghao
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
	/// AuditOpinion:实体类(属性说明自动提取数据库字段的描述信息)
	/// </summary>
	[Serializable]
	public partial class AuditOpinion
	{
		public AuditOpinion()
		{}
		#region Model
		private int _id;
		private int _fk_webuserveriid=0;
        private string _checkname = string.Empty;
        private string _checkopinion = string.Empty;
		private DateTime _opiniondate= DateTime.Now;
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
		public string CheckName
		{
			set{ _checkname=value;}
			get{return _checkname;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string CheckOpinion
		{
			set{ _checkopinion=value;}
			get{return _checkopinion;}
		}
		/// <summary>
		/// 
		/// </summary>
		public DateTime OpinionDate
		{
			set{ _opiniondate=value;}
			get{return _opiniondate;}
		}
		#endregion Model

	}
}

