using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using NCPEP.Dal;
using System.Web.SessionState;

namespace NCPEP.Bll
{
    public class GetUserCookiesPlug
    {
        //
        public dynamic GetUserCookies(string SuperAdminUserCookies)
        {
            try
            {
                string id = Key.Decryption(Key.Decryption(SuperAdminUserCookies));
                int Id = int.Parse(id);
                return new AdminUserBll().GetById(Id);
            }
            catch (Exception ex)
            {
                SystemErrorPlug.ErrorRecord("时间:[" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "]类名:[" + this.GetType().Name + "],行号:[" + Component.GetLineNum().ToString() + "行],错误信息:[" + ex.Message + "]");
                return null;
            }
        }
        //
        public bool ShieldingUsers(string mac)
        {
            return new AdminUserDal().ShieldingUsers(mac);
        }
        //
        public dynamic GetVeriUserCookies(string SuperAdminUserCookies)
        {
            try
            {
                string id = Key.Decryption(Key.Decryption(SuperAdminUserCookies));
                int Id = int.Parse(id);
                return new WebUserVeriDal().GetModel(Id);
            }
            catch (Exception ex)
            {
                SystemErrorPlug.ErrorRecord("时间:[" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "]类名:[" + this.GetType().Name + "],行号:[" + Component.GetLineNum().ToString() + "行],错误信息:[" + ex.Message + "]");
                return null;
            }
        }
    }
}
