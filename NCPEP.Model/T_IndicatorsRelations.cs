using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace NCPEP.Model
{
    /// <summary>
    /// 指标对应关系
    /// </summary>
    [Serializable]
    public partial class T_IndicatorsRelations
    {
        public T_IndicatorsRelations()
        { }
        #region Model
        private int _id;
        private int _applicationtype;
        private int _fk_membertypecertificationid;
        private int _fk_typeindicatornameid;
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
        public int ApplicationType
        {
            set { _applicationtype = value; }
            get { return _applicationtype; }
        }
        /// <summary>
        /// 
        /// </summary>
        public int FK_MemberTypeCertificationId
        {
            set { _fk_membertypecertificationid = value; }
            get { return _fk_membertypecertificationid; }
        }
        /// <summary>
        /// 
        /// </summary>
        public int FK_TypeIndicatorNameId
        {
            set { _fk_typeindicatornameid = value; }
            get { return _fk_typeindicatornameid; }
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
