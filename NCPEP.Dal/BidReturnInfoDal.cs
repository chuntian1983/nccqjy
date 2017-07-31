/**
* T_BidReturnInfo.cs
*
* 类 名： T_BidReturnInfo
*
* Ver    变更日期            负责人           变更内容
* ───────────────────────────────────
* V0.01  2016-5-3 09:22:49   N/A      wanghao
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
using NCPEP.Com.Util;
using NCPEP.Model;

namespace NCPEP.Dal
{
    public class BidReturnInfoDal
    {
        private dynamic db = null;
        public BidReturnInfoDal()
        {
            db = new MsSqlHelper();
        }
        //
        public bool Create(BidReturnInfo model)
        {
            try
            {
                StringBuilder strSql = new StringBuilder();
                strSql.Append("insert into T_BidReturnInfo(");
                strSql.Append("FK_BidId,FK_JobId,ReturnDepaName,ReturnDepaSay,ReturnDate)");
                strSql.Append(" values (");
                strSql.Append("@FK_BidId,@FK_JobId,@ReturnDepaName,@ReturnDepaSay,@ReturnDate)");
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
        public bool Delete(int BidId)
        {
            try
            {
                StringBuilder strSql = new StringBuilder();
                strSql.Append("delete from T_BidReturnInfo ");
                strSql.Append(" where FK_BidId=@BidId");
                SqlParameter[] parameters = {
					new SqlParameter("@BidId", SqlDbType.Int,4)
			};
                parameters[0].Value = BidId;

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
            catch { throw; }
        }
        public dynamic GetAllList(int BidId)
        {
            try
            {
                string strSql = " select a.Id,a.FK_BidId,b.JobTypeName as FK_JobId,a.ReturnDepaName,a.ReturnDepaSay,a.ReturnDate from T_BidReturnInfo as a left join T_Job as b on a.FK_JobId = b.Id ";
                strSql += string.Format(" where a.FK_BidId={0}", BidId);
                strSql += " order by a.Id desc ";
                return db.ExecuteDataTable(strSql);
            }
            catch { throw; }
        }
        private SqlParameter[] GetSqlParameter(dynamic model)
        {
            SqlParameter[] parameters = {
				new SqlParameter("@FK_BidId", SqlDbType.Int,4),
					new SqlParameter("@FK_JobId", SqlDbType.Int,4),
					new SqlParameter("@ReturnDepaName", SqlDbType.NVarChar,150),
					new SqlParameter("@ReturnDepaSay", SqlDbType.NVarChar,120),
					new SqlParameter("@ReturnDate", SqlDbType.DateTime),
					new SqlParameter("@Id", SqlDbType.Int,4)};
            parameters[0].Value = model.FK_BidId;
            parameters[1].Value = model.FK_JobId;
            parameters[2].Value = model.ReturnDepaName;
            parameters[3].Value = model.ReturnDepaSay;
            parameters[4].Value = model.ReturnDate;
            parameters[5].Value = model.Id;
            return parameters;
        }
    }
}
