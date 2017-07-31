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
    /// 数据访问类:T_BidPlacard
    /// </summary>
    public partial class T_BidPlacard
    {
        public T_BidPlacard()
        { }
        #region  BasicMethod

        /// <summary>
        /// 增加一条数据
        /// </summary>
        public int Add(NCPEP.Model.T_BidPlacard model)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("insert into T_BidPlacard(");
            strSql.Append("FK_BidId,BidPlacardTitle,BidPlacardContent,Publisher,ReleaseTime,fujian,fujianname)");
            strSql.Append(" values (");
            strSql.Append("@FK_BidId,@BidPlacardTitle,@BidPlacardContent,@Publisher,@ReleaseTime,@fujian,@fujianname)");
            strSql.Append(";select @@IDENTITY");
            SqlParameter[] parameters = {
					new SqlParameter("@FK_BidId", SqlDbType.Int,4),
					new SqlParameter("@BidPlacardTitle", SqlDbType.NVarChar,50),
					new SqlParameter("@BidPlacardContent", SqlDbType.NVarChar,500),
					new SqlParameter("@Publisher", SqlDbType.NVarChar,50),
					new SqlParameter("@ReleaseTime", SqlDbType.DateTime),
					new SqlParameter("@fujian", SqlDbType.VarChar,500),
					new SqlParameter("@fujianname", SqlDbType.VarChar,50)};
            parameters[0].Value = model.FK_BidId;
            parameters[1].Value = model.BidPlacardTitle;
            parameters[2].Value = model.BidPlacardContent;
            parameters[3].Value = model.Publisher;
            parameters[4].Value = model.ReleaseTime;
            parameters[5].Value = model.fujian;
            parameters[6].Value = model.fujianname;

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
        public bool Update(NCPEP.Model.T_BidPlacard model)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("update T_BidPlacard set ");
            strSql.Append("FK_BidId=@FK_BidId,");
            strSql.Append("BidPlacardTitle=@BidPlacardTitle,");
            strSql.Append("BidPlacardContent=@BidPlacardContent,");
            strSql.Append("Publisher=@Publisher,");
            strSql.Append("ReleaseTime=@ReleaseTime,");
            strSql.Append("fujian=@fujian,");
            strSql.Append("fujianname=@fujianname");
            strSql.Append(" where Id=@Id");
            SqlParameter[] parameters = {
					new SqlParameter("@FK_BidId", SqlDbType.Int,4),
					new SqlParameter("@BidPlacardTitle", SqlDbType.NVarChar,50),
					new SqlParameter("@BidPlacardContent", SqlDbType.NVarChar,500),
					new SqlParameter("@Publisher", SqlDbType.NVarChar,50),
					new SqlParameter("@ReleaseTime", SqlDbType.DateTime),
					new SqlParameter("@fujian", SqlDbType.VarChar,500),
					new SqlParameter("@fujianname", SqlDbType.VarChar,50),
					new SqlParameter("@Id", SqlDbType.Int,4)};
            parameters[0].Value = model.FK_BidId;
            parameters[1].Value = model.BidPlacardTitle;
            parameters[2].Value = model.BidPlacardContent;
            parameters[3].Value = model.Publisher;
            parameters[4].Value = model.ReleaseTime;
            parameters[5].Value = model.fujian;
            parameters[6].Value = model.fujianname;
            parameters[7].Value = model.Id;

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
            strSql.Append("delete from T_BidPlacard ");
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
            strSql.Append("delete from T_BidPlacard ");
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
        public NCPEP.Model.T_BidPlacard GetModel(int Id)
        {

            StringBuilder strSql = new StringBuilder();
            strSql.Append("select  top 1 Id,FK_BidId,BidPlacardTitle,BidPlacardContent,Publisher,ReleaseTime,fujian,fujianname from T_BidPlacard ");
            strSql.Append(" where Id=@Id");
            SqlParameter[] parameters = {
					new SqlParameter("@Id", SqlDbType.Int,4)
			};
            parameters[0].Value = Id;

            NCPEP.Model.T_BidPlacard model = new NCPEP.Model.T_BidPlacard();
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
        public NCPEP.Model.T_BidPlacard DataRowToModel(DataRow row)
        {
            NCPEP.Model.T_BidPlacard model = new NCPEP.Model.T_BidPlacard();
            if (row != null)
            {
                if (row["Id"] != null && row["Id"].ToString() != "")
                {
                    model.Id = int.Parse(row["Id"].ToString());
                }
                if (row["FK_BidId"] != null && row["FK_BidId"].ToString() != "")
                {
                    model.FK_BidId = int.Parse(row["FK_BidId"].ToString());
                }
                if (row["BidPlacardTitle"] != null)
                {
                    model.BidPlacardTitle = row["BidPlacardTitle"].ToString();
                }
                if (row["BidPlacardContent"] != null)
                {
                    model.BidPlacardContent = row["BidPlacardContent"].ToString();
                }
                if (row["Publisher"] != null)
                {
                    model.Publisher = row["Publisher"].ToString();
                }
                if (row["ReleaseTime"] != null && row["ReleaseTime"].ToString() != "")
                {
                    model.ReleaseTime = DateTime.Parse(row["ReleaseTime"].ToString());
                }
                if (row["fujian"] != null)
                {
                    model.fujian = row["fujian"].ToString();
                }
                if (row["fujianname"] != null)
                {
                    model.fujianname = row["fujianname"].ToString();
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
            strSql.Append("select Id,FK_BidId,BidPlacardTitle,BidPlacardContent,Publisher,ReleaseTime,fujian,fujianname ");
            strSql.Append(" FROM T_BidPlacard ");
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
            strSql.Append(" Id,FK_BidId,BidPlacardTitle,BidPlacardContent,Publisher,ReleaseTime,fujian,fujianname ");
            strSql.Append(" FROM T_BidPlacard ");
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
            strSql.Append("select count(1) FROM T_BidPlacard ");
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
            strSql.Append(")AS Row, T.*  from T_BidPlacard T ");
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
            parameters[0].Value = "T_BidPlacard";
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
