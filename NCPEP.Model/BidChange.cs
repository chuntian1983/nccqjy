/**
* BidChange.cs
*
* 类 名： BidChange
*
* Ver    变更日期            负责人           变更内容
* ───────────────────────────────────
* V0.01  2016-4-27 18:11:20   N/A      wanghao
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
    /// BidChange:实体类(属性说明自动提取数据库字段的描述信息)
    /// </summary>
    [Serializable]
    public partial class BidChange
    {
        public BidChange()
        { }
        #region Model
        private int _id;
        private int _fk_bidid = 0;
        private string _bidname = string.Empty;
        private decimal _listingprice = 0;
        private DateTime _startdate;
        private DateTime _enddate;
        private string _bidbasic = string.Empty;
        private string _ownership = string.Empty;
        private string _properties = string.Empty;
        private int? _turnout = 0;
        private string _rightsbodies = string.Empty;
        private string _feedingmechanism = string.Empty;
        private string _warrantnumber = string.Empty;
        private int? _meanstransaction = 0;
        private decimal? _lowtransaction = 0;
        private decimal? _turnover = 0;
        private int _relatesnum = 0;
        /// <summary>
        /// 
        /// </summary>
        public int Id
        {
            set { _id = value; }
            get { return _id; }
        }
        /// <summary>
        /// 
        /// </summary>
        public int FK_BidId
        {
            set { _fk_bidid = value; }
            get { return _fk_bidid; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string BidName
        {
            set { _bidname = value; }
            get { return _bidname; }
        }
        /// <summary>
        /// 
        /// </summary>
        public decimal ListingPrice
        {
            set { _listingprice = value; }
            get { return _listingprice; }
        }
        /// <summary>
        /// 
        /// </summary>
        public DateTime StartDate
        {
            set { _startdate = value; }
            get { return _startdate; }
        }
        /// <summary>
        /// 
        /// </summary>
        public DateTime EndDate
        {
            set { _enddate = value; }
            get { return _enddate; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string BidBasic
        {
            set { _bidbasic = value; }
            get { return _bidbasic; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string Ownership
        {
            set { _ownership = value; }
            get { return _ownership; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string Properties
        {
            set { _properties = value; }
            get { return _properties; }
        }
        /// <summary>
        /// 
        /// </summary>
        public int? TurnOut
        {
            set { _turnout = value; }
            get { return _turnout; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string RightsBodies
        {
            set { _rightsbodies = value; }
            get { return _rightsbodies; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string FeedingMechanism
        {
            set { _feedingmechanism = value; }
            get { return _feedingmechanism; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string WarrantNumber
        {
            set { _warrantnumber = value; }
            get { return _warrantnumber; }
        }
        /// <summary>
        /// 
        /// </summary>
        public int? MeansTransaction
        {
            set { _meanstransaction = value; }
            get { return _meanstransaction; }
        }
        /// <summary>
        /// 
        /// </summary>
        public decimal? LowTransaction
        {
            set { _lowtransaction = value; }
            get { return _lowtransaction; }
        }
        /// <summary>
        /// 
        /// </summary>
        public decimal? Turnover
        {
            set { _turnover = value; }
            get { return _turnover; }
        }
        /// <summary>
        /// 
        /// </summary>
        public int RelatesNum
        {
            set { _relatesnum = value; }
            get { return _relatesnum; }
        }
        #endregion Model

    }
}

