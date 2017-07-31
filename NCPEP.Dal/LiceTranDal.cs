/**
* T_LiceTran.cs
*
* 类 名： T_LiceTran
*
* Ver    变更日期            负责人           变更内容
* ───────────────────────────────────
* V0.01  2016-5-3 09:22:52   N/A      wanghao
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
    public class LiceTranDal
    {
        private dynamic db = null;
        public LiceTranDal()
        {
            db = new MsSqlHelper();
        }
        //
        public bool UpdateState(string row, string values, int Id)
        {
            try
            {
                string strSql = string.Format("update T_LiceTran set {0} = {1} where Id = {2}", row, values, Id);
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
        public DataTable GetComnoData(int LiceTranId)
        {
            try
            {
                //排比上传
               // string strSql = string.Format(" select a.Id,a.TypeIndicatorName from T_UploadTypeIndicator as a left join T_IndicatorsRelations as b on a.Id=b.FK_TypeIndicatorNameId left join T_LiceTran as c on b.FK_MemberTypeCertificationId =c.MemberTypeId and b.ApplicationType=c.LiceTranType where  c.Id={0} and a.Id not in(select FK_UploadTypeIndicatorId from T_LiceTranScan where FK_LiceTranId={0}) ", LiceTranId);
                string strSql = string.Format(" select a.Id,a.TypeIndicatorName from T_UploadTypeIndicator as a left join T_IndicatorsRelations as b on a.Id=b.FK_TypeIndicatorNameId left join T_LiceTran as c on b.FK_MemberTypeCertificationId =c.MemberTypeId and b.ApplicationType=c.LiceTranType where c.Id={0} ", LiceTranId);
                return db.ExecuteDataTable(strSql);
            }
            catch
            {
                throw;
            }

        }
        //
        public DataTable GetLiceTranComno(string OrgCode, int LiceTranType)
        {
            try
            {
                string strSql = string.Format(" select Id,Name from T_LiceTran where OrgCode = '{0}' and AuditType = 1 and LiceTranType={1} ", OrgCode, LiceTranType);
                return db.ExecuteDataTable(strSql);
            }
            catch { throw; }
        }
        //web
        public DataTable GetLiceTranComno(int FK_WebUserVeriId, int LiceTranType)
        {
            try
            {
                string strSql = string.Format(" select Id,Name from T_LiceTran where FK_WebUserVeriId = {0} and AuditType = 1 and LiceTranType={1} ", FK_WebUserVeriId, LiceTranType);
                return db.ExecuteDataTable(strSql);
            }
            catch { throw; }
        }
        //
        public bool Create(LiceTran model)
        {
            try
            {
                StringBuilder strSql = new StringBuilder();
                strSql.Append("insert into T_LiceTran(");
                strSql.Append("OrgCode,MemberTypeId,Name,Addr,Contact,Corporate,IDCard,OrganizationCode,Tel,Owner,Capital,ApplyDate,AuditType,LiceTranType,FK_WebUserVeriId)");
                strSql.Append(" values (");
                strSql.Append("@OrgCode,@MemberTypeId,@Name,@Addr,@Contact,@Corporate,@IDCard,@OrganizationCode,@Tel,@Owner,@Capital,@ApplyDate,@AuditType,@LiceTranType,@FK_WebUserVeriId)");
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
        public int SumCount(string where)
        {
            try
            {
                string strSql = " select count(Id) from T_LiceTran  ";
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
                string strSql = string.Format("delete from T_LiceTran where Id={0}", Id);
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
        public bool Update(LiceTran model)
        {
            try
            {
                StringBuilder strSql = new StringBuilder();
                strSql.Append("update T_LiceTran set ");
                strSql.Append("OrgCode=@OrgCode,");
                strSql.Append("MemberTypeId=@MemberTypeId,");
                strSql.Append("Name=@Name,");
                strSql.Append("Addr=@Addr,");
                strSql.Append("Contact=@Contact,");
                strSql.Append("Corporate=@Corporate,");
                strSql.Append("IDCard=@IDCard,");
                strSql.Append("OrganizationCode=@OrganizationCode,");
                strSql.Append("Tel=@Tel,");
                strSql.Append("Owner=@Owner,");
                strSql.Append("Capital=@Capital,");
                strSql.Append("ApplyDate=@ApplyDate,");
                strSql.Append("AuditType=@AuditType,");
                strSql.Append("FK_WebUserVeriId=@FK_WebUserVeriId,");
                strSql.Append("LiceTranType=@LiceTranType");
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
        public DataTable GetAllList(int Id)
        {
            try
            {
                string strSql = string.Format(" select a.Id,c.TypeCertificationName as MemberTypeId,a.Name,a.Addr,a.Contact,a.Corporate,a.IDCard,a.OrganizationCode,a.Tel,a.[Owner],a.Capital,a.ApplyDate,a.AuditType,a.LiceTranType from T_LiceTran as a left join T_MemberTypeCertification as c on a.MemberTypeId = c.Id where a.Id={0} ", Id);
                return db.ExecuteDataTable(strSql);
            }
            catch { throw; }
        }
        //
        public DataTable GetAllList(string sqlWhere, int startIndex, int pageSize, string order)
        {
            try
            {
                string strSql = " select a.Id,b.OrgShortName as OrgCode,c.TypeCertificationName as MemberTypeId,a.Name,a.Addr,a.Contact,a.Corporate,a.IDCard,a.OrganizationCode,a.Tel,a.[Owner],a.Capital,a.ApplyDate,a.AuditType,a.LiceTranType,a.FK_WebUserVeriId from T_LiceTran as a left join T_Organization as b on a.OrgCode = b.OrgCode left join T_MemberTypeCertification as c on a.MemberTypeId = c.Id ";
                if (!string.IsNullOrEmpty(sqlWhere))
                {
                    strSql += string.Format(" where {0}", sqlWhere);
                }
                if (!string.IsNullOrEmpty(order))
                {
                    strSql += order;
                }
                return db.ExecuteDataTable(strSql, startIndex * pageSize, pageSize, "T_LiceTran");
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
                strSql.Append("select Id,OrgCode,MemberTypeId,Name,Addr,Contact,Corporate,IDCard,OrganizationCode,Tel,Owner,Capital,ApplyDate,AuditType,LiceTranType,FK_WebUserVeriId from T_LiceTran ");
                strSql.Append(" where Id=@Id");
                SqlParameter[] parameters = {
					new SqlParameter("@Id", SqlDbType.Int,4)
			};
                parameters[0].Value = Id;
                using (dynamic read = db.ExecuteReader(strSql.ToString(), parameters))
                {
                    if (read.Read())
                    {
                        model = new LiceTran();
                        try { model.Id = int.Parse(read["Id"].ToString()); }
                        catch { }
                        model.OrgCode = read["OrgCode"].ToString();
                        try { model.MemberTypeId = int.Parse(read["MemberTypeId"].ToString()); }
                        catch { }
                        model.Name = read["Name"].ToString();
                        model.Addr = read["Addr"].ToString();
                        model.Contact = read["Contact"].ToString();
                        model.Corporate = read["Corporate"].ToString();
                        model.IDCard = read["IDCard"].ToString();
                        model.OrganizationCode = read["OrganizationCode"].ToString();
                        model.Tel = read["Tel"].ToString();
                        model.Owner = read["Owner"].ToString();
                        model.Capital = read["Capital"].ToString();
                        try { model.ApplyDate = DateTime.Parse(read["ApplyDate"].ToString()); }
                        catch { }
                        try { model.AuditType = int.Parse(read["AuditType"].ToString()); }
                        catch { }
                        try { model.LiceTranType = int.Parse(read["LiceTranType"].ToString()); }
                        catch { }
                        try { model.FK_WebUserVeriId = int.Parse(read["FK_WebUserVeriId"].ToString()); }
                        catch { }
                    }
                    read.Dispose();
                }
                return model;
            }
            catch { throw; }
        }
        //
        public dynamic GetById(int Id)
        {
            try
            {
                string strSql = string.Format(" select a.Id,c.TypeCertificationName as MemberTypeId,a.Name,a.Addr,a.Contact,a.Corporate,a.IDCard,a.OrganizationCode,a.Tel,a.[Owner],a.Capital,a.ApplyDate,a.AuditType,a.LiceTranType from T_LiceTran as a left join T_MemberTypeCertification as c on a.MemberTypeId = c.Id where a.Id={0} ", Id);
                return db.ExecuteDataTable(strSql);
            }
            catch { throw; }
        }
        //
        private SqlParameter[] GetSqlParameter(dynamic model)
        {
            SqlParameter[] parameters = {
				new SqlParameter("@OrgCode", SqlDbType.NVarChar,100),
					new SqlParameter("@MemberTypeId", SqlDbType.Int,4),
					new SqlParameter("@Name", SqlDbType.NVarChar,100),
					new SqlParameter("@Addr", SqlDbType.NVarChar,100),
					new SqlParameter("@Contact", SqlDbType.NVarChar,100),
					new SqlParameter("@Corporate", SqlDbType.NVarChar,100),
					new SqlParameter("@IDCard", SqlDbType.NVarChar,100),
					new SqlParameter("@OrganizationCode", SqlDbType.NVarChar,100),
					new SqlParameter("@Tel", SqlDbType.NVarChar,100),
					new SqlParameter("@Owner", SqlDbType.NVarChar,100),
					new SqlParameter("@Capital", SqlDbType.NVarChar,100),
					new SqlParameter("@ApplyDate", SqlDbType.DateTime),
					new SqlParameter("@AuditType", SqlDbType.Int,4),
					new SqlParameter("@LiceTranType", SqlDbType.Int,4),
					new SqlParameter("@Id", SqlDbType.Int,4),
                    new SqlParameter("@FK_WebUserVeriId", SqlDbType.Int,4),           
                                        };
            parameters[0].Value = model.OrgCode;
            parameters[1].Value = model.MemberTypeId;
            parameters[2].Value = model.Name;
            parameters[3].Value = model.Addr;
            parameters[4].Value = model.Contact;
            parameters[5].Value = model.Corporate;
            parameters[6].Value = model.IDCard;
            parameters[7].Value = model.OrganizationCode;
            parameters[8].Value = model.Tel;
            parameters[9].Value = model.Owner;
            parameters[10].Value = model.Capital;
            parameters[11].Value = model.ApplyDate;
            parameters[12].Value = model.AuditType;
            parameters[13].Value = model.LiceTranType;
            parameters[14].Value = model.Id;
            parameters[15].Value = model.FK_WebUserVeriId;
            return parameters;
        }
    }
}
