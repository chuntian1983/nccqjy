using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace NCPEP.Model
{
    /// <summary>
    /// T_News:实体类(属性说明自动提取数据库字段的描述信息)
    /// </summary>
    [Serializable]
    public partial class T_News
    {
        public T_News()
        { }
        #region Model
        private int _id;
        private int _newstypeid;
        private string _keyword;
        private string _content;
        private string _orgcode;
        private string _newstitle;
        private string _newssubheading;
        private string _newssource;
        private string _newscontent;
        private string _newsimg;
        private string _newsfile;
        private int _numclicks = 0;
        private int _ischeck = 0;
        private string _editor;
        private DateTime _createdate = DateTime.Now;
        private string _ztbz;
        private string _tzzt;
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
        public int NewsTypeId
        {
            set { _newstypeid = value; }
            get { return _newstypeid; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string Keyword
        {
            set { _keyword = value; }
            get { return _keyword; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string Content
        {
            set { _content = value; }
            get { return _content; }
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
        public string NewsTitle
        {
            set { _newstitle = value; }
            get { return _newstitle; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string NewsSubheading
        {
            set { _newssubheading = value; }
            get { return _newssubheading; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string NewsSource
        {
            set { _newssource = value; }
            get { return _newssource; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string NewsContent
        {
            set { _newscontent = value; }
            get { return _newscontent; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string NewsImg
        {
            set { _newsimg = value; }
            get { return _newsimg; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string NewsFile
        {
            set { _newsfile = value; }
            get { return _newsfile; }
        }
        /// <summary>
        /// 
        /// </summary>
        public int NumClicks
        {
            set { _numclicks = value; }
            get { return _numclicks; }
        }
        /// <summary>
        /// 
        /// </summary>
        public int IsCheck
        {
            set { _ischeck = value; }
            get { return _ischeck; }
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
        /// <summary>
        /// 专题通栏标志
        /// </summary>
        public string ztbz
        {
            set { _ztbz = value; }
            get { return _ztbz; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string TZZT
        {
            set { _tzzt = value; }
            get { return _tzzt; }
        }
        #endregion Model

    }
}
