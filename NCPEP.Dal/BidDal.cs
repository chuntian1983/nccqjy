
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using NCPEP.Com.Util;
using NCPEP.Model;
using System.Data;
using System.Data.SqlClient;
using Maticsoft.DBUtility;

namespace NCPEP.Dal
{
    public class BidDal
    {
        private MsSqlHelper db = null;
        //
        public BidDal()
        {
            db = new MsSqlHelper();
        }
        //
        public DataTable GetModelPrint(int Id) {

            string strSql = string.Format(" select a.Admissibility, jzs.cjje,jzs.beiyong,jzs.zcdate,jzs.zcdatez,jzs.beizhu, a.LowTransaction,a.Turnover, a.guimo,a.danwei,a.Ownership,o.OrgName,a.BidName,a.StartDate,l.Name as LName,p.PropertyTypeName,l.Tel as LTel,a.RelatesNum,t.Name,mt.TypeCertificationName,t.Tel,tt.TurnOutTypeName,sm.StandardModeName,a.ListingPrice,a.EndDate,a.AreContract,a.TradingCenterName,a.CreateDate from T_Bid as a  left join T_BidTrans as b on a.Id = b.FK_BidId left join T_LiceTran as l on a.FK_LiceTranId = l.Id left join T_LiceTran as t on t.Id= b.FK_LiceTranId  left join T_MemberTypeCertification as mt on l.MemberTypeId=mt.Id left join T_Organization as o on a.OrgCOde=o.OrgCOde left join T_PropertyType as p on a.Properties = p.Id left join T_TurnOutType as tt on tt.Id=a.TurnOut left join T_StandardMode as sm on sm.Id=a.StandardMode left join T_Jzs as jzs on jzs.binid=a.Id where b.TradingStatus =1   and a.Id = {0} ", Id);
            return db.ExecuteDataTable(strSql);
        }
        //
        public DataTable Summary(string orgcode)
        {
            try
            {
                string strSql = string.Format(" select a.guimo,a.danwei,a.Ownership,o.OrgName,a.BidName,a.StartDate,l.Name as LName,p.PropertyTypeName,l.Tel as LTel,a.RelatesNum,t.Name,mt.TypeCertificationName,t.Tel,tt.TurnOutTypeName,sm.StandardModeName,a.ListingPrice,a.EndDate,a.AreContract,a.TradingCenterName,a.CreateDate from T_Bid as a  left join T_BidTrans as b on a.Id = b.FK_BidId left join T_LiceTran as l on a.FK_LiceTranId = l.Id left join T_LiceTran as t on t.Id= b.FK_LiceTranId  left join T_MemberTypeCertification as mt on l.MemberTypeId=mt.Id left join T_Organization as o on a.OrgCOde=o.OrgCOde left join T_PropertyType as p on a.Properties = p.Id left join T_TurnOutType as tt on tt.Id=a.TurnOut left join T_StandardMode as sm on sm.Id=a.StandardMode where b.TradingStatus =1 and a.OrgCOde = '{0}' ", orgcode);
                return db.ExecuteDataTable(strSql);
            }
            catch { throw; }
        }
        //
        public dynamic Create(Bid model)
        {
            try
            {
                StringBuilder strSql = new StringBuilder();
                strSql.Append("insert into T_Bid(");
                strSql.Append("OrgCode,FK_LiceTranId,BidName,ListingPrice,StartDate,EndDate,BidBasic,Ownership,Properties,TurnOut,RightsBodies,FeedingMechanism,WarrantNumber,LowTransaction,Turnover,ContractDate,ContractNo,Admissibility,NoAssurance,TradingCenterName,AreContract,RelatesNum,DepaStatus,ReturnStatus,UpManager,Publicity,Change,Cancel,Lost,StandardMode,StandardType)");
                strSql.Append(" values (");
                strSql.Append("@OrgCode,@FK_LiceTranId,@BidName,@ListingPrice,@StartDate,@EndDate,@BidBasic,@Ownership,@Properties,@TurnOut,@RightsBodies,@FeedingMechanism,@WarrantNumber,@LowTransaction,@Turnover,@ContractDate,@ContractNo,@Admissibility,@NoAssurance,@TradingCenterName,@AreContract,@RelatesNum,@DepaStatus,@ReturnStatus,@UpManager,@Publicity,@Change,@Cancel,@Lost,@StandardMode,@StandardType)");
                strSql.Append(";select @@IDENTITY");
                return (int)db.ExecuteScalar(strSql.ToString(), GetSqlParameter(model));
            }
            catch { throw; }
        }
        //
        public bool Update(Bid model)
        {
            try
            {
                StringBuilder strSql = new StringBuilder();
                strSql.Append("update T_Bid set ");
                strSql.Append("OrgCode=@OrgCode,");
                strSql.Append("FK_LiceTranId=@FK_LiceTranId,");
                strSql.Append("BidName=@BidName,");
                strSql.Append("ListingPrice=@ListingPrice,");
                strSql.Append("StartDate=@StartDate,");
                strSql.Append("EndDate=@EndDate,");
                strSql.Append("BidBasic=@BidBasic,");
                strSql.Append("Ownership=@Ownership,");
                strSql.Append("Properties=@Properties,");
                strSql.Append("TurnOut=@TurnOut,");
                strSql.Append("RightsBodies=@RightsBodies,");
                strSql.Append("FeedingMechanism=@FeedingMechanism,");
                strSql.Append("WarrantNumber=@WarrantNumber,");
                strSql.Append("LowTransaction=@LowTransaction,");
                strSql.Append("Turnover=@Turnover,");
                strSql.Append("ContractDate=@ContractDate,");
                strSql.Append("ContractNo=@ContractNo,");
                strSql.Append("Admissibility=@Admissibility,");
                strSql.Append("NoAssurance=@NoAssurance,");
                strSql.Append("TradingCenterName=@TradingCenterName,");
                strSql.Append("AreContract=@AreContract,");
                strSql.Append("RelatesNum=@RelatesNum,");
                strSql.Append("DepaStatus=@DepaStatus,");
                strSql.Append("ReturnStatus=@ReturnStatus,");
                strSql.Append("UpManager=@UpManager,");
                strSql.Append("Publicity=@Publicity,");
                strSql.Append("Change=@Change,");
                strSql.Append("Cancel=@Cancel,");
                strSql.Append("Lost=@Lost,");
                strSql.Append("StandardMode=@StandardMode,");
                strSql.Append("StandardType=@StandardType");
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
                string strSql = " select count(a.Id) from T_Bid as a";
                if (!string.IsNullOrEmpty(where))
                {
                    strSql += string.Format(" where {0}", where);
                }
                return db.ExecuteScalar(strSql);
            }
            catch { throw; }
        }
        public dynamic SumCountByDyzt(string where)
        {
            try
            {
                string strSql = " select count(a.id) from t_dyzt a left join T_Bid b on b.Id=a.binid left join T_Organization c on c.OrgCode=b.OrgCode left join T_LiceTran d on d.Id=b.FK_LiceTranId";
                if (!string.IsNullOrEmpty(where))
                {
                    strSql += string.Format(" where {0}", where);
                }
                return db.ExecuteScalar(strSql);
            }
            catch { throw; }
        }
        //
        public int GetMaxAdmissibility()
        {
            try
            {
                string sql = " select max(isnull(convert(int,Admissibility) ,0)) from T_BID ";
                int Admissibility = Convert.ToInt32(db.ExecuteScalar(sql));
                int newAdmissibility = 0;
                if (Admissibility.ToString().Length > 3)
                {
                    newAdmissibility = int.Parse(Admissibility.ToString().Substring(Admissibility.ToString().Length - 6, 6));
                }
                return newAdmissibility + 1;
            }
            catch { return 1; }
        }
        //
        public int GetMaxNoAssurance()
        {
            try
            {
                string sql = " select max(isnull(convert(int,NoAssurance),0)) from T_Bid ";
                int NoAssurance = Convert.ToInt32(db.ExecuteScalar(sql));
                int newNoAssurance = 0;
                if (NoAssurance.ToString().Length > 3)
                {
                    newNoAssurance = int.Parse(NoAssurance.ToString().Substring(NoAssurance.ToString().Length - 6, 6));
                }
                return newNoAssurance + 1;
            }
            catch { return 1; }
        }
        //
        public int GetMaxContractNo()
        {
            try
            {
                string sql = " select max(ContractNo) from T_BID ";
                object ContractNo = db.ExecuteScalar(sql);
                int newContractNo = 0;
                if (ContractNo.ToString().Length > 5)
                {
                    newContractNo = int.Parse(ContractNo.ToString().Substring(ContractNo.ToString().Length - 6, 6));
                }
                return newContractNo + 1;
            }
            catch { return 1; }
        }
        //
        public bool Delete(int Id)
        {
            try
            {
                StringBuilder strSql = new StringBuilder();
                strSql.Append("delete from T_Bid ");
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
        public bool UpdateState(string rows, int value, int Id)
        {
            try
            {
                string strSql = string.Format("update T_Bid set {0} = {1} where Id = {2}", rows, value, Id);
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
        public bool UpdateState(string rows, string where)
        {
            try
            {
                string strSql = string.Format("update T_Bid set {0} where {1}", rows, where);
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
        public DataTable GetList(int WebUserVeriId, int startIndex, int pageSize, string order)
        {
            try
            {
                string strSql = string.Format(" select a.Id,b.OrgShortName as OrgCode,a.OrgCode as oCode,c.Name as LiceTran,a.FK_LiceTranId,a.BidName,a.DepaStatus as A,a.DepaStatus as B,a.DepaStatus as C,a.DepaStatus as D,a.DepaStatus as E,a.DepaStatus as F,a.DepaStatus as G from T_Bid as a left join T_Organization as b on a.OrgCOde = b.OrgCode left join T_LiceTran as c on a.FK_LiceTranId  =c.Id left join T_PropertyType as d on a.Properties=d.Id left join T_TurnOutType as e on a.TurnOut = e.Id left join T_StandardMode as f on a.StandardMode=f.Id left join  T_StandardType as g on a.StandardType=g.Id left join T_Job as h on a.DepaStatus =h.Id where a.FK_LiceTranId in (select Id from T_LiceTran where FK_WebUserVeriId ={0}) ", WebUserVeriId);
                if (!string.IsNullOrEmpty(order))
                {
                    strSql += order;
                }
                return db.ExecuteDataTable(strSql, startIndex * pageSize, pageSize, "T_Bid");
            }
            catch { throw; }
        }
        //
        public DataTable GetList(string OrgCode)
        {
            try
            {
                string strSql = string.Format(" select Id,BidName from T_Bid  where OrgCOde ='{0}' and Id not in (select FK_BidId from T_BidTrans where TradingStatus =1) and DepaStatus=7 ", OrgCode);
                return db.ExecuteDataTable(strSql);
            }
            catch { throw; }
        }
        //
        public DataTable GetAllList(string OrgCode)
        {
            try
            {
                string strSql = string.Format(" select Id,BidName from T_Bid  where OrgCOde ='{0}' and Id not in (select FK_BidId from T_BidTrans where TradingStatus =1)", OrgCode);
                return db.ExecuteDataTable(strSql);
            }
            catch { throw; }
        }
        //
        public DataTable GetAllList(string sqlWhere, int startIndex, int pageSize, string order)
        {
            try
            {
                string strSql = "  select a.guimo,a.danwei,a.Id,b.OrgShortName as OrgCode,a.OrgCode as oCode,c.Name as LiceTran,a.FK_LiceTranId,a.BidName,a.ListingPrice,a.StartDate,a.EndDate,a.BidBasic,a.Ownership,d.PropertyTypeName as Properties,e.TurnOutTypeName as TurnOut,a.RightsBodies,a.FeedingMechanism,a.WarrantNumber,f.StandardModeName as StandardMode,g.StandardTypeName as StandardType,a.LowTransaction,a.Turnover,a.ContractDate,a.ContractNo,a.Admissibility,a.NoAssurance,a.TradingCenterName,a.AreContract,a.RelatesNum,h.JobTypeName as DepaStatus,a.DepaStatus as DepaStatusId,a.ReturnStatus,a.UpManager,a.Publicity,a.Change,a.Cancel,a.Lost from T_Bid as a left join T_Organization as b on a.OrgCOde = b.OrgCode left join T_LiceTran as c on a.FK_LiceTranId  =c.Id left join T_PropertyType as d on a.Properties=d.Id left join T_TurnOutType as e on a.TurnOut = e.Id left join T_StandardMode as f on a.StandardMode=f.Id left join  T_StandardType as g on a.StandardType=g.Id left join T_Job as h on a.DepaStatus =h.Id ";
                if (!string.IsNullOrEmpty(sqlWhere))
                {
                    strSql += string.Format(" where {0}", sqlWhere);
                }
                if (!string.IsNullOrEmpty(order))
                {
                    strSql += order;
                }
                return db.ExecuteDataTable(strSql, startIndex * pageSize, pageSize, "T_Bid");
            }
            catch { throw; }
        }
        public DataTable GetAllListByDyzt(string sqlWhere, int startIndex, int pageSize, string order)
        {
            try
            {
                string strSql = "  select a.*,c.OrgShortName,d.Name,b.* from t_dyzt a left join T_Bid b on b.Id=a.binid left join T_Organization c on c.OrgCode=b.OrgCode left join T_LiceTran d on d.Id=b.FK_LiceTranId  ";
                if (!string.IsNullOrEmpty(sqlWhere))
                {
                    strSql += string.Format(" where {0}", sqlWhere);
                }
                if (!string.IsNullOrEmpty(order))
                {
                    strSql += order;
                }
                return db.ExecuteDataTable(strSql, startIndex * pageSize, pageSize, "T_Bid");
            }
            catch { throw; }
        }
        //
        public DataTable GetById(string sqlWhere)
        {
            try
            {
                string strSql = string.Format(" select a.Id,b.OrgShortName as OrgCode,k.TypeCertificationName,c.Addr,c.Owner,c.Contact,c.Corporate,c.Tel,c.IDCard,c.Capital,c.OrganizationCode,c.Name,a.FK_LiceTranId,a.BidName,a.ListingPrice,a.StartDate,a.EndDate,a.BidBasic,a.Ownership,d.PropertyTypeName as Properties,e.TurnOutTypeName as TurnOut,a.RightsBodies,a.FeedingMechanism,a.WarrantNumber,f.StandardModeName as StandardMode,g.StandardTypeName as StandardType,a.LowTransaction,a.Turnover,a.ContractDate,a.ContractNo,a.Admissibility,a.NoAssurance,a.TradingCenterName,a.AreContract,a.RelatesNum,h.JobTypeName as DepaStatus,a.DepaStatus as DepaStatusId,a.ReturnStatus,a.UpManager,a.Publicity,a.Change,a.Cancel,a.Lost from T_Bid as a left join T_Organization as b on a.OrgCOde = b.OrgCode left join T_LiceTran as c on a.FK_LiceTranId  =c.Id left join T_PropertyType as d on a.Properties=d.Id left join T_TurnOutType as e on a.TurnOut = e.Id left join T_StandardMode as f on a.StandardMode=f.Id left join  T_StandardType as g on a.StandardType=g.Id left join T_Job as h on a.DepaStatus =h.Id left join T_MemberTypeCertification as k on c.MemberTypeId = k.Id  where {0}", sqlWhere);
                return db.ExecuteDataTable(strSql);
            }
            catch { throw; }
        }
        //
        public DataTable GetId(int Id)
        {
            try
            {
                string strSql = string.Format(" select a.srfjbtj,a.Id,b.OrgShortName as OrgCode,k.TypeCertificationName,c.Addr,c.Owner,c.Contact,c.Corporate,c.Tel,c.IDCard,c.Capital,c.OrganizationCode,c.Name,a.FK_LiceTranId,a.BidName,a.ListingPrice,a.StartDate,a.EndDate,a.BidBasic,a.Ownership,d.PropertyTypeName as Properties,e.TurnOutTypeName as TurnOut,a.RightsBodies,a.FeedingMechanism,a.WarrantNumber,f.StandardModeName as StandardMode,g.StandardTypeName as StandardType,a.LowTransaction,a.Turnover,a.ContractDate,a.ContractNo,a.Admissibility,a.NoAssurance,a.TradingCenterName,a.AreContract,a.RelatesNum,h.JobTypeName as DepaStatus,a.DepaStatus as DepaStatusId,a.ReturnStatus,a.UpManager,a.Publicity,a.Change,a.Cancel,a.Lost from T_Bid as a left join T_Organization as b on a.OrgCOde = b.OrgCode left join T_LiceTran as c on a.FK_LiceTranId  =c.Id left join T_PropertyType as d on a.Properties=d.Id left join T_TurnOutType as e on a.TurnOut = e.Id left join T_StandardMode as f on a.StandardMode=f.Id left join  T_StandardType as g on a.StandardType=g.Id left join T_Job as h on a.DepaStatus =h.Id left join T_MemberTypeCertification as k on c.MemberTypeId = k.Id  where a.Id={0}", Id);
                return db.ExecuteDataTable(strSql);
            }
            catch { throw; }
        }
        //
        public dynamic GetModel(int Id)
        {
            try
            {
                NCPEP.Model.T_Bid model = null;
                StringBuilder strSql = new StringBuilder();
                strSql.Append(" select * from T_Bid  ");
                strSql.Append(" where Id=@Id");
                SqlParameter[] parameters = {
					new SqlParameter("@Id", SqlDbType.Int,4)
			};
                parameters[0].Value = Id;
                using (dynamic read = db.ExecuteReader(strSql.ToString(), parameters))
                {
                    if (read.Read())
                    {
                        model = new NCPEP.Model.T_Bid();
                        try { model.Id = int.Parse(read["Id"].ToString()); }
                        catch { }
                        model.OrgCode = read["OrgCode"].ToString();
                        try { model.FK_LiceTranId = int.Parse(read["FK_LiceTranId"].ToString()); }
                        catch { }
                        model.BidName = read["BidName"].ToString();
                        model.ListingPrice = read["ListingPrice"].ToString();
                        try { model.StartDate = DateTime.Parse(read["StartDate"].ToString()); }
                        catch { }
                        try { model.EndDate = DateTime.Parse(read["EndDate"].ToString()); }
                        catch { }
                        model.BidBasic = read["BidBasic"].ToString();
                        model.Ownership = read["Ownership"].ToString();
                        model.Properties = read["Properties"].ToString();
                        try { model.TurnOut = int.Parse(read["TurnOut"].ToString()); }
                        catch { }
                        model.RightsBodies = read["RightsBodies"].ToString();
                        model.FeedingMechanism = read["FeedingMechanism"].ToString();
                        model.WarrantNumber = read["WarrantNumber"].ToString();
                        model.LowTransaction = read["LowTransaction"].ToString();
                        try { model.Turnover = decimal.Parse(read["Turnover"].ToString()); }
                        catch { }
                        model.ContractDate = read["ContractDate"].ToString();
                        model.ContractNo = read["ContractNo"].ToString();
                        model.Admissibility = read["Admissibility"].ToString();
                        model.NoAssurance = read["NoAssurance"].ToString();
                        model.TradingCenterName = read["TradingCenterName"].ToString();
                        model.AreContract = read["AreContract"].ToString();
                        model.RelatesNum = read["RelatesNum"].ToString();
                        try { model.DepaStatus = int.Parse(read["DepaStatus"].ToString()); }
                        catch { }
                        try { model.ReturnStatus = int.Parse(read["ReturnStatus"].ToString()); }
                        catch { }
                        try { model.UpManager = int.Parse(read["UpManager"].ToString()); }
                        catch { }
                        model.Publicity = read["Publicity"].ToString();
                        try { model.Change = int.Parse(read["Change"].ToString()); }
                        catch { }
                        try { model.Cancel = int.Parse(read["Cancel"].ToString()); }
                        catch { }
                        try { model.Lost = int.Parse(read["Lost"].ToString()); }
                        catch { }
                        try
                        {
                            model.StandardMode = int.Parse(read["StandardMode"].ToString());
                        }
                        catch { }
                        try
                        {
                            model.StandardType = int.Parse(read["StandardType"].ToString());
                        }
                        catch { }
                        try { model.guimo = read["guimo"].ToString(); }
                        catch { }
                        try { model.danwei = read["danwei"].ToString(); }
                        catch { }
                    }
                    read.Dispose();
                }
                return model;
            }
            catch { throw; }
        }
        //
        public dynamic GetAdmissibilityModel(int Admissibility)
        {
            try
            {
                dynamic model = null;
                string strSql = string.Format(" select Id,OrgCode,FK_LiceTranId,BidName,ListingPrice,StartDate,EndDate,BidBasic,Ownership,Properties,TurnOut,RightsBodies,FeedingMechanism,WarrantNumber,LowTransaction,Turnover,ContractDate,ContractNo,Admissibility,NoAssurance,TradingCenterName,AreContract,RelatesNum,DepaStatus,ReturnStatus,UpManager,Publicity,Change,Cancel,Lost,StandardMode,StandardType from T_Bid   where Admissibility={0}", Admissibility);
                using (dynamic read = db.ExecuteReader(strSql.ToString()))
                {
                    if (read.Read())
                    {
                        model = new Bid();
                        try { model.Id = int.Parse(read["Id"].ToString()); }
                        catch { }
                        model.OrgCode = read["OrgCode"].ToString();
                        try { model.FK_LiceTranId = int.Parse(read["FK_LiceTranId"].ToString()); }
                        catch { }
                        model.BidName = read["BidName"].ToString();
                        model.ListingPrice = read["ListingPrice"].ToString();
                        try { model.StartDate = DateTime.Parse(read["StartDate"].ToString()); }
                        catch { }
                        try { model.EndDate = DateTime.Parse(read["EndDate"].ToString()); }
                        catch { }
                        model.BidBasic = read["BidBasic"].ToString();
                        model.Ownership = read["Ownership"].ToString();
                        model.Properties = read["Properties"].ToString();
                        try { model.TurnOut = int.Parse(read["TurnOut"].ToString()); }
                        catch { }
                        model.RightsBodies = read["RightsBodies"].ToString();
                        model.FeedingMechanism = read["FeedingMechanism"].ToString();
                        model.WarrantNumber = read["WarrantNumber"].ToString();
                        model.LowTransaction = read["LowTransaction"].ToString();
                        try { model.Turnover = decimal.Parse(read["Turnover"].ToString()); }
                        catch { }
                        model.ContractDate = read["ContractDate"].ToString();
                        model.ContractNo = read["ContractNo"].ToString();
                        model.Admissibility = read["Admissibility"].ToString();
                        model.NoAssurance = read["NoAssurance"].ToString();
                        model.TradingCenterName = read["TradingCenterName"].ToString();
                        model.AreContract = read["AreContract"].ToString();
                        model.RelatesNum = read["RelatesNum"].ToString();
                        try { model.DepaStatus = int.Parse(read["DepaStatus"].ToString()); }
                        catch { }
                        try { model.ReturnStatus = int.Parse(read["ReturnStatus"].ToString()); }
                        catch { }
                        try { model.UpManager = int.Parse(read["UpManager"].ToString()); }
                        catch { }
                        model.Publicity = read["Publicity"].ToString();
                        try { model.Change = int.Parse(read["Change"].ToString()); }
                        catch { }
                        try { model.Cancel = int.Parse(read["Cancel"].ToString()); }
                        catch { }
                        try { model.Lost = int.Parse(read["Lost"].ToString()); }
                        catch { }
                        try { model.StandardMode = int.Parse(read["StandardMode"].ToString()); }
                        catch { }
                        try { model.StandardType = int.Parse(read["StandardType"].ToString()); }
                        catch { }
                    }
                    read.Dispose();
                }
                return model;
            }
            catch { throw; }
        }
        //
        private SqlParameter[] GetSqlParameter(Bid model)
        {
            SqlParameter[] parameters = {					
					new SqlParameter("@OrgCode", SqlDbType.NVarChar,50),
					new SqlParameter("@FK_LiceTranId", SqlDbType.Int,4),
					new SqlParameter("@BidName", SqlDbType.NVarChar,100),
					new SqlParameter("@ListingPrice", SqlDbType.NVarChar,50),
					new SqlParameter("@StartDate", SqlDbType.DateTime),
					new SqlParameter("@EndDate", SqlDbType.DateTime),
					new SqlParameter("@BidBasic", SqlDbType.NVarChar,500),
					new SqlParameter("@Ownership", SqlDbType.NVarChar,50),
					new SqlParameter("@Properties", SqlDbType.NVarChar,50),
					new SqlParameter("@TurnOut", SqlDbType.Int,4),
					new SqlParameter("@RightsBodies", SqlDbType.NVarChar,50),
					new SqlParameter("@FeedingMechanism", SqlDbType.NVarChar,50),
					new SqlParameter("@WarrantNumber", SqlDbType.NVarChar,50),
					new SqlParameter("@LowTransaction", SqlDbType.NVarChar,50),
					new SqlParameter("@Turnover", SqlDbType.Decimal,9),
					new SqlParameter("@ContractDate", SqlDbType.NVarChar,50),
					new SqlParameter("@ContractNo", SqlDbType.NVarChar,50),				
					new SqlParameter("@Admissibility", SqlDbType.NVarChar,50),					
					new SqlParameter("@NoAssurance", SqlDbType.NVarChar,50),
					new SqlParameter("@TradingCenterName", SqlDbType.NVarChar,50),
					new SqlParameter("@AreContract", SqlDbType.NVarChar,5),
					new SqlParameter("@RelatesNum", SqlDbType.NVarChar,5),
					new SqlParameter("@DepaStatus", SqlDbType.Int,4),
					new SqlParameter("@ReturnStatus", SqlDbType.Int,4),
					new SqlParameter("@UpManager", SqlDbType.Int,4),
					new SqlParameter("@Publicity", SqlDbType.NVarChar,5),
					new SqlParameter("@Change", SqlDbType.Int,4),
					new SqlParameter("@Cancel", SqlDbType.Int,4),
					new SqlParameter("@Lost", SqlDbType.Int,4),
					new SqlParameter("@StandardMode", SqlDbType.Int,4),
					new SqlParameter("@StandardType", SqlDbType.Int,4),
					new SqlParameter("@Id", SqlDbType.Int,4)};
            parameters[0].Value = model.OrgCode;
            parameters[1].Value = model.FK_LiceTranId;
            parameters[2].Value = model.BidName;
            parameters[3].Value = model.ListingPrice;
            parameters[4].Value = model.StartDate;
            parameters[5].Value = model.EndDate;
            parameters[6].Value = model.BidBasic;
            parameters[7].Value = model.Ownership;
            parameters[8].Value = model.Properties;
            parameters[9].Value = model.TurnOut;
            parameters[10].Value = model.RightsBodies;
            parameters[11].Value = model.FeedingMechanism;
            parameters[12].Value = model.WarrantNumber;
            parameters[13].Value = model.LowTransaction;
            parameters[14].Value = model.Turnover;
            parameters[15].Value = model.ContractDate;
            parameters[16].Value = model.ContractNo;
            parameters[17].Value = model.Admissibility;
            parameters[18].Value = model.NoAssurance;
            parameters[19].Value = model.TradingCenterName;
            parameters[20].Value = model.AreContract;
            parameters[21].Value = model.RelatesNum;
            parameters[22].Value = model.DepaStatus;
            parameters[23].Value = model.ReturnStatus;
            parameters[24].Value = model.UpManager;
            parameters[25].Value = model.Publicity;
            parameters[26].Value = model.Change;
            parameters[27].Value = model.Cancel;
            parameters[28].Value = model.Lost;
            parameters[29].Value = model.StandardMode;
            parameters[30].Value = model.StandardType;
            parameters[31].Value = model.Id;
            return parameters;
        }
        //
        public DataTable GetAllList(int WebUserVeriId, int startIndex, int pageSize, string order)
        {
            try
            {
                string strSql = string.Format(" select a.Id,b.OrgShortName as OrgCode,a.OrgCode as oCode,c.Name as LiceTran,a.FK_LiceTranId,a.BidName,a.ListingPrice,a.StartDate,a.EndDate,a.BidBasic,a.Ownership,d.PropertyTypeName as Properties,e.TurnOutTypeName as TurnOut,a.RightsBodies,a.FeedingMechanism,a.WarrantNumber,f.StandardModeName as StandardMode,g.StandardTypeName as StandardType,a.LowTransaction,a.Turnover,a.ContractDate,a.ContractNo,a.Admissibility,a.NoAssurance,a.TradingCenterName,a.AreContract,a.RelatesNum,h.JobTypeName as DepaStatus,a.DepaStatus as DepaStatusId,a.ReturnStatus,a.UpManager,a.Publicity,a.Change,a.Cancel,a.Lost from T_Bid as a left join T_Organization as b on a.OrgCOde = b.OrgCode left join T_LiceTran as c on a.FK_LiceTranId  =c.Id left join T_PropertyType as d on a.Properties=d.Id left join T_TurnOutType as e on a.TurnOut = e.Id left join T_StandardMode as f on a.StandardMode=f.Id left join  T_StandardType as g on a.StandardType=g.Id left join T_Job as h on a.DepaStatus =h.Id where a.FK_LiceTranId in (select Id from T_LiceTran where FK_WebUserVeriId ={0})", WebUserVeriId);
                if (!string.IsNullOrEmpty(order))
                {
                    strSql += order;
                }
                return db.ExecuteDataTable(strSql, startIndex * pageSize, pageSize, "T_Bid");
            }
            catch { throw; }
        }
        //
        public dynamic SumCount(int WebUserVeriId)
        {
            try
            {
                string strSql = string.Format("  select count(a.Id) from T_Bid as a left join T_Organization as b on a.OrgCOde = b.OrgCode left join T_LiceTran as c on a.FK_LiceTranId  =c.Id left join T_PropertyType as d on a.Properties=d.Id left join T_TurnOutType as e on a.TurnOut = e.Id left join T_StandardMode as f on a.StandardMode=f.Id left join  T_StandardType as g on a.StandardType=g.Id left join T_Job as h on a.DepaStatus =h.Id where a.FK_LiceTranId in (select Id from T_LiceTran where FK_WebUserVeriId ={0})", WebUserVeriId);
                return db.ExecuteScalar(strSql);
            }
            catch { throw; }
        }
        /// <summary>
        /// 获取记录总数
        /// </summary>
        public int GetRecordCount(string strWhere)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("select count(1) FROM View_Bid ");
            if (strWhere.Trim() != "")
            {
                strSql.Append(" where " + strWhere);
            }
            object obj = DbHelperSQL.GetSingle(strSql.ToString());
            if (obj == null)
            {
                return 0;
            }
            else
            {
                return Convert.ToInt32(obj);
            }
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="strWhere"></param>
        /// <returns></returns>
        public DataTable GetListby(string strWhere)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("select * FROM View_Bid ");
            if (strWhere.Trim() != "")
            {
                strSql.Append(" where " + strWhere);
            }
            DataTable obj = DbHelperSQL.Query(strSql.ToString()).Tables[0];
            return obj;
        }
        /// <summary>
        /// 分页获取数据列表
        /// </summary>
        public DataSet GetListByPage(string strWhere, string orderby, int startIndex, int endIndex)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("SELECT * FROM ( ");
            strSql.Append(" SELECT ROW_NUMBER() OVER (");
            if (!string.IsNullOrEmpty(orderby.Trim()))
            {
                strSql.Append("order by T." + orderby);
            }
            else
            {
                strSql.Append("order by T.id desc");
            }
            strSql.Append(")AS Row, T.*  from View_Bid T ");
            if (!string.IsNullOrEmpty(strWhere.Trim()))
            {
                strSql.Append(" WHERE " + strWhere);
            }
            strSql.Append(" ) TT");
            strSql.AppendFormat(" WHERE TT.Row between {0} and {1}", startIndex, endIndex);
            return DbHelperSQL.Query(strSql.ToString());
        }
    }
}

