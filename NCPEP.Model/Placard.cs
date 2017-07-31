/**
* Placard.cs
*
* 类 名： Placard
*
* Ver    变更日期            负责人           变更内容
* ───────────────────────────────────
* V0.01  2016-4-27 18:11:35   N/A      wanghao
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
	/// Placard:实体类(属性说明自动提取数据库字段的描述信息)
	/// </summary>
	[Serializable]
	public partial class Placard
	{
		public Placard()
		{}
		#region Model
		private int _id;
		private string _placardtitle= string.Empty;
		private string _placardcontent= string.Empty;
		private string _publisher= string.Empty;
		private DateTime _releasetime= DateTime.Now;
		private int _numclicks=0;
		private string _depname= string.Empty;
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
		public string PlacardTitle
		{
			set{ _placardtitle=value;}
			get{return _placardtitle;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string PlacardContent
		{
			set{ _placardcontent=value;}
			get{return _placardcontent;}
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
		/// <summary>
		/// 
		/// </summary>
		public int NumClicks
		{
			set{ _numclicks=value;}
			get{return _numclicks;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string DepName
		{
			set{ _depname=value;}
			get{return _depname;}
		}
		#endregion Model

	}
}

