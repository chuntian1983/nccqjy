﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using NCPEP.Dal;
using NCPEP.Model;
using System.Data;

namespace NCPEP.Bll
{
    /// <summary>
    /// T_FujianBiao
    /// </summary>
    public partial class T_FujianBiao
    {
        private readonly NCPEP.Dal.T_FujianBiao dal = new NCPEP.Dal.T_FujianBiao();
        public T_FujianBiao()
        { }
        #region  BasicMethod
        /// <summary>
        /// 增加一条数据
        /// </summary>
        public int Add(NCPEP.Model.T_FujianBiao model)
        {
            return dal.Add(model);
        }

        /// <summary>
        /// 更新一条数据
        /// </summary>
        public bool Update(NCPEP.Model.T_FujianBiao model)
        {
            return dal.Update(model);
        }

        /// <summary>
        /// 删除一条数据
        /// </summary>
        public bool Delete(int id)
        {

            return dal.Delete(id);
        }
        ///// <summary>
        ///// 删除一条数据
        ///// </summary>
        //public bool DeleteList(string idlist)
        //{
        //    return dal.DeleteList(Maticsoft.Common.PageValidate.SafeLongFilter(idlist, 0));
        //}

        /// <summary>
        /// 得到一个对象实体
        /// </summary>
        public NCPEP.Model.T_FujianBiao GetModel(int id)
        {

            return dal.GetModel(id);
        }

        /// <summary>
        /// 获得数据列表
        /// </summary>
        public DataSet GetList(string strWhere)
        {
            return dal.GetList(strWhere);
        }
        /// <summary>
        /// 获得前几行数据
        /// </summary>
        public DataSet GetList(int Top, string strWhere, string filedOrder)
        {
            return dal.GetList(Top, strWhere, filedOrder);
        }
        /// <summary>
        /// 获得数据列表
        /// </summary>
        public List<NCPEP.Model.T_FujianBiao> GetModelList(string strWhere)
        {
            DataSet ds = dal.GetList(strWhere);
            return DataTableToList(ds.Tables[0]);
        }
        /// <summary>
        /// 获得数据列表
        /// </summary>
        public List<NCPEP.Model.T_FujianBiao> DataTableToList(DataTable dt)
        {
            List<NCPEP.Model.T_FujianBiao> modelList = new List<NCPEP.Model.T_FujianBiao>();
            int rowsCount = dt.Rows.Count;
            if (rowsCount > 0)
            {
                NCPEP.Model.T_FujianBiao model;
                for (int n = 0; n < rowsCount; n++)
                {
                    model = dal.DataRowToModel(dt.Rows[n]);
                    if (model != null)
                    {
                        modelList.Add(model);
                    }
                }
            }
            return modelList;
        }

        /// <summary>
        /// 获得数据列表
        /// </summary>
        public DataSet GetAllList()
        {
            return GetList("");
        }

        /// <summary>
        /// 分页获取数据列表
        /// </summary>
        public int GetRecordCount(string strWhere)
        {
            return dal.GetRecordCount(strWhere);
        }
        /// <summary>
        /// 分页获取数据列表
        /// </summary>
        public DataSet GetListByPage(string strWhere, string orderby, int startIndex, int endIndex)
        {
            return dal.GetListByPage(strWhere, orderby, startIndex, endIndex);
        }
        /// <summary>
        /// 分页获取数据列表
        /// </summary>
        //public DataSet GetList(int PageSize,int PageIndex,string strWhere)
        //{
        //return dal.GetList(PageSize,PageIndex,strWhere);
        //}

        #endregion  BasicMethod
        #region  ExtensionMethod
        /// <summary>
        /// 获取附件信息
        /// </summary>
        /// <param name="strwhere"></param>
        /// <returns></returns>
        public DataTable GetListByType(string strwhere)
        {
            return dal.GetListByType(strwhere);
        }
        #endregion  ExtensionMethod
    }
}
