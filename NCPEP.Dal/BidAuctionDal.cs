/**
* T_BidAuction.cs
*
* 类 名： T_BidAuction
*
* Ver    变更日期            负责人           变更内容
* ───────────────────────────────────
* V0.01  2016-5-3 09:22:44   N/A      wanghao
*
* Copyright (c) 2016 wanghao Corporation. All rights reserved.
*┌───────────────────────────────────┐
*│　此代码信息为机密信息             │
*│  未经书面同意禁止向第三方披露     │
*│　设计研发：wanghao　　　　　　　　 │
*└───────────────────────────────────┘
*/
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using NCPEP.Com.Util;
using NCPEP.Model;
using System.Data.SqlClient;
using System.Data;

namespace NCPEP.Dal
{
    public class BidAuctionDal
    {
        private dynamic db = null;
        public BidAuctionDal()
        {
            db = new MsSqlHelper();
        }           
        //
        public int Existence(int FK_BidId, int SeveralBid)
        {
            try
            {
                string strSql = string.Format(" select count(Id) from T_BidAuction where FK_BidId={0} ", FK_BidId);
                if (0 != SeveralBid) { strSql += string.Format("and SeveralBid={0}", SeveralBid); }
                return (int)db.ExecuteScalar(strSql);
            }
            catch
            {
                return 0;
            }
        }
        //
        public bool Create(BidAuction model)
        {
            try
            {
                StringBuilder strSql = new StringBuilder();
                strSql.Append("insert into T_BidAuction(");
                strSql.Append("FK_BidId,LiceTranId,SeveralBid,Price,AuctionDate,Editor,CreateDate)");
                strSql.Append(" values (");
                strSql.Append("@FK_BidId,@LiceTranId,@SeveralBid,@Price,@AuctionDate,@Editor,@CreateDate)");
                if (db.ExecuteNonQuery(strSql.ToString(), GetSqlParameter(model)) > 0)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch { throw; }
        }
        //
        public bool Delete(int Id)
        {
            return false;
        }
        //
        public bool Update(BidAuction model)
        {
            try
            {
                StringBuilder strSql = new StringBuilder();
                strSql.Append("update T_BidAuction set ");
                strSql.Append("FK_BidId=@FK_BidId,");
                strSql.Append("LiceTranId=@LiceTranId,");
                strSql.Append("SeveralBid=@SeveralBid,");
                strSql.Append("Price=@Price,");
                strSql.Append("AuctionDate=@AuctionDate,");
                strSql.Append("Editor=@Editor,");
                strSql.Append("CreateDate=@CreateDate");
                strSql.Append(" where Id=@Id");
                if (db.ExecuteNonQuery(strSql.ToString(), GetSqlParameter(model)) > 0)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch { throw; }
        }
        //
        public dynamic GetAllList(int id)
        {
            try
            {
                string strSql = string.Format(" select  a.Id,b.BidName,c.Name,a.SeveralBid,a.Price,a.AuctionDate,a.Editor,a.CreateDate from T_BidAuction as a left join T_Bid as b on a.FK_BidId  =b.Id left join T_LiceTran as c on a.LiceTranId = c.Id where a.FK_BidId={0} ", id);
                return db.ExecuteDataTable(strSql);
            }
            catch { throw; }
        }
        ///
        public dynamic GetModel(int Id)
        {
            try
            {
                dynamic model = null;
                StringBuilder strSql = new StringBuilder();
                strSql.Append(" select  top 1 Id,FK_BidId,LiceTranId,SeveralBid,Price,AuctionDate,Editor,CreateDate from T_BidAuction  ");
                strSql.Append(" where Id=@Id");
                SqlParameter[] parameters = {
					new SqlParameter("@Id", SqlDbType.Int,4)
			};
                parameters[0].Value = Id;
                using (dynamic read = db.ExecuteReader(strSql.ToString(), parameters))
                {
                    if (read.Read())
                    {
                        model = new AdminType();
                        model.Id = int.Parse(read["Id"].ToString());
                        model.FK_BidId = int.Parse(read["FK_BidId"].ToString());
                        model.LiceTranId = int.Parse(read["LiceTranId"].ToString());
                        model.SeveralBid = int.Parse(read["SeveralBid"].ToString());
                        model.Price = decimal.Parse(read["Price"].ToString());
                        model.AuctionDate = DateTime.Parse(read["AuctionDate"].ToString());
                        model.Editor = read["Editor"].ToString();
                        model.CreateDate = DateTime.Parse(read["CreateDate"].ToString());
                    }
                    read.Dispose();
                }
                return model;
            }
            catch { throw; }
        }
        //
        private SqlParameter[] GetSqlParameter(dynamic model)
        {
            SqlParameter[] parameters = {
						new SqlParameter("@FK_BidId", SqlDbType.Int,4),
					new SqlParameter("@LiceTranId", SqlDbType.Int,4),
					new SqlParameter("@SeveralBid", SqlDbType.Int,4),
					new SqlParameter("@Price", SqlDbType.Decimal,9),
					new SqlParameter("@AuctionDate", SqlDbType.DateTime),
					new SqlParameter("@Editor", SqlDbType.NChar,50),
					new SqlParameter("@CreateDate", SqlDbType.DateTime),
					new SqlParameter("@Id", SqlDbType.Int,4)};
            parameters[0].Value = model.FK_BidId;
            parameters[1].Value = model.LiceTranId;
            parameters[2].Value = model.SeveralBid;
            parameters[3].Value = model.Price;
            parameters[4].Value = model.AuctionDate;
            parameters[5].Value = model.Editor;
            parameters[6].Value = model.CreateDate;
            parameters[7].Value = model.Id;

            return parameters;
        }
    }
}
