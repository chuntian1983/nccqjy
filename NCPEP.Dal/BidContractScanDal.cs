/**
* T_BidContractScan.cs
*
* 类 名： T_BidContractScan
*
* Ver    变更日期            负责人           变更内容
* ───────────────────────────────────
* V0.01  2016-5-3 09:22:46   N/A      wanghao
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
    public class BidContractScanDal
    {
        private dynamic db = null;
        public BidContractScanDal()
        {
            db = new MsSqlHelper();
        }
        //
        public bool Create(BidContractScan model)
        {
            try
            {
                StringBuilder strSql = new StringBuilder();
                strSql.Append("insert into T_BidContractScan(");
                strSql.Append("FK_BidId,ScanName,ScanUrl,UploadName,UploadDate)");
                strSql.Append(" values (");
                strSql.Append("@FK_BidId,@ScanName,@ScanUrl,@UploadName,@UploadDate)");
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
                string strSql = string.Format("delete from T_BidContractScan where Id={0}", id);
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
        public bool Update(BidContractScan model)
        {
            try
            {
                StringBuilder strSql = new StringBuilder();
                strSql.Append("update T_BidContractScan set ");
                strSql.Append("FK_BidId=@FK_BidId,");
                strSql.Append("ScanName=@ScanName,");
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
        public dynamic GetAllList(int id)
        {
            try
            {
                string strSql = string.Format(" select Id,FK_BidId,ScanName,ScanUrl,UploadName,UploadDate from T_BidContractScan where FK_BidId={0}", id);
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
                strSql.Append(" select  top 1 Id,FK_BidId,ScanName,ScanUrl,UploadName,UploadDate from T_BidContractScan ");
                strSql.Append(" where Id=@Id");
                SqlParameter[] parameters = {
					new SqlParameter("@Id", SqlDbType.Int,4)
			};
                parameters[0].Value = Id;
                using (dynamic read = db.ExecuteReader(strSql.ToString(), parameters))
                {
                    if (read.Read())
                    {
                        model = new BidClinchScan();
                        try { model.Id = int.Parse(read["Id"].ToString()); }
                        catch { }
                        try { model.FK_BidId = int.Parse(read["FK_BidId"].ToString()); }
                        catch { }
                        model.ScanName = read["ScanName"].ToString();
                        model.ScanUrl = read["ScanUrl"].ToString();
                        model.UploadName = read["UploadName"].ToString();
                        try { model.UploadDate = DateTime.Parse(read["UploadDate"].ToString()); }
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
					new SqlParameter("@ScanName", SqlDbType.NVarChar,100),
					new SqlParameter("@ScanUrl", SqlDbType.NVarChar,100),
					new SqlParameter("@UploadName", SqlDbType.NVarChar,100),
					new SqlParameter("@UploadDate", SqlDbType.DateTime),
					new SqlParameter("@Id", SqlDbType.Int,4)};
            parameters[0].Value = model.FK_BidId;
            parameters[1].Value = model.ScanName;
            parameters[2].Value = model.ScanUrl;
            parameters[3].Value = model.UploadName;
            parameters[4].Value = model.UploadDate;
            parameters[5].Value = model.Id;
            return parameters;
        }
    }
}