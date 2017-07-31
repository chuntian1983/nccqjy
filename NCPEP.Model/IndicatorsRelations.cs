/**
* IndicatorsRelations.cs
*
* 类 名： IndicatorsRelations
*
* Ver    变更日期            负责人           变更内容
* ───────────────────────────────────
* V0.01  2016-4-27 18:11:26   N/A      wanghao
*
* Copyright (c) wanghao Corporation. All rights reserved.
*┌───────────────────────────────────┐
*│　此代码信息为机密信息             │
*│  未经书面同意禁止向第三方披露     │
*│　设计研发：wanghao　　　　　　　　 │
*└───────────────────────────────────┘
*/
using System;
namespace NCPEP.Model
{
    /// <summary>
    /// IndicatorsRelations:实体类(属性说明自动提取数据库字段的描述信息)
    /// </summary>
    [Serializable]
    public partial class IndicatorsRelations
    {
        public IndicatorsRelations()
        { }
        #region Model
        private int _id;
        private int _applicationtype = 0;
        private int _fk_membertypecertificationid = 0;
        private int _fk_typeindicatornameid = 0;
        private string _editor = string.Empty;
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

