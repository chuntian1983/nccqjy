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
	/// 数据访问类:T_AdminUser
	/// </summary>
	public partial class T_AdminUser
    {
        public T_AdminUser()
        { }
        #region  BasicMethod

        /// <summary>
        /// 增加一条数据
        /// </summary>
        public int Add( NCPEP.Model.T_AdminUser model)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("insert into T_AdminUser(");
            strSql.Append("AdminLogName,AdminLogPass,AdminName,AdminTel,OrgCode,AdminTypeId,JobId,AdminState,AdminLogNum,IsCheck,Editor,CreateDate,EndDate)");
            strSql.Append(" values (");
            strSql.Append("@AdminLogName,@AdminLogPass,@AdminName,@AdminTel,@OrgCode,@AdminTypeId,@JobId,@AdminState,@AdminLogNum,@IsCheck,@Editor,@CreateDate,@EndDate)");
            strSql.Append(";select @@IDENTITY");
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
                    new SqlParameter("@EndDate", SqlDbType.DateTime)};
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

            object obj = DbHelperSQL.GetSingle(strSql.ToString(), parameters);
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
        /// 更新一条数据
        /// </summary>
        public bool Update(NCPEP.Model.T_AdminUser model)
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
        public bool Delete(int Id)
        {

            StringBuilder strSql = new StringBuilder();
            strSql.Append("delete from T_AdminUser ");
            strSql.Append(" where Id=@Id");
            SqlParameter[] parameters = {
                    new SqlParameter("@Id", SqlDbType.Int,4)
            };
            parameters[0].Value = Id;

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
        public bool DeleteList(string Idlist)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("delete from T_AdminUser ");
            strSql.Append(" where Id in (" + Idlist + ")  ");
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
        public NCPEP.Model.T_AdminUser GetModel(int Id)
        {

            StringBuilder strSql = new StringBuilder();
            strSql.Append("select  top 1 Id,AdminLogName,AdminLogPass,AdminName,AdminTel,OrgCode,AdminTypeId,JobId,AdminState,AdminLogNum,IsCheck,Editor,CreateDate,EndDate from T_AdminUser ");
            strSql.Append(" where Id=@Id");
            SqlParameter[] parameters = {
                    new SqlParameter("@Id", SqlDbType.Int,4)
            };
            parameters[0].Value = Id;

            NCPEP.Model.T_AdminUser model = new NCPEP.Model.T_AdminUser();
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
        public NCPEP.Model.T_AdminUser DataRowToModel(DataRow row)
        {
            NCPEP.Model.T_AdminUser model = new NCPEP.Model.T_AdminUser();
            if (row != null)
            {
                if (row["Id"] != null && row["Id"].ToString() != "")
                {
                    model.Id = int.Parse(row["Id"].ToString());
                }
                if (row["AdminLogName"] != null)
                {
                    model.AdminLogName = row["AdminLogName"].ToString();
                }
                if (row["AdminLogPass"] != null)
                {
                    model.AdminLogPass = row["AdminLogPass"].ToString();
                }
                if (row["AdminName"] != null)
                {
                    model.AdminName = row["AdminName"].ToString();
                }
                if (row["AdminTel"] != null)
                {
                    model.AdminTel = row["AdminTel"].ToString();
                }
                if (row["OrgCode"] != null)
                {
                    model.OrgCode = row["OrgCode"].ToString();
                }
                if (row["AdminTypeId"] != null && row["AdminTypeId"].ToString() != "")
                {
                    model.AdminTypeId = int.Parse(row["AdminTypeId"].ToString());
                }
                if (row["JobId"] != null && row["JobId"].ToString() != "")
                {
                    model.JobId = int.Parse(row["JobId"].ToString());
                }
                if (row["AdminState"] != null && row["AdminState"].ToString() != "")
                {
                    model.AdminState = int.Parse(row["AdminState"].ToString());
                }
                if (row["AdminLogNum"] != null && row["AdminLogNum"].ToString() != "")
                {
                    model.AdminLogNum = int.Parse(row["AdminLogNum"].ToString());
                }
                if (row["IsCheck"] != null && row["IsCheck"].ToString() != "")
                {
                    model.IsCheck = int.Parse(row["IsCheck"].ToString());
                }
                if (row["Editor"] != null)
                {
                    model.Editor = row["Editor"].ToString();
                }
                if (row["CreateDate"] != null && row["CreateDate"].ToString() != "")
                {
                    model.CreateDate = DateTime.Parse(row["CreateDate"].ToString());
                }
                if (row["EndDate"] != null && row["EndDate"].ToString() != "")
                {
                    model.EndDate = DateTime.Parse(row["EndDate"].ToString());
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
            strSql.Append("select Id,AdminLogName,AdminLogPass,AdminName,AdminTel,OrgCode,AdminTypeId,JobId,AdminState,AdminLogNum,IsCheck,Editor,CreateDate,EndDate ");
            strSql.Append(" FROM T_AdminUser ");
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
            strSql.Append(" Id,AdminLogName,AdminLogPass,AdminName,AdminTel,OrgCode,AdminTypeId,JobId,AdminState,AdminLogNum,IsCheck,Editor,CreateDate,EndDate ");
            strSql.Append(" FROM T_AdminUser ");
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
            strSql.Append("select count(1) FROM T_AdminUser ");
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
                strSql.Append("order by T.Id desc");
            }
            strSql.Append(")AS Row, T.*  from T_AdminUser T ");
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
			parameters[0].Value = "T_AdminUser";
			parameters[1].Value = "Id";
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
