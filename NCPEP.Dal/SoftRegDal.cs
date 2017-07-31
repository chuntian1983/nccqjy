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
using System.Data.SqlClient;
using System.Data;
using NCPEP.Com.Util;

namespace NCPEP.Dal
{
    public class SoftRegDal : IDisposable
    {
        private dynamic db = null;
        //
        public SoftRegDal()
        {
            db = new MsSqlHelper();
        }
        //
        public bool Create(string model)
        {
            try
            {
                StringBuilder strSql = new StringBuilder();
                strSql.Append(" insert into T_SoftReg(");
                strSql.Append("SequenceNumber)");
                strSql.Append(" values (");
                strSql.Append("@SequenceNumber) ");
                SqlParameter[] parameters = {
					new SqlParameter("@SequenceNumber", SqlDbType.NChar,500)};
                parameters[0].Value = model;
                if (db.ExecuteNonQuery(strSql.ToString(), parameters) > 0)
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
        public bool Delete()
        {
            try
            {
                string strSql = " delete from T_SoftReg ";
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
        public string GetSequenceNumber()
        {
            try
            {
                string strSql = "select top 1 SequenceNumber from T_SoftReg ";
                string sequenceNumber = string.Empty;
                using (dynamic read = db.ExecuteReader(strSql))
                {
                    if (read.Read())
                    {
                        sequenceNumber = read["SequenceNumber"].ToString();
                    }
                    read.Dispose();
                }
                return sequenceNumber;
            }
            catch { throw; }
        }

        public void Dispose()
        {
            throw new NotImplementedException();
        }
    }
}