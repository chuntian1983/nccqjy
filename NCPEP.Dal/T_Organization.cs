using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Maticsoft.DBUtility;//Please add references
using NCPEP.Model;
using System.Data.SqlClient;
using System.Data;

namespace NCPEP.Dal
{
    /// <summary>
    /// 数据访问类:T_Organization
    /// </summary>
    public partial class T_Organization
    {
        public T_Organization()
        { }
        #region  BasicMethod

        /// <summary>
        /// 增加一条数据
        /// </summary>
        public bool Add(NCPEP.Model.T_Organization model)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("insert into T_Organization(");
            strSql.Append("OrgCode,OrgName,OrgShortName,UpOrgCode,Seq,Level,ShengCode,ShiCode,XianCode,XiangCode,CunCode,ZuCode)");
            strSql.Append(" values (");
            strSql.Append("@OrgCode,@OrgName,@OrgShortName,@UpOrgCode,@Seq,@Level,@ShengCode,@ShiCode,@XianCode,@XiangCode,@CunCode,@ZuCode)");
            SqlParameter[] parameters = {
					new SqlParameter("@OrgCode", SqlDbType.VarChar,300),
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
					new SqlParameter("@ZuCode", SqlDbType.Char,10)};
            parameters[0].Value = model.OrgCode;
            parameters[1].Value = model.OrgName;
            parameters[2].Value = model.OrgShortName;
            parameters[3].Value = model.UpOrgCode;
            parameters[4].Value = model.Seq;
            parameters[5].Value = model.Level;
            parameters[6].Value = model.ShengCode;
            parameters[7].Value = model.ShiCode;
            parameters[8].Value = model.XianCode;
            parameters[9].Value = model.XiangCode;
            parameters[10].Value = model.CunCode;
            parameters[11].Value = model.ZuCode;

            int rows = DbHelperSQL.ExecuteSql(strSql.ToString(), parameters);
            if (rows > 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        /// <summary>
        /// 更新一条数据
        /// </summary>
        public bool Update(NCPEP.Model.T_Organization model)
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

            int rows = DbHelperSQL.ExecuteSql(strSql.ToString(), parameters);
            if (rows > 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        /// <summary>
        /// 删除一条数据
        /// </summary>
        public bool Delete(string OrgCode)
        {

            StringBuilder strSql = new StringBuilder();
            strSql.Append("delete from T_Organization ");
            strSql.Append(" where OrgCode=@OrgCode ");
            SqlParameter[] parameters = {
					new SqlParameter("@OrgCode", SqlDbType.VarChar,300)			};
            parameters[0].Value = OrgCode;

            int rows = DbHelperSQL.ExecuteSql(strSql.ToString(), parameters);
            if (rows > 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        /// <summary>
        /// 批量删除数据
        /// </summary>
        public bool DeleteList(string OrgCodelist)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("delete from T_Organization ");
            strSql.Append(" where OrgCode in (" + OrgCodelist + ")  ");
            int rows = DbHelperSQL.ExecuteSql(strSql.ToString());
            if (rows > 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }


        /// <summary>
        /// 得到一个对象实体
        /// </summary>
        public NCPEP.Model.T_Organization GetModel(string OrgCode)
        {

            StringBuilder strSql = new StringBuilder();
            strSql.Append("select  top 1 OrgCode,OrgName,OrgShortName,UpOrgCode,Seq,Level,ShengCode,ShiCode,XianCode,XiangCode,CunCode,ZuCode from T_Organization ");
            strSql.Append(" where OrgCode=@OrgCode ");
            SqlParameter[] parameters = {
					new SqlParameter("@OrgCode", SqlDbType.VarChar,300)			};
            parameters[0].Value = OrgCode;

            NCPEP.Model.T_Organization model = new NCPEP.Model.T_Organization();
            DataSet ds = DbHelperSQL.Query(strSql.ToString(), parameters);
            if (ds.Tables[0].Rows.Count > 0)
            {
                return DataRowToModel(ds.Tables[0].Rows[0]);
            }
            else
            {
                return null;
            }
        }


        /// <summary>
        /// 得到一个对象实体
        /// </summary>
        public NCPEP.Model.T_Organization DataRowToModel(DataRow row)
        {
            NCPEP.Model.T_Organization model = new NCPEP.Model.T_Organization();
            if (row != null)
            {
                if (row["OrgCode"] != null)
                {
                    model.OrgCode = row["OrgCode"].ToString();
                }
                if (row["OrgName"] != null)
                {
                    model.OrgName = row["OrgName"].ToString();
                }
                if (row["OrgShortName"] != null)
                {
                    model.OrgShortName = row["OrgShortName"].ToString();
                }
                if (row["UpOrgCode"] != null)
                {
                    model.UpOrgCode = row["UpOrgCode"].ToString();
                }
                if (row["Seq"] != null && row["Seq"].ToString() != "")
                {
                    model.Seq = int.Parse(row["Seq"].ToString());
                }
                if (row["Level"] != null && row["Level"].ToString() != "")
                {
                    model.Level = int.Parse(row["Level"].ToString());
                }
                if (row["ShengCode"] != null)
                {
                    model.ShengCode = row["ShengCode"].ToString();
                }
                if (row["ShiCode"] != null)
                {
                    model.ShiCode = row["ShiCode"].ToString();
                }
                if (row["XianCode"] != null)
                {
                    model.XianCode = row["XianCode"].ToString();
                }
                if (row["XiangCode"] != null)
                {
                    model.XiangCode = row["XiangCode"].ToString();
                }
                if (row["CunCode"] != null)
                {
                    model.CunCode = row["CunCode"].ToString();
                }
                if (row["ZuCode"] != null)
                {
                    model.ZuCode = row["ZuCode"].ToString();
                }
            }
            return model;
        }

        /// <summary>
        /// 获得数据列表
        /// </summary>
        public DataSet GetList(string strWhere)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("select OrgCode,OrgName,OrgShortName,UpOrgCode,Seq,Level,ShengCode,ShiCode,XianCode,XiangCode,CunCode,ZuCode ");
            strSql.Append(" FROM T_Organization ");
            if (strWhere.Trim() != "")
            {
                strSql.Append(" where " + strWhere);
            }
            return DbHelperSQL.Query(strSql.ToString());
        }

        /// <summary>
        /// 获得前几行数据
        /// </summary>
        public DataSet GetList(int Top, string strWhere, string filedOrder)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("select ");
            if (Top > 0)
            {
                strSql.Append(" top " + Top.ToString());
            }
            strSql.Append(" OrgCode,OrgName,OrgShortName,UpOrgCode,Seq,Level,ShengCode,ShiCode,XianCode,XiangCode,CunCode,ZuCode ");
            strSql.Append(" FROM T_Organization ");
            if (strWhere.Trim() != "")
            {
                strSql.Append(" where " + strWhere);
            }
            strSql.Append(" order by " + filedOrder);
            return DbHelperSQL.Query(strSql.ToString());
        }

        /// <summary>
        /// 获取记录总数
        /// </summary>
        public int GetRecordCount(string strWhere)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("select count(1) FROM T_Organization ");
            if (strWhere.Trim() != "")
            {
                strSql.Append(" where " + strWhere);
            }
            object obj = DbHelperSQL.GetSingle(strSql.ToString());
            if (obj == null)
            {
                return 0;
            }
            else
            {
                return Convert.ToInt32(obj);
            }
        }
        /// <summary>
        /// 分页获取数据列表
        /// </summary>
        public DataSet GetListByPage(string strWhere, string orderby, int startIndex, int endIndex)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("SELECT * FROM ( ");
            strSql.Append(" SELECT ROW_NUMBER() OVER (");
            if (!string.IsNullOrEmpty(orderby.Trim()))
            {
                strSql.Append("order by T." + orderby);
            }
            else
            {
                strSql.Append("order by T.OrgCode desc");
            }
            strSql.Append(")AS Row, T.*  from T_Organization T ");
            if (!string.IsNullOrEmpty(strWhere.Trim()))
            {
                strSql.Append(" WHERE " + strWhere);
            }
            strSql.Append(" ) TT");
            strSql.AppendFormat(" WHERE TT.Row between {0} and {1}", startIndex, endIndex);
            return DbHelperSQL.Query(strSql.ToString());
        }

        /*
        /// <summary>
        /// 分页获取数据列表
        /// </summary>
        public DataSet GetList(int PageSize,int PageIndex,string strWhere)
        {
            SqlParameter[] parameters = {
                    new SqlParameter("@tblName", SqlDbType.VarChar, 255),
                    new SqlParameter("@fldName", SqlDbType.VarChar, 255),
                    new SqlParameter("@PageSize", SqlDbType.Int),
                    new SqlParameter("@PageIndex", SqlDbType.Int),
                    new SqlParameter("@IsReCount", SqlDbType.Bit),
                    new SqlParameter("@OrderType", SqlDbType.Bit),
                    new SqlParameter("@strWhere", SqlDbType.VarChar,1000),
                    };
            parameters[0].Value = "T_Organization";
            parameters[1].Value = "OrgCode";
            parameters[2].Value = PageSize;
            parameters[3].Value = PageIndex;
            parameters[4].Value = 0;
            parameters[5].Value = 0;
            parameters[6].Value = strWhere;	
            return DbHelperSQL.RunProcedure("UP_GetRecordByPage",parameters,"ds");
        }*/

        #endregion  BasicMethod
        #region  ExtensionMethod

        #endregion  ExtensionMethod
    }
}
