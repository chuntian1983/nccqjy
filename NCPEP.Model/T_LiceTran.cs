using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace NCPEP.Model
{
    /// <summary>
    /// T_LiceTran:实体类(属性说明自动提取数据库字段的描述信息)
    /// </summary>
    [Serializable]
    public partial class T_LiceTran
    {
        public T_LiceTran()
        { }
        #region Model
        private int _id;
        private int _fk_webuserveriid;
        private int _licetrantype;
        private string _orgcode;
        private int _membertypeid;
        private string _name;
        private string _addr;
        private string _contact;
        private string _corporate;
        private string _idcard;
        private string _organizationcode;
        private string _tel;
        private string _owner;
        private string _capital;
        private DateTime _applydate;
        private int _audittype;
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
        public int FK_WebUserVeriId
        {
            set { _fk_webuserveriid = value; }
            get { return _fk_webuserveriid; }
        }
        /// <summary>
        /// 
        /// </summary>
        public int LiceTranType
        {
            set { _licetrantype = value; }
            get { return _licetrantype; }
        }
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
        public int MemberTypeId
        {
            set { _membertypeid = value; }
            get { return _membertypeid; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string Name
        {
            set { _name = value; }
            get { return _name; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string Addr
        {
            set { _addr = value; }
            get { return _addr; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string Contact
        {
            set { _contact = value; }
            get { return _contact; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string Corporate
        {
            set { _corporate = value; }
            get { return _corporate; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string IDCard
        {
            set { _idcard = value; }
            get { return _idcard; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string OrganizationCode
        {
            set { _organizationcode = value; }
            get { return _organizationcode; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string Tel
        {
            set { _tel = value; }
            get { return _tel; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string Owner
        {
            set { _owner = value; }
            get { return _owner; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string Capital
        {
            set { _capital = value; }
            get { return _capital; }
        }
        /// <summary>
        /// 
        /// </summary>
        public DateTime ApplyDate
        {
            set { _applydate = value; }
            get { return _applydate; }
        }
        /// <summary>
        /// 
        /// </summary>
        public int AuditType
        {
            set { _audittype = value; }
            get { return _audittype; }
        }
        #endregion Model

    }
}
