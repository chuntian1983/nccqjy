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
    public class LinksDal
    {
        private dynamic db = null;
        public LinksDal()
        {
            db = new MsSqlHelper();
        }
        //
        public bool Create(Links model)
        {
            try
            {
                StringBuilder strSql = new StringBuilder();
                strSql.Append("insert into T_Links(");
                strSql.Append("LinkName,LinkUrl,LinkImgUrl,Editor,CreateDate)");
                strSql.Append(" values (");
                strSql.Append("@LinkName,@LinkUrl,@LinkImgUrl,@Editor,@CreateDate)");
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
            try
            {
                string strSql = string.Format("delete from T_Links where Id={0}", Id);
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
        public bool Update(Links model)
        {
            try
            {
                StringBuilder strSql = new StringBuilder();
                strSql.Append("update T_Links set ");
                strSql.Append("LinkName=@LinkName,");
                strSql.Append("LinkUrl=@LinkUrl,");
                strSql.Append("LinkImgUrl=@LinkImgUrl,");
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
        public dynamic GetModel(int Id)
        {
            try
            {
                dynamic model = null;
                StringBuilder strSql = new StringBuilder();
                strSql.Append(" select Id,LinkName,LinkUrl,LinkImgUrl,Editor,CreateDate from T_Links ");
                strSql.Append(" where Id=@Id");
                SqlParameter[] parameters = {
					new SqlParameter("@Id", Id)
			};
                using (dynamic read = db.ExecuteReader(strSql.ToString(), parameters))
                {
                    if (read.Read())
                    {
                        model = new Links();
                        try { model.Id = int.Parse(read["Id"].ToString()); }
                        catch { }
                        model.LinkName = read["LinkName"].ToString().Trim();
                        model.LinkUrl = read["LinkUrl"].ToString().Trim();
                        model.LinkImgUrl = read["LinkImgUrl"].ToString().Trim();
                        model.Editor = read["Editor"].ToString().Trim();
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
        public dynamic GetAllList()
        {
            try
            {
                string strSql = " select Id,LinkName,LinkUrl,LinkImgUrl,Editor,CreateDate from T_Links ";        
                strSql += " order by Id asc ";
                return db.ExecuteDataTable(strSql);
            }
            catch { throw; }
        }
        //
        private SqlParameter[] GetSqlParameter(dynamic model)
        {
            SqlParameter[] parameters = {
					new SqlParameter("@LinkName", SqlDbType.NVarChar,50),
					new SqlParameter("@LinkUrl", SqlDbType.VarChar,50),
					new SqlParameter("@LinkImgUrl", SqlDbType.VarChar,50),
					new SqlParameter("@Editor", SqlDbType.NVarChar,50),
					new SqlParameter("@CreateDate", SqlDbType.DateTime),
					new SqlParameter("@Id", SqlDbType.Int,4)};
            parameters[0].Value = model.LinkName;
            parameters[1].Value = model.LinkUrl;
            parameters[2].Value = model.LinkImgUrl;
            parameters[3].Value = model.Editor;
            parameters[4].Value = model.CreateDate;
            parameters[5].Value = model.Id;
            return parameters;
        }
    }
}