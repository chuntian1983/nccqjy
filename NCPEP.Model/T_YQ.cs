using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace NCPEP.Model
{
    /// <summary>
	/// T_YQ:实体类(属性说明自动提取数据库字段的描述信息)
	/// </summary>
	[Serializable]
    public partial class T_YQ
    {
        public T_YQ()
        { }
        #region Model
        private int _id;
        private string _yqname;
        private string _yqleixing;
        private string _yqlianjie;
        private string _beiyong;
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
        public string yqname
        {
            set { _yqname = value; }
            get { return _yqname; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string yqleixing
        {
            set { _yqleixing = value; }
            get { return _yqleixing; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string yqlianjie
        {
            set { _yqlianjie = value; }
            get { return _yqlianjie; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string beiyong
        {
            set { _beiyong = value; }
            get { return _beiyong; }
        }
        #endregion Model

    }
}
