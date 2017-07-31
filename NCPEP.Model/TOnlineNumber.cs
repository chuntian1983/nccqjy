/**
* OnlineNumber.cs
*
* 类 名： OnlineNumber
*
* Ver    变更日期            负责人           变更内容
* ───────────────────────────────────
* V0.01  2016-4-27 18:11:33   N/A      wanghao
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
	/// OnlineNumber:实体类(属性说明自动提取数据库字段的描述信息)
	/// </summary>
	[Serializable]
	public partial class TOnlineNumber
	{
		public TOnlineNumber()
		{}
		#region Model
		private int _onlinenumber=0;
		/// <summary>
		/// 
		/// </summary>
		public int OnlineNumber
		{
			set{ _onlinenumber=value;}
			get{return _onlinenumber;}
		}
		#endregion Model

	}
}

