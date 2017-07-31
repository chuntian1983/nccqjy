/**
* Ver    变更日期            负责人           变更内容
* ───────────────────────────────────
* V0.01  2016-5-3 09:22:54   N/A      wanghao
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
using NCPEP.Model;
using NCPEP.Com.Util;
using System.Data;
using System.Data.SqlClient;

namespace NCPEP.Dal
{
    public class SysLogDal : IDisposable
    {
        private dynamic db = null;
        public SysLogDal()
        {
            db = new MsSqlHelper();
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public bool Create(SysLog model)
        {
            try
            {
                StringBuilder strSql = new StringBuilder();
                strSql.Append("insert into T_SysLog(");
                strSql.Append("LogValue,Operates,IpAdd,MacAdd,Editor,CreateDate)");
                strSql.Append(" values (");
                strSql.Append("@LogValue,@Operates,@IpAdd,@MacAdd,@Editor,@CreateDate)");
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
        /// <returns></returns>
        public bool Delete()
        {
            return Delete(string.Empty);
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="sqlWhere"></param>
        /// <returns></returns>
        public bool Delete(string sqlWhere)
        {
            try
            {
                StringBuilder strSql = new StringBuilder();
                strSql.Append("delete from T_SysLog ");
                if (!string.IsNullOrEmpty(sqlWhere))
                {
                    strSql.Append(string.Format(" where {0}", sqlWhere));
                }
                int rows = db.ExecuteNonQuery(strSql.ToString());
                if (rows > 0)
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
        /// <returns></returns>
        public DataTable GetAllList()
        {
            try
            {
                string strSql = "select Id,LogValue,Operates,IpAdd,MacAdd,Editor,CreateDate from T_SysLog ";

                return db.ExecuteDataTable(strSql);
            }
            catch { throw; }
        }
        /// <summary>
        /// 列表查询操作
        /// </summary>
        /// <param name="sql"></param>
        /// <param name="startIndex"></param>
        /// <param name="pageSize"></param>
        /// <param name="tableName"></param>
        /// <returns></returns>
        public DataTable GetAllList(string sqlWhere, int startIndex, int pageSize, string order)
        {
            try
            {
                string strSql = " select Id,LogValue,Operates,IpAdd,MacAdd,Editor,CreateDate from T_SysLog ";
                if (!string.IsNullOrEmpty(sqlWhere))
                {
                    strSql += string.Format(" where {0}", sqlWhere);
                }
                strSql += order;
                return db.ExecuteDataTable(strSql, startIndex * pageSize, pageSize, "T_SysLog");
            }
            catch { throw; }
        }
        /// <summary>
        /// 数据总和
        /// </summary>
        /// <param name="where"></param>
        /// <returns></returns>
        public dynamic SumCount(string where)
        {
            try
            {
                string strSql = "select count(Id) from T_SysLog ";
                if (!string.IsNullOrEmpty(where))
                {
                    strSql += string.Format(" where {0}", where);
                }
                return db.ExecuteScalar(strSql);
            }
            catch { throw; }
        }
        //
        private SqlParameter[] GetSqlParameter(SysLog model)
        {
            SqlParameter[] parameters = {
					new SqlParameter("@LogValue", SqlDbType.NVarChar,150),
					new SqlParameter("@Operates", SqlDbType.NVarChar,50),
					new SqlParameter("@IpAdd", SqlDbType.NVarChar,50),					
					new SqlParameter("@MacAdd", SqlDbType.NVarChar,50),
					new SqlParameter("@Editor", SqlDbType.NVarChar,50),
					new SqlParameter("@CreateDate", SqlDbType.DateTime),
					new SqlParameter("@Id", SqlDbType.Int)};
            parameters[0].Value = model.LogValue;
            parameters[1].Value = model.Operates;
            parameters[2].Value = model.IpAdd;
            parameters[3].Value = model.MacAdd;
            parameters[4].Value = model.Editor;
            parameters[5].Value = model.CreateDate;
            parameters[6].Value = model.Id;
            return parameters;
        }

        public void Dispose()
        {
            throw new NotImplementedException();
        }
    }
}

