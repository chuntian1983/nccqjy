using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace NCPEP.Model
{
    /// <summary>
    /// T_Jzs:实体类(属性说明自动提取数据库字段的描述信息)
    /// </summary>
    [Serializable]
    public partial class T_Jzs
    {
        public T_Jzs()
        { }
        #region Model
        private int _id;
        private string _zcdate;
        private string _zcdatez;
        private string _cjje;
        private string _htbh;
        private string _binid;
        private string _beizhu;
        private string _beiyong;
        private string _beiyong2;
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
        public string zcdate
        {
            set { _zcdate = value; }
            get { return _zcdate; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string zcdatez
        {
            set { _zcdatez = value; }
            get { return _zcdatez; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string cjje
        {
            set { _cjje = value; }
            get { return _cjje; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string htbh
        {
            set { _htbh = value; }
            get { return _htbh; }
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
        public string beizhu
        {
            set { _beizhu = value; }
            get { return _beizhu; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string beiyong
        {
            set { _beiyong = value; }
            get { return _beiyong; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string beiyong2
        {
            set { _beiyong2 = value; }
            get { return _beiyong2; }
        }
        #endregion Model

    }
}
