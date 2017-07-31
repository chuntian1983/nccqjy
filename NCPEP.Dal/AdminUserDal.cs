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
using NCPEP.Model;
using NCPEP.Com.Util;
using System.Data;
using System.Data.SqlClient;

namespace NCPEP.Dal
{
    public class AdminUserDal
    {
        private dynamic db = null;
        public AdminUserDal()
        {
            db = new MsSqlHelper();
        }
        //
        public bool ShieldingUsers(string mac)
        {
            try
            {
                string strSql = string.Format("select count(Id) from T_ShieldingUsers where UserMac = '{0}'", mac);
                if (db.ExecuteScalar(strSql) > 0)
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
                return true;
            }
        }
        //
        public bool Exists()
        {
            try
            {
                string strSql = "select count(*) from T_AdminUser";
                if (db.ExecuteScalar(strSql) > 0)
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
                return true;
            }
        }
        //
        public int OrgCount(string OrgCode)
        {
            try
            {
                string strSql = string.Format("select count(*) from T_AdminUser where orgcode ='{0}'", OrgCode);
                return (int)db.ExecuteScalar(strSql);
            }
            catch { throw; }
        }
        //
        public bool Create(AdminUser model)
        {
            try
            {
                StringBuilder strSql = new StringBuilder();
                strSql.Append("insert into T_AdminUser(");
                strSql.Append("AdminLogName,AdminLogPass,AdminName,AdminTel,OrgCode,AdminTypeId,JobId,AdminState,AdminLogNum,IsCheck,Editor,CreateDate,EndDate)");
                strSql.Append(" values (");
                strSql.Append("@AdminLogName,@AdminLogPass,@AdminName,@AdminTel,@OrgCode,@AdminTypeId,@JobId,@AdminState,@AdminLogNum,@IsCheck,@Editor,@CreateDate,@EndDate)");
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
        public dynamic CreateScalar(AdminUser model)
        {
            try
            {
                StringBuilder strSql = new StringBuilder();
                strSql.Append("insert into T_AdminUser(");
                strSql.Append("AdminLogName,AdminLogPass,AdminName,AdminTel,OrgCode,AdminTypeId,JobId,AdminState,AdminLogNum,IsCheck,Editor,CreateDate,EndDate)");
                strSql.Append(" values (");
                strSql.Append("@AdminLogName,@AdminLogPass,@AdminName,@AdminTel,@OrgCode,@AdminTypeId,@JobId,@AdminState,@AdminLogNum,@IsCheck,@Editor,@CreateDate,@EndDate);");
                strSql.Append(" select @@identity");
                return db.ExecuteScalar(strSql.ToString(), GetSqlParameter(model));
            }
            catch { throw; }
        }
        //
        public bool Update(AdminUser model)
        {
            try
            {
                StringBuilder strSql = new StringBuilder();
                strSql.Append("update T_AdminUser set ");
                strSql.Append("AdminLogName=@AdminLogName,");
                strSql.Append("AdminLogPass=@AdminLogPass,");
                strSql.Append("AdminName=@AdminName,");
                strSql.Append("AdminTel=@AdminTel,");
                strSql.Append("OrgCode=@OrgCode,");
                strSql.Append("AdminTypeId=@AdminTypeId,");
                strSql.Append("JobId=@JobId,");
                strSql.Append("AdminState=@AdminState,");
                strSql.Append("AdminLogNum=@AdminLogNum,");
                strSql.Append("IsCheck=@IsCheck,");
                strSql.Append("Editor=@Editor,");
                strSql.Append("CreateDate=@CreateDate,");
                strSql.Append("EndDate=@EndDate");
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
        public bool UpdatePass(string AdminLogPass, int Id)
        {
            try
            {
                String strSql = string.Format("update T_AdminUser set AdminLogPass={0} where Id={1}", AdminLogPass, Id);
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
        public bool Delete(int id)
        {
            try
            {
                string strSql = string.Format("delete from T_AdminUser where Id={0}", id);
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
        public bool Delete(string Idlist)
        {
            try
            {
                StringBuilder strSql = new StringBuilder();
                strSql.Append("delete from T_AdminUser ");
                strSql.Append(" where Id in (" + Idlist + ")  ");
                int rows = db.ExecuteNonQuery(strSql.ToString());
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
        //
        public DataTable GetAllList(string sqlWhere, int startIndex, int pageSize, string order)
        {
            try
            {
                string strSql = " select a.Id,a.AdminLogName,a.AdminLogPass,a.AdminName,a.AdminTel,o.OrgShortName,t.AdminTypeName as AdminTypeId,a.AdminState,a.AdminLogNum,a.IsCheck,a.Editor,a.CreateDate,a.EndDate,j.JobTypeName as JobId  from T_AdminUser as a left join T_Organization as o on a.OrgCode=o.OrgCode left join T_AdminType as t on a.AdminTypeId = t.Id left join T_Job as j on a.JobId=j.Id ";
                if (!string.IsNullOrEmpty(sqlWhere))
                {
                    strSql += string.Format(" where {0}", sqlWhere);
                }
                if (!string.IsNullOrEmpty(order))
                {
                    strSql += order;
                }
                return db.ExecuteDataTable(strSql, startIndex * pageSize, pageSize, "T_AdminUser");
            }
            catch { throw; }
        }
        //
        public bool UpdateState(string row, string values, string where)
        {
            try
            {
                string strSql = string.Format("update T_AdminUser set {0} = {1} where Id = {2}", row, values, where);
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
        public dynamic GetModel(int id)
        {
            try
            {
                AdminUser model = null;
                string strSql = string.Format("select Id,AdminLogName,AdminLogPass,AdminName,AdminTel,OrgCode,AdminTypeId,AdminState,AdminLogNum,IsCheck,Editor,CreateDate,EndDate,JobId from T_AdminUser where Id = {0}", id);
                using (dynamic read = db.ExecuteReader(strSql))
                {
                    if (read.Read())
                    {
                        model = new AdminUser();
                        model.Id = int.Parse(read["Id"].ToString());
                        model.AdminLogName = read["AdminLogName"].ToString();
                        model.AdminLogPass = read["AdminLogPass"].ToString();
                        model.AdminName = read["AdminName"].ToString();
                        model.AdminTel = read["AdminTel"].ToString();
                        model.OrgCode = read["OrgCode"].ToString();
                        model.AdminTypeId = int.Parse(read["AdminTypeId"].ToString());
                        model.AdminState = int.Parse(read["AdminState"].ToString());
                        model.AdminLogNum = int.Parse(read["AdminLogNum"].ToString());
                        model.IsCheck = int.Parse(read["IsCheck"].ToString());
                        model.Editor = read["Editor"].ToString();
                        model.JobId = int.Parse(read["JobId"].ToString());
                        model.CreateDate = DateTime.Parse(read["CreateDate"].ToString());
                        model.EndDate = DateTime.Parse(read["EndDate"].ToString());
                    }
                    read.Dispose();
                }
                return model;
            }
            catch { throw; }
        }
        //
        public dynamic SumCount(string where)
        {
            try
            {
                string strSql = " select count(a.Id)from T_AdminUser as a left join T_Organization as o on a.OrgCode=o.OrgCode left join T_AdminType as t on a.AdminTypeId = t.Id ";
                if (!string.IsNullOrEmpty(where))
                {
                    strSql += string.Format(" where {0}", where);
                }
                return db.ExecuteScalar(strSql);
            }
            catch { throw; }
        }
        //
        public AdminUser AdminUserLogin(string adminLogName, string adminLogPass)
        {
            try
            {
                string strSql = string.Format("select top 1 Id,AdminLogName,AdminLogPass,AdminName,AdminTel,OrgCode,AdminTypeId,AdminState,AdminLogNum,IsCheck,Editor,CreateDate,EndDate,JobId from T_AdminUser where AdminLogName='{0}' and AdminLogPass='{1}'", adminLogName, adminLogPass);
                AdminUser model = new AdminUser();
                using (dynamic read = db.ExecuteReader(strSql))
                {
                    if (read.Read())
                    {
                        model.Id = (int)read["Id"];
                        model.AdminLogName = read["AdminLogName"];
                        model.AdminLogPass = read["AdminLogPass"];
                        model.AdminName = read["AdminName"];
                        model.AdminTel = read["AdminTel"];
                        model.OrgCode = read["OrgCode"];
                        try { model.AdminTypeId = (int)read["AdminTypeId"]; }
                        catch { model.AdminTypeId = 0; }
                        try { model.AdminState = (int)read["AdminState"]; }
                        catch { model.AdminState = 0; }
                        try { model.AdminLogNum = (int)read["AdminLogNum"]; }
                        catch { model.AdminLogNum = 0; }
                        try { model.JobId = (int)read["JobId"]; }
                        catch { model.JobId = 0; }
                        try { model.IsCheck = (int)read["IsCheck"]; }
                        catch { model.IsCheck = 0; }
                        model.Editor = read["Editor"];
                        try { model.CreateDate = (DateTime)read["CreateDate"]; }
                        catch { model.CreateDate = DateTime.Now; }
                        try { model.EndDate = (DateTime)read["EndDate"]; }
                        catch { model.EndDate = DateTime.Now; }
                    }
                    read.Dispose();
                }
                return model;
            }
            catch { throw; }
        }
        //
        public bool CheckUserName(string adminLogName)
        {
            try
            {
                bool existence;
                string strSql = string.Format(" select Id,AdminLogName from T_AdminUser where AdminLogName = '{0}' ", adminLogName);
                using (dynamic read = db.ExecuteReader(strSql))
                {
                    if (read.Read())
                    {
                        existence = true;
                    }
                    else
                    {
                        existence = false;
                    }
                    read.Dispose();
                }
                return existence;
            }
            catch
            {
                throw;
            }
        }
        //
        public void NumberLogin(int id)
        {
            try
            {
                db.ExecuteNonQuery(string.Format("update T_AdminUser set AdminLogNum=(AdminLogNum+1),EndDate=GETDATE() where Id={0}", id));
            }
            catch { throw; }
        }
        //
        private SqlParameter[] GetSqlParameter(AdminUser model)
        {
            SqlParameter[] parameters = {
					new SqlParameter("@AdminLogName", SqlDbType.NVarChar,50),
					new SqlParameter("@AdminLogPass", SqlDbType.NVarChar,50),
					new SqlParameter("@AdminName", SqlDbType.NVarChar,50),
					new SqlParameter("@AdminTel", SqlDbType.NVarChar,50),
					new SqlParameter("@OrgCode", SqlDbType.NVarChar,50),
					new SqlParameter("@AdminTypeId", SqlDbType.Int,4),
					new SqlParameter("@JobId", SqlDbType.Int,4),
					new SqlParameter("@AdminState", SqlDbType.Int,4),
					new SqlParameter("@AdminLogNum", SqlDbType.Int,4),
					new SqlParameter("@IsCheck", SqlDbType.Int,4),
					new SqlParameter("@Editor", SqlDbType.NVarChar,50),
					new SqlParameter("@CreateDate", SqlDbType.DateTime),
					new SqlParameter("@EndDate", SqlDbType.DateTime),
					new SqlParameter("@Id", SqlDbType.Int,4)};
            parameters[0].Value = model.AdminLogName;
            parameters[1].Value = model.AdminLogPass;
            parameters[2].Value = model.AdminName;
            parameters[3].Value = model.AdminTel;
            parameters[4].Value = model.OrgCode;
            parameters[5].Value = model.AdminTypeId;
            parameters[6].Value = model.JobId;
            parameters[7].Value = model.AdminState;
            parameters[8].Value = model.AdminLogNum;
            parameters[9].Value = model.IsCheck;
            parameters[10].Value = model.Editor;
            parameters[11].Value = model.CreateDate;
            parameters[12].Value = model.EndDate;
            parameters[13].Value = model.Id;
            return parameters;
        }
    }
}

