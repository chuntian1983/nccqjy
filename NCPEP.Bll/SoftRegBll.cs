using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using NCPEP.Dal;

namespace NCPEP.Bll
{
    public class SoftRegBll
    {
        //
        private SoftRegDal softRegDal = null;
        //
        public SoftRegBll()
        {
            softRegDal = new SoftRegDal();
        }
        //
        public bool Create(string model)
        {
            return softRegDal.Create(model);
        }
        //
        public bool Delete()
        {
            return softRegDal.Delete();
        }
        //
        public string GetSequenceNumber()
        {
            return softRegDal.GetSequenceNumber();
        }
    }
}
