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
    /// 数据访问类:T_LiceTran
    /// </summary>
    public partial class T_LiceTran
    {
        public T_LiceTran()
        { }
        #region  BasicMethod

        /// <summary>
        /// 增加一条数据
        /// </summary>
        public int Add(NCPEP.Model.T_LiceTran model)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("insert into T_LiceTran(");
            strSql.Append("FK_WebUserVeriId,LiceTranType,OrgCode,MemberTypeId,Name,Addr,Contact,Corporate,IDCard,OrganizationCode,Tel,Owner,Capital,ApplyDate,AuditType)");
            strSql.Append(" values (");
            strSql.Append("@FK_WebUserVeriId,@LiceTranType,@OrgCode,@MemberTypeId,@Name,@Addr,@Contact,@Corporate,@IDCard,@OrganizationCode,@Tel,@Owner,@Capital,@ApplyDate,@AuditType)");
            strSql.Append(";select @@IDENTITY");
            SqlParameter[] parameters = {
					new SqlParameter("@FK_WebUserVeriId", SqlDbType.Int,4),
					new SqlParameter("@LiceTranType", SqlDbType.Int,4),
					new SqlParameter("@OrgCode", SqlDbType.NVarChar,100),
					new SqlParameter("@MemberTypeId", SqlDbType.Int,4),
					new SqlParameter("@Name", SqlDbType.NVarChar,100),
					new SqlParameter("@Addr", SqlDbType.NVarChar,100),
					new SqlParameter("@Contact", SqlDbType.NVarChar,100),
					new SqlParameter("@Corporate", SqlDbType.NVarChar,100),
					new SqlParameter("@IDCard", SqlDbType.NVarChar,100),
					new SqlParameter("@OrganizationCode", SqlDbType.NVarChar,100),
					new SqlParameter("@Tel", SqlDbType.NVarChar,100),
					new SqlParameter("@Owner", SqlDbType.NVarChar,100),
					new SqlParameter("@Capital", SqlDbType.NVarChar,100),
					new SqlParameter("@ApplyDate", SqlDbType.DateTime),
					new SqlParameter("@AuditType", SqlDbType.Int,4)};
            parameters[0].Value = model.FK_WebUserVeriId;
            parameters[1].Value = model.LiceTranType;
            parameters[2].Value = model.OrgCode;
            parameters[3].Value = model.MemberTypeId;
            parameters[4].Value = model.Name;
            parameters[5].Value = model.Addr;
            parameters[6].Value = model.Contact;
            parameters[7].Value = model.Corporate;
            parameters[8].Value = model.IDCard;
            parameters[9].Value = model.OrganizationCode;
            parameters[10].Value = model.Tel;
            parameters[11].Value = model.Owner;
            parameters[12].Value = model.Capital;
            parameters[13].Value = model.ApplyDate;
            parameters[14].Value = model.AuditType;

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
        public bool Update(NCPEP.Model.T_LiceTran model)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("update T_LiceTran set ");
            strSql.Append("FK_WebUserVeriId=@FK_WebUserVeriId,");
            strSql.Append("LiceTranType=@LiceTranType,");
            strSql.Append("OrgCode=@OrgCode,");
            strSql.Append("MemberTypeId=@MemberTypeId,");
            strSql.Append("Name=@Name,");
            strSql.Append("Addr=@Addr,");
            strSql.Append("Contact=@Contact,");
            strSql.Append("Corporate=@Corporate,");
            strSql.Append("IDCard=@IDCard,");
            strSql.Append("OrganizationCode=@OrganizationCode,");
            strSql.Append("Tel=@Tel,");
            strSql.Append("Owner=@Owner,");
            strSql.Append("Capital=@Capital,");
            strSql.Append("ApplyDate=@ApplyDate,");
            strSql.Append("AuditType=@AuditType");
            strSql.Append(" where Id=@Id");
            SqlParameter[] parameters = {
					new SqlParameter("@FK_WebUserVeriId", SqlDbType.Int,4),
					new SqlParameter("@LiceTranType", SqlDbType.Int,4),
					new SqlParameter("@OrgCode", SqlDbType.NVarChar,100),
					new SqlParameter("@MemberTypeId", SqlDbType.Int,4),
					new SqlParameter("@Name", SqlDbType.NVarChar,100),
					new SqlParameter("@Addr", SqlDbType.NVarChar,100),
					new SqlParameter("@Contact", SqlDbType.NVarChar,100),
					new SqlParameter("@Corporate", SqlDbType.NVarChar,100),
					new SqlParameter("@IDCard", SqlDbType.NVarChar,100),
					new SqlParameter("@OrganizationCode", SqlDbType.NVarChar,100),
					new SqlParameter("@Tel", SqlDbType.NVarChar,100),
					new SqlParameter("@Owner", SqlDbType.NVarChar,100),
					new SqlParameter("@Capital", SqlDbType.NVarChar,100),
					new SqlParameter("@ApplyDate", SqlDbType.DateTime),
					new SqlParameter("@AuditType", SqlDbType.Int,4),
					new SqlParameter("@Id", SqlDbType.Int,4)};
            parameters[0].Value = model.FK_WebUserVeriId;
            parameters[1].Value = model.LiceTranType;
            parameters[2].Value = model.OrgCode;
            parameters[3].Value = model.MemberTypeId;
            parameters[4].Value = model.Name;
            parameters[5].Value = model.Addr;
            parameters[6].Value = model.Contact;
            parameters[7].Value = model.Corporate;
            parameters[8].Value = model.IDCard;
            parameters[9].Value = model.OrganizationCode;
            parameters[10].Value = model.Tel;
            parameters[11].Value = model.Owner;
            parameters[12].Value = model.Capital;
            parameters[13].Value = model.ApplyDate;
            parameters[14].Value = model.AuditType;
            parameters[15].Value = model.Id;

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
            strSql.Append("delete from T_LiceTran ");
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
            strSql.Append("delete from T_LiceTran ");
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
        public NCPEP.Model.T_LiceTran GetModel(int Id)
        {

            StringBuilder strSql = new StringBuilder();
            strSql.Append("select  top 1 Id,FK_WebUserVeriId,LiceTranType,OrgCode,MemberTypeId,Name,Addr,Contact,Corporate,IDCard,OrganizationCode,Tel,Owner,Capital,ApplyDate,AuditType from T_LiceTran ");
            strSql.Append(" where Id=@Id");
            SqlParameter[] parameters = {
					new SqlParameter("@Id", SqlDbType.Int,4)
			};
            parameters[0].Value = Id;

            NCPEP.Model.T_LiceTran model = new NCPEP.Model.T_LiceTran();
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
        public NCPEP.Model.T_LiceTran DataRowToModel(DataRow row)
        {
            NCPEP.Model.T_LiceTran model = new NCPEP.Model.T_LiceTran();
            if (row != null)
            {
                if (row["Id"] != null && row["Id"].ToString() != "")
                {
                    model.Id = int.Parse(row["Id"].ToString());
                }
                if (row["FK_WebUserVeriId"] != null && row["FK_WebUserVeriId"].ToString() != "")
                {
                    model.FK_WebUserVeriId = int.Parse(row["FK_WebUserVeriId"].ToString());
                }
                if (row["LiceTranType"] != null && row["LiceTranType"].ToString() != "")
                {
                    model.LiceTranType = int.Parse(row["LiceTranType"].ToString());
                }
                if (row["OrgCode"] != null)
                {
                    model.OrgCode = row["OrgCode"].ToString();
                }
                if (row["MemberTypeId"] != null && row["MemberTypeId"].ToString() != "")
                {
                    model.MemberTypeId = int.Parse(row["MemberTypeId"].ToString());
                }
                if (row["Name"] != null)
                {
                    model.Name = row["Name"].ToString();
                }
                if (row["Addr"] != null)
                {
                    model.Addr = row["Addr"].ToString();
                }
                if (row["Contact"] != null)
                {
                    model.Contact = row["Contact"].ToString();
                }
                if (row["Corporate"] != null)
                {
                    model.Corporate = row["Corporate"].ToString();
                }
                if (row["IDCard"] != null)
                {
                    model.IDCard = row["IDCard"].ToString();
                }
                if (row["OrganizationCode"] != null)
                {
                    model.OrganizationCode = row["OrganizationCode"].ToString();
                }
                if (row["Tel"] != null)
                {
                    model.Tel = row["Tel"].ToString();
                }
                if (row["Owner"] != null)
                {
                    model.Owner = row["Owner"].ToString();
                }
                if (row["Capital"] != null)
                {
                    model.Capital = row["Capital"].ToString();
                }
                if (row["ApplyDate"] != null && row["ApplyDate"].ToString() != "")
                {
                    model.ApplyDate = DateTime.Parse(row["ApplyDate"].ToString());
                }
                if (row["AuditType"] != null && row["AuditType"].ToString() != "")
                {
                    model.AuditType = int.Parse(row["AuditType"].ToString());
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
            strSql.Append("select Id,FK_WebUserVeriId,LiceTranType,OrgCode,MemberTypeId,Name,Addr,Contact,Corporate,IDCard,OrganizationCode,Tel,Owner,Capital,ApplyDate,AuditType ");
            strSql.Append(" FROM T_LiceTran ");
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
            strSql.Append(" Id,FK_WebUserVeriId,LiceTranType,OrgCode,MemberTypeId,Name,Addr,Contact,Corporate,IDCard,OrganizationCode,Tel,Owner,Capital,ApplyDate,AuditType ");
            strSql.Append(" FROM T_LiceTran ");
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
            strSql.Append("select count(1) FROM T_LiceTran ");
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
            strSql.Append(")AS Row, T.*  from T_LiceTran T ");
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
            parameters[0].Value = "T_LiceTran";
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
