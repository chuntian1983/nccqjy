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
    public class RolePermissionsDal : IDisposable
    {
        private dynamic db = null;
        //
        public RolePermissionsDal()
        {
            db = new MsSqlHelper();
        }
        //
        public bool Create(RolePermissions model)
        {
            try
            {
                StringBuilder strSql = new StringBuilder();
                strSql.Append("insert into T_RolePermissions(");
                strSql.Append("AdminUserId,SysFunId,Editor,CreateDate)");
                strSql.Append(" values (");
                strSql.Append("@AdminUserId,@SysFunId,@Editor,@CreateDate)");
                if (db.ExecuteNonQuery(strSql.ToString(), GetParameter(model)) > 0)
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
        public bool Delete(int AdminUserId)
        {
            try
            {
                StringBuilder strSql = new StringBuilder();
                strSql.Append("delete from T_RolePermissions ");
                strSql.Append(" where AdminUserId=@AdminUserId");
                SqlParameter[] parameters = {
					new SqlParameter("@AdminUserId", AdminUserId)
			};
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
        public DataTable GetAllList(int adminUserId)
        {
            try
            {
                string strSql = string.Format(" select c.NodeId,c.NodeURL,c.DisplayName,c.FunImgNum from T_RolePermissions as a left join T_AdminUser as b on a.AdminUserId = b.Id left join T_SysFun as c on a.SysFunId = c.NodeId where a.AdminUserId = {0}  order by c.DisplayOrder asc ", adminUserId );
                return db.ExecuteDataTable(strSql);
            }
            catch { throw; }
        }

        //
        public DataTable GetAllList(int adminUserId, int parentNodeId)
        {
            try
            {
                string strSql = string.Format(" select c.NodeId,c.NodeURL,c.DisplayName,c.FunImgNum from T_RolePermissions as a left join T_AdminUser as b on a.AdminUserId = b.Id left join T_SysFun as c on a.SysFunId = c.NodeId where a.AdminUserId = {0} and c.ParentNodeId={1} order by c.DisplayOrder asc ", adminUserId, parentNodeId);
                return db.ExecuteDataTable(strSql);
            }
            catch { throw; }
        }
        public DataTable GetAllListByPid(int parentNodeId)
        {
            try
            {
                string strSql = string.Format(" select c.NodeId,c.NodeURL,c.DisplayName,c.FunImgNum from  T_SysFun as c where c.ParentNodeId={0}   order by c.DisplayOrder asc ",parentNodeId);
                return db.ExecuteDataTable(strSql);
            }
            catch { throw; }
        }
        //
        private SqlParameter[] GetParameter(RolePermissions model)
        {
            SqlParameter[] parameters = {
					new SqlParameter("@AdminUserId", SqlDbType.Int,4),
					new SqlParameter("@SysFunId", SqlDbType.Int,4),
					new SqlParameter("@Editor", SqlDbType.NVarChar,50),
					new SqlParameter("@CreateDate", SqlDbType.DateTime)};
            parameters[0].Value = model.AdminUserId;
            parameters[1].Value = model.SysFunId;
            parameters[2].Value = model.Editor;
            parameters[3].Value = model.CreateDate;
            return parameters;
        }

        public void Dispose()
        {
            throw new NotImplementedException();
        }
    }
}
