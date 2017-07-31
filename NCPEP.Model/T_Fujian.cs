using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace NCPEP.Model
{
    /// <summary>
    /// T_Fujian:实体类(属性说明自动提取数据库字段的描述信息)
    /// </summary>
    [Serializable]
    public partial class T_Fujian
    {
        public T_Fujian()
        { }
        #region Model
        private int _id;
        private string _fjname;
        private string _fjpath;
        private string _fid;
        private string _fjlx;
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
        public string fjname
        {
            set { _fjname = value; }
            get { return _fjname; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string fjpath
        {
            set { _fjpath = value; }
            get { return _fjpath; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string fid
        {
            set { _fid = value; }
            get { return _fid; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string fjlx
        {
            set { _fjlx = value; }
            get { return _fjlx; }
        }
        #endregion Model

    }
}
