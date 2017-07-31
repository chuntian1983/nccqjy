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
using System.Data.SqlClient;
using NCPEP.Model;
using System.Data;

namespace NCPEP.Dal
{
    public class IndicatorsRelationsDal
    {
        private dynamic db = null;
        public IndicatorsRelationsDal()
        {
            db = new MsSqlHelper();
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public bool Create(IndicatorsRelations model)
        {
            try
            {
                StringBuilder strSql = new StringBuilder();
                strSql.Append("insert into T_IndicatorsRelations(");
                strSql.Append("ApplicationType,FK_MemberTypeCertificationId,FK_TypeIndicatorNameId,Editor,CreateDate)");
                strSql.Append(" values (");
                strSql.Append("@ApplicationType,@FK_MemberTypeCertificationId,@FK_TypeIndicatorNameId,@Editor,@CreateDate)");
                if (db.ExecuteNonQuery(strSql.ToString(), GetParameter(model)) > 0)
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

        /// <summary>
        /// 
        /// </summary>
        /// <param name="ApplicationType"></param>
        /// <param name="FK_MemberTypeCertificationId"></param>
        /// <returns></returns>
        public bool Delete(string ApplicationType, string FK_MemberTypeCertificationId)
        {
            try
            {
                StringBuilder strSql = new StringBuilder();
                strSql.Append("delete from T_IndicatorsRelations ");
                strSql.Append(" where ApplicationType=@ApplicationType");
                strSql.Append(" and FK_MemberTypeCertificationId=@FK_MemberTypeCertificationId");
                SqlParameter[] parameters = {
					new SqlParameter("@ApplicationType", ApplicationType),
                    new SqlParameter("@FK_MemberTypeCertificationId", FK_MemberTypeCertificationId)
			};
                if (db.ExecuteNonQuery(strSql.ToString(), parameters) > 0)
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
        public dynamic GetAllList(string ApplicationType, string FK_MemberTypeCertificationId)
        {
            try
            {
                string strSql = string.Format("SELECT A.Id,A.ApplicationType,B.TypeCertificationName as MemberTypeCertificationName,C.TypeIndicatorName AS TypeIndicatorName,A.Editor,A.CreateDate FROM T_IndicatorsRelations AS A left join T_MemberTypeCertification AS B on A.FK_MemberTypeCertificationId=B.Id LEFT JOIN T_UploadTypeIndicator AS C on A.FK_TypeIndicatorNameId=C.Id WHERE A.ApplicationType={0} AND A.FK_MemberTypeCertificationId={1} ORDER BY A.Id ASC ", ApplicationType, FK_MemberTypeCertificationId);
                return db.ExecuteDataTable(strSql);
            }
            catch { throw; }
        }
        //
        public dynamic GetAllList(int ApplicationType, int FK_MemberTypeCertificationId)
        {
            try
            {
                string strSql = string.Format(" SELECT Id,ApplicationType,FK_MemberTypeCertificationId,FK_TypeIndicatorNameId,Editor,CreateDate FROM T_IndicatorsRelations where  ApplicationType ={0} and FK_MemberTypeCertificationId={1} ", ApplicationType, FK_MemberTypeCertificationId);
                return db.ExecuteDataTable(strSql);
            }
            catch { throw; }
        }
        //
        private SqlParameter[] GetParameter(dynamic model)
        {
            SqlParameter[] parameters = {
					new SqlParameter("@ApplicationType", SqlDbType.Int,4),
					new SqlParameter("@FK_MemberTypeCertificationId", SqlDbType.Int,4),
					new SqlParameter("@FK_TypeIndicatorNameId", SqlDbType.Int,4),
					new SqlParameter("@Editor", SqlDbType.NVarChar,50),
					new SqlParameter("@CreateDate", SqlDbType.DateTime)};
            parameters[0].Value = model.ApplicationType;
            parameters[1].Value = model.FK_MemberTypeCertificationId;
            parameters[2].Value = model.FK_TypeIndicatorNameId;
            parameters[3].Value = model.Editor;
            parameters[4].Value = model.CreateDate;
            return parameters;
        }
    }
}
