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
	/// 数据访问类:T_XMGG
	/// </summary>
	public partial class T_XMGG
    {
        public T_XMGG()
        { }
        #region  BasicMethod

        /// <summary>
        /// 增加一条数据
        /// </summary>
        public int Add(NCPEP.Model.T_XMGG model)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("insert into T_XMGG(");
            strSql.Append("bid,xmtitle,xmneirong,xmsj,xmbz,xmby)");
            strSql.Append(" values (");
            strSql.Append("@bid,@xmtitle,@xmneirong,@xmsj,@xmbz,@xmby)");
            strSql.Append(";select @@IDENTITY");
            SqlParameter[] parameters = {
                    new SqlParameter("@bid", SqlDbType.Int,4),
                    new SqlParameter("@xmtitle", SqlDbType.VarChar,50),
                    new SqlParameter("@xmneirong", SqlDbType.NVarChar,-1),
                    new SqlParameter("@xmsj", SqlDbType.NVarChar,50),
                    new SqlParameter("@xmbz", SqlDbType.NVarChar,50),
                    new SqlParameter("@xmby", SqlDbType.NVarChar,50)};
            parameters[0].Value = model.bid;
            parameters[1].Value = model.xmtitle;
            parameters[2].Value = model.xmneirong;
            parameters[3].Value = model.xmsj;
            parameters[4].Value = model.xmbz;
            parameters[5].Value = model.xmby;

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
        public bool Update(NCPEP.Model.T_XMGG model)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("update T_XMGG set ");
            strSql.Append("bid=@bid,");
            strSql.Append("xmtitle=@xmtitle,");
            strSql.Append("xmneirong=@xmneirong,");
            strSql.Append("xmsj=@xmsj,");
            strSql.Append("xmbz=@xmbz,");
            strSql.Append("xmby=@xmby");
            strSql.Append(" where id=@id");
            SqlParameter[] parameters = {
                    new SqlParameter("@bid", SqlDbType.Int,4),
                    new SqlParameter("@xmtitle", SqlDbType.VarChar,50),
                    new SqlParameter("@xmneirong", SqlDbType.NVarChar,-1),
                    new SqlParameter("@xmsj", SqlDbType.NVarChar,50),
                    new SqlParameter("@xmbz", SqlDbType.NVarChar,50),
                    new SqlParameter("@xmby", SqlDbType.NVarChar,50),
                    new SqlParameter("@id", SqlDbType.Int,4)};
            parameters[0].Value = model.bid;
            parameters[1].Value = model.xmtitle;
            parameters[2].Value = model.xmneirong;
            parameters[3].Value = model.xmsj;
            parameters[4].Value = model.xmbz;
            parameters[5].Value = model.xmby;
            parameters[6].Value = model.id;

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
        public bool Delete(int id)
        {

            StringBuilder strSql = new StringBuilder();
            strSql.Append("delete from T_XMGG ");
            strSql.Append(" where id=@id");
            SqlParameter[] parameters = {
                    new SqlParameter("@id", SqlDbType.Int,4)
            };
            parameters[0].Value = id;

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
        public bool DeleteList(string idlist)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("delete from T_XMGG ");
            strSql.Append(" where id in (" + idlist + ")  ");
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
        public NCPEP.Model.T_XMGG GetModel(int id)
        {

            StringBuilder strSql = new StringBuilder();
            strSql.Append("select  top 1 id,bid,xmtitle,xmneirong,xmsj,xmbz,xmby from T_XMGG ");
            strSql.Append(" where id=@id");
            SqlParameter[] parameters = {
                    new SqlParameter("@id", SqlDbType.Int,4)
            };
            parameters[0].Value = id;

            NCPEP.Model.T_XMGG model = new NCPEP.Model.T_XMGG();
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
        public NCPEP.Model.T_XMGG DataRowToModel(DataRow row)
        {
            NCPEP.Model.T_XMGG model = new NCPEP.Model.T_XMGG();
            if (row != null)
            {
                if (row["id"] != null && row["id"].ToString() != "")
                {
                    model.id = int.Parse(row["id"].ToString());
                }
                if (row["bid"] != null && row["bid"].ToString() != "")
                {
                    model.bid = int.Parse(row["bid"].ToString());
                }
                if (row["xmtitle"] != null)
                {
                    model.xmtitle = row["xmtitle"].ToString();
                }
                if (row["xmneirong"] != null)
                {
                    model.xmneirong = row["xmneirong"].ToString();
                }
                if (row["xmsj"] != null)
                {
                    model.xmsj = row["xmsj"].ToString();
                }
                if (row["xmbz"] != null)
                {
                    model.xmbz = row["xmbz"].ToString();
                }
                if (row["xmby"] != null)
                {
                    model.xmby = row["xmby"].ToString();
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
            strSql.Append("select id,bid,xmtitle,xmneirong,xmsj,xmbz,xmby ");
            strSql.Append(" FROM T_XMGG ");
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
            strSql.Append(" id,bid,xmtitle,xmneirong,xmsj,xmbz,xmby ");
            strSql.Append(" FROM T_XMGG ");
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
            strSql.Append("select count(1) FROM T_XMGG ");
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
                strSql.Append("order by T.id desc");
            }
            strSql.Append(")AS Row, T.*  from T_XMGG T ");
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
			parameters[0].Value = "T_XMGG";
			parameters[1].Value = "id";
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
