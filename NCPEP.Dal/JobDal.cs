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
  
using NCPEP.Model;
using System.Data.SqlClient;
using System.Data;
using Maticsoft.DBUtility;

namespace NCPEP.Dal
{
    public class JobDal
    {
        //private dynamic db = null;
        public JobDal()
        {
            //db = new MsSqlHelper();
        }
        //
        public bool Create(Job model)
        {
            try
            {
                StringBuilder strSql = new StringBuilder();
                strSql.Append("insert into T_Job(");
                strSql.Append("JobTypeName,Editor,CreateDate)");
                strSql.Append(" values (");
                strSql.Append("@JobTypeName,@Editor,@CreateDate)");

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
        //
        public bool Delete(int Id)
        {
            //该信息表不能删除数据
            return false;
        }
        //
        public bool Update(Job model)
        {
            try
            {
                StringBuilder strSql = new StringBuilder();
                strSql.Append("update T_Job set ");
                strSql.Append("JobTypeName=@JobTypeName,");
                strSql.Append("Editor=@Editor,");
                strSql.Append("CreateDate=@CreateDate");
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
                string strSql = "select Id,JobTypeName,Editor,CreateDate from T_Job ";
                if (!string.IsNullOrEmpty(id))
                {
                    strSql += string.Format(" where id={0}", id);
                }
                strSql += " order by Id asc ";
                return DbHelperSQL.QueryTable(strSql);
            }
            catch { throw; }
        }
        //
        public dynamic GetAllList(string sort, string order)
        {
            try
            {
                string strSql = string.Format("select Id,JobTypeName,Editor,CreateDate from T_Job order by {0} {1}", sort, order);
                return DbHelperSQL.QueryTable(strSql);
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
                strSql.Append("select top 1 Id,JobTypeName,Editor,CreateDate from T_Job ");
                strSql.Append(" where Id=@Id");
                SqlParameter[] parameters = {
					new SqlParameter("@Id", SqlDbType.Int,4)
			};
                parameters[0].Value = Id;
                using (dynamic read = DbHelperSQL.ExecuteReader(strSql.ToString(), parameters))
                {
                    model = new Job();
                    if (read.Read())
                    {                      
                        try { model.Id = int.Parse(read["Id"].ToString()); }
                        catch { }
                        model.JobTypeName = read["JobTypeName"].ToString();
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
					new SqlParameter("@JobTypeName", SqlDbType.NVarChar,50),
					new SqlParameter("@Editor", SqlDbType.NVarChar,50),
					new SqlParameter("@CreateDate", SqlDbType.DateTime),
					new SqlParameter("@Id", SqlDbType.Int,4)};
            parameters[0].Value = model.JobTypeName;
            parameters[1].Value = model.Editor;
            parameters[2].Value = model.CreateDate;
            parameters[3].Value = model.Id;
            return parameters;
        }
    }
}