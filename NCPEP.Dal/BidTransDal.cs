/**
* T_BidTrans.cs
*
* 类 名： T_BidTrans
*
* Ver    变更日期            负责人           变更内容
* ───────────────────────────────────
* V0.01  2016-5-3 09:22:49   N/A      wanghao
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
    public class BidTransDal
    {
        private MsSqlHelper db = null;

        public BidTransDal()
        {
            db = new MsSqlHelper();
        }
        //
        public bool UpdateState(string row, string where)
        {
            try
            {
                string strSql = string.Format("update T_BidTrans set {0} where {1}", row, where);
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
        public int Exists(int FK_BidId)
        {
            try
            {
                string strSql = string.Format(" select count(*) from T_BidTrans where FK_BidId ={0} and TradingStatus =1", FK_BidId);
                return (int)db.ExecuteScalar(strSql);
            }
            catch
            {
                return 0;
            }
        }      
        //
        public bool Create(BidTrans model)
        {
            try
            {
                StringBuilder strSql = new StringBuilder();
                strSql.Append("insert into T_BidTrans(");
                strSql.Append("FK_BidId,FK_LiceTranId,TradingStatus,Editor,CreateDate,ApplyDate)");
                strSql.Append(" values (");
                strSql.Append("@FK_BidId,@FK_LiceTranId,@TradingStatus,@Editor,@CreateDate,@ApplyDate)");
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
        public bool Update(BidTrans model)
        {
            try
            {
                StringBuilder strSql = new StringBuilder();
                strSql.Append("update T_BidTrans set ");
                strSql.Append("FK_BidId=@FK_BidId,");
                strSql.Append("FK_LiceTranId=@FK_LiceTranId,");
                strSql.Append("TradingStatus=@TradingStatus,");
                strSql.Append("Editor=@Editor,");
                strSql.Append("CreateDate=@CreateDate,");
                strSql.Append("ApplyDate=@ApplyDate");
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
        public dynamic SumCount(string where)
        {
            try
            {
                string strSql = " select count(a.Id)from T_BidTrans as b left join T_Bid as a on b.FK_BidId = a.Id ";
                if (!string.IsNullOrEmpty(where))
                {
                    strSql += string.Format(" where {0}", where);
                }
                return db.ExecuteScalar(strSql);
            }
            catch { throw; }
        }
        //
        public bool Delete(int Id)
        {
            try
            {
                StringBuilder strSql = new StringBuilder();
                strSql.Append("delete from T_BidTrans ");
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
            catch { throw; }
        }
        //
        public dynamic GetAllList(string sqlWhere, int startIndex, int pageSize, string order)
        {
            try
            {
                string strSql = " select m.FK_BidId as BidId,m.Id,b.OrgShortName as OrgCode,k.Name,m.FK_LiceTranId as TranId,a.FK_LiceTranId as LiceId,a.BidName,a.ListingPrice,a.StartDate,a.EndDate,a.BidBasic,a.Ownership,d.PropertyTypeName as Properties,e.TurnOutTypeName as TurnOut,a.RightsBodies,a.FeedingMechanism,a.WarrantNumber,f.StandardModeName as StandardMode,g.StandardTypeName as StandardType,a.LowTransaction,a.Turnover,a.ContractDate,a.ContractNo,a.Admissibility,a.NoAssurance,a.TradingCenterName,a.AreContract,a.RelatesNum,h.JobTypeName as DepaStatus,a.DepaStatus as DepaStatusId,a.ReturnStatus,a.UpManager,a.Publicity,a.Change,a.Cancel,a.Lost from T_BidTrans as m left join T_Bid as a on m.FK_BidId = a.Id left join T_LiceTran as k on m.FK_LiceTranId = k.Id left join T_Organization as b on a.OrgCOde = b.OrgCode left join T_PropertyType as d on a.Properties=d.Id left join T_TurnOutType as e on a.TurnOut = e.Id left join T_StandardMode as f on a.StandardMode=f.Id left join  T_StandardType as g on a.StandardType=g.Id left join T_Job as h on a.DepaStatus =h.Id  ";
                if (!string.IsNullOrEmpty(sqlWhere))
                {
                    strSql += string.Format(" where {0}", sqlWhere);
                }
                if (!string.IsNullOrEmpty(order))
                {
                    strSql += order;
                }
                return db.ExecuteDataTable(strSql, startIndex * pageSize, pageSize, "T_BidTrans");
            }
            catch { throw; }
        }
        //
        public DataTable GetList(int Id)
        {
            try
            {
                string strSql = string.Format(" select a.Id,b.Id as FK_LiceTranId,b.[LiceTranType],b.[OrgCode],c.TypeCertificationName,b.[Name],b.[Addr],b.[Contact],b.[Corporate],b.[IDCard],b.[OrganizationCode],b.[Tel],b.[Owner],b.[Capital],b.[ApplyDate],b.[AuditType] from T_BidTrans as a left join T_LiceTran as b on a.FK_LiceTranId= b.Id  left join T_MemberTypeCertification as c on b.[MemberTypeId] =c.Id where a.FK_BidId ={0} ", Id);
                return db.ExecuteDataTable(strSql);
            }
            catch { throw; }
        }
        //
        public dynamic GetById(int Id)
        {
            try
            {
                string strSql = string.Format(" select m.Id,m.FK_BidId,m.FK_LiceTranId,m.TradingStatus,m.Editor,m.CreateDate,m.ApplyDate,a.OrgCode from T_BidTrans as m left join T_Bid as a on m.FK_BidId = a.Id where m.Id={0} ", Id);
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
                strSql.Append(" select Id,FK_BidId,FK_LiceTranId,ApplyDate,TradingStatus,Editor,CreateDate from T_BidTrans ");
                strSql.Append(" where Id=@Id");
                SqlParameter[] parameters = {
					new SqlParameter("@Id", SqlDbType.Int,4)
			};
                parameters[0].Value = Id;
                using (dynamic read = db.ExecuteReader(strSql.ToString(), parameters))
                {
                    if (read.Read())
                    {
                        model = new BidTrans();
                        model.Id = int.Parse(read["Id"].ToString());
                        model.FK_BidId = int.Parse(read["FK_BidId"].ToString());
                        model.FK_LiceTranId = int.Parse(read["FK_LiceTranId"].ToString());
                        model.TradingStatus = int.Parse(read["TradingStatus"].ToString());
                        model.Editor = read["Editor"].ToString();
                        model.CreateDate = DateTime.Parse(read["CreateDate"].ToString());
                        model.ApplyDate = DateTime.Parse(read["ApplyDate"].ToString());
                    }
                    read.Dispose();
                }
                return model;
            }
            catch { throw; }
        }
        //
        private SqlParameter[] GetSqlParameter(BidTrans model)
        {
            SqlParameter[] parameters = {					
					new SqlParameter("@FK_BidId", SqlDbType.Int,4),
					new SqlParameter("@FK_LiceTranId", SqlDbType.Int,4),
					new SqlParameter("@TradingStatus", SqlDbType.Int,4),
					new SqlParameter("@Editor", SqlDbType.NVarChar,50),
					new SqlParameter("@CreateDate", SqlDbType.DateTime),
					new SqlParameter("@ApplyDate", SqlDbType.DateTime),
					new SqlParameter("@Id", SqlDbType.Int,4)};
            parameters[0].Value = model.FK_BidId;
            parameters[1].Value = model.FK_LiceTranId;
            parameters[2].Value = model.TradingStatus;
            parameters[3].Value = model.Editor;
            parameters[4].Value = model.CreateDate;
            parameters[5].Value = model.ApplyDate;
            parameters[6].Value = model.Id;
            return parameters;
        }
        //
        //
        //
        //
        public dynamic SumCount(int FK_LiceTranId)
        {
            try
            {
                string strSql = string.Format(" select count(a.Id) from T_BidTrans as b left join T_Bid as a on b.FK_BidId = a.Id  where a.FK_LiceTranId in (select Id from T_LiceTran where FK_WebUserVeriId ={0}) ",FK_LiceTranId);               
                return db.ExecuteScalar(strSql);
            }
            catch { throw; }
        }
        //
        public dynamic GetAllList(int FK_LiceTranId, int startIndex, int pageSize, string order)
        {
            try
            {
                string strSql = string.Format(" select m.FK_BidId as BidId,m.Id,b.OrgShortName as OrgCode,k.Name,m.FK_LiceTranId as TranId,a.FK_LiceTranId as LiceId,a.BidName,a.ListingPrice,a.StartDate,a.EndDate,a.BidBasic,a.Ownership,d.PropertyTypeName as Properties,e.TurnOutTypeName as TurnOut,a.RightsBodies,a.FeedingMechanism,a.WarrantNumber,f.StandardModeName as StandardMode,g.StandardTypeName as StandardType,a.LowTransaction,a.Turnover,a.ContractDate,a.ContractNo,a.Admissibility,a.NoAssurance,a.TradingCenterName,a.AreContract,a.RelatesNum,h.JobTypeName as DepaStatus,a.DepaStatus as DepaStatusId,a.ReturnStatus,a.UpManager,a.Publicity,a.Change,a.Cancel,a.Lost from T_BidTrans as m left join T_Bid as a on m.FK_BidId = a.Id left join T_LiceTran as k on m.FK_LiceTranId = k.Id left join T_Organization as b on a.OrgCOde = b.OrgCode left join T_PropertyType as d on a.Properties=d.Id left join T_TurnOutType as e on a.TurnOut = e.Id left join T_StandardMode as f on a.StandardMode=f.Id left join  T_StandardType as g on a.StandardType=g.Id left join T_Job as h on a.DepaStatus =h.Id where m.FK_LiceTranId in (select Id from T_LiceTran where FK_WebUserVeriId ={0}) ", FK_LiceTranId);               
                if (!string.IsNullOrEmpty(order))
                {
                    strSql += order;
                }
                return db.ExecuteDataTable(strSql, startIndex * pageSize, pageSize, "T_BidTrans");
            }
            catch { throw; }
        }
    }
}


