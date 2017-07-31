using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace NCPEP.Model
{
    /// <summary>
    /// T_Dyjl:实体类(属性说明自动提取数据库字段的描述信息)
    /// </summary>
    [Serializable]
    public partial class T_Dyjl
    {
        public T_Dyjl()
        { }
        #region Model
        private int _id;
        private string _fid;
        private string _dysj;
        private string _dyr;
        private string _dysqid;
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
        public string fid
        {
            set { _fid = value; }
            get { return _fid; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string dysj
        {
            set { _dysj = value; }
            get { return _dysj; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string dyr
        {
            set { _dyr = value; }
            get { return _dyr; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string dysqid
        {
            set { _dysqid = value; }
            get { return _dysqid; }
        }
        #endregion Model

    }
}
