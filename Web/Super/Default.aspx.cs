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
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            v.InnerHtml = Version.Ver();
            DataTable dt = new DataTable();
            DBUtility.ComReg bll = new ComReg();
            dt = bll.Getlist();
            if (dt.Rows.Count > 0)
            {
                try
                {
                    string str = dt.Rows[0]["str"].ToString();
                    str = Maticsoft.DBUtility.DESEncrypt.Decrypt(str);
                    string[] strlist = str.Split('|');
                    if (strlist[0] == DESEncrypt.Encrypt(System.Net.Dns.GetHostName()))
                    {
                        if (DateTime.Parse(strlist[1]) <= System.DateTime.Now && DateTime.Parse(strlist[2]) >= System.DateTime.Now)
                        {
                            //Response.Redirect("admin/login.aspx");
                        }
                        else
                        {
                            MessageBox.ShowAndRedirect(this, "您的软件注册时间已经到期请重新注册谢谢！", "../reg.aspx");
                        }
                    }
                    else
                    {
                        MessageBox.ShowAndRedirect(this, "您的软件还没注册请注册谢谢！", "../reg.aspx");
                    }
                }
                catch
                {
                    MessageBox.ShowAndRedirect(this, "您的软件还没注册或者已经到期请重新注册谢谢！", "../reg.aspx");
                }


            }
            else
            {
                MessageBox.ShowAndRedirect(this, "您的软件还没注册或者已经到期请重新注册谢谢！", "../reg.aspx");
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            NCPEP.Dal.AdminUserDal dal = new AdminUserDal();
            dynamic adminUser = null;
            string username = this.username.Value.Trim();
            string password = this.password.Value.Trim();
            string randid = this.randid.Value;
            string CheckCode = Session["CheckCode"] as string;
            if (randid.ToUpper().Equals(CheckCode.ToUpper()))
            {
                if (dal.CheckUserName(username))
                {
                    adminUser = dal.AdminUserLogin(username, password);
                    if (!string.IsNullOrEmpty(adminUser.AdminLogPass))
                    {
                        if (0 != adminUser.AdminState)
                        {
                            Session.Add("SuperAdminUserSession", adminUser);
                            dal.NumberLogin(adminUser.Id);
                            SysLogBll.Create("登陆页面", "登陆成功", adminUser.AdminName);
                            Response.Redirect("main.aspx");
                            //AddCookie(context, adminUser.Id.ToString());
                            
                        }
                        else
                        {
                            SysLogBll.Create("登陆页面", "账户禁用", adminUser.AdminName);
                            MessageBox.Show(this, "用于登录后台管理的账户已经被禁用");
                            return;
                        }
                    }
                    else
                    {
                        SysLogBll.Create("登陆页面", "密码错误", adminUser.AdminName);
                       
                        MessageBox.Show(this, "密码不正确请重新输入密码！");
                        return;
                    }
                }
                else
                {
                    SysLogBll.Create("登陆页面", "用户名错误", adminUser.AdminName);
                    
                    MessageBox.Show(this, "用户名不存在请联系上级单位！");
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
        private void AddCookie(HttpContext context, dynamic adminUserId)
        {
            try
            {
                HttpCookie cookies = new HttpCookie("AdminCookies");
                cookies.Values.Add("SuperAdminUserCookies", Key.Encryption(Key.Encryption(adminUserId)));
                cookies.Expires = DateTime.Now.AddDays(2);
                context.Response.AppendCookie(cookies);
            }
            catch { throw new Exception("添加Cookies失败,请检查您的浏览器设置是否屏蔽Cookies？<br>打开IE浏览器点击→工具→Interner选项→隐私→高级→勾选替代自动cookie处理→第一方cookie还有第三方cookie点击接受→保存"); }
        }
    }
}