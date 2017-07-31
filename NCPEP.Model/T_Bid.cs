using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace NCPEP.Model
{
    /// <summary>
    /// T_Bid:实体类(属性说明自动提取数据库字段的描述信息)
    /// </summary>
    [Serializable]
    public partial class T_Bid
    {
        public T_Bid()
        { }
        #region Model
        private int _id;
        private string _orgcode;
        private int _fk_licetranid;
        private string _bidname;
        private string _listingprice;
        private DateTime? _startdate = DateTime.Now;
        private DateTime? _enddate = DateTime.Now.AddYears(10);
        private string _bidbasic;
        private string _ownership;
        private string _properties;
        private int? _turnout= 0;
        private string _rightsbodies;
        private string _feedingmechanism;
        private string _warrantnumber;
        private string _lowtransaction;
        private decimal? _turnover = 0;
        private string _contractdate;
        private string _contractno;
        private string _admissibility;
        private string _noassurance;
        private string _tradingcentername;
        private string _arecontract;
        private string _relatesnum;
        private int? _depastatus = 0;
        private int? _returnstatus = 0;
        private int? _upmanager;
        private string _publicity;
        private int? _change = 0;
        private int? _cancel = 0;
        private int? _lost = 0;
        private int _standardmode;
        private int _standardtype;
        private DateTime _createdate = DateTime.Now;
        private string _guimo;
        private string _danwei;
        private string _sfzclz;
        private string _srfjbtj;
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
        public DateTime? StartDate
        {
            set { _startdate = value; }
            get { return _startdate; }
        }
        /// <summary>
        /// 
        /// </summary>
        public DateTime? EndDate
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
        public string LowTransaction
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
        public int? DepaStatus
        {
            set { _depastatus = value; }
            get { return _depastatus; }
        }
        /// <summary>
        /// 
        /// </summary>
        public int? ReturnStatus
        {
            set { _returnstatus = value; }
            get { return _returnstatus; }
        }
        /// <summary>
        /// 
        /// </summary>
        public int? UpManager
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
        public int? Change
        {
            set { _change = value; }
            get { return _change; }
        }
        /// <summary>
        /// 
        /// </summary>
        public int? Cancel
        {
            set { _cancel = value; }
            get { return _cancel; }
        }
        /// <summary>
        /// 
        /// </summary>
        public int? Lost
        {
            set { _lost = value; }
            get { return _lost; }
        }
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
        public DateTime CreateDate
        {
            set { _createdate = value; }
            get { return _createdate; }
        }
        /// <summary>
        /// 规模
        /// </summary>
        public string guimo
        {
            set { _guimo = value; }
            get { return _guimo; }
        }
        /// <summary>
        /// 单位
        /// </summary>
        public string danwei
        {
            set { _danwei = value; }
            get { return _danwei; }
        }
        /// <summary>
        /// 是否再次流转
        /// </summary>
        public string sfzclz
        {
            set { _sfzclz = value; }
            get { return _sfzclz; }
        }
        /// <summary>
        /// 受让方具备条件
        /// </summary>
        public string srfjbtj
        {
            set { _srfjbtj = value; }
            get { return _srfjbtj; }
        }
        #endregion Model

    }
}
