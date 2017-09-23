using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using NCPEP.Model;

namespace NCPEP.Bll
{
    /// <summary>
    /// T_SysFun
    /// </summary>
    public partial class T_SysFun
    {
        private readonly NCPEP.Dal.T_SysFun dal = new NCPEP.Dal.T_SysFun();
        public T_SysFun()
        { }
        #region  BasicMethod
        /// <summary>
        /// 是否存在该记录
        /// </summary>
        public bool Exists(int NodeId)
        {
            return dal.Exists(NodeId);
        }

        /// <summary>
        /// 增加一条数据
        /// </summary>
        public int Add(NCPEP.Model.T_SysFun model)
        {
            return dal.Add(model);
        }

        /// <summary>
        /// 更新一条数据
        /// </summary>
        public bool Update(NCPEP.Model.T_SysFun model)
        {
            return dal.Update(model);
        }

        /// <summary>
        /// 删除一条数据
        /// </summary>
        public bool Delete(int NodeId)
        {

            return dal.Delete(NodeId);
        }
        /// <summary>
        /// 删除一条数据
        /// </summary>
        public bool DeleteList(string NodeIdlist)
        {
            return dal.DeleteList(NodeIdlist);
        }

        /// <summary>
        /// 得到一个对象实体
        /// </summary>
        public NCPEP.Model.T_SysFun GetModel(int NodeId)
        {

            return dal.GetModel(NodeId);
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
        public List<NCPEP.Model.T_SysFun> GetModelList(string strWhere)
        {
            DataSet ds = dal.GetList(strWhere);
            return DataTableToList(ds.Tables[0]);
        }
        /// <summary>
        /// 获得数据列表
        /// </summary>
        public List<NCPEP.Model.T_SysFun> DataTableToList(DataTable dt)
        {
            List<NCPEP.Model.T_SysFun> modelList = new List<NCPEP.Model.T_SysFun>();
            int rowsCount = dt.Rows.Count;
            if (rowsCount > 0)
            {
                NCPEP.Model.T_SysFun model;
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

        #endregion  ExtensionMethod
    }
}
