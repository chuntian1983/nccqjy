using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace NCPEP.Model
{
    /// <summary>
    /// 指标类型
    /// </summary>
    [Serializable]
    public partial class T_UploadTypeIndicator
    {
        public T_UploadTypeIndicator()
        { }
        #region Model
        private int _id;
        private string _typeindicatorname;
        private string _editor;
        private DateTime? _createdate = DateTime.Now;
        /// <summary>
        /// id
        /// </summary>
        public int Id
        {
            set { _id = value; }
            get { return _id; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string TypeIndicatorName
        {
            set { _typeindicatorname = value; }
            get { return _typeindicatorname; }
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
