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
    public class WebUserDal
    {
        private dynamic db = null;
        public WebUserDal()
        {
            db = new MsSqlHelper();
        }

        public bool Create(WebUserVeri model)
        {
            try
            {
                StringBuilder strSql = new StringBuilder();
                strSql.Append("insert into T_WebUserVeri(");
                strSql.Append("LoginName,LoginPass,UserName,UserTel,UserEmail,UserStatus,LoginDate,LoginnNum,OutDate,Veri)");
                strSql.Append(" values (");
                strSql.Append("@LoginName,@LoginPass,@UserName,@UserTel,@UserEmail,@UserStatus,@LoginDate,@LoginnNum,@OutDate,@Veri)");
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
                return db.ExecuteScalar(strSql);
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
                strSql.Append("Veri=@Veri");              
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
        public bool Delete(int Id)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("delete from T_WebUserVeri ");
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
        //
        public DataTable GetAllList(string sqlWhere, int startIndex, int pageSize, string order)
        {
            try
            {
                string strSql = " SELECT [Id],[LoginName],[LoginPass],[UserName],[UserTel],[UserEmail],[UserStatus],[LoginDate],[LoginnNum],[OutDate],[Veri] FROM [T_WebUserVeri] ";
                if (!string.IsNullOrEmpty(sqlWhere))
                {
                    strSql += string.Format(" WHERE {0} ", sqlWhere);
                }
                strSql += order;
                return db.ExecuteDataTable(strSql, startIndex * pageSize, pageSize, "T_WebUserVeri");
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
                strSql.Append(" SELECT [Id],[LoginName],[LoginPass],[UserName],[UserTel],[UserEmail],[UserStatus],[LoginDate],[LoginnNum],[OutDate],[Veri] FROM [T_WebUserVeri] ");
                strSql.Append(" where Id=@Id");
                SqlParameter[] parameters = {
					new SqlParameter("@Id", SqlDbType.Int,4)
			};
                parameters[0].Value = Id;
                using (dynamic read = db.ExecuteReader(strSql.ToString(), parameters))
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
            parameters[10].Value = model.Id;
            return parameters;
        }

        /// <summary>
        /// 用户登录
        /// </summary>
        /// <param name="adminLogName"></param>
        /// <param name="adminLogPass"></param>
        /// <returns></returns>
        public dynamic UserLogin(string LoginName, string LoginPass)
        {
            try
            {
                string strSql = string.Format(" select  top 1 Id,LoginName,LoginPass,UserName,UserTel,UserEmail,UserStatus,LoginDate,LoginnNum,OutDate,Veri,MemberTypeId,VeriName,VeriSex,VeriIDCard,VeriIDCardScan,OrgCode,VeriAddress,VeriTel,VeriCorporate,VeriCorporateIDCard,VeriCorporateIDCardScan,VeriCreditCode,VeriCreditCodeScan,VeriStatus,AuditType,VeriCheckName,VeriApplyDate,VeriCheckDate from T_WebUserVeri where LoginName='{0}' and LoginPass='{1}'", LoginName, LoginPass);
                dynamic model = null;
                using (dynamic read = db.ExecuteReader(strSql))
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
        /// <summary>
        /// 验证用户名
        /// </summary>
        /// <param name="adminLogName"></param>
        /// <returns></returns>
        public bool CheckUserName(string LoginName)
        {
            try
            {
                bool existence;
                string strSql = string.Format(" select Id,LoginName from T_WebUserVeri where LoginName = '{0}' ", LoginName);
                using (dynamic read = db.ExecuteReader(strSql))
                {
                    if (read.Read())
                    {
                        existence = true;
                    }
                    else
                    {
                        existence = false;
                    }
                    read.Dispose();
                }
                return existence;
            }
            catch
            {
                throw;
            }
        }
        /// <summary>
        /// 登录次数
        /// </summary>
        /// <param name="id"></param>
        public void NumberLogin(int id)
        {
            try
            {
                db.ExecuteNonQuery(string.Format("update T_WebUserVeri set LoginnNum=(LoginnNum+1),OutDate=GETDATE() where Id={0}", id));
            }
            catch { throw; }
        }
    }
}
