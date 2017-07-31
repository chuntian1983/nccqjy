/**
* Organization.cs
*
* 类 名： Organization
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
	/// Organization:实体类(属性说明自动提取数据库字段的描述信息)
	/// </summary>
	[Serializable]
	public partial class Organization
	{
		public Organization()
		{}
		#region Model
		private string _orgcode= string.Empty;
		private string _orgname= string.Empty;
		private string _orgshortname= string.Empty;
		private string _uporgcode= string.Empty;
		private int _seq= 0;
		private int _level= 0;
		private string _shengcode= string.Empty;
		private string _shicode= string.Empty;
		private string _xiancode= string.Empty;
		private string _xiangcode= string.Empty;
		private string _cuncode= string.Empty;
		private string _zucode= string.Empty;
		/// <summary>
		/// 
		/// </summary>
		public string OrgCode
		{
			set{ _orgcode=value;}
			get{return _orgcode;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string OrgName
		{
			set{ _orgname=value;}
			get{return _orgname;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string OrgShortName
		{
			set{ _orgshortname=value;}
			get{return _orgshortname;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string UpOrgCode
		{
			set{ _uporgcode=value;}
			get{return _uporgcode;}
		}
		/// <summary>
		/// 
		/// </summary>
		public int Seq
		{
			set{ _seq=value;}
			get{return _seq;}
		}
		/// <summary>
		/// 
		/// </summary>
		public int Level
		{
			set{ _level=value;}
			get{return _level;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string ShengCode
		{
			set{ _shengcode=value;}
			get{return _shengcode;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string ShiCode
		{
			set{ _shicode=value;}
			get{return _shicode;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string XianCode
		{
			set{ _xiancode=value;}
			get{return _xiancode;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string XiangCode
		{
			set{ _xiangcode=value;}
			get{return _xiangcode;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string CunCode
		{
			set{ _cuncode=value;}
			get{return _cuncode;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string ZuCode
		{
			set{ _zucode=value;}
			get{return _zucode;}
		}
		#endregion Model

	}
}

