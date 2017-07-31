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
using System.Data;
using System.Data.SqlClient;

namespace NCPEP.Dal
{
    public class NewsTypeDal
    {
        private dynamic db = null;

        public NewsTypeDal()
        {
            db = new MsSqlHelper();
        }
        //
        public bool Create(NewsType model)
        {
            try
            {
                StringBuilder strSql = new StringBuilder();
                strSql.Append("insert into T_NewsType(");
                strSql.Append("NewsTypeName,Editor,CreateDate)");
                strSql.Append(" values (");
                strSql.Append("@NewsTypeName,@Editor,@CreateDate)");
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
        public bool Update(NewsType model)
        {
            try
            {
                StringBuilder strSql = new StringBuilder();
                strSql.Append("update T_NewsType set ");
                strSql.Append("NewsTypeName=@NewsTypeName,");               
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
        public bool Delete(int id)
        {
            //新闻类型禁止删除操作
            return false;
        }
        //
        public DataTable GetAllList()
        {
            try
            {
                string strSql = "select Id,Editor,NewsTypeName,CreateDate from T_NewsType  order by Id ";
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
                strSql.Append(" select  top 1 Id,Editor,NewsTypeName,CreateDate from T_NewsType  ");
                strSql.Append(" where Id=@Id");
                SqlParameter[] parameters = {
					new SqlParameter("@Id", SqlDbType.Int,4)
			};
                parameters[0].Value = Id;
                using (dynamic read = db.ExecuteReader(strSql.ToString(), parameters))
                {
                    if (read.Read())
                    {
                        model = new NewsType();
                        model.NewsTypeName = read["NewsTypeName"];                       
                        model.Editor = read["Editor"];
                        try { model.CreateDate = DateTime.Parse(read["CreateDate"].ToString()); }
                        catch { }
                        try { model.Id = int.Parse(read["Id"].ToString()); }
                        catch { }
                    }
                    read.Dispose();
                }
                return model;
            }
            catch { throw; }
        }
        //
        private SqlParameter[] GetSqlParameter(NewsType model)
        {
            SqlParameter[] parameters = {
					
					new SqlParameter("@NewsTypeName", SqlDbType.NVarChar,50),								
					new SqlParameter("@Editor", SqlDbType.NVarChar,50),
					new SqlParameter("@CreateDate", SqlDbType.DateTime),
					new SqlParameter("@Id", SqlDbType.Int,4)};
            parameters[0].Value = model.NewsTypeName;           
            parameters[1].Value = model.Editor;
            parameters[2].Value = model.CreateDate;
            parameters[3].Value = model.Id;
            return parameters;
        }
    }
}
