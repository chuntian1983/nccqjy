﻿/**
* BidChangeScan.cs
*
* 类 名： BidChangeScan
*
* Ver    变更日期            负责人           变更内容
* ───────────────────────────────────
* V0.01  2016-4-27 18:11:21   N/A      wanghao
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
    /// BidChangeScan:实体类(属性说明自动提取数据库字段的描述信息)
    /// </summary>
    [Serializable]
    public partial class BidChangeScan
    {
        public BidChangeScan()
        { }
        #region Model
        private int _id;
        private int _fk_bidid = 0;
        private string _scanfilename = string.Empty;
        private string _scanfileurl = string.Empty;
        private string _editor = string.Empty;
        private DateTime _createdate = DateTime.Now;
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
        public int FK_BidId
        {
            set { _fk_bidid = value; }
            get { return _fk_bidid; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string ScanFileName
        {
            set { _scanfilename = value; }
            get { return _scanfilename; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string ScanFileUrl
        {
            set { _scanfileurl = value; }
            get { return _scanfileurl; }
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
        public DateTime CreateDate
        {
            set { _createdate = value; }
            get { return _createdate; }
        }
        #endregion Model

    }
}

