/**
* T_WebIntention.cs
*
* 类 名： T_WebIntention
*
* Ver    变更日期            负责人           变更内容
* ───────────────────────────────────
* V0.01  2016-5-3 09:23:13   N/A      wanghao
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
using NCPEP.Com.Util;
using NCPEP.Model;
using System.Data.SqlClient;
using System.Data;

namespace NCPEP.Dal
{
    public class WebIntentionDal
    {
        //
        private dynamic db = null;
        //
        public WebIntentionDal()
        {
            db = new MsSqlHelper();
        }
        //
        public bool UpdateState(string row, string values, string where)
        {
            try
            {
                string strSql = string.Format("update T_WebIntention set {0}={1} where Id = {2}", row, values, where);
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
            string strSql = string.Format("update T_WebIntention set ClickNum = ClickNum + 1 where id= {0}", id);
            db.ExecuteNonQuery(strSql);
        }
        //
        public bool Create(WebIntention model)
        {
            try
            {
                StringBuilder strSql = new StringBuilder();
                strSql.Append("insert into T_WebIntention(");
                strSql.Append("FK_WebUserVeriId,IntentionType,Title,Content,RegDate,EndDte,CheckStatus,ClickNum,CheckName,CheckDate)");
                strSql.Append(" values (");
                strSql.Append("@FK_WebUserVeriId,@IntentionType,@Title,@Content,@RegDate,@EndDte,@CheckStatus,@ClickNum,@CheckName,@CheckDate)");
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
                string strSql = string.Format("delete from T_WebIntention where Id in ({0})", idList);
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
                strSql.Append("delete from T_WebIntention ");
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
        public bool Update(WebIntention model)
        {
            try
            {
                StringBuilder strSql = new StringBuilder();
                strSql.Append("update T_WebIntention set ");
                strSql.Append("FK_WebUserVeriId=@FK_WebUserVeriId,");
                strSql.Append("IntentionType=@IntentionType,");
                strSql.Append("Title=@Title,");
                strSql.Append("Content=@Content,");
                strSql.Append("RegDate=@RegDate,");
                strSql.Append("EndDte=@EndDte,");
                strSql.Append("CheckStatus=@CheckStatus,");
                strSql.Append("ClickNum=@ClickNum,");
                strSql.Append("CheckName=@CheckName,");
                strSql.Append("CheckDate=@CheckDate");
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
                strSql.Append(" select  top 1 Id,FK_WebUserVeriId,IntentionType,Title,Content,RegDate,EndDte,CheckStatus,ClickNum,CheckName,CheckDate from T_WebIntention  ");
                strSql.Append(" where Id=@Id");
                SqlParameter[] parameters = {
					new SqlParameter("@Id", SqlDbType.Int,4)
			};
                parameters[0].Value = Id;
                using (dynamic read = db.ExecuteReader(strSql.ToString(), parameters))
                {
                    if (read.Read())
                    {
                        model = new WebIntention();
                        model.Id = int.Parse(read["Id"].ToString());
                        model.FK_WebUserVeriId = int.Parse(read["FK_WebUserVeriId"].ToString());
                        model.IntentionType = int.Parse(read["IntentionType"].ToString());
                        model.Title = read["Title"].ToString();
                        model.Content = read["Content"].ToString();
                        model.RegDate = DateTime.Parse(read["RegDate"].ToString());
                        model.EndDte = DateTime.Parse(read["EndDte"].ToString());
                        model.CheckStatus = int.Parse(read["CheckStatus"].ToString());
                        model.ClickNum = int.Parse(read["ClickNum"].ToString());
                        model.CheckName = read["CheckName"].ToString();
                        model.CheckDate = DateTime.Parse(read["CheckDate"].ToString());
                    }
                    read.Dispose();
                }
                return model;
            }
            catch { throw; }
        }

        public dynamic GetModel(string sqlWhere)
        {
            try
            {
                dynamic model = null;
                string strSql = " select  top 1 Id,FK_WebUserVeriId,IntentionType,Title,Content,RegDate,EndDte,CheckStatus,ClickNum,CheckName,CheckDate from T_WebIntention  ";
                strSql += string.Format(" where {0}", sqlWhere);
                using (dynamic read = db.ExecuteReader(strSql))
                {
                    if (read.Read())
                    {
                        model = new WebIntention();
                        model.Id = int.Parse(read["Id"].ToString());
                        model.FK_WebUserVeriId = int.Parse(read["FK_WebUserVeriId"].ToString());
                        model.IntentionType = int.Parse(read["IntentionType"].ToString());
                        model.Title = read["Title"].ToString();
                        model.Content = read["Content"].ToString();
                        model.RegDate = DateTime.Parse(read["RegDate"].ToString());
                        model.EndDte = DateTime.Parse(read["EndDte"].ToString());
                        model.CheckStatus = int.Parse(read["CheckStatus"].ToString());
                        model.ClickNum = int.Parse(read["ClickNum"].ToString());
                        model.CheckName = read["CheckName"].ToString();
                        model.CheckDate = DateTime.Parse(read["CheckDate"].ToString());
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
                string strSql = " select a.Id,isnull(b.VeriName,b.UserName) as WebUser,a.FK_WebUserVeriId,a.IntentionType,a.Title,a.Content,a.RegDate,a.EndDte,a.CheckStatus,a.ClickNum,a.CheckName,a.CheckDate from T_WebIntention as a left join T_WebUserVeri as b on a.FK_WebUserVeriId =b.Id ";
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
        public dynamic WebGetAllList(string sqlWhere, int startIndex, int pageSize, string order)
        {
            try
            {
                string strSql = " select Id,FK_WebUserVeriId,IntentionType,Title,Content,RegDate,EndDte,CheckStatus,ClickNum,CheckName,CheckDate from T_WebIntention ";
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
                string strSql = string.Format(" select top {0} Id,FK_WebUserVeriId,IntentionType,Title,Content,RegDate,EndDte,CheckStatus,ClickNum,CheckName,CheckDate from T_WebIntention ", top);
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

        public int Count(string sqlWhere)
        {
            try
            {
                string strSql = " select count(Id) from T_WebIntention ";
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
                string strSql = " select count(Id) from T_WebIntention ";
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
        private SqlParameter[] GetSqlParameter(WebIntention model)
        {
            SqlParameter[] parameters = {
					new SqlParameter("@FK_WebUserVeriId", SqlDbType.Int,4),
					new SqlParameter("@IntentionType", SqlDbType.Int,4),
					new SqlParameter("@Title", SqlDbType.NVarChar,150),
					new SqlParameter("@Content", SqlDbType.NVarChar,500),
					new SqlParameter("@RegDate", SqlDbType.DateTime),
					new SqlParameter("@EndDte", SqlDbType.DateTime),
					new SqlParameter("@CheckStatus", SqlDbType.Int,4),
					new SqlParameter("@ClickNum", SqlDbType.Int,4),
					new SqlParameter("@CheckName", SqlDbType.NVarChar,50),
					new SqlParameter("@CheckDate", SqlDbType.DateTime),
					new SqlParameter("@Id", SqlDbType.Int,4)};
            parameters[0].Value = model.FK_WebUserVeriId;
            parameters[1].Value = model.IntentionType;
            parameters[2].Value = model.Title;
            parameters[3].Value = model.Content;
            parameters[4].Value = model.RegDate;
            parameters[5].Value = model.EndDte;
            parameters[6].Value = model.CheckStatus;
            parameters[7].Value = model.ClickNum;
            parameters[8].Value = model.CheckName;
            parameters[9].Value = model.CheckDate;
            parameters[10].Value = model.Id;
            return parameters;
        }
    }
}