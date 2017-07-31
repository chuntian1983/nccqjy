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
    public class SysFunDal : IDisposable
    {
        private dynamic db = null;
        public SysFunDal()
        {
            db = new MsSqlHelper();
        }
        //
        public bool Create(SysFun model)
        {
            try
            {
                StringBuilder strSql = new StringBuilder();
                strSql.Append("insert into T_SysFun(");
                strSql.Append("DisplayName,NodeURL,DisplayOrder,ParentNodeId,Editor,CreateDate,FunImgNum)");
                strSql.Append(" values (");
                strSql.Append("@DisplayName,@NodeURL,@DisplayOrder,@ParentNodeId,@Editor,@CreateDate,@FunImgNum)");
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
        public bool Update(SysFun model)
        {
            try
            {
                StringBuilder strSql = new StringBuilder();
                strSql.Append("update T_SysFun set ");
                strSql.Append("DisplayName=@DisplayName,");
                strSql.Append("NodeURL=@NodeURL,");
                strSql.Append("DisplayOrder=@DisplayOrder,");
                strSql.Append("ParentNodeId=@ParentNodeId,");
                strSql.Append("Editor=@Editor,");
                strSql.Append("FunImgNum=@FunImgNum,");
                strSql.Append("CreateDate=@CreateDate");
                strSql.Append(" where NodeId=@NodeId");
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
        public dynamic GetModel(int NodeId)
        {
            try
            {
                dynamic model = null;
                StringBuilder strSql = new StringBuilder();
                strSql.Append("select  top 1 NodeId,DisplayName,NodeURL,DisplayOrder,ParentNodeId,Editor,CreateDate,FunImgNum from T_SysFun ");
                strSql.Append(" where NodeId=@NodeId");
                SqlParameter[] parameters = {
					new SqlParameter("@NodeId", SqlDbType.Int,4)
			};
                parameters[0].Value = NodeId;
                using (dynamic read = db.ExecuteReader(strSql.ToString(), parameters))
                {
                    if (read.Read())
                    {
                        model = new SysFun();
                        model.DisplayName = read["DisplayName"].ToString();
                        model.NodeURL = read["NodeURL"].ToString();
                        try { model.DisplayOrder = int.Parse(read["DisplayOrder"].ToString()); }
                        catch { }
                        try { model.ParentNodeId = int.Parse(read["ParentNodeId"].ToString()); }
                        catch { }
                        model.Editor = read["Editor"].ToString();
                        model.FunImgNum = read["FunImgNum"].ToString();
                        try { model.CreateDate = DateTime.Parse(read["CreateDate"].ToString()); }
                        catch { }
                        try { model.NodeId = int.Parse(read["NodeId"].ToString()); }
                        catch { }
                    }
                    read.Dispose();
                }
                return model;
            }
            catch { throw; }
        }
        //
        public DataTable GetAllList(string ParentNodeId)
        {
            try
            {
                string strSql = "select NodeId,DisplayName,NodeURL,DisplayOrder,ParentNodeId,Editor,CreateDate,FunImgNum from T_SysFun";
                if (!string.IsNullOrEmpty(ParentNodeId))
                {
                    strSql += " where ";
                    strSql += string.Format(" ParentNodeId ={0}", ParentNodeId);
                }
                strSql += " order by DisplayOrder asc ";
                return db.ExecuteDataTable(strSql);
            }
            catch { throw; }
        }
        //
        private SqlParameter[] GetSqlParameter(SysFun model)
        {
            SqlParameter[] parameters = {
					new SqlParameter("@DisplayName", SqlDbType.NVarChar,50),
					new SqlParameter("@NodeURL", SqlDbType.NVarChar,50),
					new SqlParameter("@DisplayOrder", SqlDbType.Int,4),
					new SqlParameter("@ParentNodeId", SqlDbType.Int,4),
					new SqlParameter("@Editor", SqlDbType.NVarChar,50),
					new SqlParameter("@CreateDate", SqlDbType.DateTime),
					new SqlParameter("@NodeId", SqlDbType.Int,4),
                    new SqlParameter("@FunImgNum", SqlDbType.NVarChar,10) };
            parameters[0].Value = model.DisplayName;
            parameters[1].Value = model.NodeURL;
            parameters[2].Value = model.DisplayOrder;
            parameters[3].Value = model.ParentNodeId;
            parameters[4].Value = model.Editor;
            parameters[5].Value = model.CreateDate;
            parameters[6].Value = model.NodeId;
            parameters[7].Value = model.FunImgNum;
            return parameters;
        }

        public void Dispose()
        {
            throw new NotImplementedException();
        }
    }
}