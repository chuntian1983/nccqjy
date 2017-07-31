using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace NCPEP.Model
{
    /// <summary>
    /// 会员类型表即指标对应类型表
    /// </summary>
    [Serializable]
    public partial class T_MemberTypeCertification
    {
        public T_MemberTypeCertification()
        { }
        #region Model
        private int _id;
        private string _typecertificationname;
        private string _editor;
        private DateTime? _createdate = DateTime.Now;
        /// <summary>
        /// 
        /// </summary>
        public int Id
        {
            set { _id = value; }
            get { return _id; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string TypeCertificationName
        {
            set { _typecertificationname = value; }
            get { return _typecertificationname; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string Editor
        {
            set { _editor = value; }
            get { return _editor; }
        }
        /// <summary>
        /// 
        /// </summary>
        public DateTime? CreateDate
        {
            set { _createdate = value; }
            get { return _createdate; }
        }
        #endregion Model

    }
}
