/**
* T_BidPlacard.cs
*
* 类 名： T_BidPlacard
*
* Ver    变更日期            负责人           变更内容
* ───────────────────────────────────
* V0.01  2016-5-3 09:22:48   N/A      wanghao
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
    public class BidPlacardDal
    {
        private dynamic db = null;
        public BidPlacardDal()
        {
            db = new MsSqlHelper();
        }
        //
        public bool Exists(int FK_BidId)
        {
            try
            {
                string strSql = string.Format("select count(*) from T_BidPlacard where FK_BidId={0}", FK_BidId);
                if (db.ExecuteScalar(strSql) > 0)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch
            {
                return true;
            }
        }
        //
        public bool Create(BidPlacard model)
        {
            try
            {
                StringBuilder strSql = new StringBuilder();
                strSql.Append("insert into T_BidPlacard(");
                strSql.Append("FK_BidId,BidPlacardTitle,BidPlacardContent,Publisher,ReleaseTime,fujian)");
                strSql.Append(" values (");
                strSql.Append("@FK_BidId,@BidPlacardTitle,@BidPlacardContent,@Publisher,@ReleaseTime,@fujian)");
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
        public bool Update(BidPlacard model)
        {
            try
            {
                StringBuilder strSql = new StringBuilder();
                strSql.Append("update T_BidPlacard set ");
                strSql.Append("BidPlacardTitle=@BidPlacardTitle,");
                strSql.Append("BidPlacardContent=@BidPlacardContent,");
                strSql.Append("Publisher=@Publisher,");
                strSql.Append("fujian=@fujian,"); 
                strSql.Append("ReleaseTime=@ReleaseTime");
                strSql.Append(" where FK_BidId=@FK_BidId");
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
                strSql.Append(" select  top 1 Id,FK_BidId,BidPlacardTitle,BidPlacardContent,Publisher,ReleaseTime,fujian from T_BidPlacard ");
                strSql.Append(" where FK_BidId=@FK_BidId");
                SqlParameter[] parameters = {
					new SqlParameter("@FK_BidId", SqlDbType.Int,4)
			};
                parameters[0].Value = Id;
                using (dynamic read = db.ExecuteReader(strSql.ToString(), parameters))
                {
                    if (read.Read())
                    {
                        model = new BidPlacard();
                        model.Id = int.Parse(read["Id"].ToString());
                        model.FK_BidId = int.Parse(read["FK_BidId"].ToString());
                        model.BidPlacardTitle = read["BidPlacardTitle"].ToString();
                        model.BidPlacardContent = read["BidPlacardContent"].ToString();
                        model.Publisher = read["Publisher"].ToString();                       
                        model.ReleaseTime = DateTime.Parse(read["ReleaseTime"].ToString());
                    }
                    read.Dispose();
                }
                return model;
            }
            catch { throw; }
        }
        //
        public int SumCount(string sqlWhere)
        {
            try
            {
                string strSql = " select count(Id) from T_BidPlacard ";
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
        public dynamic GetAllList(string sqlWhere, int startIndex, int pageSize, string order)
        {
            try
            {
                string strSql = " select a.Id,a.FK_BidId,b.BidName,a.BidPlacardTitle,a.BidPlacardContent,a.Publisher,a.ReleaseTime from T_BidPlacard as a left join T_Bid as b on a.FK_BidId=b.Id ";
                if (!string.IsNullOrEmpty(sqlWhere))
                {
                    strSql += " where ";
                    strSql += sqlWhere;
                }
                if (!string.IsNullOrEmpty(order))
                {
                    strSql += order;
                }
                return db.ExecuteDataTable(strSql, startIndex * pageSize, pageSize, "T_BidPlacard");
            }
            catch { throw; }
        }
        //
        public dynamic  GetModels(int Id)
        {
            try
            {
                string strSql = string.Format(" select a.Id,a.FK_BidId,b.BidName,a.BidPlacardTitle,a.BidPlacardContent,a.Publisher,a.ReleaseTime from T_BidPlacard as a left join T_Bid as b on a.FK_BidId=b.Id where a.Id={0}",Id);              
                return db.ExecuteDataTable(strSql);
            }
            catch { throw; }
        }
        public DataTable GetYxsrf(int binid)
        {
            DataTable dt = new DataTable();

            string strSql = string.Format("   select a.*,b.* from T_BidTrans a left join t_licetran b on a.fk_licetranid=b.id where a.FK_BidId={0}", binid);
                dt= db.ExecuteDataTable(strSql);
            
            return dt;
        }
        //
        private SqlParameter[] GetSqlParameter(dynamic model)
        {
            SqlParameter[] parameters = {
						new SqlParameter("@FK_BidId", SqlDbType.Int,4),
					new SqlParameter("@BidPlacardTitle", SqlDbType.NVarChar,50),
					new SqlParameter("@BidPlacardContent", SqlDbType.NVarChar,500),
					new SqlParameter("@Publisher", SqlDbType.NVarChar,50),					
					new SqlParameter("@ReleaseTime", SqlDbType.DateTime),
					new SqlParameter("@Id", SqlDbType.Int,4),
                                        new SqlParameter("@fujian",SqlDbType.VarChar,500)};
            parameters[0].Value = model.FK_BidId;
            parameters[1].Value = model.BidPlacardTitle;
            parameters[2].Value = model.BidPlacardContent;
            parameters[3].Value = model.Publisher;          
            parameters[4].Value = model.ReleaseTime;
            parameters[5].Value = model.Id;
            parameters[6].Value = model.fujian;
            return parameters;
        }
    }
}

