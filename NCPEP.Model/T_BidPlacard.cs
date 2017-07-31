using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace NCPEP.Model
{
    /// <summary>
    /// T_BidPlacard:实体类(属性说明自动提取数据库字段的描述信息)
    /// </summary>
    [Serializable]
    public partial class T_BidPlacard
    {
        public T_BidPlacard()
        { }
        #region Model
        private int _id;
        private int _fk_bidid;
        private string _bidplacardtitle;
        private string _bidplacardcontent;
        private string _publisher;
        private DateTime _releasetime = DateTime.Now;
        private string _fujian;
        private string _fujianname;
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
        public string BidPlacardTitle
        {
            set { _bidplacardtitle = value; }
            get { return _bidplacardtitle; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string BidPlacardContent
        {
            set { _bidplacardcontent = value; }
            get { return _bidplacardcontent; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string Publisher
        {
            set { _publisher = value; }
            get { return _publisher; }
        }
        /// <summary>
        /// 
        /// </summary>
        public DateTime ReleaseTime
        {
            set { _releasetime = value; }
            get { return _releasetime; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string fujian
        {
            set { _fujian = value; }
            get { return _fujian; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string fujianname
        {
            set { _fujianname = value; }
            get { return _fujianname; }
        }
        #endregion Model

    }
}
