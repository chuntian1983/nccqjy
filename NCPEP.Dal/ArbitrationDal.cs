/**
* T_Arbitration.cs
*
* 类 名： T_Arbitration
*
* Ver    变更日期            负责人           变更内容
* ───────────────────────────────────
* V0.01  2016-5-3 09:22:43   N/A      wanghao
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
    public class ArbitrationDal
    {
        private dynamic db = null;
        public ArbitrationDal()
        {
            db = new MsSqlHelper();
        }
        //
        public bool Create(Arbitration model)
        {
            try
            {
                StringBuilder strSql = new StringBuilder();
                strSql.Append("insert into T_Arbitration(");
                strSql.Append("FK_BidId,FK_LiceId,FK_TranId,Fact,Grounds,Results,AcceptName,AcceptDate,OrgCode)");
                strSql.Append(" values (");
                strSql.Append("@FK_BidId,@FK_LiceId,@FK_TranId,@Fact,@Grounds,@Results,@AcceptName,@AcceptDate,@OrgCode)");
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
            try
            {
                string strSql = string.Format("delete from T_Arbitration where Id={0}", Id);
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
        public bool Update(Arbitration model)
        {
            try
            {
                StringBuilder strSql = new StringBuilder();
                strSql.Append("update T_Arbitration set ");
                strSql.Append("FK_BidId=@FK_BidId,");
                strSql.Append("FK_LiceId=@FK_LiceId,");
                strSql.Append("FK_TranId=@FK_TranId,");
                strSql.Append("Fact=@Fact,");
                strSql.Append("Grounds=@Grounds,");
                strSql.Append("Results=@Results,");
                strSql.Append("AcceptName=@AcceptName,");
                strSql.Append("AcceptDate=@AcceptDate");
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
        public dynamic GetAllList(string sqlWhere, int startIndex, int pageSize, string order)
        {
            try
            {
                string strSql = " select a.Id,b.BidName,a.FK_LiceId,a.FK_TranId,aa.Name as AName ,bb.Name as BName,a.Fact,a.Grounds,a.Results,a.AcceptName,a.AcceptDate from T_Arbitration as a left join T_Bid as b on a.FK_BidId=b.Id left join T_LiceTran as aa on a.FK_LiceId=aa.Id left join T_LiceTran as bb on a.FK_TranId=bb.Id ";
                if (!string.IsNullOrEmpty(sqlWhere))
                {
                    strSql += " where ";
                    strSql += sqlWhere;
                }
                if (!string.IsNullOrEmpty(order))
                {
                    strSql += order;
                }
                return db.ExecuteDataTable(strSql, startIndex * pageSize, pageSize, "T_Arbitration");
            }
            catch { throw; }
        }
        //
        public DataTable GetLiceTran(int Id)
        {
            string sql = string.Format(" select isnull(a.FK_LiceTranId,0) as A1,isnull(b.FK_LiceTranId,0) AS A2 from T_Bid as a left join T_BidTrans as b on a.Id =b.FK_BidId where a.Id ={0} ", Id);
            return db.ExecuteDataTable(sql);
        }
        //
        public int Count(string sqlWhere)
        {
            try
            {
                string strSql = " select count(Id) from T_Arbitration ";
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
        public dynamic GetModel(int Id)
        {
            try
            {
                dynamic model = null;
                StringBuilder strSql = new StringBuilder();
                strSql.Append("select top 1 Id,FK_BidId,FK_LiceId,FK_TranId,Fact,Grounds,Results,OrgCode,AcceptName,AcceptDate from T_Arbitration ");
                strSql.Append(" where Id=@Id");
                SqlParameter[] parameters = {
					new SqlParameter("@Id", SqlDbType.Int,4)
			};
                parameters[0].Value = Id;
                using (dynamic read = db.ExecuteReader(strSql.ToString(), parameters))
                {
                    if (read.Read())
                    {
                        model = new Arbitration();
                        try { model.Id = int.Parse(read["Id"].ToString()); }
                        catch { }
                        try { model.FK_BidId = int.Parse(read["FK_BidId"].ToString()); }
                        catch { }
                        try { model.FK_LiceId = int.Parse(read["FK_LiceId"].ToString()); }
                        catch { }
                        try { model.FK_TranId = int.Parse(read["FK_TranId"].ToString()); }
                        catch { }
                        model.Fact = read["Fact"].ToString();
                        model.Grounds = read["Grounds"].ToString();
                        model.Results = read["Results"].ToString();
                        model.AcceptName = read["AcceptName"].ToString();
                        model.OrgCode = read["OrgCode"].ToString();
                        try { model.AcceptDate = DateTime.Parse(read["AcceptDate"].ToString()); }
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
					new SqlParameter("@FK_BidId", SqlDbType.Int,4),
					new SqlParameter("@FK_LiceId", SqlDbType.Int,4),
					new SqlParameter("@FK_TranId", SqlDbType.Int,4),
					new SqlParameter("@Fact", SqlDbType.NVarChar,500),
					new SqlParameter("@Grounds", SqlDbType.NVarChar,500),
					new SqlParameter("@Results", SqlDbType.NVarChar,500),
					new SqlParameter("@AcceptName", SqlDbType.NVarChar,50),
					new SqlParameter("@AcceptDate", SqlDbType.DateTime),
					new SqlParameter("@Id", SqlDbType.Int,4),
                    new SqlParameter("@OrgCode", SqlDbType.VarChar,100)};
            parameters[0].Value = model.FK_BidId;
            parameters[1].Value = model.FK_LiceId;
            parameters[2].Value = model.FK_TranId;
            parameters[3].Value = model.Fact;
            parameters[4].Value = model.Grounds;
            parameters[5].Value = model.Results;
            parameters[6].Value = model.AcceptName;
            parameters[7].Value = model.AcceptDate;
            parameters[8].Value = model.Id;
            parameters[9].Value = model.OrgCode;
            return parameters;
        }
    }
}
