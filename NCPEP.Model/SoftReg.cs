/**
* SoftReg.cs
*
* 类 名： SoftReg
*
* Ver    变更日期            负责人           变更内容
* ───────────────────────────────────
* V0.01  2016-4-27 18:11:38   N/A      wanghao
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
	/// SoftReg:实体类(属性说明自动提取数据库字段的描述信息)
	/// </summary>
	[Serializable]
	public partial class SoftReg
	{
		public SoftReg()
		{}
		#region Model
		private string _sequencenumber= string.Empty;
		/// <summary>
		/// 
		/// </summary>
		public string SequenceNumber
		{
			set{ _sequencenumber=value;}
			get{return _sequencenumber;}
		}
		#endregion Model

	}
}

