using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace NCPEP.Model
{
    /// <summary>
    /// T_JBTWO:实体类(属性说明自动提取数据库字段的描述信息)
    /// </summary>
    [Serializable]
    public partial class T_JBTWO
    {
        public T_JBTWO()
        { }
        #region Model
        private int _sid;
        private string _bid;
        private string _tid;
        private string _jbyhm;
        private string _jbjg;
        private string _jbdj;
        private string _zbzt;
        private string _beizhu;
        private string _jbbs;
        /// <summary>
        /// 
        /// </summary>
        public int sid
        {
            set { _sid = value; }
            get { return _sid; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string bid
        {
            set { _bid = value; }
            get { return _bid; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string tid
        {
            set { _tid = value; }
            get { return _tid; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string jbyhm
        {
            set { _jbyhm = value; }
            get { return _jbyhm; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string jbjg
        {
            set { _jbjg = value; }
            get { return _jbjg; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string jbdj
        {
            set { _jbdj = value; }
            get { return _jbdj; }
        }
        /// <summary>
        /// 中标状态1是中标
        /// </summary>
        public string zbzt
        {
            set { _zbzt = value; }
            get { return _zbzt; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string beizhu
        {
            set { _beizhu = value; }
            get { return _beizhu; }
        }
        /// <summary>
        /// 竞标标识
        /// </summary>
        public string jbbs
        {
            set { _jbbs = value; }
            get { return _jbbs; }
        }
        #endregion Model

    }
}
