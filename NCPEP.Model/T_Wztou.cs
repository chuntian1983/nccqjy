using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace NCPEP.Model
{
    /// <summary>
    /// T_Wztou:实体类(属性说明自动提取数据库字段的描述信息)
    /// </summary>
    [Serializable]
    public partial class T_Wztou
    {
        public T_Wztou()
        { }
        #region Model
        private int _id;
        private string _wztou;
        private string _zzcode;
        private string _beizhu;
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
        public string wztou
        {
            set { _wztou = value; }
            get { return _wztou; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string zzcode
        {
            set { _zzcode = value; }
            get { return _zzcode; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string beizhu
        {
            set { _beizhu = value; }
            get { return _beizhu; }
        }
        #endregion Model

    }
}
