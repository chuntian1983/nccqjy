using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using NCPEP.Dal;

namespace NCPEP.Bll
{
    public class CheckUserBll
    {
        private dynamic dal = null;
        public CheckUserBll()
        {
            dal = new CheckUserDal();
        }

        public void CheckUserThere()
        {
            try
            {
                dal.CheckUserThere();
            }
            catch (Exception ex)
            {
                SystemErrorPlug.ErrorRecord("时间:[" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "]类名:[" + this.GetType().Name + "],行号:[" + Component.GetLineNum().ToString() + "行],错误信息:[" + ex.Message + "]");
            }
        }
    }
}
