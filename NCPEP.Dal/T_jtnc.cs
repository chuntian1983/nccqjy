using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Maticsoft.DBUtility;
using System.Data;
using System.Data.SqlClient;

namespace NCPEP.Dal
{
    /// <summary>
    /// 数据访问类:T_jtnc
    /// </summary>
    public partial class T_jtnc
    {
        public T_jtnc()
        { }
        #region  BasicMethod
        /// <summary>
        /// 是否存在该记录
        /// </summary>
        public bool Exists(int id)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("select count(1) from T_jtnc");
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
        public int Add(NCPEP.Model.T_jtnc model)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("insert into T_jtnc(");
            strSql.Append("xh,quyu,mingcheng,dizhi,zhuceshijian,jingyingfanwei,chengyuanshu,nianshouru,lishizhang,lianxidianhua,pinpaiqingkuang,niandujibie,zuzhicode,zuobiaox,zuobiaoy)");
            strSql.Append(" values (");
            strSql.Append("@xh,@quyu,@mingcheng,@dizhi,@zhuceshijian,@jingyingfanwei,@chengyuanshu,@nianshouru,@lishizhang,@lianxidianhua,@pinpaiqingkuang,@niandujibie,@zuzhicode,@zuobiaox,@zuobiaoy)");
            strSql.Append(";select @@IDENTITY");
            SqlParameter[] parameters = {
					new SqlParameter("@xh", SqlDbType.Int,4),
					new SqlParameter("@quyu", SqlDbType.VarChar,50),
					new SqlParameter("@mingcheng", SqlDbType.NVarChar,200),
					new SqlParameter("@dizhi", SqlDbType.NVarChar,500),
					new SqlParameter("@zhuceshijian", SqlDbType.NVarChar,50),
					new SqlParameter("@jingyingfanwei", SqlDbType.NVarChar,500),
					new SqlParameter("@chengyuanshu", SqlDbType.NVarChar,50),
					new SqlParameter("@nianshouru", SqlDbType.NVarChar,50),
					new SqlParameter("@lishizhang", SqlDbType.NVarChar,50),
					new SqlParameter("@lianxidianhua", SqlDbType.NVarChar,50),
					new SqlParameter("@pinpaiqingkuang", SqlDbType.NVarChar,50),
					new SqlParameter("@niandujibie", SqlDbType.NVarChar,500),
					new SqlParameter("@zuzhicode", SqlDbType.NVarChar,50),
					new SqlParameter("@zuobiaox", SqlDbType.NVarChar,50),
					new SqlParameter("@zuobiaoy", SqlDbType.NVarChar,50)};
            parameters[0].Value = model.xh;
            parameters[1].Value = model.quyu;
            parameters[2].Value = model.mingcheng;
            parameters[3].Value = model.dizhi;
            parameters[4].Value = model.zhuceshijian;
            parameters[5].Value = model.jingyingfanwei;
            parameters[6].Value = model.chengyuanshu;
            parameters[7].Value = model.nianshouru;
            parameters[8].Value = model.lishizhang;
            parameters[9].Value = model.lianxidianhua;
            parameters[10].Value = model.pinpaiqingkuang;
            parameters[11].Value = model.niandujibie;
            parameters[12].Value = model.zuzhicode;
            parameters[13].Value = model.zuobiaox;
            parameters[14].Value = model.zuobiaoy;

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
        public bool Update(NCPEP.Model.T_jtnc model)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("update T_jtnc set ");
            strSql.Append("xh=@xh,");
            strSql.Append("quyu=@quyu,");
            strSql.Append("mingcheng=@mingcheng,");
            strSql.Append("dizhi=@dizhi,");
            strSql.Append("zhuceshijian=@zhuceshijian,");
            strSql.Append("jingyingfanwei=@jingyingfanwei,");
            strSql.Append("chengyuanshu=@chengyuanshu,");
            strSql.Append("nianshouru=@nianshouru,");
            strSql.Append("lishizhang=@lishizhang,");
            strSql.Append("lianxidianhua=@lianxidianhua,");
            strSql.Append("pinpaiqingkuang=@pinpaiqingkuang,");
            strSql.Append("niandujibie=@niandujibie,");
            strSql.Append("zuzhicode=@zuzhicode,");
            strSql.Append("zuobiaox=@zuobiaox,");
            strSql.Append("zuobiaoy=@zuobiaoy");
            strSql.Append(" where id=@id");
            SqlParameter[] parameters = {
					new SqlParameter("@xh", SqlDbType.Int,4),
					new SqlParameter("@quyu", SqlDbType.VarChar,50),
					new SqlParameter("@mingcheng", SqlDbType.NVarChar,200),
					new SqlParameter("@dizhi", SqlDbType.NVarChar,500),
					new SqlParameter("@zhuceshijian", SqlDbType.NVarChar,50),
					new SqlParameter("@jingyingfanwei", SqlDbType.NVarChar,500),
					new SqlParameter("@chengyuanshu", SqlDbType.NVarChar,50),
					new SqlParameter("@nianshouru", SqlDbType.NVarChar,50),
					new SqlParameter("@lishizhang", SqlDbType.NVarChar,50),
					new SqlParameter("@lianxidianhua", SqlDbType.NVarChar,50),
					new SqlParameter("@pinpaiqingkuang", SqlDbType.NVarChar,50),
					new SqlParameter("@niandujibie", SqlDbType.NVarChar,500),
					new SqlParameter("@zuzhicode", SqlDbType.NVarChar,50),
					new SqlParameter("@zuobiaox", SqlDbType.NVarChar,50),
					new SqlParameter("@zuobiaoy", SqlDbType.NVarChar,50),
					new SqlParameter("@id", SqlDbType.Int,4)};
            parameters[0].Value = model.xh;
            parameters[1].Value = model.quyu;
            parameters[2].Value = model.mingcheng;
            parameters[3].Value = model.dizhi;
            parameters[4].Value = model.zhuceshijian;
            parameters[5].Value = model.jingyingfanwei;
            parameters[6].Value = model.chengyuanshu;
            parameters[7].Value = model.nianshouru;
            parameters[8].Value = model.lishizhang;
            parameters[9].Value = model.lianxidianhua;
            parameters[10].Value = model.pinpaiqingkuang;
            parameters[11].Value = model.niandujibie;
            parameters[12].Value = model.zuzhicode;
            parameters[13].Value = model.zuobiaox;
            parameters[14].Value = model.zuobiaoy;
            parameters[15].Value = model.id;

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
            strSql.Append("delete from T_jtnc ");
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
            strSql.Append("delete from T_jtnc ");
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
        public NCPEP.Model.T_jtnc GetModel(int id)
        {

            StringBuilder strSql = new StringBuilder();
            strSql.Append("select  top 1 id,xh,quyu,mingcheng,dizhi,zhuceshijian,jingyingfanwei,chengyuanshu,nianshouru,lishizhang,lianxidianhua,pinpaiqingkuang,niandujibie,zuzhicode,zuobiaox,zuobiaoy from T_jtnc ");
            strSql.Append(" where id=@id");
            SqlParameter[] parameters = {
					new SqlParameter("@id", SqlDbType.Int,4)
			};
            parameters[0].Value = id;

            NCPEP.Model.T_jtnc model = new NCPEP.Model.T_jtnc();
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
        public NCPEP.Model.T_jtnc DataRowToModel(DataRow row)
        {
            NCPEP.Model.T_jtnc model = new NCPEP.Model.T_jtnc();
            if (row != null)
            {
                if (row["id"] != null && row["id"].ToString() != "")
                {
                    model.id = int.Parse(row["id"].ToString());
                }
                if (row["xh"] != null && row["xh"].ToString() != "")
                {
                    model.xh = int.Parse(row["xh"].ToString());
                }
                if (row["quyu"] != null)
                {
                    model.quyu = row["quyu"].ToString();
                }
                if (row["mingcheng"] != null)
                {
                    model.mingcheng = row["mingcheng"].ToString();
                }
                if (row["dizhi"] != null)
                {
                    model.dizhi = row["dizhi"].ToString();
                }
                if (row["zhuceshijian"] != null)
                {
                    model.zhuceshijian = row["zhuceshijian"].ToString();
                }
                if (row["jingyingfanwei"] != null)
                {
                    model.jingyingfanwei = row["jingyingfanwei"].ToString();
                }
                if (row["chengyuanshu"] != null)
                {
                    model.chengyuanshu = row["chengyuanshu"].ToString();
                }
                if (row["nianshouru"] != null)
                {
                    model.nianshouru = row["nianshouru"].ToString();
                }
                if (row["lishizhang"] != null)
                {
                    model.lishizhang = row["lishizhang"].ToString();
                }
                if (row["lianxidianhua"] != null)
                {
                    model.lianxidianhua = row["lianxidianhua"].ToString();
                }
                if (row["pinpaiqingkuang"] != null)
                {
                    model.pinpaiqingkuang = row["pinpaiqingkuang"].ToString();
                }
                if (row["niandujibie"] != null)
                {
                    model.niandujibie = row["niandujibie"].ToString();
                }
                if (row["zuzhicode"] != null)
                {
                    model.zuzhicode = row["zuzhicode"].ToString();
                }
                if (row["zuobiaox"] != null)
                {
                    model.zuobiaox = row["zuobiaox"].ToString();
                }
                if (row["zuobiaoy"] != null)
                {
                    model.zuobiaoy = row["zuobiaoy"].ToString();
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
            strSql.Append("select id,xh,quyu,mingcheng,dizhi,zhuceshijian,jingyingfanwei,chengyuanshu,nianshouru,lishizhang,lianxidianhua,pinpaiqingkuang,niandujibie,zuzhicode,zuobiaox,zuobiaoy ");
            strSql.Append(" FROM T_jtnc ");
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
            strSql.Append(" id,xh,quyu,mingcheng,dizhi,zhuceshijian,jingyingfanwei,chengyuanshu,nianshouru,lishizhang,lianxidianhua,pinpaiqingkuang,niandujibie,zuzhicode,zuobiaox,zuobiaoy ");
            strSql.Append(" FROM T_jtnc ");
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
            strSql.Append("select count(1) FROM T_jtnc ");
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
            strSql.Append(")AS Row, T.*  from T_jtnc T ");
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
            parameters[0].Value = "T_jtnc";
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
