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
    /// 数据访问类:T_News
    /// </summary>
    public partial class T_News
    {
        public T_News()
        { }
        #region  BasicMethod

        /// <summary>
        /// 增加一条数据
        /// </summary>
        public int Add(NCPEP.Model.T_News model)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("insert into T_News(");
            strSql.Append("NewsTypeId,Keyword,Content,OrgCode,NewsTitle,NewsSubheading,NewsSource,NewsContent,NewsImg,NewsFile,NumClicks,IsCheck,Editor,CreateDate,ztbz,TZZT)");
            strSql.Append(" values (");
            strSql.Append("@NewsTypeId,@Keyword,@Content,@OrgCode,@NewsTitle,@NewsSubheading,@NewsSource,@NewsContent,@NewsImg,@NewsFile,@NumClicks,@IsCheck,@Editor,@CreateDate,@ztbz,@TZZT)");
            strSql.Append(";select @@IDENTITY");
            SqlParameter[] parameters = {
					new SqlParameter("@NewsTypeId", SqlDbType.Int,4),
					new SqlParameter("@Keyword", SqlDbType.NVarChar,50),
					new SqlParameter("@Content", SqlDbType.NVarChar,50),
					new SqlParameter("@OrgCode", SqlDbType.VarChar,150),
					new SqlParameter("@NewsTitle", SqlDbType.NVarChar,100),
					new SqlParameter("@NewsSubheading", SqlDbType.NVarChar,50),
					new SqlParameter("@NewsSource", SqlDbType.NVarChar,50),
					new SqlParameter("@NewsContent", SqlDbType.Text),
					new SqlParameter("@NewsImg", SqlDbType.VarChar,50),
					new SqlParameter("@NewsFile", SqlDbType.VarChar,50),
					new SqlParameter("@NumClicks", SqlDbType.Int,4),
					new SqlParameter("@IsCheck", SqlDbType.Int,4),
					new SqlParameter("@Editor", SqlDbType.NVarChar,50),
					new SqlParameter("@CreateDate", SqlDbType.DateTime),
					new SqlParameter("@ztbz", SqlDbType.VarChar,50),
					new SqlParameter("@TZZT", SqlDbType.NVarChar,50)};
            parameters[0].Value = model.NewsTypeId;
            parameters[1].Value = model.Keyword;
            parameters[2].Value = model.Content;
            parameters[3].Value = model.OrgCode;
            parameters[4].Value = model.NewsTitle;
            parameters[5].Value = model.NewsSubheading;
            parameters[6].Value = model.NewsSource;
            parameters[7].Value = model.NewsContent;
            parameters[8].Value = model.NewsImg;
            parameters[9].Value = model.NewsFile;
            parameters[10].Value = model.NumClicks;
            parameters[11].Value = model.IsCheck;
            parameters[12].Value = model.Editor;
            parameters[13].Value = model.CreateDate;
            parameters[14].Value = model.ztbz;
            parameters[15].Value = model.TZZT;

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
        public bool Update(NCPEP.Model.T_News model)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("update T_News set ");
            strSql.Append("NewsTypeId=@NewsTypeId,");
            strSql.Append("Keyword=@Keyword,");
            strSql.Append("Content=@Content,");
            strSql.Append("OrgCode=@OrgCode,");
            strSql.Append("NewsTitle=@NewsTitle,");
            strSql.Append("NewsSubheading=@NewsSubheading,");
            strSql.Append("NewsSource=@NewsSource,");
            strSql.Append("NewsContent=@NewsContent,");
            strSql.Append("NewsImg=@NewsImg,");
            strSql.Append("NewsFile=@NewsFile,");
            strSql.Append("NumClicks=@NumClicks,");
            strSql.Append("IsCheck=@IsCheck,");
            strSql.Append("Editor=@Editor,");
            strSql.Append("CreateDate=@CreateDate,");
            strSql.Append("ztbz=@ztbz,");
            strSql.Append("TZZT=@TZZT");
            strSql.Append(" where Id=@Id");
            SqlParameter[] parameters = {
					new SqlParameter("@NewsTypeId", SqlDbType.Int,4),
					new SqlParameter("@Keyword", SqlDbType.NVarChar,50),
					new SqlParameter("@Content", SqlDbType.NVarChar,50),
					new SqlParameter("@OrgCode", SqlDbType.VarChar,150),
					new SqlParameter("@NewsTitle", SqlDbType.NVarChar,100),
					new SqlParameter("@NewsSubheading", SqlDbType.NVarChar,50),
					new SqlParameter("@NewsSource", SqlDbType.NVarChar,50),
					new SqlParameter("@NewsContent", SqlDbType.Text),
					new SqlParameter("@NewsImg", SqlDbType.VarChar,50),
					new SqlParameter("@NewsFile", SqlDbType.VarChar,50),
					new SqlParameter("@NumClicks", SqlDbType.Int,4),
					new SqlParameter("@IsCheck", SqlDbType.Int,4),
					new SqlParameter("@Editor", SqlDbType.NVarChar,50),
					new SqlParameter("@CreateDate", SqlDbType.DateTime),
					new SqlParameter("@ztbz", SqlDbType.VarChar,50),
					new SqlParameter("@TZZT", SqlDbType.NVarChar,50),
					new SqlParameter("@Id", SqlDbType.Int,4)};
            parameters[0].Value = model.NewsTypeId;
            parameters[1].Value = model.Keyword;
            parameters[2].Value = model.Content;
            parameters[3].Value = model.OrgCode;
            parameters[4].Value = model.NewsTitle;
            parameters[5].Value = model.NewsSubheading;
            parameters[6].Value = model.NewsSource;
            parameters[7].Value = model.NewsContent;
            parameters[8].Value = model.NewsImg;
            parameters[9].Value = model.NewsFile;
            parameters[10].Value = model.NumClicks;
            parameters[11].Value = model.IsCheck;
            parameters[12].Value = model.Editor;
            parameters[13].Value = model.CreateDate;
            parameters[14].Value = model.ztbz;
            parameters[15].Value = model.TZZT;
            parameters[16].Value = model.Id;

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
            strSql.Append("delete from T_News ");
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
            strSql.Append("delete from T_News ");
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
        public NCPEP.Model.T_News GetModel(int Id)
        {

            StringBuilder strSql = new StringBuilder();
            strSql.Append("select  top 1 Id,NewsTypeId,Keyword,Content,OrgCode,NewsTitle,NewsSubheading,NewsSource,NewsContent,NewsImg,NewsFile,NumClicks,IsCheck,Editor,CreateDate,ztbz,TZZT from T_News ");
            strSql.Append(" where Id=@Id");
            SqlParameter[] parameters = {
					new SqlParameter("@Id", SqlDbType.Int,4)
			};
            parameters[0].Value = Id;

            NCPEP.Model.T_News model = new NCPEP.Model.T_News();
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
        public NCPEP.Model.T_News DataRowToModel(DataRow row)
        {
            NCPEP.Model.T_News model = new NCPEP.Model.T_News();
            if (row != null)
            {
                if (row["Id"] != null && row["Id"].ToString() != "")
                {
                    model.Id = int.Parse(row["Id"].ToString());
                }
                if (row["NewsTypeId"] != null && row["NewsTypeId"].ToString() != "")
                {
                    model.NewsTypeId = int.Parse(row["NewsTypeId"].ToString());
                }
                if (row["Keyword"] != null)
                {
                    model.Keyword = row["Keyword"].ToString();
                }
                if (row["Content"] != null)
                {
                    model.Content = row["Content"].ToString();
                }
                if (row["OrgCode"] != null)
                {
                    model.OrgCode = row["OrgCode"].ToString();
                }
                if (row["NewsTitle"] != null)
                {
                    model.NewsTitle = row["NewsTitle"].ToString();
                }
                if (row["NewsSubheading"] != null)
                {
                    model.NewsSubheading = row["NewsSubheading"].ToString();
                }
                if (row["NewsSource"] != null)
                {
                    model.NewsSource = row["NewsSource"].ToString();
                }
                if (row["NewsContent"] != null)
                {
                    model.NewsContent = row["NewsContent"].ToString();
                }
                if (row["NewsImg"] != null)
                {
                    model.NewsImg = row["NewsImg"].ToString();
                }
                if (row["NewsFile"] != null)
                {
                    model.NewsFile = row["NewsFile"].ToString();
                }
                if (row["NumClicks"] != null && row["NumClicks"].ToString() != "")
                {
                    model.NumClicks = int.Parse(row["NumClicks"].ToString());
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
                if (row["ztbz"] != null)
                {
                    model.ztbz = row["ztbz"].ToString();
                }
                if (row["TZZT"] != null)
                {
                    model.TZZT = row["TZZT"].ToString();
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
            strSql.Append("select Id,NewsTypeId,Keyword,Content,OrgCode,NewsTitle,NewsSubheading,NewsSource,NewsContent,NewsImg,NewsFile,NumClicks,IsCheck,Editor,CreateDate,ztbz,TZZT ");
            strSql.Append(" FROM T_News ");
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
            strSql.Append(" Id,NewsTypeId,Keyword,Content,OrgCode,NewsTitle,NewsSubheading,NewsSource,NewsContent,NewsImg,NewsFile,NumClicks,IsCheck,Editor,CreateDate,ztbz,TZZT ");
            strSql.Append(" FROM T_News ");
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
            strSql.Append("select count(1) FROM T_News ");
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
            strSql.Append(")AS Row, T.*  from T_News T ");
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
            parameters[0].Value = "T_News";
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
        /// <summary>
        /// 获得通知公告前几行数据
        /// </summary>
        public DataSet GetListNotice(int Top, string strWhere, string filedOrder)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("select ");
            if (Top > 0)
            {
                strSql.Append(" top " + Top.ToString());
            }
            strSql.Append(" * ");
            strSql.Append(" FROM View_notice ");
            if (strWhere.Trim() != "")
            {
                strSql.Append(" where " + strWhere);
            }
            strSql.Append(" order by " + filedOrder);
            return DbHelperSQL.Query(strSql.ToString());
        }
        #endregion  ExtensionMethod
    }
}
