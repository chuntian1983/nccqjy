using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using NCPEP.Bll;
using DBUtility;

using System.Data;
using Maticsoft.Common;
using NCPEP.Dal;

namespace Web.Super
{
    public partial class loginuser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            v.InnerHtml = Version.Ver();
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            NCPEP.Bll.T_LiceTran dal = new NCPEP.Bll.T_LiceTran();
            NCPEP.Model.T_LiceTran model=new NCPEP.Model.T_LiceTran();
           
            string username = this.username.Value.Trim();
            string password = this.password.Value.Trim();
            string randid = this.randid.Value;
            string CheckCode = Session["CheckCode"] as string;
            if (randid.ToUpper().Equals(CheckCode.ToUpper()))
            {
                model=dal.GetModeluser(username,password);
                if (model!=null)
                {
                    
                    Session.Add("jbyhm", model);
                           
                    SysLogBll.Create("竞标登陆页面", "竞标用户登陆成功", model.JBYhm);
                    Response.Redirect("mainuser.aspx");
                    //AddCookie(context, adminUser.Id.ToString());

                        
                }
                else
                {
                    MessageBox.Show(this, "竞标用户不存在或者密码错误，请重新登陆！");
                    return;
                        
                }
            }
            else
            {
                //SysLogBll.Create("登陆页面", "验证码错误", adminUser.AdminName);
                MessageBox.Show(this, "验证码错误请重新输入！");
                return;

            }
        }
        
    }
}