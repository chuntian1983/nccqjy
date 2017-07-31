/**
* BidLost.cs
*
* 类 名： BidLost
*
* Ver    变更日期            负责人           变更内容
* ───────────────────────────────────
* V0.01  2016-4-27 18:11:22   N/A      wanghao
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
	/// BidLost:实体类(属性说明自动提取数据库字段的描述信息)
	/// </summary>
	[Serializable]
	public partial class BidLost
	{
		public BidLost()
		{}
		#region Model
		private int _id;
		private int _fk_bidid= 0;
		private string _lostname= string.Empty;
		private DateTime _lostdate;
		private string _lostparts= string.Empty;
		private string _lostcause= string.Empty;
		private string _remark= string.Empty;
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
		public int FK_BidId
		{
			set{ _fk_bidid=value;}
			get{return _fk_bidid;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string LostName
		{
			set{ _lostname=value;}
			get{return _lostname;}
		}
		/// <summary>
		/// 
		/// </summary>
		public DateTime LostDate
		{
			set{ _lostdate=value;}
			get{return _lostdate;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string LostParts
		{
			set{ _lostparts=value;}
			get{return _lostparts;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string LostCause
		{
			set{ _lostcause=value;}
			get{return _lostcause;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string Remark
		{
			set{ _remark=value;}
			get{return _remark;}
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

