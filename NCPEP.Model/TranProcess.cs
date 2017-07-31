/**
* TranProcess.cs
*
* 类 名： TranProcess
*
* Ver    变更日期            负责人           变更内容
* ───────────────────────────────────
* V0.01  2016-4-27 18:11:45   N/A      wanghao
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
	/// TranProcess:实体类(属性说明自动提取数据库字段的描述信息)
	/// </summary>
	[Serializable]
	public partial class TranProcess
	{
		public TranProcess()
		{}
		#region Model
		private int _id;
		private int _fk_bidid= 0;
		private DateTime? _acceptdate;
		private string _acceptname= string.Empty;
		private string _acceptsay= string.Empty;
		private DateTime? _acceptsaydate;
		private DateTime? _auditdate;
		private string _auditname= string.Empty;
		private string _auditsay= string.Empty;
		private DateTime? _auditsaydate;
        private DateTime? _tradingdate;
		private string _tradingname= string.Empty;
		private string _tradingsay= string.Empty;
        private DateTime? _tradingsaydate;
        private DateTime? _attestationdate;
		private string _attestationname= string.Empty;
		private string _attestationsay= string.Empty;
        private DateTime? _attestationsaydate;
        private DateTime? _headdate;
		private string _headname= string.Empty;
		private string _headsay= string.Empty;
        private DateTime? _headsaydate;
        private DateTime? _superdate;
		private string _supername= string.Empty;
		private string _supersay= string.Empty;
        private DateTime? _supersaydate;
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
		public DateTime? AcceptDate
		{
			set{ _acceptdate=value;}
			get{return _acceptdate;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string AcceptName
		{
			set{ _acceptname=value;}
			get{return _acceptname;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string AcceptSay
		{
			set{ _acceptsay=value;}
			get{return _acceptsay;}
		}
		/// <summary>
		/// 
		/// </summary>
		public DateTime? AcceptSayDate
		{
			set{ _acceptsaydate=value;}
			get{return _acceptsaydate;}
		}
		/// <summary>
		/// 
		/// </summary>
		public DateTime? AuditDate
		{
			set{ _auditdate=value;}
			get{return _auditdate;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string AuditName
		{
			set{ _auditname=value;}
			get{return _auditname;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string AuditSay
		{
			set{ _auditsay=value;}
			get{return _auditsay;}
		}
		/// <summary>
		/// 
		/// </summary>
		public DateTime? AuditSayDate
		{
			set{ _auditsaydate=value;}
			get{return _auditsaydate;}
		}
		/// <summary>
		/// 
		/// </summary>
		public DateTime? TradingDate
		{
			set{ _tradingdate=value;}
			get{return _tradingdate;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string TradingName
		{
			set{ _tradingname=value;}
			get{return _tradingname;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string TradingSay
		{
			set{ _tradingsay=value;}
			get{return _tradingsay;}
		}
		/// <summary>
		/// 
		/// </summary>
		public DateTime? TradingSayDate
		{
			set{ _tradingsaydate=value;}
			get{return _tradingsaydate;}
		}
		/// <summary>
		/// 
		/// </summary>
		public DateTime? AttestationDate
		{
			set{ _attestationdate=value;}
			get{return _attestationdate;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string AttestationName
		{
			set{ _attestationname=value;}
			get{return _attestationname;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string AttestationSay
		{
			set{ _attestationsay=value;}
			get{return _attestationsay;}
		}
		/// <summary>
		/// 
		/// </summary>
		public DateTime? AttestationSayDate
		{
			set{ _attestationsaydate=value;}
			get{return _attestationsaydate;}
		}
		/// <summary>
		/// 
		/// </summary>
		public DateTime? HeadDate
		{
			set{ _headdate=value;}
			get{return _headdate;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string HeadName
		{
			set{ _headname=value;}
			get{return _headname;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string HeadSay
		{
			set{ _headsay=value;}
			get{return _headsay;}
		}
		/// <summary>
		/// 
		/// </summary>
		public DateTime? HeadSayDate
		{
			set{ _headsaydate=value;}
			get{return _headsaydate;}
		}
		/// <summary>
		/// 
		/// </summary>
		public DateTime? SuperDate
		{
			set{ _superdate=value;}
			get{return _superdate;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string SuperName
		{
			set{ _supername=value;}
			get{return _supername;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string SuperSay
		{
			set{ _supersay=value;}
			get{return _supersay;}
		}
		/// <summary>
		/// 
		/// </summary>
		public DateTime? SuperSayDate
		{
			set{ _supersaydate=value;}
			get{return _supersaydate;}
		}
		#endregion Model

	}
}

