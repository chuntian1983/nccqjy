using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace NCPEP.Model
{
    /// <summary>
    /// T_BidTrans:实体类(属性说明自动提取数据库字段的描述信息)
    /// </summary>
    [Serializable]
    public partial class T_BidTrans
    {
        public T_BidTrans()
        { }
        #region Model
        private int _id;
        private int _fk_bidid;
        private int _fk_licetranid;
        private int _tradingstatus;
        private string _editor;
        private DateTime _createdate = DateTime.Now;
        private DateTime _applydate;
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
        public int FK_LiceTranId
        {
            set { _fk_licetranid = value; }
            get { return _fk_licetranid; }
        }
        /// <summary>
        /// 
        /// </summary>
        public int TradingStatus
        {
            set { _tradingstatus = value; }
            get { return _tradingstatus; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string Editor
        {
            set { _editor = value; }
            get { return _editor; }
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
        /// 
        /// </summary>
        public DateTime ApplyDate
        {
            set { _applydate = value; }
            get { return _applydate; }
        }
        #endregion Model

    }
}
