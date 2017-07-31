using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace NCPEP.Model
{
    /// <summary>
    /// T_Dyzt:实体类(属性说明自动提取数据库字段的描述信息)
    /// </summary>
    [Serializable]
    public partial class T_Dyzt
    {
        public T_Dyzt()
        { }
        #region Model
        private int _id;
        private string _binid;
        private string _dyzt;
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
        public string binid
        {
            set { _binid = value; }
            get { return _binid; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string dyzt
        {
            set { _dyzt = value; }
            get { return _dyzt; }
        }
        #endregion Model

    }
}
