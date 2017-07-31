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
    public class MemberTypeCertificationDal
    {
        private dynamic db = null;
        public MemberTypeCertificationDal()
        {
            db = new MsSqlHelper();
        }
        //
        public bool Create(MemberTypeCertification model)
        {
            try
            {
                StringBuilder strSql = new StringBuilder();
                strSql.Append("insert into T_MemberTypeCertification(");
                strSql.Append("TypeCertificationName,Editor,CreateDate)");
                strSql.Append(" values (");
                strSql.Append("@TypeCertificationName,@Editor,@CreateDate)");
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
            //该信息表不能删除数据
            return false;
        }
        //
        public bool Update(MemberTypeCertification model)
        {
            try
            {
                StringBuilder strSql = new StringBuilder();
                strSql.Append("update T_MemberTypeCertification set ");
                strSql.Append("TypeCertificationName=@TypeCertificationName,");
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
        public dynamic GetAllList()
        {
            return GetAllList(string.Empty);
        }
        //
        public dynamic GetAllList(string id)
        {
            try
            {
                string strSql = "select Id,TypeCertificationName,Editor,CreateDate from T_MemberTypeCertification ";
                if (!string.IsNullOrEmpty(id))
                {
                    strSql += string.Format(" where id={0}", id);
                }
                strSql += " order by Id asc ";
                return db.ExecuteDataTable(strSql);
            }
            catch { throw; }
        }
        //
        public dynamic GetAllList(string sort, string order)
        {
            try
            {
                string strSql = string.Format("select Id,TypeCertificationName,Editor,CreateDate from T_MemberTypeCertification order by {0} {1}", sort, order);
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
                strSql.Append("select  top 1 Id,TypeCertificationName,Editor,CreateDate from T_MemberTypeCertification ");
                strSql.Append(" where Id=@Id");
                SqlParameter[] parameters = {
					new SqlParameter("@Id", SqlDbType.Int,4)
			};
                parameters[0].Value = Id;
                using (dynamic read = db.ExecuteReader(strSql.ToString(), parameters))
                {
                    model = new MemberTypeCertification();
                    if (read.Read())
                    {
                        try { model.Id = int.Parse(read["Id"].ToString()); }
                        catch { }
                        model.TypeCertificationName = read["TypeCertificationName"].ToString();
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
					new SqlParameter("@TypeCertificationName", SqlDbType.NVarChar,50),
					new SqlParameter("@Editor", SqlDbType.NVarChar,50),
					new SqlParameter("@CreateDate", SqlDbType.DateTime),
					new SqlParameter("@Id", SqlDbType.Int,4)};
            parameters[0].Value = model.TypeCertificationName;
            parameters[1].Value = model.Editor;
            parameters[2].Value = model.CreateDate;
            parameters[3].Value = model.Id;
            return parameters;
        }
    }
}