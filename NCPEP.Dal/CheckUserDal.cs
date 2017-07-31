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
using NCPEP.Model;
using System.Data;
using NCPEP.Com.Util;

namespace NCPEP.Dal
{
    public class CheckUserDal
    {
        private dynamic db = null;
        private AdminUserDal userDal = null;
        private RolePermissionsDal role = null;
        public CheckUserDal()
        {
            db = new MsSqlHelper();
            userDal = new AdminUserDal();
            role = new RolePermissionsDal();
        }

        public void CheckUserThere()
        {
            try
            {
                if (!userDal.Exists())
                {
                    int id = Convert.ToInt32(userDal.CreateScalar(this.GetModel()));
                    DataTable dt = new SysFunDal().GetAllList(string.Empty);
                    foreach (DataRow dr in dt.Rows)
                    {
                        RolePermissions model = new RolePermissions();
                        model.AdminUserId = id;
                        model.SysFunId = Convert.ToInt32(dr["NodeId"].ToString());
                        model.Editor = "Geek";
                        role.Create(model);
                    }
                }
            }
            catch { throw; }
        }

        private AdminUser GetModel()
        {
            AdminUser model = new AdminUser();
            model.AdminLogName = "admin";
            model.AdminLogNum = 0;
            model.AdminLogPass = "06315626001";
            model.AdminName = "管理员";
            model.AdminState = 1;
            model.AdminTel = "0631-5626001";
            model.JobId = 2005;
            model.AdminTypeId = 1;
            model.CreateDate = DateTime.Now;
            model.Editor = "admin";
            model.EndDate = DateTime.Now;
            model.IsCheck = 1;
            model.OrgCode = new OrganizationDal().GetHighestOrgCode();
            return model;
        }
    }
}

