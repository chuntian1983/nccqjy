/**
* BidPlacard.cs
*
* 类 名： BidPlacard
*
* Ver    变更日期            负责人           变更内容
* ───────────────────────────────────
* V0.01  2016-4-27 18:11:23   N/A      wanghao
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
	/// BidPlacard:实体类(属性说明自动提取数据库字段的描述信息)
	/// </summary>
	[Serializable]
	public partial class BidPlacard
	{
		public BidPlacard()
		{}
		#region Model
		private int _id;
		private int _fk_bidid= 0;
		private string _bidplacardtitle= string.Empty;
		private string _bidplacardcontent= string.Empty;
		private string _publisher= string.Empty;		
		private DateTime _releasetime= DateTime.Now;
        private string _fujian;
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
        public string fujian
        {
            set { _fujian = value; }
            get { return _fujian; }
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
		public string BidPlacardTitle
		{
			set{ _bidplacardtitle=value;}
			get{return _bidplacardtitle;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string BidPlacardContent
		{
			set{ _bidplacardcontent=value;}
			get{return _bidplacardcontent;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string Publisher
		{
			set{ _publisher=value;}
			get{return _publisher;}
		}
		
		/// <summary>
		/// 
		/// </summary>
		public DateTime ReleaseTime
		{
			set{ _releasetime=value;}
			get{return _releasetime;}
		}
		#endregion Model

	}
}

