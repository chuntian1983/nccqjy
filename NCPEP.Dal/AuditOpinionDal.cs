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
using System.Data.SqlClient;
using System.Data;

namespace NCPEP.Dal
{
    public class AuditOpinionDal
    {
        private dynamic db = null;
        public AuditOpinionDal()
        {
            db = new MsSqlHelper();
        }
        //
        public bool Create(AuditOpinion model)
        {
            try
            {
                StringBuilder strSql = new StringBuilder();
                strSql.Append("insert into T_AuditOpinion(");
                strSql.Append("FK_WebUserVeriId,CheckName,CheckOpinion,OpinionDate)");
                strSql.Append(" values (");
                strSql.Append("@FK_WebUserVeriId,@CheckName,@CheckOpinion,@OpinionDate)");
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
        public bool Delete(int FK_WebUserVeriId)
        {
            try
            {
                string strSql = string.Format("delete from T_AuditOpinion where FK_WebUserVeriId={0}", FK_WebUserVeriId);
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
      
        //
        public dynamic GetAllList(int FK_WebUserVeriId)
        {
            try
            {
                string strSql = string.Format(" select Id,FK_WebUserVeriId,CheckName,CheckOpinion,OpinionDate from T_AuditOpinion  where FK_WebUserVeriId={0} order by OpinionDate desc ", FK_WebUserVeriId);
                return db.ExecuteDataTable(strSql);
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
                strSql.Append("select  top 1 Id,FK_WebUserVeriId,CheckName,CheckOpinion,OpinionDate from T_AuditOpinion ");
                strSql.Append(" where Id=@Id");
                SqlParameter[] parameters = {
					new SqlParameter("@Id", SqlDbType.Int,4)
			};
                parameters[0].Value = Id;
                using (dynamic read = db.ExecuteReader(strSql.ToString(), parameters))
                {
                    if (read.Read())
                    {
                        model = new AuditOpinion();
                        try { model.Id = int.Parse(read["Id"].ToString()); }
                        catch { }
                        try { model.FK_WebUserVeriId = int.Parse(read["FK_WebUserVeriId"].ToString()); }
                        catch { }
                        model.CheckName = read["CheckName"].ToString();
                        model.CheckOpinion = read["CheckOpinion"].ToString();
                        try { model.OpinionDate = DateTime.Parse(read["OpinionDate"].ToString()); }
                        catch { }
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
				new SqlParameter("@FK_WebUserVeriId", SqlDbType.Int,4),
					new SqlParameter("@CheckName", SqlDbType.NVarChar,50),
					new SqlParameter("@CheckOpinion", SqlDbType.NVarChar,500),
					new SqlParameter("@OpinionDate", SqlDbType.DateTime),
					new SqlParameter("@Id", SqlDbType.Int,4)};
            parameters[0].Value = model.FK_WebUserVeriId;
            parameters[1].Value = model.CheckName;
            parameters[2].Value = model.CheckOpinion;
            parameters[3].Value = model.OpinionDate;
            parameters[4].Value = model.Id;
            return parameters;
        }
    }
}
