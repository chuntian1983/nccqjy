/**
* T_TranProcess.cs
*
* 类 名： T_TranProcess
*
* Ver    变更日期            负责人           变更内容
* ───────────────────────────────────
* V0.01  2016-5-3 09:23:09   N/A      wanghao
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
    public class TranProcessDal
    {
        private MsSqlHelper db = null;
        public TranProcessDal()
        {
            db = new MsSqlHelper();
        }
        /// <summary>
        /// 是否存在
        /// </summary>
        public bool Exists(int BidId)
        {
            string strSql = string.Format("select count(1) from T_TranProcess where FK_BidId={0}", BidId);
            if (db.ExecuteScalar(strSql) > 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        //
        public bool Create(string column, string values)
        {
            try
            {
                string strSql = string.Format("insert into T_TranProcess({0}) values ({1})", column, values);
                if (db.ExecuteNonQuery(strSql) > 0)
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

        public bool Update(string column, int BidId)
        {
            try
            {
                string strSql = string.Format("update T_TranProcess set {0} where FK_BidId={1}", column, BidId);
                if (db.ExecuteNonQuery(strSql.ToString()) > 0)
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
        public dynamic GetModel(int id)
        {
            try
            {
                TranProcess model = null;
                string strSql = string.Format(" select Id,FK_BidId,AcceptDate,AcceptName,AcceptSay,AcceptSayDate,AuditDate,AuditName,AuditSay,AuditSayDate,TradingDate,TradingName,TradingSay,TradingSayDate,AttestationDate,AttestationName,AttestationSay,AttestationSayDate,HeadDate,HeadName,HeadSay,HeadSayDate,SuperDate,SuperName,SuperSay,SuperSayDate FROM T_TranProcess  where FK_BidId ={0}", id);
                using (dynamic read = db.ExecuteReader(strSql))
                {
                    model = new TranProcess();
                    if (read.Read())
                    {
                        try { model.Id = int.Parse(read["Id"].ToString()); }
                        catch { }
                        try { model.FK_BidId = int.Parse(read["FK_BidId"].ToString()); }
                        catch { }
                        try { model.AcceptDate = DateTime.Parse(read["AcceptDate"].ToString()); }
                        catch { }
                        model.AcceptName = read["AcceptName"].ToString();
                        model.AcceptSay = read["AcceptSay"].ToString();
                        try { model.AcceptSayDate = DateTime.Parse(read["AcceptSayDate"].ToString()); }
                        catch { }
                        try { model.AuditDate = DateTime.Parse(read["AuditDate"].ToString()); }
                        catch { }
                        model.AuditName = read["AuditName"].ToString();
                        model.AuditSay = read["AuditSay"].ToString();
                        try { model.AuditSayDate = DateTime.Parse(read["AuditSayDate"].ToString()); }
                        catch { }
                        try { model.TradingDate = DateTime.Parse(read["TradingDate"].ToString()); }
                        catch { }
                        model.TradingName = read["TradingName"].ToString();
                        model.TradingSay = read["TradingSay"].ToString();
                        try { model.TradingSayDate = DateTime.Parse(read["TradingSayDate"].ToString()); }
                        catch { }
                        try { model.AttestationDate = DateTime.Parse(read["AttestationDate"].ToString()); }
                        catch { }
                        model.AttestationName = read["AttestationName"].ToString();
                        model.AttestationSay = read["AttestationSay"].ToString();
                        try { model.AttestationSayDate = DateTime.Parse(read["AttestationSayDate"].ToString()); }
                        catch { }
                        try { model.HeadDate = DateTime.Parse(read["HeadDate"].ToString()); }
                        catch { }
                        model.HeadName = read["HeadName"].ToString();
                        model.HeadSay = read["HeadSay"].ToString();
                        try { model.HeadSayDate = DateTime.Parse(read["HeadSayDate"].ToString()); }
                        catch { }
                        try { model.SuperDate = DateTime.Parse(read["SuperDate"].ToString()); }
                        catch { }
                        model.SuperName = read["SuperName"].ToString();
                        model.SuperSay = read["SuperSay"].ToString();
                        try { model.SuperSayDate = DateTime.Parse(read["SuperSayDate"].ToString()); }
                        catch { }
                    }
                    read.Dispose();
                }
                return model;
            }
            catch { throw; }
        }
        //
        public dynamic GetAllList(int BidId)
        {
            try
            {
                string strSql = " select Id,FK_BidId,AcceptDate,AcceptName,AcceptSay,AcceptSayDate,AuditDate,AuditName,AuditSay,AuditSayDate,TradingDate,TradingName,TradingSay,TradingSayDate,AttestationDate,AttestationName,AttestationSay,AttestationSayDate,HeadDate,HeadName,HeadSay,HeadSayDate,SuperDate,SuperName,SuperSay,SuperSayDate  FROM T_TranProcess  ";
                strSql += string.Format(" where a.FK_BidId={0}", BidId);
                strSql += " order by Id desc ";
                return db.ExecuteDataTable(strSql);
            }
            catch { throw; }
        }
    }
}
