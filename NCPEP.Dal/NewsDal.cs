/**
* T_News.cs
*
* 类 名： T_News
*
* Ver    变更日期            负责人           变更内容
* ───────────────────────────────────
* V0.01  2016-5-3 09:22:55   N/A      wanghao
*
* Copyright (c) 2016 wanghao Corporation. All rights reserved.
*┌───────────────────────────────────┐
*│　此代码信息为机密信息             │
*│  未经书面同意禁止向第三方披露     │
*│　设计研发：wanghao　　　　　　　　 │
*└───────────────────────────────────┘
*/
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using NCPEP.Model;
using NCPEP.Com.Util;
using System.Data;

namespace NCPEP.Dal
{
    public class NewsDal
    {
        //
        private dynamic db = null;
        //
        public NewsDal()
        {
            db = new MsSqlHelper();
        }
        //
        public bool UpdateState(string row, string values, string where)
        {
            try
            {
                string strSql = string.Format("update T_News set {0}={1} where Id = {2}", row, values, where);
                if (db.ExecuteNonQuery(strSql) > 0)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch { throw; }
        }
        //
        public void UpdateNumClicks(int id)
        {
            string strSql = string.Format("update T_News set NumClicks = NumClicks + 1 where id= {0}", id);
            db.ExecuteNonQuery(strSql);
        }
        //
        public bool Create(News model)
        {
            try
            {
                StringBuilder strSql = new StringBuilder();
                strSql.Append("insert into T_News(");
                strSql.Append("NewsTypeId,Keyword,Content,OrgCode,NewsTitle,NewsSubheading,NewsSource,NewsContent,NewsImg,NewsFile,NumClicks,IsCheck,Editor,CreateDate)");
                strSql.Append(" values (");
                strSql.Append("@NewsTypeId,@Keyword,@Content,@OrgCode,@NewsTitle,@NewsSubheading,@NewsSource,@NewsContent,@NewsImg,@NewsFile,@NumClicks,@IsCheck,@Editor,@CreateDate)");
                if (db.ExecuteNonQuery(strSql.ToString(), GetSqlParameter(model)) > 0)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch { throw; }
        }
        //
        public bool Delete(string idList)
        {
            try
            {
                string strSql = string.Format("delete from T_News where Id in ({0})", idList);
                if (db.ExecuteNonQuery(strSql) > 0)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch { throw; }
        }
        //
        public bool Delete(int Id)
        {
            try
            {
                StringBuilder strSql = new StringBuilder();
                strSql.Append("delete from T_News ");
                strSql.Append(" where Id=@Id");
                SqlParameter[] parameters = {
					new SqlParameter("@Id", SqlDbType.Int,4)
			};
                parameters[0].Value = Id;
                if (db.ExecuteNonQuery(strSql.ToString(), parameters) > 0)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch { throw; }
        }
        //
        public bool Update(News model)
        {
            try
            {
                StringBuilder strSql = new StringBuilder();
                strSql.Append("update T_News set ");
                strSql.Append("NewsTypeId=@NewsTypeId,");
                strSql.Append("Keyword=@Keyword,");
                strSql.Append("Content=@Content,");
                strSql.Append("OrgCode=@OrgCode,");
                strSql.Append("NewsTitle=@NewsTitle,");
                strSql.Append("NewsSubheading=@NewsSubheading,");
                strSql.Append("NewsSource=@NewsSource,");
                strSql.Append("NewsContent=@NewsContent,");
                strSql.Append("NewsImg=@NewsImg,");
                strSql.Append("NewsFile=@NewsFile,");
                strSql.Append("NumClicks=@NumClicks,");
                strSql.Append("IsCheck=@IsCheck,");
                strSql.Append("Editor=@Editor,");
                strSql.Append("CreateDate=@CreateDate");
                strSql.Append(" where Id=@Id");
                if (db.ExecuteNonQuery(strSql.ToString(), GetSqlParameter(model)) > 0)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch { throw; }
        }
        //
        public dynamic GetModel(int Id)
        {
            try
            {
                dynamic model = null;
                StringBuilder strSql = new StringBuilder();
                strSql.Append(" select  top 1 Id,NewsTypeId,Keyword,Content,OrgCode,NewsTitle,NewsSubheading,NewsSource,NewsContent,NewsImg,NewsFile,NumClicks,IsCheck,Editor,CreateDate from T_News ");
                strSql.Append(" where Id=@Id");
                SqlParameter[] parameters = {
					new SqlParameter("@Id", SqlDbType.Int,4)
			};
                parameters[0].Value = Id;
                using (dynamic read = db.ExecuteReader(strSql.ToString(), parameters))
                {
                    if (read.Read())
                    {
                        model = new News();
                        model.Id = int.Parse(read["Id"].ToString());
                        model.NewsTypeId = int.Parse(read["NewsTypeId"].ToString());
                        model.Keyword = read["Keyword"].ToString();
                        model.Content = read["Content"].ToString();
                        model.OrgCode = read["OrgCode"].ToString();
                        model.NewsTitle = read["NewsTitle"].ToString();
                        model.NewsSubheading = read["NewsSubheading"].ToString();
                        model.NewsSource = read["NewsSource"].ToString();
                        model.NewsContent = read["NewsContent"].ToString();
                        model.NewsImg = read["NewsImg"].ToString();
                        model.NewsFile = read["NewsFile"].ToString();
                        model.NumClicks = int.Parse(read["NumClicks"].ToString());
                        model.IsCheck = int.Parse(read["IsCheck"].ToString());
                        model.Editor = read["Editor"].ToString();
                        model.CreateDate = DateTime.Parse(read["CreateDate"].ToString());
                    }
                    read.Dispose();
                }
                return model;
            }
            catch { throw; }
        }
        //
        public dynamic GetModel(string sqlWhere)
        {
            try
            {
                dynamic model = null;
                StringBuilder strSql = new StringBuilder();
                strSql.Append(" select  top 1 Id,NewsTypeId,Keyword,Content,OrgCode,NewsTitle,NewsSubheading,NewsSource,NewsContent,NewsImg,NewsFile,NumClicks,IsCheck,Editor,CreateDate from T_News ");
                if (!string.IsNullOrEmpty(sqlWhere))
                {
                    strSql.Append(string.Format(" where {0}", sqlWhere));
                }
                strSql.Append(" order by CreateDate desc ");
                using (dynamic read = db.ExecuteReader(strSql.ToString()))
                {
                    if (read.Read())
                    {
                        model = new News();
                        model.Id = int.Parse(read["Id"].ToString());
                        model.NewsTypeId = int.Parse(read["NewsTypeId"].ToString());
                        model.Keyword = read["Keyword"].ToString();
                        model.Content = read["Content"].ToString();
                        model.OrgCode = read["OrgCode"].ToString();
                        model.NewsTitle = read["NewsTitle"].ToString();
                        model.NewsSubheading = read["NewsSubheading"].ToString();
                        model.NewsSource = read["NewsSource"].ToString();
                        model.NewsContent = read["NewsContent"].ToString();
                        model.NewsImg = read["NewsImg"].ToString();
                        model.NewsFile = read["NewsFile"].ToString();
                        model.NumClicks = int.Parse(read["NumClicks"].ToString());
                        model.IsCheck = int.Parse(read["IsCheck"].ToString());
                        model.Editor = read["Editor"].ToString();
                        model.CreateDate = DateTime.Parse(read["CreateDate"].ToString());
                    }
                    read.Dispose();
                }
                return model;
            }
            catch { throw; }
        }
        //
        public dynamic GetAllList(string sqlWhere, int startIndex, int pageSize, string order)
        {
            try
            {
                string strSql = " select a.Id,b.NewsTypeName as NewsTypeId,a.Keyword,a.Content,a.OrgCode,a.NewsTitle,a.NewsSubheading,a.NewsSource,a.NewsContent,a.NewsImg,a.NewsFile,a.NumClicks,a.IsCheck,a.Editor,a.CreateDate from T_News as a left join T_NEWSTYPE as b on a.NewsTypeId = b.Id ";
                if (!string.IsNullOrEmpty(sqlWhere))
                {
                    strSql += " where ";
                    strSql += sqlWhere;
                }
                if (!string.IsNullOrEmpty(order))
                {
                    strSql += order;
                }
                return db.ExecuteDataTable(strSql, startIndex * pageSize, pageSize, "T_News");
            }
            catch { throw; }
        }
        //
        public dynamic WebGetAllList(string sqlWhere, string order)
        {
            try
            {
                string strSql = " select top 5 Id,NewsTypeId,Keyword,Content,OrgCode,NewsTitle,NewsSubheading,NewsSource,NewsContent,NewsImg,NewsFile,NumClicks,IsCheck,Editor,CreateDate from T_News ";
                if (!string.IsNullOrEmpty(sqlWhere))
                {
                    strSql += " where ";
                    strSql += sqlWhere;
                }
                if (!string.IsNullOrEmpty(order))
                {
                    strSql += order;
                }
                return db.ExecuteDataTable(strSql);
            }
            catch { throw; }
        }
        //
        public dynamic WebGetAllList(string sqlWhere, int startIndex, int pageSize, string order)
        {
            try
            {
                string strSql = " select Id,NewsTypeId,Keyword,Content,OrgCode,NewsTitle,NewsSubheading,NewsSource,NewsContent,NewsImg,NewsFile,NumClicks,IsCheck,Editor,CreateDate from T_News ";
                if (!string.IsNullOrEmpty(sqlWhere))
                {
                    strSql += " where ";
                    strSql += sqlWhere;
                }
                if (!string.IsNullOrEmpty(order))
                {
                    strSql += order;
                }
                return db.ExecuteDataTable(strSql, startIndex * pageSize, pageSize, "T_News");
            }
            catch { throw; }
        }
        //
        public dynamic WebGetTopList(string top, string sqlWhere, string order)
        {
            try
            {
                string strSql = string.Format(" select top {0} Id,NewsTypeId,Keyword,Content,OrgCode,NewsTitle,NewsSubheading,NewsSource,NewsContent,NewsImg,NewsFile,NumClicks,IsCheck,Editor,CreateDate from T_News ", top);
                if (!string.IsNullOrEmpty(sqlWhere))
                {
                    strSql += " where ";
                    strSql += sqlWhere;
                }
                if (!string.IsNullOrEmpty(order))
                {
                    strSql += order;
                }
                return db.ExecuteDataTable(strSql);
            }
            catch { throw; }
        }
        //
        public int Count(string sqlWhere)
        {
            try
            {
                string strSql = " select count(Id) from T_News ";
                if (!string.IsNullOrEmpty(sqlWhere))
                {
                    strSql += " where ";
                    strSql += sqlWhere;
                }
                return (int)db.ExecuteScalar(strSql);
            }
            catch { throw; }
        }
        //
        public int WebSumCount(string sqlWhere)
        {
            try
            {
                string strSql = " select count(Id) from T_News ";
                if (!string.IsNullOrEmpty(sqlWhere))
                {
                    strSql += " where ";
                    strSql += sqlWhere;
                }
                return (int)db.ExecuteScalar(strSql);
            }
            catch { throw; }
        }
        //
        private SqlParameter[] GetSqlParameter(News model)
        {
            SqlParameter[] parameters = {
					new SqlParameter("@NewsTypeId", SqlDbType.Int,4),
					new SqlParameter("@Keyword", SqlDbType.NVarChar,50),
					new SqlParameter("@Content", SqlDbType.NVarChar,50),
					new SqlParameter("@OrgCode", SqlDbType.VarChar,150),
					new SqlParameter("@NewsTitle", SqlDbType.NVarChar,100),
					new SqlParameter("@NewsSubheading", SqlDbType.NVarChar,50),
					new SqlParameter("@NewsSource", SqlDbType.NVarChar,50),
					new SqlParameter("@NewsContent", SqlDbType.Text),
					new SqlParameter("@NewsImg", SqlDbType.VarChar,50),
					new SqlParameter("@NewsFile", SqlDbType.VarChar,50),
					new SqlParameter("@NumClicks", SqlDbType.Int,4),
					new SqlParameter("@IsCheck", SqlDbType.Int,4),
					new SqlParameter("@Editor", SqlDbType.NVarChar,50),
					new SqlParameter("@CreateDate", SqlDbType.DateTime),
					new SqlParameter("@Id", SqlDbType.Int,4)};
            parameters[0].Value = model.NewsTypeId;
            parameters[1].Value = model.Keyword;
            parameters[2].Value = model.Content;
            parameters[3].Value = model.OrgCode;
            parameters[4].Value = model.NewsTitle;
            parameters[5].Value = model.NewsSubheading;
            parameters[6].Value = model.NewsSource;
            parameters[7].Value = model.NewsContent;
            parameters[8].Value = model.NewsImg;
            parameters[9].Value = model.NewsFile;
            parameters[10].Value = model.NumClicks;
            parameters[11].Value = model.IsCheck;
            parameters[12].Value = model.Editor;
            parameters[13].Value = model.CreateDate;
            parameters[14].Value = model.Id;
            return parameters;
        }
    }
}