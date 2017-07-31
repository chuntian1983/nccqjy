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
using NCPEP.Model;
using System.Data;
using NCPEP.Com.Util;

namespace NCPEP.Dal
{
    public class OrganizationDal
    {
        private dynamic db = null;
        //
        public OrganizationDal()
        {
            db = new MsSqlHelper();
        }
        //
        public DataSet GetList(string strwhere)
        {
            string strsql = "select * from T_Organization";
            if (!string.IsNullOrEmpty(strwhere))
            {
                strsql += " where "+strwhere;
            }
            DataSet dt = db.DataSet(strsql);
            return dt;
        }
        public string CreateLower(string OrgCode)
        {
            try
            {
                string strSql = string.Format("select isnull(max(OrgCode),0) from T_Organization where UpOrgCode = '{0}'", OrgCode);
                string dy = db.ExecuteScalar(strSql);
                string strLength = string.Empty;
                switch (OrgCode.Length)
                {
                    case 2:
                        strLength = "00";
                        break;
                    case 4:
                        strLength = "00";
                        break;
                    case 6:
                        strLength = "000";
                        break;
                    case 9:
                        strLength = "000";
                        break;
                    case 12:
                        strLength = "00";
                        break;
                    default:
                        strLength = "000000000000";
                        break;
                }
                if ("0" == dy)
                {
                    return OrgCode += "1".PadLeft(strLength.Length, '0');
                }
                else
                {
                    return (Convert.ToInt64(dy) + 1).ToString();
                }
            }
            catch { throw; }
        }
        //
        public bool Create(Organization model)
        {
            try
            {
                StringBuilder strSql = new StringBuilder();
                strSql.Append("insert into T_Organization(");
                strSql.Append("OrgCode,OrgName,OrgShortName,UpOrgCode,Seq,Level,ShengCode,ShiCode,XianCode,XiangCode,CunCode,ZuCode)");
                strSql.Append(" values (");
                strSql.Append("@OrgCode,@OrgName,@OrgShortName,@UpOrgCode,@Seq,@Level,@ShengCode,@ShiCode,@XianCode,@XiangCode,@CunCode,@ZuCode)");
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
        public bool Delete(string OrgCode)
        {
            try
            {
                StringBuilder strSql = new StringBuilder();
                strSql.Append("delete from T_Organization ");
                strSql.Append(" where OrgCode=@OrgCode ");
                SqlParameter[] parameters = {
					new SqlParameter("@OrgCode", SqlDbType.VarChar,300)			};
                parameters[0].Value = OrgCode;
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
        public bool Update(Organization model)
        {
            try
            {
                StringBuilder strSql = new StringBuilder();
                strSql.Append("update T_Organization set ");
                strSql.Append("OrgName=@OrgName,");
                strSql.Append("OrgShortName=@OrgShortName,");
                strSql.Append("UpOrgCode=@UpOrgCode,");
                strSql.Append("Seq=@Seq,");
                strSql.Append("Level=@Level,");
                strSql.Append("ShengCode=@ShengCode,");
                strSql.Append("ShiCode=@ShiCode,");
                strSql.Append("XianCode=@XianCode,");
                strSql.Append("XiangCode=@XiangCode,");
                strSql.Append("CunCode=@CunCode,");
                strSql.Append("ZuCode=@ZuCode");
                strSql.Append(" where OrgCode=@OrgCode ");
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
        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        public int GetLevel(string orgCode)
        {
            try
            {
                int level = 0;
                string strSql = string.Format("select top 1 OrgCode,OrgName,OrgShortName,UpOrgCode,Seq,Level,ShengCode,ShiCode,XianCode,XiangCode,CunCode,ZuCode from T_Organization where OrgCode = '{0}'", orgCode);
                dynamic model = null;
                using (dynamic read = db.ExecuteReader(strSql))
                {
                    model = new Organization();
                    if (read.Read())
                    {
                        level = int.Parse(read["Level"].ToString());
                    }
                    read.Dispose();
                }
                return level;
            }
            catch { throw; }
        }
        //
        public string GetHighestOrgCode()
        {
            try
            {
                string strSql = "select top 1 OrgCode,OrgName,OrgShortName,UpOrgCode,Seq,Level,ShengCode,ShiCode,XianCode,XiangCode,CunCode,ZuCode from T_Organization order by Level desc ";
                string OrgCode = string.Empty;
                using (dynamic read = db.ExecuteReader(strSql))
                {
                    if (read.Read())
                    {
                        OrgCode = read["OrgCode"].ToString();
                    }
                    read.Dispose();
                }
                return OrgCode;
            }
            catch { throw; }
        }
        //
        public string GetHighestLevel()
        {
            return this.GetHighestLevel(string.Empty);
        }
        /// <summary>
        /// 最高级
        /// </summary>
        /// <returns></returns>
        public string GetHighestLevel(string OrgCode)
        {
            try
            {
                string strSql = "select top 1 OrgCode,OrgName,OrgShortName,UpOrgCode,Seq,Level,ShengCode,ShiCode,XianCode,XiangCode,CunCode,ZuCode from T_Organization ";
                if (!string.IsNullOrEmpty(OrgCode))
                {
                    strSql += string.Format(" where OrgCode = '{0}'", OrgCode);
                }
                strSql += " order by [Level] desc ";
                string UpOrgCode = string.Empty;
                using (dynamic read = db.ExecuteReader(strSql))
                {
                    if (read.Read())
                    {
                        UpOrgCode = read["UpOrgCode"].ToString();
                    }
                    read.Dispose();
                }
                return UpOrgCode;
            }
            catch { throw; }
        }
        public string GetHighestLevelOrgName(string OrgCode)
        {
            try
            {
                string strSql =string.Format( "select top 1 OrgCode,OrgName,OrgShortName,UpOrgCode,Seq,Level,ShengCode,ShiCode,XianCode,XiangCode,CunCode,ZuCode from T_Organization where OrgCode='{0}' order by Level desc ",OrgCode);
                string orgShortName = string.Empty;
                using (dynamic read = db.ExecuteReader(strSql))
                {
                    if (read.Read())
                    {
                        orgShortName = read["OrgShortName"].ToString();
                    }
                    read.Dispose();
                }
                return orgShortName;
            }
            catch { throw; }
        }
        //
        public string GetHighestLevelOrgName()
        {
            try
            {
                string strSql = "select top 1 OrgCode,OrgName,OrgShortName,UpOrgCode,Seq,Level,ShengCode,ShiCode,XianCode,XiangCode,CunCode,ZuCode from T_Organization order by Level desc ";
                string orgShortName = string.Empty;
                using (dynamic read = db.ExecuteReader(strSql))
                {
                    if (read.Read())
                    {
                        orgShortName = read["OrgShortName"].ToString();
                    }
                    read.Dispose();
                }
                return orgShortName;
            }
            catch { throw; }
        }
        /// <summary>
        /// 下级
        /// </summary>
        /// <param name="UpOrgCode"></param>
        /// <returns></returns>
        public DataTable GetLower(string UpOrgCode)
        {
            try
            {
                string strSql = string.Format("select OrgCode,OrgName,OrgShortName,UpOrgCode,Seq,Level,ShengCode,ShiCode,XianCode,XiangCode,CunCode,ZuCode from T_Organization where UpOrgCode='{0}'", UpOrgCode);
                return db.ExecuteDataTable(strSql);
            }
            catch { throw; }
        }
        //
        public DataTable GetLevel(int level)
        {
            try
            {
                string strSql = string.Format("select OrgCode,OrgName,OrgShortName,UpOrgCode,Seq,Level,ShengCode,ShiCode,XianCode,XiangCode,CunCode,ZuCode from T_Organization where level={0}", level);
                return db.ExecuteDataTable(strSql);
            }
            catch { throw; }
        }
        //
        public string RecOrgCode(string OrgCode, int Level)
        {
            string strSql = string.Format(" WITH Org(OrgCode,UpOrgCode,level,OrgShortName) as (select OrgCode,UpOrgCode,level,OrgShortName from T_Organization where OrgCode='{0}' union all select a.OrgCode,a.UpOrgCode,a.level,a.OrgShortName from T_Organization a inner join Org b ON a.OrgCode=b.UpOrgCode) select top 1 * from Org where level ={1} ", OrgCode, Level);
            string orgCode = string.Empty;
            using (dynamic read = db.ExecuteReader(strSql))
            {
                if (read.Read())
                {
                    orgCode = read["OrgCode"].ToString();
                }
                read.Dispose();
            }
            return orgCode;
        }
        //
        public string RecOrgShortName(string OrgCode, int Level)
        {
            string strSql = string.Format(" WITH Org(OrgCode,UpOrgCode,level,OrgShortName) as (select OrgCode,UpOrgCode,level,OrgShortName from T_Organization where OrgCode='{0}' union all select a.OrgCode,a.UpOrgCode,a.level,a.OrgShortName from T_Organization a inner join Org b ON a.OrgCode=b.UpOrgCode) select top 1 * from Org where level ={1} ", OrgCode, Level);
            string orgShortName = string.Empty;
            using (dynamic read = db.ExecuteReader(strSql))
            {
                if (read.Read())
                {
                    orgShortName = read["OrgShortName"].ToString();
                }
                read.Dispose();
            }
            return orgShortName;
        }
        //
        public Organization GetModel(string OrgCode)
        {
            try
            {
                string strSql = string.Format("select top 1 OrgCode,OrgName,OrgShortName,UpOrgCode,Seq,Level,ShengCode,ShiCode,XianCode,XiangCode,CunCode,ZuCode from T_Organization where OrgCode='{0}'", OrgCode);
                dynamic model = null;
                using (dynamic read = db.ExecuteReader(strSql))
                {
                    model = new Organization();
                    if (read.Read())
                    {
                        model.OrgCode = read["OrgCode"].ToString();
                        model.OrgName = read["OrgName"].ToString();
                        model.OrgShortName = read["OrgShortName"].ToString();
                        model.UpOrgCode = read["UpOrgCode"].ToString();
                        model.Seq = int.Parse(read["Seq"].ToString());
                        model.Level = int.Parse(read["Level"].ToString());
                        model.ShengCode = read["ShengCode"].ToString();
                        model.ShiCode = read["ShiCode"].ToString();
                        model.XianCode = read["XianCode"].ToString();
                        model.XiangCode = read["XiangCode"].ToString();
                        model.CunCode = read["CunCode"].ToString();
                        model.ZuCode = read["ZuCode"].ToString();
                    }
                    read.Dispose();
                }
                return model;
            }
            catch { throw; }
        }
        //
        public Organization GetModel()
        {
            try
            {
                string strSql = string.Format("select top 1 OrgCode,OrgName,OrgShortName,UpOrgCode,Seq,Level,ShengCode,ShiCode,XianCode,XiangCode,CunCode,ZuCode from T_Organization order by level desc");
                dynamic model = null;
                using (dynamic read = db.ExecuteReader(strSql))
                {
                    model = new Organization();
                    if (read.Read())
                    {
                        model.OrgCode = read["OrgCode"].ToString();
                        model.OrgName = read["OrgName"].ToString();
                        model.OrgShortName = read["OrgShortName"].ToString();
                        model.UpOrgCode = read["UpOrgCode"].ToString();
                        model.Seq = int.Parse(read["Seq"].ToString());
                        model.Level = int.Parse(read["Level"].ToString());
                        model.ShengCode = read["ShengCode"].ToString();
                        model.ShiCode = read["ShiCode"].ToString();
                        model.XianCode = read["XianCode"].ToString();
                        model.XiangCode = read["XiangCode"].ToString();
                        model.CunCode = read["CunCode"].ToString();
                        model.ZuCode = read["ZuCode"].ToString();
                    }
                    read.Dispose();
                }
                return model;
            }
            catch { throw; }
        }
        //
        private SqlParameter[] GetSqlParameter(Organization model)
        {
            SqlParameter[] parameters = {
					new SqlParameter("@OrgName", SqlDbType.NVarChar,500),
					new SqlParameter("@OrgShortName", SqlDbType.NVarChar,50),
					new SqlParameter("@UpOrgCode", SqlDbType.VarChar,300),
					new SqlParameter("@Seq", SqlDbType.Int,4),
					new SqlParameter("@Level", SqlDbType.Int,4),
					new SqlParameter("@ShengCode", SqlDbType.Char,10),
					new SqlParameter("@ShiCode", SqlDbType.Char,10),
					new SqlParameter("@XianCode", SqlDbType.Char,10),
					new SqlParameter("@XiangCode", SqlDbType.Char,10),
					new SqlParameter("@CunCode", SqlDbType.Char,10),
					new SqlParameter("@ZuCode", SqlDbType.Char,10),
					new SqlParameter("@OrgCode", SqlDbType.VarChar,300)};
            parameters[0].Value = model.OrgName;
            parameters[1].Value = model.OrgShortName;
            parameters[2].Value = model.UpOrgCode;
            parameters[3].Value = model.Seq;
            parameters[4].Value = model.Level;
            parameters[5].Value = model.ShengCode;
            parameters[6].Value = model.ShiCode;
            parameters[7].Value = model.XianCode;
            parameters[8].Value = model.XiangCode;
            parameters[9].Value = model.CunCode;
            parameters[10].Value = model.ZuCode;
            parameters[11].Value = model.OrgCode;
            return parameters;
        }
    }
}

