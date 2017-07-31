/**
* BidPrintGrounds.cs
*
* 类 名： BidPrintGrounds
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
	/// BidPrintGrounds:实体类(属性说明自动提取数据库字段的描述信息)
	/// </summary>
	[Serializable]
	public partial class BidPrintGrounds
	{
		public BidPrintGrounds()
		{}
		#region Model
		private int _id;
		private int _fk_bidid=0;
		private int _printnum= 0;
		private string _printname= string.Empty;
		private string _reason= string.Empty;
		private DateTime _printdate= DateTime.Now;
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
		public int PrintNum
		{
			set{ _printnum=value;}
			get{return _printnum;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string PrintName
		{
			set{ _printname=value;}
			get{return _printname;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string Reason
		{
			set{ _reason=value;}
			get{return _reason;}
		}
		/// <summary>
		/// 
		/// </summary>
		public DateTime PrintDate
		{
			set{ _printdate=value;}
			get{return _printdate;}
		}
		#endregion Model

	}
}

