using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using NCPEP.Dal;
using NCPEP.Model;

namespace NCPEP.Bll
{
    public class TOnlineNumberBll
    {
        private dynamic dal = null;

        //
        public TOnlineNumberBll()
        {
            dal = new TOnlineNumberDal();
        }
        //
        public dynamic GetModel()
        {
            try
            {
                return dal.GetModel();
            }
            catch (Exception ex)
            {
                SystemErrorPlug.ErrorRecord("时间:[" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "]类名:[" + this.GetType().Name + "],行号:[" + Component.GetLineNum().ToString() + "行],错误信息:[" + ex.Message + "]");
                return 0;
            }
        }
        //
        public void Update(int OnlineNumber)
        {
            try
            {
                TOnlineNumber model = new TOnlineNumber();
                model.OnlineNumber = OnlineNumber;
                dal.Update(model);
            }
            catch (Exception ex)
            {
                SystemErrorPlug.ErrorRecord("时间:[" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "]类名:[" + this.GetType().Name + "],行号:[" + Component.GetLineNum().ToString() + "行],错误信息:[" + ex.Message + "]");
            }
        }
    }
}

