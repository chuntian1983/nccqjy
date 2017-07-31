/**
* LiceTran.cs
*
* 类 名： LiceTran
*
* Ver    变更日期            负责人           变更内容
* ───────────────────────────────────
* V0.01  2016-4-27 18:11:28   N/A      wanghao
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
	/// LiceTran:实体类(属性说明自动提取数据库字段的描述信息)
	/// </summary>
	[Serializable]
	public partial class LiceTran
	{
		public LiceTran()
		{}
		#region Model
		private int _id;
        private int _fk_webuserveriid;
		private string _orgcode= string.Empty;
		private int _membertypeid= 0;
		private string _name= string.Empty;
		private string _addr= string.Empty;
		private string _contact= string.Empty;
		private string _corporate= string.Empty;
		private string _idcard= string.Empty;
		private string _organizationcode= string.Empty;
		private string _tel= string.Empty;
		private string _owner= string.Empty;
		private string _capital= string.Empty;
		private DateTime _applydate=DateTime.Now;
		private int _audittype= 0;
        private int _licetrantype=0;
		/// <summary>
		/// 
		/// </summary>
        public int FK_WebUserVeriId
		{
            set { _fk_webuserveriid = value; }
            get { return _fk_webuserveriid; }
		}
        //
        public int Id
        {
            set { _id = value; }
            get { return _id; }
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
		public int MemberTypeId
		{
			set{ _membertypeid=value;}
			get{return _membertypeid;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string Name
		{
			set{ _name=value;}
			get{return _name;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string Addr
		{
			set{ _addr=value;}
			get{return _addr;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string Contact
		{
			set{ _contact=value;}
			get{return _contact;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string Corporate
		{
			set{ _corporate=value;}
			get{return _corporate;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string IDCard
		{
			set{ _idcard=value;}
			get{return _idcard;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string OrganizationCode
		{
			set{ _organizationcode=value;}
			get{return _organizationcode;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string Tel
		{
			set{ _tel=value;}
			get{return _tel;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string Owner
		{
			set{ _owner=value;}
			get{return _owner;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string Capital
		{
			set{ _capital=value;}
			get{return _capital;}
		}
		/// <summary>
		/// 
		/// </summary>
		public DateTime ApplyDate
		{
			set{ _applydate=value;}
			get{return _applydate;}
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
        public int LiceTranType
        {
            set { _licetrantype = value; }
            get { return _licetrantype; }
        }
		#endregion Model

	}
}

