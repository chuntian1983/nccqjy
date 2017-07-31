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
    public class PermissionsDal
    {
        private dynamic db = null;
        public PermissionsDal()
        {
            db = new MsSqlHelper();
        }
        /// <summary>
        /// 增加一条数据
        /// </summary>
        public bool Create(Permissions model)
        {
            try
            {
                StringBuilder strSql = new StringBuilder();
                strSql.Append("insert into T_Permissions(");
                strSql.Append("AdminTypeId,SysFunId,Editor,CreateDate)");
                strSql.Append(" values (");
                strSql.Append("@AdminTypeId,@SysFunId,@Editor,@CreateDate)");
                strSql.Append(";select @@IDENTITY");
                SqlParameter[] parameters = {
					new SqlParameter("@AdminTypeId", SqlDbType.Int,4),
					new SqlParameter("@SysFunId", SqlDbType.Int,4),
					new SqlParameter("@Editor", SqlDbType.NVarChar,50),
					new SqlParameter("@CreateDate", SqlDbType.DateTime)};
                parameters[0].Value = model.AdminTypeId;
                parameters[1].Value = model.SysFunId;
                parameters[2].Value = model.Editor;
                parameters[3].Value = model.CreateDate;
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

        /// <summary>
        /// 删除一条数据
        /// </summary>
        public bool Delete(int AdminTypeId)
        {
            try
            {
                StringBuilder strSql = new StringBuilder();
                strSql.Append("delete from T_Permissions ");
                strSql.Append(" where AdminTypeId=@AdminTypeId");
                SqlParameter[] parameters = {
					new SqlParameter("@AdminTypeId", SqlDbType.Int,4)
			};
                parameters[0].Value = AdminTypeId;
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
        /// <summary>
        /// 
        /// </summary>
        /// <param name="AdminTypeId"></param>
        /// <returns></returns>
        public DataTable GetAllList(int AdminTypeId)
        {
            try
            {
                string strSql = string.Format("select Id,AdminTypeId,SysFunId,Editor,CreateDate from T_Permissions where AdminTypeId = {0}", AdminTypeId);
                return db.ExecuteDataTable(strSql);
            }
            catch { throw; }
        }
    }
}

