using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web
{
    public partial class sfz : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }
        public string St()
        {
            return "ceshi";
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            this.txtjg.Value ="读取的身份证号码是："+ this.hdsfz.Value;
        }
    }
}