using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace NCPEP.Model
{
    /// <summary>
    /// T_Organization:实体类(属性说明自动提取数据库字段的描述信息)
    /// </summary>
    [Serializable]
    public partial class T_Organization
    {
        public T_Organization()
        { }
        #region Model
        private string _orgcode;
        private string _orgname;
        private string _orgshortname;
        private string _uporgcode;
        private int _seq;
        private int _level;
        private string _shengcode = "";
        private string _shicode = "";
        private string _xiancode = "";
        private string _xiangcode = "";
        private string _cuncode = "";
        private string _zucode = "";
        /// <summary>
        /// 
        /// </summary>
        public string OrgCode
        {
            set { _orgcode = value; }
            get { return _orgcode; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string OrgName
        {
            set { _orgname = value; }
            get { return _orgname; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string OrgShortName
        {
            set { _orgshortname = value; }
            get { return _orgshortname; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string UpOrgCode
        {
            set { _uporgcode = value; }
            get { return _uporgcode; }
        }
        /// <summary>
        /// 
        /// </summary>
        public int Seq
        {
            set { _seq = value; }
            get { return _seq; }
        }
        /// <summary>
        /// 
        /// </summary>
        public int Level
        {
            set { _level = value; }
            get { return _level; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string ShengCode
        {
            set { _shengcode = value; }
            get { return _shengcode; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string ShiCode
        {
            set { _shicode = value; }
            get { return _shicode; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string XianCode
        {
            set { _xiancode = value; }
            get { return _xiancode; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string XiangCode
        {
            set { _xiangcode = value; }
            get { return _xiangcode; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string CunCode
        {
            set { _cuncode = value; }
            get { return _cuncode; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string ZuCode
        {
            set { _zucode = value; }
            get { return _zucode; }
        }
        #endregion Model

    }
}
