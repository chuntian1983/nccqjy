/**
* Ver    变更日期            负责人           变更内容
* ───────────────────────────────────
* V0.01  2016-5-3 09:22:54   N/A      wanghao
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
using System.Data;

namespace NCPEP.Dal
{
    public class TOnlineNumberDal : IDisposable
    {

        private dynamic db = null;

        public TOnlineNumberDal()
        {
            db = new MsSqlHelper();
        }
        /// <summary>
        /// 增加一条数据
        /// </summary>
        public bool Update(TOnlineNumber model)
        {
            try
            {
                string strSql = string.Format("update T_OnlineNumber set OnlineNumber={0}", model.OnlineNumber);
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

        public dynamic GetModel()
        {
            try
            {
                string strSql = " select  top 1 OnlineNumber from T_OnlineNumber ";
                DataTable dt = db.ExecuteDataTable(strSql);
                return dt.Rows[0]["OnlineNumber"];
            }
            catch { throw; }
        }

        public void Dispose()
        {
            throw new NotImplementedException();
        }
    }
}
