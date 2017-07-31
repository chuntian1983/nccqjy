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
    public class LiceTranScanDal
    {
        private dynamic db = null;
        public LiceTranScanDal()
        {
            db = new MsSqlHelper();
        }
        //
        public bool Exists(int Id)
        {
            try
            {
                string strSql = string.Format("select top 1 isnull(b.DepaStatus,0) as DepaStatus,isnull(bt.TradingStatus,0) as TradingStatus from T_LiceTranScan as s left join T_LiceTran as l on s.FK_LiceTranId = l.Id left join T_Bid as b on l.Id = b.FK_LiceTranId left join T_BidTrans as bt on l.Id = bt.FK_LiceTranId where s.Id={0} order by b.DepaStatus,bt.TradingStatus desc", Id);
                DataTable dataTable = db.ExecuteDataTable(strSql);
                int DepaStatus = 0;
                try { DepaStatus = Convert.ToInt16(dataTable.Rows[0]["DepaStatus"]); }
                catch { }
                int TradingStatus = 0;
                try { TradingStatus = Convert.ToInt16(dataTable.Rows[0]["TradingStatus"]); }
                catch { }
                if (DepaStatus <= 1 && TradingStatus != 1)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch { return false; }
        }
        //
        public bool Create(LiceTranScan model)
        {
            try
            {
                StringBuilder strSql = new StringBuilder();
                strSql.Append("insert into T_LiceTranScan(");
                strSql.Append("FK_LiceTranId,FK_UploadTypeIndicatorId,ScanUrl,UploadName,UploadDate)");
                strSql.Append(" values (");
                strSql.Append("@FK_LiceTranId,@FK_UploadTypeIndicatorId,@ScanUrl,@UploadName,@UploadDate)");
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
        public bool Update(LiceTranScan model)
        {
            try
            {
                StringBuilder strSql = new StringBuilder();
                strSql.Append("update T_LiceTranScan set ");
                strSql.Append("FK_LiceTranId=@FK_LiceTranId,");
                strSql.Append("FK_UploadTypeIndicatorId=@FK_UploadTypeIndicatorId,");
                strSql.Append("ScanUrl=@ScanUrl,");
                strSql.Append("UploadName=@UploadName,");
                strSql.Append("UploadDate=@UploadDate");
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
        public bool Delete(int id)
        {
            try
            {
                string strSql = string.Format("delete from T_LiceTranScan where Id={0}", id);
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
        public bool Deletes(int LiceTranId)
        {
            try
            {
                string strSql = string.Format("delete from T_LiceTranScan where FK_LiceTranId={0}", LiceTranId);
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
        public DataTable GetAllList(int LiceTranId)
        {
            try
            {
                string strSql = " select a.Id,a.FK_LiceTranId,b.TypeIndicatorName as FK_UploadTypeIndicatorId,a.ScanUrl,a.UploadName,a.UploadDate from T_LiceTranScan as a left join T_UploadTypeIndicator as b on a.FK_UploadTypeIndicatorId = b.Id ";
                strSql += string.Format(" where a.FK_LiceTranId={0} order by a.Id desc ", LiceTranId);
                return db.ExecuteDataTable(strSql);
            }
            catch { throw; }
        }
        //
        public dynamic GetModel(int id)
        {
            try
            {
                dynamic model = null;
                string strSql = string.Format(" select Id,FK_LiceTranId,FK_UploadTypeIndicatorId,ScanUrl,UploadName,UploadDate from T_LiceTranScan  where Id = {0}", id);
                using (dynamic read = db.ExecuteReader(strSql))
                {
                    if (read.Read())
                    {
                        model = new LiceTranScan();
                        try { model.Id = int.Parse(read["Id"].ToString()); }
                        catch { }
                        model.FK_LiceTranId = int.Parse(read["FK_LiceTranId"].ToString());
                        model.FK_UploadTypeIndicatorId = int.Parse(read["FK_UploadTypeIndicatorId"].ToString());
                        model.ScanUrl = read["ScanUrl"].ToString();
                        model.UploadName = read["UploadName"].ToString();
                        model.UploadDate = DateTime.Parse(read["UploadDate"].ToString());
                    }
                    read.Dispose();
                }
                return model;
            }
            catch { throw; }
        }
        //
        private SqlParameter[] GetSqlParameter(LiceTranScan model)
        {
            SqlParameter[] parameters = {
					new SqlParameter("@FK_LiceTranId", SqlDbType.Int,4),
					new SqlParameter("@FK_UploadTypeIndicatorId", SqlDbType.Int,4),				
					new SqlParameter("@ScanUrl", SqlDbType.NVarChar,100),					
					new SqlParameter("@UploadName", SqlDbType.NVarChar,100),
					new SqlParameter("@UploadDate", SqlDbType.DateTime),
					new SqlParameter("@Id", SqlDbType.Int,4)};
            parameters[0].Value = model.FK_LiceTranId;
            parameters[1].Value = model.FK_UploadTypeIndicatorId;
            parameters[2].Value = model.ScanUrl;
            parameters[3].Value = model.UploadName;
            parameters[4].Value = model.UploadDate;
            parameters[5].Value = model.Id;
            return parameters;
        }
    }
}