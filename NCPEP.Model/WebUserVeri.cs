/**
* WebUserVeri.cs
*
* 类 名： WebUserVeri
*
* Ver    变更日期            负责人           变更内容
* ───────────────────────────────────
* V0.01  2016-4-27 18:11:50   N/A      wanghao
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
	/// WebUserVeri:实体类(属性说明自动提取数据库字段的描述信息)
	/// </summary>
	[Serializable]
	public partial class WebUserVeri
	{
		public WebUserVeri()
		{}
		#region Model
		private int _id;
		private string _loginname = string.Empty;
		private string _loginpass = string.Empty;
		private string _username = string.Empty;
		private string _usertel = string.Empty;
		private string _useremail = string.Empty;
		private int _userstatus = 0;
        private DateTime _logindate;
		private int _loginnnum =0;
		private DateTime _outdate;
		private int _veri = 0;
		private int _membertypeid = 0;
		private string _veriname = string.Empty;
		private string _verisex = string.Empty;
		private string _veriidcard = string.Empty;
		private string _veriidcardscan = string.Empty;
		private string _orgcode = string.Empty;
		private string _veriaddress = string.Empty;
		private string _veritel = string.Empty;
		private string _vericorporate = string.Empty;
		private string _vericorporateidcard = string.Empty;
		private string _vericorporateidcardscan = string.Empty;
		private string _vericreditcode = string.Empty;
		private string _vericreditcodescan = string.Empty;
		private int _veristatus=0;
		private int _audittype=0;
		private string _vericheckname = string.Empty;
		private DateTime? _veriapplydate;
		private DateTime? _vericheckdate;
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
		public string LoginName
		{
			set{ _loginname=value;}
			get{return _loginname;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string LoginPass
		{
			set{ _loginpass=value;}
			get{return _loginpass;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string UserName
		{
			set{ _username=value;}
			get{return _username;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string UserTel
		{
			set{ _usertel=value;}
			get{return _usertel;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string UserEmail
		{
			set{ _useremail=value;}
			get{return _useremail;}
		}
		/// <summary>
		/// 
		/// </summary>
		public int UserStatus
		{
			set{ _userstatus=value;}
			get{return _userstatus;}
		}
		/// <summary>
		/// 
		/// </summary>
		public DateTime LoginDate
		{
			set{ _logindate=value;}
			get{return _logindate;}
		}
		/// <summary>
		/// 
		/// </summary>
		public int LoginnNum
		{
			set{ _loginnnum=value;}
			get{return _loginnnum;}
		}
		/// <summary>
		/// 
		/// </summary>
		public DateTime OutDate
		{
			set{ _outdate=value;}
			get{return _outdate;}
		}
		/// <summary>
		/// 
		/// </summary>
		public int Veri
		{
			set{ _veri=value;}
			get{return _veri;}
		}
		/// <summary>
		/// 
		/// </summary>
		public int MemberTypeId
		{
			set{ _membertypeid=value;}
			get{return _membertypeid;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string VeriName
		{
			set{ _veriname=value;}
			get{return _veriname;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string VeriSex
		{
			set{ _verisex=value;}
			get{return _verisex;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string VeriIDCard
		{
			set{ _veriidcard=value;}
			get{return _veriidcard;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string VeriIDCardScan
		{
			set{ _veriidcardscan=value;}
			get{return _veriidcardscan;}
		}
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
		public string VeriAddress
		{
			set{ _veriaddress=value;}
			get{return _veriaddress;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string VeriTel
		{
			set{ _veritel=value;}
			get{return _veritel;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string VeriCorporate
		{
			set{ _vericorporate=value;}
			get{return _vericorporate;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string VeriCorporateIDCard
		{
			set{ _vericorporateidcard=value;}
			get{return _vericorporateidcard;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string VeriCorporateIDCardScan
		{
			set{ _vericorporateidcardscan=value;}
			get{return _vericorporateidcardscan;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string VeriCreditCode
		{
			set{ _vericreditcode=value;}
			get{return _vericreditcode;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string VeriCreditCodeScan
		{
			set{ _vericreditcodescan=value;}
			get{return _vericreditcodescan;}
		}
		/// <summary>
		/// 
		/// </summary>
		public int VeriStatus
		{
			set{ _veristatus=value;}
			get{return _veristatus;}
		}
		/// <summary>
		/// 
		/// </summary>
		public int AuditType
		{
			set{ _audittype=value;}
			get{return _audittype;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string VeriCheckName
		{
			set{ _vericheckname=value;}
			get{return _vericheckname;}
		}
		/// <summary>
		/// 
		/// </summary>
		public DateTime? VeriApplyDate
		{
			set{ _veriapplydate=value;}
			get{return _veriapplydate;}
		}
		/// <summary>
		/// 
		/// </summary>
		public DateTime? VeriCheckDate
		{
			set{ _vericheckdate=value;}
			get{return _vericheckdate;}
		}
		#endregion Model

	}
}

