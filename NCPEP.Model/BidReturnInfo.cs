/**
* BidReturnInfo.cs
*
* 类 名： BidReturnInfo
*
* Ver    变更日期            负责人           变更内容
* ───────────────────────────────────
* V0.01  2016-4-27 18:11:24   N/A      wanghao
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
	/// BidReturnInfo:实体类(属性说明自动提取数据库字段的描述信息)
	/// </summary>
	[Serializable]
	public partial class BidReturnInfo
	{
		public BidReturnInfo()
		{}
		#region Model
		private int _id;
		private int _fk_bidid=0;
		private int _fk_jobid= 0;
		private string _returndepaname= string.Empty;
		private string _returndepasay= string.Empty;
		private DateTime _returndate= DateTime.Now;
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
		public int FK_BidId
		{
			set{ _fk_bidid=value;}
			get{return _fk_bidid;}
		}
		/// <summary>
		/// 
		/// </summary>
		public int FK_JobId
		{
			set{ _fk_jobid=value;}
			get{return _fk_jobid;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string ReturnDepaName
		{
			set{ _returndepaname=value;}
			get{return _returndepaname;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string ReturnDepaSay
		{
			set{ _returndepasay=value;}
			get{return _returndepasay;}
		}
		/// <summary>
		/// 
		/// </summary>
		public DateTime ReturnDate
		{
			set{ _returndate=value;}
			get{return _returndate;}
		}
		#endregion Model

	}
}

