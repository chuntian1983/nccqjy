using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace NCPEP.Model
{
    /// <summary>
    /// T_Dysq:实体类(属性说明自动提取数据库字段的描述信息)
    /// </summary>
    [Serializable]
    public partial class T_Dysq
    {
        public T_Dysq()
        { }
        #region Model
        private int _id;
        private string _fid;
        private string _dycs;
        private string _dysqnr;
        private string _dysqsj;
        private string _dyzt;
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
        public string fid
        {
            set { _fid = value; }
            get { return _fid; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string dycs
        {
            set { _dycs = value; }
            get { return _dycs; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string dysqnr
        {
            set { _dysqnr = value; }
            get { return _dysqnr; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string dysqsj
        {
            set { _dysqsj = value; }
            get { return _dysqsj; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string dyzt
        {
            set { _dyzt = value; }
            get { return _dyzt; }
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
