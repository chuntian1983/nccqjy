/***
* Ver    变更日期            负责人           变更内容
* ───────────────────────────────────
* V0.01  2016-5-3 09:23:00   N/A      wanghao
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
using System.Data;
using System.Data.SqlClient;

namespace NCPEP.Dal
{
    public class PlacardDal
    {
        private dynamic db = null;
        public PlacardDal()
        {
            db = new MsSqlHelper();
        }
        public bool Create(Placard model)
        {
            try
            {
                StringBuilder strSql = new StringBuilder();
                strSql.Append("insert into T_Placard(");
                strSql.Append("PlacardTitle,PlacardContent,Publisher,ReleaseTime,NumClicks,DepName)");
                strSql.Append(" values (");
                strSql.Append("@PlacardTitle,@PlacardContent,@Publisher,@ReleaseTime,@NumClicks,@DepName)");
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
        /// <summary>
        /// 
        /// </summary>
        /// <param name="id"></param>
        public void UpdateNumClicks(int id)
        {
            string strSql = string.Format("update T_Placard set NumClicks = NumClicks + 1 where id= {0}", id);
            db.ExecuteNonQuery(strSql);
        }
        /// <summary>
        /// 数据总和
        /// </summary>
        /// <param name="where"></param>
        /// <returns></returns>
        public dynamic SumCount(string sqlWhere)
        {
            try
            {
                string strSql = " select count(Id) from T_Placard ";
                if (!string.IsNullOrEmpty(sqlWhere))
                {
                    strSql += string.Format(" where {0} ", sqlWhere);
                }
                return db.ExecuteScalar(strSql);
            }
            catch { throw; }
        }
        //
        public bool Update(Placard model)
        {
            try
            {
                StringBuilder strSql = new StringBuilder();
                strSql.Append("update T_Placard set ");
                strSql.Append("PlacardTitle=@PlacardTitle,");
                strSql.Append("PlacardContent=@PlacardContent,");
                strSql.Append("Publisher=@Publisher,");
                strSql.Append("ReleaseTime=@ReleaseTime,");
                strSql.Append("NumClicks=@NumClicks,");
                strSql.Append("DepName=@DepName");
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
        public bool Delete(int Id)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("delete from T_Placard ");
            strSql.Append(" where Id=@Id");
            SqlParameter[] parameters = {
					new SqlParameter("@Id", SqlDbType.Int,4)
			};
            parameters[0].Value = Id;

            int rows = db.ExecuteNonQuery(strSql.ToString(), parameters);
            if (rows > 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        //
        public DataTable GetAllList(string sqlWhere, int startIndex, int pageSize, string order)
        {
            try
            {
                string strSql = string.Format("select Id,PlacardTitle,PlacardContent,Publisher,ReleaseTime,NumClicks,DepName from T_Placard  where {0} {1}", sqlWhere, order);
                return db.ExecuteDataTable(strSql, startIndex * pageSize, pageSize, "T_Placard");
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
                strSql.Append(" select Id,PlacardTitle,PlacardContent,Publisher,ReleaseTime,NumClicks,DepName from T_Placard  ");
                strSql.Append(" where Id=@Id");
                SqlParameter[] parameters = {
					new SqlParameter("@Id", SqlDbType.Int,4)
			};
                parameters[0].Value = Id;
                using (dynamic read = db.ExecuteReader(strSql.ToString(), parameters))
                {
                    if (read.Read())
                    {
                        model = new Placard();
                        try { model.Id = int.Parse(read["Id"].ToString()); }
                        catch { }
                        model.PlacardTitle = read["PlacardTitle"].ToString();
                        model.PlacardContent = read["PlacardContent"].ToString();
                        model.Publisher = read["Publisher"].ToString();
                        try { model.ReleaseTime = DateTime.Parse(read["ReleaseTime"].ToString()); }
                        catch { }
                        try { model.NumClicks = int.Parse(read["NumClicks"].ToString()); }
                        catch { }
                        model.DepName = read["DepName"].ToString();
                    }
                    read.Dispose();
                }
                return model;
            }
            catch { throw; }
        }
        //
        private SqlParameter[] GetSqlParameter(dynamic model)
        {
            SqlParameter[] parameters = {					
					new SqlParameter("@PlacardTitle", SqlDbType.NVarChar,10),
					new SqlParameter("@PlacardContent", SqlDbType.NVarChar,500),
					new SqlParameter("@Publisher", SqlDbType.NVarChar,500),
					new SqlParameter("@ReleaseTime", SqlDbType.DateTime),
					new SqlParameter("@NumClicks", SqlDbType.Int,4),
					new SqlParameter("@DepName", SqlDbType.NVarChar,500),
					new SqlParameter("@Id", SqlDbType.Int,4)};
            parameters[0].Value = model.PlacardTitle;
            parameters[1].Value = model.PlacardContent;
            parameters[2].Value = model.Publisher;
            parameters[3].Value = model.ReleaseTime;
            parameters[4].Value = model.NumClicks;
            parameters[5].Value = model.DepName;
            parameters[6].Value = model.Id;
            return parameters;
        }
    }
}
