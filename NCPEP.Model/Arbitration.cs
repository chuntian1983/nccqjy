/**
* Arbitration.cs
*
* 类 名： Arbitration
*
* Ver    变更日期            负责人           变更内容
* ───────────────────────────────────
* V0.01  2016-4-27 18:11:18   N/A      wanghao
*
* Copyright (c) wanghao Corporation. All rights reserved.
*┌───────────────────────────────────┐
*│　此代码信息为机密信息                                                │
*│  未经书面同意禁止向第三方披露                                        │
*│　设计研发：wanghao　　　　　　　　                                    │
*└───────────────────────────────────┘
*/
using System;
namespace NCPEP.Model
{
    /// <summary>
    /// Arbitration:实体类(属性说明自动提取数据库字段的描述信息)
    /// </summary>
    [Serializable]
    public partial class Arbitration
    {
        public Arbitration()
        { }
        #region Model
        private int _id;
        private int _fk_bidid = 0;
        private int _fk_liceid = 0;
        private int _fk_tranid = 0;
        private string _orgcode = string.Empty;
        private string _fact = string.Empty;
        private string _grounds = string.Empty;
        private string _results = string.Empty;
        private string _acceptname = string.Empty;
        private DateTime _acceptdate = DateTime.Now;
        /// <summary>
        /// 
        /// </summary>
        public int Id
        {
            set { _id = value; }
            get { return _id; }
        }
        //
        public string OrgCode
        {
            set { _orgcode = value; }
            get { return _orgcode; }
        }
        /// <summary>
        /// 
        /// </summary>
        public int FK_BidId
        {
            set { _fk_bidid = value; }
            get { return _fk_bidid; }
        }
        /// <summary>
        /// 
        /// </summary>
        public int FK_LiceId
        {
            set { _fk_liceid = value; }
            get { return _fk_liceid; }
        }
        /// <summary>
        /// 
        /// </summary>
        public int FK_TranId
        {
            set { _fk_tranid = value; }
            get { return _fk_tranid; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string Fact
        {
            set { _fact = value; }
            get { return _fact; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string Grounds
        {
            set { _grounds = value; }
            get { return _grounds; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string Results
        {
            set { _results = value; }
            get { return _results; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string AcceptName
        {
            set { _acceptname = value; }
            get { return _acceptname; }
        }
        /// <summary>
        /// 
        /// </summary>
        public DateTime AcceptDate
        {
            set { _acceptdate = value; }
            get { return _acceptdate; }
        }
        #endregion Model

    }
}

