﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using NCPEP.Dal;
using System.Web;
using NCPEP.Model;
using System.Data;

namespace NCPEP.Bll
{
    public class TurnOutTypeBll
    {
        private dynamic dal = null;
        private dynamic adminUser = null;
        public TurnOutTypeBll()
        {
            dal = new TurnOutTypeDal();
        }
        public string ProcessRequest(HttpContext context)
        {
            try
            {
                adminUser = context.Session["SuperAdminUserSession"] as AdminUser;
                if (null == adminUser)
                {
                    if (!string.IsNullOrEmpty(context.Request.Cookies["AdminCookies"].Value))
                    {
                        adminUser = new GetUserCookiesPlug().GetUserCookies(context.Request.Cookies["AdminCookies"]["SuperAdminUserCookies"]);
                        context.Session["SuperAdminUserSession"] = adminUser;
                    }
                }
            }
            catch (Exception ex)
            {
                SystemErrorPlug.ErrorRecord("时间:[" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "]类名:[" + this.GetType().Name + "],行号:[" + Component.GetLineNum().ToString() + "行],错误信息:[" + ex.Message + "]");
                return null;
            }

            string action = context.Request.QueryString["action"].ToString();
            string returnDate = string.Empty;
            switch (action)
            {
                case "paging":
                    returnDate = JsonHelper<TurnOutType>.JsonDataTable(GetAllList(context), "rows");
                    break;
                case "add":
                    returnDate = Create(context);
                    break;
                case "up":
                    returnDate = Update(context);
                    break;
                case "combo":
                    returnDate = GetComboData();
                    break;
                case "by":
                    returnDate = JsonHelper<TurnOutType>.JsonWriter(GetById(context));
                    break;
                default:
                    returnDate = "请求错误!";
                    break;
            }
            return returnDate;
        }
        //
        private dynamic GetById(HttpContext context)
        {
            try
            {
                SysLogBll.Create("转出方式", "返回单个转出方式信息操作", adminUser.AdminName);
                int id = 0;
                try { id = int.Parse(context.Request.QueryString["Id"]); }
                catch { }
                return dal.GetModel(id);
            }
            catch (Exception ex)
            {
                SystemErrorPlug.ErrorRecord("时间:[" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "]类名:[" + this.GetType().Name + "],行号:[" + Component.GetLineNum().ToString() + "行],错误信息:[" + ex.Message + "]");
                return null;
            }
        }
        //
        private string GetComboData()
        {
            try
            {
                SysLogBll.Create("转出方式", "返回转出方式combo数据操作", adminUser.AdminName);
                StringBuilder strb = new StringBuilder();
                strb.Append("[");
                DataTable dataTable = dal.GetAllList();
                for (int i = 0; i < dataTable.Rows.Count; i++)
                {
                    strb.Append("{\"id\":\"" + dataTable.Rows[i]["Id"] + "\", \"text\":\"" + dataTable.Rows[i]["TurnOutTypeName"] + "\"}");
                    if (i < dataTable.Rows.Count - 1)
                    {
                        strb.Append(",");
                    }
                }
                strb.Append("]");
                return strb.ToString();
            }
            catch (Exception ex)
            {
                SystemErrorPlug.ErrorRecord("时间:[" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "]类名:[" + this.GetType().Name + "],行号:[" + Component.GetLineNum().ToString() + "行],错误信息:[" + ex.Message + "]");
                return string.Empty;
            }
        }
        //
        private string Update(HttpContext context)
        {
            try
            {
                SysLogBll.Create("转出方式", "更新转出方式操作", adminUser.AdminName);
                if (dal.Update(GetModels(context)))
                {
                    return "更新成功！";
                }
                else
                {
                    return "更新失败请重新操作! ";
                }
            }
            catch (Exception ex)
            {
                SystemErrorPlug.ErrorRecord("时间:[" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "]类名:[" + this.GetType().Name + "],行号:[" + Component.GetLineNum().ToString() + "行],错误信息:[" + ex.Message + "]");
                return "更新失败请重新操作，错误代码：500 ";
            }
        }
        //
        private string Create(HttpContext context)
        {
            try
            {
                SysLogBll.Create("转出方式", "添加转出方式操作", adminUser.AdminName);
                if (dal.Create(GetModels(context)))
                {
                    return "添加成功！";
                }
                else
                {
                    return "添加失败请重新操作! ";
                }
            }
            catch (Exception ex)
            {
                SystemErrorPlug.ErrorRecord("时间:[" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "]类名:[" + this.GetType().Name + "],行号:[" + Component.GetLineNum().ToString() + "行],错误信息:[" + ex.Message + "]");
                return "添加失败请重新操作，错误代码：500 ";
            }
        }
        private DataTable GetAllList(HttpContext context)
        {
            try
            {

                SysLogBll.Create("转出方式", "获取所有的转出方式操作", adminUser.AdminName);
                string sort = context.Request.Form["sort"];
                string order = context.Request.Form["order"];
                return dal.GetAllList(sort, order);

            }
            catch (Exception ex)
            {
                SystemErrorPlug.ErrorRecord("时间:[" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "]类名:[" + this.GetType().Name + "],行号:[" + Component.GetLineNum().ToString() + "行],错误信息:[" + ex.Message + "]");
                return null;
            }
        }

        private dynamic GetModels(HttpContext context)
        {
            TurnOutType model = new TurnOutType();
            model.TurnOutTypeName = context.Request.Form["TurnOutTypeName"];
            model.Editor = adminUser.AdminName;
            try { model.Id = int.Parse(context.Request.Form["Id"].ToString()); }
            catch { model.Id = 0; }
            return model;
        }
    }
}