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
    /// 数据访问类:T_XmBeian
    /// </summary>
    public partial class T_XmBeian
    {
        public T_XmBeian()
        { }
        #region  BasicMethod

        /// <summary>
        /// 增加一条数据
        /// </summary>
        public int Add(NCPEP.Model.T_XmBeian model)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("insert into T_XmBeian(");
            strSql.Append("cqname,orgcode,cqleixing,guimo,danwei,cqquanshu,churangfang,churangfangxingzhi,shourangfang,shourangfangxingzhi,jiaoyifangshi,hetongksrq,hetongjsrq,chengjiaodanjia,changjiaozongjia,zhifufangshi,beizhu,beiyong,beiyongb)");
            strSql.Append(" values (");
            strSql.Append("@cqname,@orgcode,@cqleixing,@guimo,@danwei,@cqquanshu,@churangfang,@churangfangxingzhi,@shourangfang,@shourangfangxingzhi,@jiaoyifangshi,@hetongksrq,@hetongjsrq,@chengjiaodanjia,@changjiaozongjia,@zhifufangshi,@beizhu,@beiyong,@beiyongb)");
            strSql.Append(";select @@IDENTITY");
            SqlParameter[] parameters = {
					new SqlParameter("@cqname", SqlDbType.VarChar,150),
					new SqlParameter("@orgcode", SqlDbType.VarChar,50),
					new SqlParameter("@cqleixing", SqlDbType.VarChar,50),
					new SqlParameter("@guimo", SqlDbType.VarChar,50),
					new SqlParameter("@danwei", SqlDbType.VarChar,50),
					new SqlParameter("@cqquanshu", SqlDbType.VarChar,50),
					new SqlParameter("@churangfang", SqlDbType.VarChar,50),
					new SqlParameter("@churangfangxingzhi", SqlDbType.VarChar,50),
					new SqlParameter("@shourangfang", SqlDbType.VarChar,50),
					new SqlParameter("@shourangfangxingzhi", SqlDbType.VarChar,50),
					new SqlParameter("@jiaoyifangshi", SqlDbType.VarChar,50),
					new SqlParameter("@hetongksrq", SqlDbType.DateTime),
					new SqlParameter("@hetongjsrq", SqlDbType.DateTime),
					new SqlParameter("@chengjiaodanjia", SqlDbType.VarChar,50),
					new SqlParameter("@changjiaozongjia", SqlDbType.NVarChar,50),
					new SqlParameter("@zhifufangshi", SqlDbType.VarChar,50),
					new SqlParameter("@beizhu", SqlDbType.VarChar,50),
					new SqlParameter("@beiyong", SqlDbType.VarChar,50),
					new SqlParameter("@beiyongb", SqlDbType.NVarChar,50)};
            parameters[0].Value = model.cqname;
            parameters[1].Value = model.orgcode;
            parameters[2].Value = model.cqleixing;
            parameters[3].Value = model.guimo;
            parameters[4].Value = model.danwei;
            parameters[5].Value = model.cqquanshu;
            parameters[6].Value = model.churangfang;
            parameters[7].Value = model.churangfangxingzhi;
            parameters[8].Value = model.shourangfang;
            parameters[9].Value = model.shourangfangxingzhi;
            parameters[10].Value = model.jiaoyifangshi;
            parameters[11].Value = model.hetongksrq;
            parameters[12].Value = model.hetongjsrq;
            parameters[13].Value = model.chengjiaodanjia;
            parameters[14].Value = model.changjiaozongjia;
            parameters[15].Value = model.zhifufangshi;
            parameters[16].Value = model.beizhu;
            parameters[17].Value = model.beiyong;
            parameters[18].Value = model.beiyongb;

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
        public bool Update(NCPEP.Model.T_XmBeian model)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("update T_XmBeian set ");
            strSql.Append("cqname=@cqname,");
            strSql.Append("orgcode=@orgcode,");
            strSql.Append("cqleixing=@cqleixing,");
            strSql.Append("guimo=@guimo,");
            strSql.Append("danwei=@danwei,");
            strSql.Append("cqquanshu=@cqquanshu,");
            strSql.Append("churangfang=@churangfang,");
            strSql.Append("churangfangxingzhi=@churangfangxingzhi,");
            strSql.Append("shourangfang=@shourangfang,");
            strSql.Append("shourangfangxingzhi=@shourangfangxingzhi,");
            strSql.Append("jiaoyifangshi=@jiaoyifangshi,");
            strSql.Append("hetongksrq=@hetongksrq,");
            strSql.Append("hetongjsrq=@hetongjsrq,");
            strSql.Append("chengjiaodanjia=@chengjiaodanjia,");
            strSql.Append("changjiaozongjia=@changjiaozongjia,");
            strSql.Append("zhifufangshi=@zhifufangshi,");
            strSql.Append("beizhu=@beizhu,");
            strSql.Append("beiyong=@beiyong,");
            strSql.Append("beiyongb=@beiyongb");
            strSql.Append(" where id=@id");
            SqlParameter[] parameters = {
					new SqlParameter("@cqname", SqlDbType.VarChar,150),
					new SqlParameter("@orgcode", SqlDbType.VarChar,50),
					new SqlParameter("@cqleixing", SqlDbType.VarChar,50),
					new SqlParameter("@guimo", SqlDbType.VarChar,50),
					new SqlParameter("@danwei", SqlDbType.VarChar,50),
					new SqlParameter("@cqquanshu", SqlDbType.VarChar,50),
					new SqlParameter("@churangfang", SqlDbType.VarChar,50),
					new SqlParameter("@churangfangxingzhi", SqlDbType.VarChar,50),
					new SqlParameter("@shourangfang", SqlDbType.VarChar,50),
					new SqlParameter("@shourangfangxingzhi", SqlDbType.VarChar,50),
					new SqlParameter("@jiaoyifangshi", SqlDbType.VarChar,50),
					new SqlParameter("@hetongksrq", SqlDbType.DateTime),
					new SqlParameter("@hetongjsrq", SqlDbType.DateTime),
					new SqlParameter("@chengjiaodanjia", SqlDbType.VarChar,50),
					new SqlParameter("@changjiaozongjia", SqlDbType.NVarChar,50),
					new SqlParameter("@zhifufangshi", SqlDbType.VarChar,50),
					new SqlParameter("@beizhu", SqlDbType.VarChar,50),
					new SqlParameter("@beiyong", SqlDbType.VarChar,50),
					new SqlParameter("@beiyongb", SqlDbType.NVarChar,50),
					new SqlParameter("@id", SqlDbType.Int,4)};
            parameters[0].Value = model.cqname;
            parameters[1].Value = model.orgcode;
            parameters[2].Value = model.cqleixing;
            parameters[3].Value = model.guimo;
            parameters[4].Value = model.danwei;
            parameters[5].Value = model.cqquanshu;
            parameters[6].Value = model.churangfang;
            parameters[7].Value = model.churangfangxingzhi;
            parameters[8].Value = model.shourangfang;
            parameters[9].Value = model.shourangfangxingzhi;
            parameters[10].Value = model.jiaoyifangshi;
            parameters[11].Value = model.hetongksrq;
            parameters[12].Value = model.hetongjsrq;
            parameters[13].Value = model.chengjiaodanjia;
            parameters[14].Value = model.changjiaozongjia;
            parameters[15].Value = model.zhifufangshi;
            parameters[16].Value = model.beizhu;
            parameters[17].Value = model.beiyong;
            parameters[18].Value = model.beiyongb;
            parameters[19].Value = model.id;

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
            strSql.Append("delete from T_XmBeian ");
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
            strSql.Append("delete from T_XmBeian ");
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
        public NCPEP.Model.T_XmBeian GetModel(int id)
        {

            StringBuilder strSql = new StringBuilder();
            strSql.Append("select  top 1 id,cqname,orgcode,cqleixing,guimo,danwei,cqquanshu,churangfang,churangfangxingzhi,shourangfang,shourangfangxingzhi,jiaoyifangshi,hetongksrq,hetongjsrq,chengjiaodanjia,changjiaozongjia,zhifufangshi,beizhu,beiyong,beiyongb from T_XmBeian ");
            strSql.Append(" where id=@id");
            SqlParameter[] parameters = {
					new SqlParameter("@id", SqlDbType.Int,4)
			};
            parameters[0].Value = id;

            NCPEP.Model.T_XmBeian model = new NCPEP.Model.T_XmBeian();
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
        public NCPEP.Model.T_XmBeian DataRowToModel(DataRow row)
        {
            NCPEP.Model.T_XmBeian model = new NCPEP.Model.T_XmBeian();
            if (row != null)
            {
                if (row["id"] != null && row["id"].ToString() != "")
                {
                    model.id = int.Parse(row["id"].ToString());
                }
                if (row["cqname"] != null)
                {
                    model.cqname = row["cqname"].ToString();
                }
                if (row["orgcode"] != null)
                {
                    model.orgcode = row["orgcode"].ToString();
                }
                if (row["cqleixing"] != null)
                {
                    model.cqleixing = row["cqleixing"].ToString();
                }
                if (row["guimo"] != null)
                {
                    model.guimo = row["guimo"].ToString();
                }
                if (row["danwei"] != null)
                {
                    model.danwei = row["danwei"].ToString();
                }
                if (row["cqquanshu"] != null)
                {
                    model.cqquanshu = row["cqquanshu"].ToString();
                }
                if (row["churangfang"] != null)
                {
                    model.churangfang = row["churangfang"].ToString();
                }
                if (row["churangfangxingzhi"] != null)
                {
                    model.churangfangxingzhi = row["churangfangxingzhi"].ToString();
                }
                if (row["shourangfang"] != null)
                {
                    model.shourangfang = row["shourangfang"].ToString();
                }
                if (row["shourangfangxingzhi"] != null)
                {
                    model.shourangfangxingzhi = row["shourangfangxingzhi"].ToString();
                }
                if (row["jiaoyifangshi"] != null)
                {
                    model.jiaoyifangshi = row["jiaoyifangshi"].ToString();
                }
                if (row["hetongksrq"] != null && row["hetongksrq"].ToString() != "")
                {
                    model.hetongksrq = DateTime.Parse(row["hetongksrq"].ToString());
                }
                if (row["hetongjsrq"] != null && row["hetongjsrq"].ToString() != "")
                {
                    model.hetongjsrq = DateTime.Parse(row["hetongjsrq"].ToString());
                }
                if (row["chengjiaodanjia"] != null)
                {
                    model.chengjiaodanjia = row["chengjiaodanjia"].ToString();
                }
                if (row["changjiaozongjia"] != null)
                {
                    model.changjiaozongjia = row["changjiaozongjia"].ToString();
                }
                if (row["zhifufangshi"] != null)
                {
                    model.zhifufangshi = row["zhifufangshi"].ToString();
                }
                if (row["beizhu"] != null)
                {
                    model.beizhu = row["beizhu"].ToString();
                }
                if (row["beiyong"] != null)
                {
                    model.beiyong = row["beiyong"].ToString();
                }
                if (row["beiyongb"] != null)
                {
                    model.beiyongb = row["beiyongb"].ToString();
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
            strSql.Append("select id,cqname,orgcode,cqleixing,guimo,danwei,cqquanshu,churangfang,churangfangxingzhi,shourangfang,shourangfangxingzhi,jiaoyifangshi,hetongksrq,hetongjsrq,chengjiaodanjia,changjiaozongjia,zhifufangshi,beizhu,beiyong,beiyongb ");
            strSql.Append(" FROM T_XmBeian ");
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
            strSql.Append(" id,cqname,orgcode,cqleixing,guimo,danwei,cqquanshu,churangfang,churangfangxingzhi,shourangfang,shourangfangxingzhi,jiaoyifangshi,hetongksrq,hetongjsrq,chengjiaodanjia,changjiaozongjia,zhifufangshi,beizhu,beiyong,beiyongb ");
            strSql.Append(" FROM T_XmBeian ");
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
            strSql.Append("select count(1) FROM T_XmBeian ");
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
            strSql.Append(")AS Row, T.*  from T_XmBeian T ");
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
            parameters[0].Value = "T_XmBeian";
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
        public DataSet GetlistBy(string strWhere)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("select a.*,b.PropertyTypeName,c.OrgName from T_XmBeian a left join T_PropertyType b on a.cqleixing=b.Id left join T_Organization c on c.OrgCode=a.orgcode ");

            if (strWhere.Trim() != "")
            {
                strSql.Append(" where " + strWhere);
            }
            return DbHelperSQL.Query(strSql.ToString());
        }
        #endregion  ExtensionMethod
    }
}
