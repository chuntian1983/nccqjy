/**
* Bid.cs
*
* 类 名： Bid
*
* Ver    变更日期            负责人           变更内容
* ───────────────────────────────────
* V0.01  2016-4-27 18:11:19   N/A      wanghao
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
    /// Bid:实体类(属性说明自动提取数据库字段的描述信息)
    /// </summary>
    [Serializable]
    public partial class Bid
    {
        public Bid()
        { }
        #region Model
        private int _id = 0;
        private string _orgcode = string.Empty;
        private int _fk_licetranid = 0;
        private string _bidname = string.Empty;
        private string _listingprice = string.Empty;
        private DateTime _startdate = DateTime.Now;
        private DateTime _enddate = DateTime.Now.AddYears(10);
        private string _bidbasic = string.Empty;
        private string _ownership = string.Empty;
        private string _properties = string.Empty;
        private int _turnout = 0;
        private string _rightsbodies = string.Empty;
        private string _feedingmechanism = string.Empty;
        private string _warrantnumber = string.Empty;       
        private string _lowtransaction = string.Empty;
        private decimal _turnover = 0;
        private string _contractdate = string.Empty;
        private string _contractno = string.Empty;      
        private string _admissibility = string.Empty;       
        private string _noassurance = string.Empty;
        private string _tradingcentername = string.Empty;
        private string _arecontract = string.Empty;
        private string _relatesnum = string.Empty;
        private int _depastatus = 0;
        private int _returnstatus = 0;
        private int _upmanager = 0;
        private string _publicity = string.Empty;
        private int _change = 0;
        private int _cancel = 0;
        private int _lost = 0;
        private int _standardmode = 0;
        private int _standardtype = 0;

        /// <summary>
        /// 
        /// </summary>
        public int StandardMode
        {
            set { _standardmode = value; }
            get { return _standardmode; }
        }
        /// <summary>
        /// 
        /// </summary>
        public int StandardType
        {
            set { _standardtype = value; }
            get { return _standardtype; }
        }
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
        public string OrgCode
        {
            set { _orgcode = value; }
            get { return _orgcode; }
        }
        /// <summary>
        /// 
        /// </summary>
        public int FK_LiceTranId
        {
            set { _fk_licetranid = value; }
            get { return _fk_licetranid; }
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
        public string ListingPrice
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
        public int TurnOut
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
        public string LowTransaction
        {
            set { _lowtransaction = value; }
            get { return _lowtransaction; }
        }
        /// <summary>
        /// 
        /// </summary>
        public decimal Turnover
        {
            set { _turnover = value; }
            get { return _turnover; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string ContractDate
        {
            set { _contractdate = value; }
            get { return _contractdate; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string ContractNo
        {
            set { _contractno = value; }
            get { return _contractno; }
        }       
        /// <summary>
        /// 
        /// </summary>
        public string Admissibility
        {
            set { _admissibility = value; }
            get { return _admissibility; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string NoAssurance
        {
            set { _noassurance = value; }
            get { return _noassurance; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string TradingCenterName
        {
            set { _tradingcentername = value; }
            get { return _tradingcentername; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string AreContract
        {
            set { _arecontract = value; }
            get { return _arecontract; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string RelatesNum
        {
            set { _relatesnum = value; }
            get { return _relatesnum; }
        }
        /// <summary>
        /// 
        /// </summary>
        public int DepaStatus
        {
            set { _depastatus = value; }
            get { return _depastatus; }
        }
        /// <summary>
        /// 
        /// </summary>
        public int ReturnStatus
        {
            set { _returnstatus = value; }
            get { return _returnstatus; }
        }
        /// <summary>
        /// 
        /// </summary>
        public int UpManager
        {
            set { _upmanager = value; }
            get { return _upmanager; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string Publicity
        {
            set { _publicity = value; }
            get { return _publicity; }
        }
        /// <summary>
        /// 
        /// </summary>
        public int Change
        {
            set { _change = value; }
            get { return _change; }
        }
        /// <summary>
        /// 
        /// </summary>
        public int Cancel
        {
            set { _cancel = value; }
            get { return _cancel; }
        }
        /// <summary>
        /// 
        /// </summary>
        public int Lost
        {
            set { _lost = value; }
            get { return _lost; }
        }
        #endregion Model

    }
}

