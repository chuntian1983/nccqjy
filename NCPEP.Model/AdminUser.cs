/**
* AdminUser.cs
*
* 类 名： AdminUser
*
* Ver    变更日期            负责人           变更内容
* ───────────────────────────────────
* V0.01  2016-4-27 18:11:18   N/A      wanghao
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
	/// AdminUser:实体类(属性说明自动提取数据库字段的描述信息)
	/// </summary>
	[Serializable]
	public class AdminUser
	{
		public AdminUser()
		{}
		#region Model
		private int _id;
		private string _adminlogname =string.Empty;
        private string _adminlogpass = string.Empty;
        private string _adminname = string.Empty;
        private string _admintel = string.Empty;
        private string _orgcode = string.Empty;
        private int _admintypeid = 0;
        private int _jobid = 0;
		private int _adminstate=0;
		private int _adminlognum=0;
		private int _ischeck=0;
        private string _editor = string.Empty;
		private DateTime _createdate= DateTime.Now;
        private DateTime _enddate = DateTime.Now;
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
		public string AdminLogName
		{
			set{ _adminlogname=value;}
			get{return _adminlogname;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string AdminLogPass
		{
			set{ _adminlogpass=value;}
			get{return _adminlogpass;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string AdminName
		{
			set{ _adminname=value;}
			get{return _adminname;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string AdminTel
		{
			set{ _admintel=value;}
			get{return _admintel;}
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
		public int AdminTypeId
		{
			set{ _admintypeid=value;}
			get{return _admintypeid;}
		}
		/// <summary>
		/// 
		/// </summary>
		public int JobId
		{
			set{ _jobid=value;}
			get{return _jobid;}
		}
		/// <summary>
		/// 
		/// </summary>
		public int AdminState
		{
			set{ _adminstate=value;}
			get{return _adminstate;}
		}
		/// <summary>
		/// 
		/// </summary>
		public int AdminLogNum
		{
			set{ _adminlognum=value;}
			get{return _adminlognum;}
		}
		/// <summary>
		/// 
		/// </summary>
		public int IsCheck
		{
			set{ _ischeck=value;}
			get{return _ischeck;}
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
		/// <summary>
		/// 
		/// </summary>
		public DateTime EndDate
		{
			set{ _enddate=value;}
			get{return _enddate;}
		}
		#endregion Model

	}
}

