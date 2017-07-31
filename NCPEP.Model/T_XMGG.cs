using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace NCPEP.Model
{
    /// <summary>
	/// T_XMGG:实体类(属性说明自动提取数据库字段的描述信息)
	/// </summary>
	[Serializable]
    public partial class T_XMGG
    {
        public T_XMGG()
        { }
        #region Model
        private int _id;
        private int _bid;
        private string _xmtitle;
        private string _xmneirong;
        private string _xmsj;
        private string _xmbz;
        private string _xmby;
        /// <summary>
        /// 
        /// </summary>
        public int id
        {
            set { _id = value; }
            get { return _id; }
        }
        /// <summary>
        /// 
        /// </summary>
        public int bid
        {
            set { _bid = value; }
            get { return _bid; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string xmtitle
        {
            set { _xmtitle = value; }
            get { return _xmtitle; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string xmneirong
        {
            set { _xmneirong = value; }
            get { return _xmneirong; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string xmsj
        {
            set { _xmsj = value; }
            get { return _xmsj; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string xmbz
        {
            set { _xmbz = value; }
            get { return _xmbz; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string xmby
        {
            set { _xmby = value; }
            get { return _xmby; }
        }
        #endregion Model

    }
}
