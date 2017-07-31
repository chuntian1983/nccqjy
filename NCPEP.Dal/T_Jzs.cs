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
    /// 数据访问类:T_Jzs
    /// </summary>
    public partial class T_Jzs
    {
        public T_Jzs()
        { }
        #region  BasicMethod
        /// <summary>
        /// 是否存在该记录
        /// </summary>
        public bool Exists(int id)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("select count(1) from T_Jzs");
            strSql.Append(" where id=@id");
            SqlParameter[] parameters = {
					new SqlParameter("@id", SqlDbType.Int,4)
			};
            parameters[0].Value = id;

            return DbHelperSQL.Exists(strSql.ToString(), parameters);
        }


        /// <summary>
        /// 增加一条数据
        /// </summary>
        public int Add(NCPEP.Model.T_Jzs model)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("insert into T_Jzs(");
            strSql.Append("zcdate,zcdatez,cjje,htbh,binid,beizhu,beiyong,beiyong2)");
            strSql.Append(" values (");
            strSql.Append("@zcdate,@zcdatez,@cjje,@htbh,@binid,@beizhu,@beiyong,@beiyong2)");
            strSql.Append(";select @@IDENTITY");
            SqlParameter[] parameters = {
					new SqlParameter("@zcdate", SqlDbType.VarChar,50),
					new SqlParameter("@zcdatez", SqlDbType.VarChar,50),
					new SqlParameter("@cjje", SqlDbType.VarChar,50),
					new SqlParameter("@htbh", SqlDbType.VarChar,50),
					new SqlParameter("@binid", SqlDbType.VarChar,50),
					new SqlParameter("@beizhu", SqlDbType.VarChar,500),
					new SqlParameter("@beiyong", SqlDbType.VarChar,500),
					new SqlParameter("@beiyong2", SqlDbType.VarChar,500)};
            parameters[0].Value = model.zcdate;
            parameters[1].Value = model.zcdatez;
            parameters[2].Value = model.cjje;
            parameters[3].Value = model.htbh;
            parameters[4].Value = model.binid;
            parameters[5].Value = model.beizhu;
            parameters[6].Value = model.beiyong;
            parameters[7].Value = model.beiyong2;

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
        public bool Update(NCPEP.Model.T_Jzs model)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("update T_Jzs set ");
            strSql.Append("zcdate=@zcdate,");
            strSql.Append("zcdatez=@zcdatez,");
            strSql.Append("cjje=@cjje,");
            strSql.Append("htbh=@htbh,");
            strSql.Append("binid=@binid,");
            strSql.Append("beizhu=@beizhu,");
            strSql.Append("beiyong=@beiyong,");
            strSql.Append("beiyong2=@beiyong2");
            strSql.Append(" where id=@id");
            SqlParameter[] parameters = {
					new SqlParameter("@zcdate", SqlDbType.VarChar,50),
					new SqlParameter("@zcdatez", SqlDbType.VarChar,50),
					new SqlParameter("@cjje", SqlDbType.VarChar,50),
					new SqlParameter("@htbh", SqlDbType.VarChar,50),
					new SqlParameter("@binid", SqlDbType.VarChar,50),
					new SqlParameter("@beizhu", SqlDbType.VarChar,500),
					new SqlParameter("@beiyong", SqlDbType.VarChar,500),
					new SqlParameter("@beiyong2", SqlDbType.VarChar,500),
					new SqlParameter("@id", SqlDbType.Int,4)};
            parameters[0].Value = model.zcdate;
            parameters[1].Value = model.zcdatez;
            parameters[2].Value = model.cjje;
            parameters[3].Value = model.htbh;
            parameters[4].Value = model.binid;
            parameters[5].Value = model.beizhu;
            parameters[6].Value = model.beiyong;
            parameters[7].Value = model.beiyong2;
            parameters[8].Value = model.id;

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
            strSql.Append("delete from T_Jzs ");
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
            strSql.Append("delete from T_Jzs ");
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
        public NCPEP.Model.T_Jzs GetModel(int id)
        {

            StringBuilder strSql = new StringBuilder();
            strSql.Append("select  top 1 id,zcdate,zcdatez,cjje,htbh,binid,beizhu,beiyong,beiyong2 from T_Jzs ");
            strSql.Append(" where id=@id");
            SqlParameter[] parameters = {
					new SqlParameter("@id", SqlDbType.Int,4)
			};
            parameters[0].Value = id;

            NCPEP.Model.T_Jzs model = new NCPEP.Model.T_Jzs();
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
        public NCPEP.Model.T_Jzs DataRowToModel(DataRow row)
        {
            NCPEP.Model.T_Jzs model = new NCPEP.Model.T_Jzs();
            if (row != null)
            {
                if (row["id"] != null && row["id"].ToString() != "")
                {
                    model.id = int.Parse(row["id"].ToString());
                }
                if (row["zcdate"] != null)
                {
                    model.zcdate = row["zcdate"].ToString();
                }
                if (row["zcdatez"] != null)
                {
                    model.zcdatez = row["zcdatez"].ToString();
                }
                if (row["cjje"] != null)
                {
                    model.cjje = row["cjje"].ToString();
                }
                if (row["htbh"] != null)
                {
                    model.htbh = row["htbh"].ToString();
                }
                if (row["binid"] != null)
                {
                    model.binid = row["binid"].ToString();
                }
                if (row["beizhu"] != null)
                {
                    model.beizhu = row["beizhu"].ToString();
                }
                if (row["beiyong"] != null)
                {
                    model.beiyong = row["beiyong"].ToString();
                }
                if (row["beiyong2"] != null)
                {
                    model.beiyong2 = row["beiyong2"].ToString();
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
            strSql.Append("select id,zcdate,zcdatez,cjje,htbh,binid,beizhu,beiyong,beiyong2 ");
            strSql.Append(" FROM T_Jzs ");
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
            strSql.Append(" id,zcdate,zcdatez,cjje,htbh,binid,beizhu,beiyong,beiyong2 ");
            strSql.Append(" FROM T_Jzs ");
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
            strSql.Append("select count(1) FROM T_Jzs ");
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
            strSql.Append(")AS Row, T.*  from T_Jzs T ");
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
            parameters[0].Value = "T_Jzs";
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
