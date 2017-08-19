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
    /// 数据访问类:T_JBTWO
    /// </summary>
    public partial class T_JBTWO
    {
        public T_JBTWO()
        { }
        #region  BasicMethod
        /// <summary>
        /// 是否存在该记录
        /// </summary>
        public bool Exists(int sid)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("select count(1) from T_JBTWO");
            strSql.Append(" where sid=@sid");
            SqlParameter[] parameters = {
					new SqlParameter("@sid", SqlDbType.Int,4)
			};
            parameters[0].Value = sid;

            return DbHelperSQL.Exists(strSql.ToString(), parameters);
        }


        /// <summary>
        /// 增加一条数据
        /// </summary>
        public int Add(NCPEP.Model.T_JBTWO model)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("insert into T_JBTWO(");
            strSql.Append("bid,tid,jbyhm,jbjg,jbdj,zbzt,beizhu,jbbs)");
            strSql.Append(" values (");
            strSql.Append("@bid,@tid,@jbyhm,@jbjg,@jbdj,@zbzt,@beizhu,@jbbs)");
            strSql.Append(";select @@IDENTITY");
            SqlParameter[] parameters = {
					new SqlParameter("@bid", SqlDbType.VarChar,50),
					new SqlParameter("@tid", SqlDbType.VarChar,50),
					new SqlParameter("@jbyhm", SqlDbType.NVarChar,50),
					new SqlParameter("@jbjg", SqlDbType.NVarChar,50),
					new SqlParameter("@jbdj", SqlDbType.NVarChar,50),
					new SqlParameter("@zbzt", SqlDbType.NVarChar,50),
					new SqlParameter("@beizhu", SqlDbType.NVarChar,50),
					new SqlParameter("@jbbs", SqlDbType.NVarChar,50)};
            parameters[0].Value = model.bid;
            parameters[1].Value = model.tid;
            parameters[2].Value = model.jbyhm;
            parameters[3].Value = model.jbjg;
            parameters[4].Value = model.jbdj;
            parameters[5].Value = model.zbzt;
            parameters[6].Value = model.beizhu;
            parameters[7].Value = model.jbbs;

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
        public bool Update(NCPEP.Model.T_JBTWO model)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("update T_JBTWO set ");
            strSql.Append("bid=@bid,");
            strSql.Append("tid=@tid,");
            strSql.Append("jbyhm=@jbyhm,");
            strSql.Append("jbjg=@jbjg,");
            strSql.Append("jbdj=@jbdj,");
            strSql.Append("zbzt=@zbzt,");
            strSql.Append("beizhu=@beizhu,");
            strSql.Append("jbbs=@jbbs");
            strSql.Append(" where sid=@sid");
            SqlParameter[] parameters = {
					new SqlParameter("@bid", SqlDbType.VarChar,50),
					new SqlParameter("@tid", SqlDbType.VarChar,50),
					new SqlParameter("@jbyhm", SqlDbType.NVarChar,50),
					new SqlParameter("@jbjg", SqlDbType.NVarChar,50),
					new SqlParameter("@jbdj", SqlDbType.NVarChar,50),
					new SqlParameter("@zbzt", SqlDbType.NVarChar,50),
					new SqlParameter("@beizhu", SqlDbType.NVarChar,50),
					new SqlParameter("@jbbs", SqlDbType.NVarChar,50),
					new SqlParameter("@sid", SqlDbType.Int,4)};
            parameters[0].Value = model.bid;
            parameters[1].Value = model.tid;
            parameters[2].Value = model.jbyhm;
            parameters[3].Value = model.jbjg;
            parameters[4].Value = model.jbdj;
            parameters[5].Value = model.zbzt;
            parameters[6].Value = model.beizhu;
            parameters[7].Value = model.jbbs;
            parameters[8].Value = model.sid;

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
        public bool Delete(int sid)
        {

            StringBuilder strSql = new StringBuilder();
            strSql.Append("delete from T_JBTWO ");
            strSql.Append(" where sid=@sid");
            SqlParameter[] parameters = {
					new SqlParameter("@sid", SqlDbType.Int,4)
			};
            parameters[0].Value = sid;

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
        public bool DeleteList(string sidlist)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("delete from T_JBTWO ");
            strSql.Append(" where sid in (" + sidlist + ")  ");
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
        public NCPEP.Model.T_JBTWO GetModel(int sid)
        {

            StringBuilder strSql = new StringBuilder();
            strSql.Append("select  top 1 sid,bid,tid,jbyhm,jbjg,jbdj,zbzt,beizhu,jbbs from T_JBTWO ");
            strSql.Append(" where sid=@sid");
            SqlParameter[] parameters = {
					new SqlParameter("@sid", SqlDbType.Int,4)
			};
            parameters[0].Value = sid;

            NCPEP.Model.T_JBTWO model = new NCPEP.Model.T_JBTWO();
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
        public NCPEP.Model.T_JBTWO DataRowToModel(DataRow row)
        {
            NCPEP.Model.T_JBTWO model = new NCPEP.Model.T_JBTWO();
            if (row != null)
            {
                if (row["sid"] != null && row["sid"].ToString() != "")
                {
                    model.sid = int.Parse(row["sid"].ToString());
                }
                if (row["bid"] != null)
                {
                    model.bid = row["bid"].ToString();
                }
                if (row["tid"] != null)
                {
                    model.tid = row["tid"].ToString();
                }
                if (row["jbyhm"] != null)
                {
                    model.jbyhm = row["jbyhm"].ToString();
                }
                if (row["jbjg"] != null)
                {
                    model.jbjg = row["jbjg"].ToString();
                }
                if (row["jbdj"] != null)
                {
                    model.jbdj = row["jbdj"].ToString();
                }
                if (row["zbzt"] != null)
                {
                    model.zbzt = row["zbzt"].ToString();
                }
                if (row["beizhu"] != null)
                {
                    model.beizhu = row["beizhu"].ToString();
                }
                if (row["jbbs"] != null)
                {
                    model.jbbs = row["jbbs"].ToString();
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
            strSql.Append("select sid,bid,tid,jbyhm,jbjg,jbdj,zbzt,beizhu,jbbs ");
            strSql.Append(" FROM T_JBTWO ");
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
            strSql.Append(" sid,bid,tid,jbyhm,jbjg,jbdj,zbzt,beizhu,jbbs ");
            strSql.Append(" FROM T_JBTWO ");
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
            strSql.Append("select count(1) FROM T_JBTWO ");
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
                strSql.Append("order by T.sid desc");
            }
            strSql.Append(")AS Row, T.*  from T_JBTWO T ");
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
            parameters[0].Value = "T_JBTWO";
            parameters[1].Value = "sid";
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
