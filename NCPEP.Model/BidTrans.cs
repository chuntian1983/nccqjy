/**
* BidTrans.cs
*
* 类 名： BidTrans
*
* Ver    变更日期            负责人           变更内容
* ───────────────────────────────────
* V0.01  2016-4-27 18:11:25   N/A      wanghao
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
	/// BidTrans:实体类(属性说明自动提取数据库字段的描述信息)
	/// </summary>
	[Serializable]
	public partial class BidTrans
	{
		public BidTrans()
		{}
		#region Model
		private int _id;
		private int _fk_bidid= 0;
		private int _fk_licetranid= 0;
		private int _tradingstatus= 0;
		private string _editor= string.Empty;
		private DateTime _createdate= DateTime.Now;
        private DateTime _applydate = DateTime.Now;
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
		public int FK_LiceTranId
		{
			set{ _fk_licetranid=value;}
			get{return _fk_licetranid;}
		}
		/// <summary>
		/// 
		/// </summary>
		public int TradingStatus
		{
			set{ _tradingstatus=value;}
			get{return _tradingstatus;}
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

        public DateTime ApplyDate
        {
            set { _applydate = value; }
            get { return _applydate; }
        }
		#endregion Model

	}
}

