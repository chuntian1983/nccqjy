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
    /// 数据访问类:T_Bid
    /// </summary>
    public partial class T_Bid
    {
        public T_Bid()
        { }
        #region  BasicMethod

        /// <summary>
        /// 增加一条数据
        /// </summary>
        public int Add(NCPEP.Model.T_Bid model)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("insert into T_Bid(");
            strSql.Append("OrgCode,FK_LiceTranId,BidName,ListingPrice,StartDate,EndDate,BidBasic,Ownership,Properties,TurnOut,RightsBodies,FeedingMechanism,WarrantNumber,LowTransaction,Turnover,ContractDate,ContractNo,Admissibility,NoAssurance,TradingCenterName,AreContract,RelatesNum,DepaStatus,ReturnStatus,UpManager,Publicity,Change,Cancel,Lost,StandardMode,StandardType,CreateDate,guimo,danwei,sfzclz,srfjbtj)");
            strSql.Append(" values (");
            strSql.Append("@OrgCode,@FK_LiceTranId,@BidName,@ListingPrice,@StartDate,@EndDate,@BidBasic,@Ownership,@Properties,@TurnOut,@RightsBodies,@FeedingMechanism,@WarrantNumber,@LowTransaction,@Turnover,@ContractDate,@ContractNo,@Admissibility,@NoAssurance,@TradingCenterName,@AreContract,@RelatesNum,@DepaStatus,@ReturnStatus,@UpManager,@Publicity,@Change,@Cancel,@Lost,@StandardMode,@StandardType,@CreateDate,@guimo,@danwei,@sfzclz,@srfjbtj)");
            strSql.Append(";select @@IDENTITY");
            SqlParameter[] parameters = {
					new SqlParameter("@OrgCode", SqlDbType.NVarChar,50),
					new SqlParameter("@FK_LiceTranId", SqlDbType.Int,4),
					new SqlParameter("@BidName", SqlDbType.NVarChar,100),
					new SqlParameter("@ListingPrice", SqlDbType.NVarChar,50),
					new SqlParameter("@StartDate", SqlDbType.DateTime),
					new SqlParameter("@EndDate", SqlDbType.DateTime),
					new SqlParameter("@BidBasic", SqlDbType.NVarChar,500),
					new SqlParameter("@Ownership", SqlDbType.NVarChar,50),
					new SqlParameter("@Properties", SqlDbType.NVarChar,50),
					new SqlParameter("@TurnOut", SqlDbType.Int,4),
					new SqlParameter("@RightsBodies", SqlDbType.NVarChar,50),
					new SqlParameter("@FeedingMechanism", SqlDbType.NVarChar,50),
					new SqlParameter("@WarrantNumber", SqlDbType.NVarChar,50),
					new SqlParameter("@LowTransaction", SqlDbType.NVarChar,50),
					new SqlParameter("@Turnover", SqlDbType.Decimal,9),
					new SqlParameter("@ContractDate", SqlDbType.NVarChar,50),
					new SqlParameter("@ContractNo", SqlDbType.NVarChar,50),
					new SqlParameter("@Admissibility", SqlDbType.NVarChar,50),
					new SqlParameter("@NoAssurance", SqlDbType.NVarChar,50),
					new SqlParameter("@TradingCenterName", SqlDbType.NVarChar,50),
					new SqlParameter("@AreContract", SqlDbType.NVarChar,5),
					new SqlParameter("@RelatesNum", SqlDbType.NVarChar,5),
					new SqlParameter("@DepaStatus", SqlDbType.Int,4),
					new SqlParameter("@ReturnStatus", SqlDbType.Int,4),
					new SqlParameter("@UpManager", SqlDbType.Int,4),
					new SqlParameter("@Publicity", SqlDbType.NVarChar,5),
					new SqlParameter("@Change", SqlDbType.Int,4),
					new SqlParameter("@Cancel", SqlDbType.Int,4),
					new SqlParameter("@Lost", SqlDbType.Int,4),
					new SqlParameter("@StandardMode", SqlDbType.Int,4),
					new SqlParameter("@StandardType", SqlDbType.Int,4),
					new SqlParameter("@CreateDate", SqlDbType.DateTime),
					new SqlParameter("@guimo", SqlDbType.VarChar,50),
					new SqlParameter("@danwei", SqlDbType.NVarChar,50),
					new SqlParameter("@sfzclz", SqlDbType.NVarChar,50),
					new SqlParameter("@srfjbtj", SqlDbType.NVarChar,500)};
            parameters[0].Value = model.OrgCode;
            parameters[1].Value = model.FK_LiceTranId;
            parameters[2].Value = model.BidName;
            parameters[3].Value = model.ListingPrice;
            parameters[4].Value = model.StartDate;
            parameters[5].Value = model.EndDate;
            parameters[6].Value = model.BidBasic;
            parameters[7].Value = model.Ownership;
            parameters[8].Value = model.Properties;
            parameters[9].Value = model.TurnOut;
            parameters[10].Value = model.RightsBodies;
            parameters[11].Value = model.FeedingMechanism;
            parameters[12].Value = model.WarrantNumber;
            parameters[13].Value = model.LowTransaction;
            parameters[14].Value = model.Turnover;
            parameters[15].Value = model.ContractDate;
            parameters[16].Value = model.ContractNo;
            parameters[17].Value = model.Admissibility;
            parameters[18].Value = model.NoAssurance;
            parameters[19].Value = model.TradingCenterName;
            parameters[20].Value = model.AreContract;
            parameters[21].Value = model.RelatesNum;
            parameters[22].Value = model.DepaStatus;
            parameters[23].Value = model.ReturnStatus;
            parameters[24].Value = model.UpManager;
            parameters[25].Value = model.Publicity;
            parameters[26].Value = model.Change;
            parameters[27].Value = model.Cancel;
            parameters[28].Value = model.Lost;
            parameters[29].Value = model.StandardMode;
            parameters[30].Value = model.StandardType;
            parameters[31].Value = model.CreateDate;
            parameters[32].Value = model.guimo;
            parameters[33].Value = model.danwei;
            parameters[34].Value = model.sfzclz;
            parameters[35].Value = model.srfjbtj;

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
        public bool Update(NCPEP.Model.T_Bid model)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("update T_Bid set ");
            strSql.Append("OrgCode=@OrgCode,");
            strSql.Append("FK_LiceTranId=@FK_LiceTranId,");
            strSql.Append("BidName=@BidName,");
            strSql.Append("ListingPrice=@ListingPrice,");
            strSql.Append("StartDate=@StartDate,");
            strSql.Append("EndDate=@EndDate,");
            strSql.Append("BidBasic=@BidBasic,");
            strSql.Append("Ownership=@Ownership,");
            strSql.Append("Properties=@Properties,");
            strSql.Append("TurnOut=@TurnOut,");
            strSql.Append("RightsBodies=@RightsBodies,");
            strSql.Append("FeedingMechanism=@FeedingMechanism,");
            strSql.Append("WarrantNumber=@WarrantNumber,");
            strSql.Append("LowTransaction=@LowTransaction,");
            strSql.Append("Turnover=@Turnover,");
            strSql.Append("ContractDate=@ContractDate,");
            strSql.Append("ContractNo=@ContractNo,");
            strSql.Append("Admissibility=@Admissibility,");
            strSql.Append("NoAssurance=@NoAssurance,");
            strSql.Append("TradingCenterName=@TradingCenterName,");
            strSql.Append("AreContract=@AreContract,");
            strSql.Append("RelatesNum=@RelatesNum,");
            strSql.Append("DepaStatus=@DepaStatus,");
            strSql.Append("ReturnStatus=@ReturnStatus,");
            strSql.Append("UpManager=@UpManager,");
            strSql.Append("Publicity=@Publicity,");
            strSql.Append("Change=@Change,");
            strSql.Append("Cancel=@Cancel,");
            strSql.Append("Lost=@Lost,");
            strSql.Append("StandardMode=@StandardMode,");
            strSql.Append("StandardType=@StandardType,");
            strSql.Append("CreateDate=@CreateDate,");
            strSql.Append("guimo=@guimo,");
            strSql.Append("danwei=@danwei,");
            strSql.Append("sfzclz=@sfzclz,");
            strSql.Append("srfjbtj=@srfjbtj");
            strSql.Append(" where Id=@Id");
            SqlParameter[] parameters = {
					new SqlParameter("@OrgCode", SqlDbType.NVarChar,50),
					new SqlParameter("@FK_LiceTranId", SqlDbType.Int,4),
					new SqlParameter("@BidName", SqlDbType.NVarChar,100),
					new SqlParameter("@ListingPrice", SqlDbType.NVarChar,50),
					new SqlParameter("@StartDate", SqlDbType.DateTime),
					new SqlParameter("@EndDate", SqlDbType.DateTime),
					new SqlParameter("@BidBasic", SqlDbType.NVarChar,500),
					new SqlParameter("@Ownership", SqlDbType.NVarChar,50),
					new SqlParameter("@Properties", SqlDbType.NVarChar,50),
					new SqlParameter("@TurnOut", SqlDbType.Int,4),
					new SqlParameter("@RightsBodies", SqlDbType.NVarChar,50),
					new SqlParameter("@FeedingMechanism", SqlDbType.NVarChar,50),
					new SqlParameter("@WarrantNumber", SqlDbType.NVarChar,50),
					new SqlParameter("@LowTransaction", SqlDbType.NVarChar,50),
					new SqlParameter("@Turnover", SqlDbType.Decimal,9),
					new SqlParameter("@ContractDate", SqlDbType.NVarChar,50),
					new SqlParameter("@ContractNo", SqlDbType.NVarChar,50),
					new SqlParameter("@Admissibility", SqlDbType.NVarChar,50),
					new SqlParameter("@NoAssurance", SqlDbType.NVarChar,50),
					new SqlParameter("@TradingCenterName", SqlDbType.NVarChar,50),
					new SqlParameter("@AreContract", SqlDbType.NVarChar,5),
					new SqlParameter("@RelatesNum", SqlDbType.NVarChar,5),
					new SqlParameter("@DepaStatus", SqlDbType.Int,4),
					new SqlParameter("@ReturnStatus", SqlDbType.Int,4),
					new SqlParameter("@UpManager", SqlDbType.Int,4),
					new SqlParameter("@Publicity", SqlDbType.NVarChar,5),
					new SqlParameter("@Change", SqlDbType.Int,4),
					new SqlParameter("@Cancel", SqlDbType.Int,4),
					new SqlParameter("@Lost", SqlDbType.Int,4),
					new SqlParameter("@StandardMode", SqlDbType.Int,4),
					new SqlParameter("@StandardType", SqlDbType.Int,4),
					new SqlParameter("@CreateDate", SqlDbType.DateTime),
					new SqlParameter("@guimo", SqlDbType.VarChar,50),
					new SqlParameter("@danwei", SqlDbType.NVarChar,50),
					new SqlParameter("@sfzclz", SqlDbType.NVarChar,50),
					new SqlParameter("@srfjbtj", SqlDbType.NVarChar,500),
					new SqlParameter("@Id", SqlDbType.Int,4)};
            parameters[0].Value = model.OrgCode;
            parameters[1].Value = model.FK_LiceTranId;
            parameters[2].Value = model.BidName;
            parameters[3].Value = model.ListingPrice;
            parameters[4].Value = model.StartDate;
            parameters[5].Value = model.EndDate;
            parameters[6].Value = model.BidBasic;
            parameters[7].Value = model.Ownership;
            parameters[8].Value = model.Properties;
            parameters[9].Value = model.TurnOut;
            parameters[10].Value = model.RightsBodies;
            parameters[11].Value = model.FeedingMechanism;
            parameters[12].Value = model.WarrantNumber;
            parameters[13].Value = model.LowTransaction;
            parameters[14].Value = model.Turnover;
            parameters[15].Value = model.ContractDate;
            parameters[16].Value = model.ContractNo;
            parameters[17].Value = model.Admissibility;
            parameters[18].Value = model.NoAssurance;
            parameters[19].Value = model.TradingCenterName;
            parameters[20].Value = model.AreContract;
            parameters[21].Value = model.RelatesNum;
            parameters[22].Value = model.DepaStatus;
            parameters[23].Value = model.ReturnStatus;
            parameters[24].Value = model.UpManager;
            parameters[25].Value = model.Publicity;
            parameters[26].Value = model.Change;
            parameters[27].Value = model.Cancel;
            parameters[28].Value = model.Lost;
            parameters[29].Value = model.StandardMode;
            parameters[30].Value = model.StandardType;
            parameters[31].Value = model.CreateDate;
            parameters[32].Value = model.guimo;
            parameters[33].Value = model.danwei;
            parameters[34].Value = model.sfzclz;
            parameters[35].Value = model.srfjbtj;
            parameters[36].Value = model.Id;

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
            strSql.Append("delete from T_Bid ");
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
            strSql.Append("delete from T_Bid ");
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
        public NCPEP.Model.T_Bid GetModel(int Id)
        {

            StringBuilder strSql = new StringBuilder();
            strSql.Append("select  top 1 Id,OrgCode,FK_LiceTranId,BidName,ListingPrice,StartDate,EndDate,BidBasic,Ownership,Properties,TurnOut,RightsBodies,FeedingMechanism,WarrantNumber,LowTransaction,Turnover,ContractDate,ContractNo,Admissibility,NoAssurance,TradingCenterName,AreContract,RelatesNum,DepaStatus,ReturnStatus,UpManager,Publicity,Change,Cancel,Lost,StandardMode,StandardType,CreateDate,guimo,danwei,sfzclz,srfjbtj from T_Bid ");
            strSql.Append(" where Id=@Id");
            SqlParameter[] parameters = {
					new SqlParameter("@Id", SqlDbType.Int,4)
			};
            parameters[0].Value = Id;

            NCPEP.Model.T_Bid model = new NCPEP.Model.T_Bid();
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
        public NCPEP.Model.T_Bid DataRowToModel(DataRow row)
        {
            NCPEP.Model.T_Bid model = new NCPEP.Model.T_Bid();
            if (row != null)
            {
                if (row["Id"] != null && row["Id"].ToString() != "")
                {
                    model.Id = int.Parse(row["Id"].ToString());
                }
                if (row["OrgCode"] != null)
                {
                    model.OrgCode = row["OrgCode"].ToString();
                }
                if (row["FK_LiceTranId"] != null && row["FK_LiceTranId"].ToString() != "")
                {
                    model.FK_LiceTranId = int.Parse(row["FK_LiceTranId"].ToString());
                }
                if (row["BidName"] != null)
                {
                    model.BidName = row["BidName"].ToString();
                }
                if (row["ListingPrice"] != null)
                {
                    model.ListingPrice = row["ListingPrice"].ToString();
                }
                if (row["StartDate"] != null && row["StartDate"].ToString() != "")
                {
                    model.StartDate = DateTime.Parse(row["StartDate"].ToString());
                }
                if (row["EndDate"] != null && row["EndDate"].ToString() != "")
                {
                    model.EndDate = DateTime.Parse(row["EndDate"].ToString());
                }
                if (row["BidBasic"] != null)
                {
                    model.BidBasic = row["BidBasic"].ToString();
                }
                if (row["Ownership"] != null)
                {
                    model.Ownership = row["Ownership"].ToString();
                }
                if (row["Properties"] != null)
                {
                    model.Properties = row["Properties"].ToString();
                }
                if (row["TurnOut"] != null && row["TurnOut"].ToString() != "")
                {
                    model.TurnOut = int.Parse(row["TurnOut"].ToString());
                }
                if (row["RightsBodies"] != null)
                {
                    model.RightsBodies = row["RightsBodies"].ToString();
                }
                if (row["FeedingMechanism"] != null)
                {
                    model.FeedingMechanism = row["FeedingMechanism"].ToString();
                }
                if (row["WarrantNumber"] != null)
                {
                    model.WarrantNumber = row["WarrantNumber"].ToString();
                }
                if (row["LowTransaction"] != null)
                {
                    model.LowTransaction = row["LowTransaction"].ToString();
                }
                if (row["Turnover"] != null && row["Turnover"].ToString() != "")
                {
                    model.Turnover = decimal.Parse(row["Turnover"].ToString());
                }
                if (row["ContractDate"] != null)
                {
                    model.ContractDate = row["ContractDate"].ToString();
                }
                if (row["ContractNo"] != null)
                {
                    model.ContractNo = row["ContractNo"].ToString();
                }
                if (row["Admissibility"] != null)
                {
                    model.Admissibility = row["Admissibility"].ToString();
                }
                if (row["NoAssurance"] != null)
                {
                    model.NoAssurance = row["NoAssurance"].ToString();
                }
                if (row["TradingCenterName"] != null)
                {
                    model.TradingCenterName = row["TradingCenterName"].ToString();
                }
                if (row["AreContract"] != null)
                {
                    model.AreContract = row["AreContract"].ToString();
                }
                if (row["RelatesNum"] != null)
                {
                    model.RelatesNum = row["RelatesNum"].ToString();
                }
                if (row["DepaStatus"] != null && row["DepaStatus"].ToString() != "")
                {
                    model.DepaStatus = int.Parse(row["DepaStatus"].ToString());
                }
                if (row["ReturnStatus"] != null && row["ReturnStatus"].ToString() != "")
                {
                    model.ReturnStatus = int.Parse(row["ReturnStatus"].ToString());
                }
                if (row["UpManager"] != null && row["UpManager"].ToString() != "")
                {
                    model.UpManager = int.Parse(row["UpManager"].ToString());
                }
                if (row["Publicity"] != null)
                {
                    model.Publicity = row["Publicity"].ToString();
                }
                if (row["Change"] != null && row["Change"].ToString() != "")
                {
                    model.Change = int.Parse(row["Change"].ToString());
                }
                if (row["Cancel"] != null && row["Cancel"].ToString() != "")
                {
                    model.Cancel = int.Parse(row["Cancel"].ToString());
                }
                if (row["Lost"] != null && row["Lost"].ToString() != "")
                {
                    model.Lost = int.Parse(row["Lost"].ToString());
                }
                if (row["StandardMode"] != null && row["StandardMode"].ToString() != "")
                {
                    model.StandardMode = int.Parse(row["StandardMode"].ToString());
                }
                if (row["StandardType"] != null && row["StandardType"].ToString() != "")
                {
                    model.StandardType = int.Parse(row["StandardType"].ToString());
                }
                if (row["CreateDate"] != null && row["CreateDate"].ToString() != "")
                {
                    model.CreateDate = DateTime.Parse(row["CreateDate"].ToString());
                }
                if (row["guimo"] != null)
                {
                    model.guimo = row["guimo"].ToString();
                }
                if (row["danwei"] != null)
                {
                    model.danwei = row["danwei"].ToString();
                }
                if (row["sfzclz"] != null)
                {
                    model.sfzclz = row["sfzclz"].ToString();
                }
                if (row["srfjbtj"] != null)
                {
                    model.srfjbtj = row["srfjbtj"].ToString();
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
            strSql.Append("select Id,OrgCode,FK_LiceTranId,BidName,ListingPrice,StartDate,EndDate,BidBasic,Ownership,Properties,TurnOut,RightsBodies,FeedingMechanism,WarrantNumber,LowTransaction,Turnover,ContractDate,ContractNo,Admissibility,NoAssurance,TradingCenterName,AreContract,RelatesNum,DepaStatus,ReturnStatus,UpManager,Publicity,Change,Cancel,Lost,StandardMode,StandardType,CreateDate,guimo,danwei,sfzclz,srfjbtj ");
            strSql.Append(" FROM T_Bid ");
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
            strSql.Append(" Id,OrgCode,FK_LiceTranId,BidName,ListingPrice,StartDate,EndDate,BidBasic,Ownership,Properties,TurnOut,RightsBodies,FeedingMechanism,WarrantNumber,LowTransaction,Turnover,ContractDate,ContractNo,Admissibility,NoAssurance,TradingCenterName,AreContract,RelatesNum,DepaStatus,ReturnStatus,UpManager,Publicity,Change,Cancel,Lost,StandardMode,StandardType,CreateDate,guimo,danwei,sfzclz,srfjbtj ");
            strSql.Append(" FROM T_Bid ");
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
            strSql.Append("select count(1) FROM T_Bid ");
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
        public int GetRecordCount(string strWhere,string tablename)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("select count(1) FROM "+tablename+" ");
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
            strSql.Append(")AS Row, T.*  from T_Bid T ");
            if (!string.IsNullOrEmpty(strWhere.Trim()))
            {
                strSql.Append(" WHERE " + strWhere);
            }
            strSql.Append(" ) TT");
            strSql.AppendFormat(" WHERE TT.Row between {0} and {1}", startIndex, endIndex);
            return DbHelperSQL.Query(strSql.ToString());
        }
        /// <summary>
        /// 分页获取数据列表
        /// </summary>
        public DataSet GetListByPage(string strWhere, string orderby, int startIndex, int endIndex,string tablename)
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
            strSql.Append(")AS Row, T.*  from "+tablename+" T ");
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
            parameters[0].Value = "T_Bid";
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
        public DataSet GetListByView(string strWhere)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("select * ");
            strSql.Append(" FROM View_Bid ");
            if (strWhere.Trim() != "")
            {
                strSql.Append(" where " + strWhere);
            }
            return DbHelperSQL.Query(strSql.ToString());
        }
        #endregion  ExtensionMethod
    }
}
