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
    public class ContactsDal
    {
        private dynamic db = null;
        public ContactsDal()
        {
            db = new MsSqlHelper();
        }
        public bool Create(Contacts model)
        {
            try
            {
                StringBuilder strSql = new StringBuilder();
                strSql.Append("insert into T_Contacts(");
                strSql.Append("FK_OrganizationId,UserName,UserTel,ConsContent,Editor,CreateDate)");
                strSql.Append(" values (");
                strSql.Append("@FK_OrganizationId,@UserName,@UserTel,@ConsContent,@Editor,@CreateDate)");
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
        public dynamic SumCount(string OrgCode)
        {
            try
            {
                string strSql = " select count(Id) from T_Contacts ";
                if (!string.IsNullOrEmpty(OrgCode))
                {
                    strSql += string.Format(" where FK_OrganizationId = '{0}' ", OrgCode);
                }
                return db.ExecuteScalar(strSql);
            }
            catch { throw; }
        }
        //
        public bool Update(Contacts model)
        {
            try
            {
                StringBuilder strSql = new StringBuilder();
                strSql.Append("update T_Contacts set ");
                strSql.Append("FK_OrganizationId=@FK_OrganizationId,");
                strSql.Append("UserName=@UserName,");
                strSql.Append("UserTel=@UserTel,");
                strSql.Append("ConsContent=@ConsContent,");
                strSql.Append("Editor=@Editor,");
                strSql.Append("CreateDate=@CreateDate");
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
        public bool Delete(int Id)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("delete from T_Contacts ");
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
        public DataTable GetAllList(string OrgCode, int startIndex, int pageSize, string order)
        {
            try
            {
                string strSql = string.Format("select a.Id,b.OrgShortName as OrganizationId,a.UserName,a.UserTel,a.ConsContent,a.Editor,a.CreateDate  FROM T_Contacts as a left join T_Organization as b on a.FK_OrganizationId = b.OrgCode  where a.FK_OrganizationId='{0}' {1}", OrgCode, order);
                return db.ExecuteDataTable(strSql, startIndex * pageSize, pageSize, "T_Contacts");
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
                strSql.Append(" select  top 1 a.Id,b.OrgShortName as FK_OrganizationId,a.UserName,a.UserTel,a.ConsContent,a.Editor,a.CreateDate from T_Contacts as a left join T_Organization as b on a.FK_OrganizationId = b.OrgCode  ");
                strSql.Append(" where a.Id=@Id");
                SqlParameter[] parameters = {
					new SqlParameter("@Id", SqlDbType.Int,4)
			};
                parameters[0].Value = Id;
                using (dynamic read = db.ExecuteReader(strSql.ToString(), parameters))
                {
                    if (read.Read())
                    {
                        model = new Contacts();
                        try { model.Id = int.Parse(read["Id"].ToString()); }
                        catch { }
                        model.FK_OrganizationId = read["FK_OrganizationId"].ToString();
                        model.UserName = read["UserName"].ToString();
                        model.UserTel = read["UserTel"].ToString();
                        model.ConsContent = read["ConsContent"].ToString();
                        model.Editor = read["Editor"].ToString();
                        try { model.CreateDate = DateTime.Parse(read["CreateDate"].ToString()); }
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
					new SqlParameter("@FK_OrganizationId", SqlDbType.NVarChar,150),
					new SqlParameter("@UserName", SqlDbType.NVarChar,50),
					new SqlParameter("@UserTel", SqlDbType.NVarChar,50),
					new SqlParameter("@ConsContent", SqlDbType.NVarChar,50),
					new SqlParameter("@Editor", SqlDbType.NVarChar,50),
					new SqlParameter("@CreateDate", SqlDbType.DateTime),
					new SqlParameter("@Id", SqlDbType.Int,4)};
            parameters[0].Value = model.FK_OrganizationId;
            parameters[1].Value = model.UserName;
            parameters[2].Value = model.UserTel;
            parameters[3].Value = model.ConsContent;
            parameters[4].Value = model.Editor;
            parameters[5].Value = model.CreateDate;
            parameters[6].Value = model.Id;
            return parameters;
        }
    }
}