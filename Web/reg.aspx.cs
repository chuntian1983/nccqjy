using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Maticsoft.DBUtility;
using DBUtility;


namespace Web
{
    public partial class reg : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Label1.Text = Maticsoft.DBUtility.DESEncrypt.Encrypt(System.Net.Dns.GetHostName());
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            DBUtility.ComReg comreg = new ComReg();
            comreg.Delete();
            
            if (comreg.Add(this.TextBox1.Text,"") > 0)
            {
                Response.Redirect("super/default.aspx");
            }
            else {
                this.ClientScript.RegisterStartupScript(this.GetType(), "message", "<script language='javascript' defer>alert('注册码输入错误，请重新输入！注册不成功');</script>");
                 }
        }
    }
}