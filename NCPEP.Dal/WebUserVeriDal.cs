﻿/**
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
  
using System.Data.SqlClient;
using System.Data;
using NCPEP.Model;
using Maticsoft.DBUtility;

namespace NCPEP.Dal
{
    public class WebUserVeriDal
    {
        
        public WebUserVeriDal()
        {
            
        }

        public bool Create(WebUserVeri model)
        {
            try
            {
                StringBuilder strSql = new StringBuilder();
                strSql.Append("insert into T_WebUserVeri(");
                strSql.Append("LoginName,LoginPass,UserName,UserTel,UserEmail,UserStatus,LoginDate,LoginnNum,OutDate,Veri,MemberTypeId,VeriName,VeriSex,VeriIDCard,VeriIDCardScan,OrgCode,VeriAddress,VeriTel,VeriCorporate,VeriCorporateIDCard,VeriCorporateIDCardScan,VeriCreditCode,VeriCreditCodeScan,VeriStatus,AuditType,VeriCheckName,VeriApplyDate,VeriCheckDate)");
                strSql.Append(" values (");
                strSql.Append("@LoginName,@LoginPass,@UserName,@UserTel,@UserEmail,@UserStatus,@LoginDate,@LoginnNum,@OutDate,@Veri,@MemberTypeId,@VeriName,@VeriSex,@VeriIDCard,@VeriIDCardScan,@OrgCode,@VeriAddress,@VeriTel,@VeriCorporate,@VeriCorporateIDCard,@VeriCorporateIDCardScan,@VeriCreditCode,@VeriCreditCodeScan,@VeriStatus,@AuditType,@VeriCheckName,@VeriApplyDate,@VeriCheckDate)");
                if (DbHelperSQL.ExecuteSql(strSql.ToString(), GetSqlParameter(model)) > 0)
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
        /// 数据总和
        /// </summary>
        /// <param name="where"></param>
        /// <returns></returns>
        public dynamic SumCount(string sqlWhere)
        {
            try
            {
                string strSql = " select count(Id) from T_WebUserVeri ";
                if (!string.IsNullOrEmpty(sqlWhere))
                {
                    strSql += string.Format(" where {0} ", sqlWhere);
                }
                return DbHelperSQL.GetSingle(strSql);
            }
            catch { throw; }
        }
        //
        public bool Update(WebUserVeri model)
        {
            try
            {
                StringBuilder strSql = new StringBuilder();
                strSql.Append("update T_WebUserVeri set ");
                strSql.Append("LoginName=@LoginName,");
                strSql.Append("LoginPass=@LoginPass,");
                strSql.Append("UserName=@UserName,");
                strSql.Append("UserTel=@UserTel,");
                strSql.Append("UserEmail=@UserEmail,");
                strSql.Append("UserStatus=@UserStatus,");
                strSql.Append("LoginDate=@LoginDate,");
                strSql.Append("LoginnNum=@LoginnNum,");
                strSql.Append("OutDate=@OutDate,");
                strSql.Append("Veri=@Veri,");
                strSql.Append("MemberTypeId=@MemberTypeId,");
                strSql.Append("VeriName=@VeriName,");
                strSql.Append("VeriSex=@VeriSex,");
                strSql.Append("VeriIDCard=@VeriIDCard,");
                strSql.Append("VeriIDCardScan=@VeriIDCardScan,");
                strSql.Append("OrgCode=@OrgCode,");
                strSql.Append("VeriAddress=@VeriAddress,");
                strSql.Append("VeriTel=@VeriTel,");
                strSql.Append("VeriCorporate=@VeriCorporate,");
                strSql.Append("VeriCorporateIDCard=@VeriCorporateIDCard,");
                strSql.Append("VeriCorporateIDCardScan=@VeriCorporateIDCardScan,");
                strSql.Append("VeriCreditCode=@VeriCreditCode,");
                strSql.Append("VeriCreditCodeScan=@VeriCreditCodeScan,");
                strSql.Append("VeriStatus=@VeriStatus,");
                strSql.Append("AuditType=@AuditType,");
                strSql.Append("VeriCheckName=@VeriCheckName,");
                strSql.Append("VeriApplyDate=@VeriApplyDate,");
                strSql.Append("VeriCheckDate=@VeriCheckDate");
                strSql.Append(" where Id=@Id");
                if (DbHelperSQL.ExecuteSql(strSql.ToString(), GetSqlParameter(model)) > 0)
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
        /// <param name="row"></param>
        /// <param name="values"></param>
        /// <param name="where"></param>
        /// <returns></returns>
        public bool UpdateState(string row, string values, string where)
        {
            try
            {
                string strSql = string.Format("update T_WebUserVeri set {0} = {1} where Id = {2}", row, values, where);
                if (DbHelperSQL.ExecuteSql(strSql) > 0)
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
            strSql.Append("delete from T_WebUserVeri ");
            strSql.Append(" where Id=@Id");
            SqlParameter[] parameters = {
					new SqlParameter("@Id", SqlDbType.Int,4)
			};
            parameters[0].Value = Id;
            int rows = DbHelperSQL.ExecuteSql(strSql.ToString(), parameters);
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
                string strSql = "select a.Id,a.LoginName,a.LoginPass,a.UserName,a.UserTel,a.UserEmail,a.UserStatus,a.LoginDate,a.LoginnNum,a.OutDate,a.Veri,c.TypeCertificationName as MemberTypeId,a.VeriName,a.VeriSex,a.VeriIDCard,a.VeriIDCardScan,b.OrgShortName as OrgCode,a.VeriAddress,a.VeriTel,a.VeriCorporate,a.VeriCorporateIDCard,a.VeriCorporateIDCardScan,a.VeriCreditCode,a.VeriCreditCodeScan,a.VeriStatus,a.AuditType,a.VeriCheckName,a.VeriApplyDate,a.VeriCheckDate from T_WebUserVeri as a left join T_Organization as b on a.OrgCode=b.OrgCode left join T_MemberTypeCertification as c on a.MemberTypeId=c.Id ";
                if (!string.IsNullOrEmpty(sqlWhere))
                {
                    strSql += string.Format(" where {0} ", sqlWhere);
                }
                strSql += order;
                return DbHelperSQL.ExecuteDataTable(strSql, startIndex * pageSize, pageSize, "T_WebUserVeri");
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
                strSql.Append(" select  top 1 Id,LoginName,LoginPass,UserName,UserTel,UserEmail,UserStatus,LoginDate,LoginnNum,OutDate,Veri,MemberTypeId,VeriName,VeriSex,VeriIDCard,VeriIDCardScan,OrgCode,VeriAddress,VeriTel,VeriCorporate,VeriCorporateIDCard,VeriCorporateIDCardScan,VeriCreditCode,VeriCreditCodeScan,VeriStatus,AuditType,VeriCheckName,VeriApplyDate,VeriCheckDate from T_WebUserVeri ");
                strSql.Append(" where Id=@Id");
                SqlParameter[] parameters = {
					new SqlParameter("@Id", SqlDbType.Int,4)
			};
                parameters[0].Value = Id;
                using (dynamic read = DbHelperSQL.ExecuteReader(strSql.ToString(), parameters))
                {
                    if (read.Read())
                    {
                        model = new WebUserVeri();
                        try { model.Id = int.Parse(read["Id"].ToString()); }
                        catch { }
                        model.LoginName = read["LoginName"].ToString();
                        model.LoginPass = read["LoginPass"].ToString();
                        model.UserName = read["UserName"].ToString();
                        model.UserTel = read["UserTel"].ToString();
                        model.UserEmail = read["UserEmail"].ToString();
                        try { model.UserStatus = int.Parse(read["UserStatus"].ToString()); }
                        catch { }
                        try { model.LoginDate = DateTime.Parse(read["LoginDate"].ToString()); }
                        catch { }
                        try { model.LoginnNum = int.Parse(read["LoginnNum"].ToString()); }
                        catch { }
                        try { model.OutDate = DateTime.Parse(read["OutDate"].ToString()); }
                        catch { }
                        try { model.Veri = int.Parse(read["Veri"].ToString()); }
                        catch { }
                        try { model.MemberTypeId = int.Parse(read["MemberTypeId"].ToString()); }
                        catch { }
                        model.VeriName = read["VeriName"].ToString();
                        model.VeriSex = read["VeriSex"].ToString();
                        model.VeriIDCard = read["VeriIDCard"].ToString();
                        model.VeriIDCardScan = read["VeriIDCardScan"].ToString();
                        model.OrgCode = read["OrgCode"].ToString();
                        model.VeriAddress = read["VeriAddress"].ToString();
                        model.VeriTel = read["VeriTel"].ToString();
                        model.VeriCorporate = read["VeriCorporate"].ToString();
                        model.VeriCorporateIDCard = read["VeriCorporateIDCard"].ToString();
                        model.VeriCorporateIDCardScan = read["VeriCorporateIDCardScan"].ToString();
                        model.VeriCreditCode = read["VeriCreditCode"].ToString();
                        model.VeriCreditCodeScan = read["VeriCreditCodeScan"].ToString();
                        try { model.VeriStatus = int.Parse(read["VeriStatus"].ToString()); }
                        catch { }
                        try { model.AuditType = int.Parse(read["AuditType"].ToString()); }
                        catch { }
                        model.VeriCheckName = read["VeriCheckName"].ToString();
                        try { model.VeriApplyDate = DateTime.Parse(read["VeriApplyDate"].ToString()); }
                        catch { }
                        try { model.VeriCheckDate = DateTime.Parse(read["VeriCheckDate"].ToString()); }
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
					new SqlParameter("@LoginName", SqlDbType.NVarChar,50),
					new SqlParameter("@LoginPass", SqlDbType.NVarChar,50),
					new SqlParameter("@UserName", SqlDbType.NVarChar,50),
					new SqlParameter("@UserTel", SqlDbType.NVarChar,50),
					new SqlParameter("@UserEmail", SqlDbType.NVarChar,50),
					new SqlParameter("@UserStatus", SqlDbType.Int,4),
					new SqlParameter("@LoginDate", SqlDbType.DateTime),
					new SqlParameter("@LoginnNum", SqlDbType.Int,4),
					new SqlParameter("@OutDate", SqlDbType.DateTime),
					new SqlParameter("@Veri", SqlDbType.Int,4),
					new SqlParameter("@MemberTypeId", SqlDbType.Int,4),
					new SqlParameter("@VeriName", SqlDbType.NVarChar,50),
					new SqlParameter("@VeriSex", SqlDbType.NVarChar,50),
					new SqlParameter("@VeriIDCard", SqlDbType.NVarChar,50),
					new SqlParameter("@VeriIDCardScan", SqlDbType.NVarChar,50),
					new SqlParameter("@OrgCode", SqlDbType.NVarChar,50),
					new SqlParameter("@VeriAddress", SqlDbType.NVarChar,150),
					new SqlParameter("@VeriTel", SqlDbType.NVarChar,50),
					new SqlParameter("@VeriCorporate", SqlDbType.NVarChar,50),
					new SqlParameter("@VeriCorporateIDCard", SqlDbType.NVarChar,50),
					new SqlParameter("@VeriCorporateIDCardScan", SqlDbType.NVarChar,50),
					new SqlParameter("@VeriCreditCode", SqlDbType.NVarChar,50),
					new SqlParameter("@VeriCreditCodeScan", SqlDbType.NVarChar,50),
					new SqlParameter("@VeriStatus", SqlDbType.Int,4),
					new SqlParameter("@AuditType", SqlDbType.Int,4),
					new SqlParameter("@VeriCheckName", SqlDbType.NVarChar,50),
					new SqlParameter("@VeriApplyDate", SqlDbType.DateTime),
					new SqlParameter("@VeriCheckDate", SqlDbType.DateTime),
					new SqlParameter("@Id", SqlDbType.Int,4)};
            parameters[0].Value = model.LoginName;
            parameters[1].Value = model.LoginPass;
            parameters[2].Value = model.UserName;
            parameters[3].Value = model.UserTel;
            parameters[4].Value = model.UserEmail;
            parameters[5].Value = model.UserStatus;
            parameters[6].Value = model.LoginDate;
            parameters[7].Value = model.LoginnNum;
            parameters[8].Value = model.OutDate;
            parameters[9].Value = model.Veri;
            parameters[10].Value = model.MemberTypeId;
            parameters[11].Value = model.VeriName;
            parameters[12].Value = model.VeriSex;
            parameters[13].Value = model.VeriIDCard;
            parameters[14].Value = model.VeriIDCardScan;
            parameters[15].Value = model.OrgCode;
            parameters[16].Value = model.VeriAddress;
            parameters[17].Value = model.VeriTel;
            parameters[18].Value = model.VeriCorporate;
            parameters[19].Value = model.VeriCorporateIDCard;
            parameters[20].Value = model.VeriCorporateIDCardScan;
            parameters[21].Value = model.VeriCreditCode;
            parameters[22].Value = model.VeriCreditCodeScan;
            parameters[23].Value = model.VeriStatus;
            parameters[24].Value = model.AuditType;
            parameters[25].Value = model.VeriCheckName;
            parameters[26].Value = model.VeriApplyDate;
            parameters[27].Value = model.VeriCheckDate;
            parameters[28].Value = model.Id;
            return parameters;
        }       
    }
}
