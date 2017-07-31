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
using NCPEP.Com.Util;
using NCPEP.Model;
using System.Data;
using System.Data.SqlClient;

namespace NCPEP.Dal
{
    public class LiceTranCheckDal
    {
        private dynamic db = null;
        public LiceTranCheckDal()
        {
            db = new MsSqlHelper();
        }
        /// <summary>
        /// 添加操作
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public bool Create(LiceTranCheck model)
        {
            try
            {
                StringBuilder strSql = new StringBuilder();
                strSql.Append("insert into T_LiceTranCheck(");
                strSql.Append("FK_LiceTranId,Reviewer,AuditSay,AuditDate)");
                strSql.Append(" values (");
                strSql.Append("@FK_LiceTranId,@Reviewer,@AuditSay,@AuditDate)");
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
        /// 更新操作
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public bool Update(LiceTranCheck model)
        {
            try
            {
                StringBuilder strSql = new StringBuilder();
                strSql.Append("update T_LiceTranCheck set ");
                strSql.Append("FK_LiceTranId=@FK_LiceTranId,");
                strSql.Append("Reviewer=@Reviewer,");
                strSql.Append("AuditSay=@AuditSay,");
                strSql.Append("AuditDate=@AuditDate");
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
        /// <summary>
        /// 删除操作
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public bool Delete(int id)
        {
            try
            {
                string strSql = string.Format("delete from T_LiceTranCheck where Id={0}", id);
                if (db.ExecuteNonQuery(strSql) > 0)
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
                throw;
            }
        }

        /// <summary>
        /// 删除操作
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public bool Deletes(int LiceTranId)
        {
            try
            {
                string strSql = string.Format("delete from T_LiceTranCheck where FK_LiceTranId={0}", LiceTranId);
                if (db.ExecuteNonQuery(strSql) > 0)
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
                throw;
            }
        }
        /// <summary>
        /// 列表查询操作
        /// </summary>
        /// <param name="sql"></param>
        /// <param name="startIndex"></param>
        /// <param name="pageSize"></param>
        /// <param name="tableName"></param>
        /// <returns></returns>
        public DataTable GetAllList(int LiceTranId)
        {
            try
            {
                string strSql = "select Id,FK_LiceTranId,Reviewer,AuditSay,AuditDate from T_LiceTranCheck ";
                strSql += string.Format(" where FK_LiceTranId={0} order by Id desc ", LiceTranId);
                return db.ExecuteDataTable(strSql);
            }
            catch { throw; }
        }
        /// <summary>
        /// 返回单个对象
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public dynamic GetModel(int id)
        {
            try
            {
                dynamic model = null;
                string strSql = string.Format("select Id,FK_LiceTranId,Reviewer,AuditSay,AuditDate from T_LiceTranCheck where Id = {0}", id);
                using (dynamic read = db.ExecuteReader(strSql))
                {
                    if (read.Read())
                    {
                        model = new LiceTranCheck();
                        try { model.Id = int.Parse(read["Id"].ToString()); }
                        catch { }
                        try { model.FK_LiceTranId = int.Parse(read["FK_LiceTranId"].ToString()); }
                        catch { }
                        model.Reviewer = read["Reviewer"].ToString();
                        model.AuditSay = read["AuditSay"].ToString();
                        try { model.AuditDate = DateTime.Parse(read["AuditDate"].ToString()); }
                        catch { }
                    }
                    read.Dispose();
                }
                return model;
            }
            catch { throw; }
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        private SqlParameter[] GetSqlParameter(LiceTranCheck model)
        {
            SqlParameter[] parameters = {
				new SqlParameter("@FK_LiceTranId", SqlDbType.Int,4),
					new SqlParameter("@Reviewer", SqlDbType.NVarChar,100),
					new SqlParameter("@AuditSay", SqlDbType.NVarChar,100),
					new SqlParameter("@AuditDate", SqlDbType.DateTime),
					new SqlParameter("@Id", SqlDbType.Int,4)};
            parameters[0].Value = model.FK_LiceTranId;
            parameters[1].Value = model.Reviewer;
            parameters[2].Value = model.AuditSay;
            parameters[3].Value = model.AuditDate;
            parameters[4].Value = model.Id;
            return parameters;
        }
    }
}