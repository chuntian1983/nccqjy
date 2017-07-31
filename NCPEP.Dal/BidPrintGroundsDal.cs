/**
* T_BidPrintGrounds.cs
*
* 类 名： T_BidPrintGrounds
*
* Ver    变更日期            负责人           变更内容
* ───────────────────────────────────
* V0.01  2016-5-3 09:22:48   N/A      wanghao
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
    public class BidPrintGroundsDal
    {
        private dynamic db = null;
        public BidPrintGroundsDal()
        {
            db = new MsSqlHelper();
        }
        //
        public dynamic SumCount(int Id)
        {
            try
            {
                string strSql = string.Format(" select count(Id) from T_BidPrintGrounds  where FK_BidId={0}", Id);
                return db.ExecuteScalar(strSql);
            }
            catch { throw; }
        }
        //
        public bool Create(BidPrintGrounds model)
        {
            try
            {
                StringBuilder strSql = new StringBuilder();
                strSql.Append("insert into T_BidPrintGrounds(");
                strSql.Append("FK_BidId,PrintNum,PrintName,Reason,PrintDate)");
                strSql.Append(" values (");
                strSql.Append("@FK_BidId,@PrintNum,@PrintName,@Reason,@PrintDate)");
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
        public bool Update(BidPrintGrounds model)
        {
            try
            {
                StringBuilder strSql = new StringBuilder();
                strSql.Append("update T_BidPrintGrounds set ");
                strSql.Append("FK_BidId=@FK_BidId,");
                strSql.Append("PrintNum=@PrintNum,");
                strSql.Append("PrintName=@PrintName,");
                strSql.Append("Reason=@Reason,");
                strSql.Append("PrintDate=@PrintDate");
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
        public dynamic GetAllList(string id)
        {
            try
            {
                string strSql = " select Id,FK_BidId,PrintNum,PrintName,Reason,PrintDate from T_BidPrintGrounds ";
                if (!string.IsNullOrEmpty(id))
                {
                    strSql += string.Format(" where FK_BidId={0}", id);
                }
                strSql += " order by Id asc ";
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
                strSql.Append(" select Id,FK_BidId,PrintNum,PrintName,Reason,PrintDate from T_BidPrintGrounds ");
                strSql.Append(" where Id=@Id");
                SqlParameter[] parameters = {
					new SqlParameter("@Id", SqlDbType.Int,4)
			};
                parameters[0].Value = Id;
                using (dynamic read = db.ExecuteReader(strSql.ToString(), parameters))
                {
                    if (read.Read())
                    {
                        model = new BidPrintGrounds();
                        model.Id = int.Parse(read["Id"].ToString());
                        model.FK_BidId = int.Parse(read["FK_BidId"].ToString());
                        model.PrintNum = int.Parse(read["PrintNum"].ToString());
                        model.PrintName = read["PrintName"].ToString();
                        model.Reason = read["Reason"].ToString();
                        model.PrintDate = DateTime.Parse(read["PrintDate"].ToString());
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
					new SqlParameter("@PrintNum", SqlDbType.Int,4),
					new SqlParameter("@PrintName", SqlDbType.NVarChar,150),
					new SqlParameter("@Reason", SqlDbType.NVarChar,150),
					new SqlParameter("@PrintDate", SqlDbType.DateTime),
					new SqlParameter("@Id", SqlDbType.Int,4)};
            parameters[0].Value = model.FK_BidId;
            parameters[1].Value = model.PrintNum;
            parameters[2].Value = model.PrintName;
            parameters[3].Value = model.Reason;
            parameters[4].Value = model.PrintDate;
            parameters[5].Value = model.Id;
            return parameters;
        }
    }
}