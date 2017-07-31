using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using NCPEP.Dal;
using NCPEP.Model;


namespace NCPEP.Bll
{
    public class AdminUserLogin
    {
        private AdminUserDal dal = null;
        private dynamic type = null;
        //
        public AdminUserLogin()
        {
            type = new AdminTypeDal();
            dal = new AdminUserDal();
        }
        public string ProcessRequest(HttpContext context)
        {
            string action = context.Request.QueryString["action"].ToString();
            string returnDate = string.Empty;
            switch (action)
            {
                case "login":
                    returnDate = UserLogin(context);
                    break;
                case "out":
                    returnDate = UserOut(context);
                    break;
                case "adminname":
                    returnDate = GetAdminName(context);
                    break;              
                default:
                    returnDate = "请求错误!";
                    break;
            }
            return returnDate;
        }       
        //
        private string GetAdminName(HttpContext context)
        {
            try
            {
                dynamic adminUser = context.Session["SuperAdminUserSession"] as AdminUser;
                string adminName = "(" + type.GetModel(adminUser.AdminTypeId).AdminTypeName + ") " + adminUser.AdminName;
                SysLogBll.Create("系统管理员", "通过session获取登陆用户名信息", adminUser.AdminName);
                return adminName;
            }
            catch (Exception ex)
            {
                SystemErrorPlug.ErrorRecord("时间:[" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "]类名:[" + this.GetType().Name + "],行号:[" + Component.GetLineNum().ToString() + "行],错误信息:[" + ex.Message + "]");
                return "Administrator";
            }
        }
        //
        private string UserOut(HttpContext context)
        {
            try
            {
                dynamic adminUser = context.Session["SuperAdminUserSession"];
                SysLogBll.Create("系统管理员", "用户退出系统操作", adminUser.AdminName);
                context.Session.Remove("SuperAdminUserSession");
                return string.Empty;
            }
            catch (Exception ex)
            {
                SystemErrorPlug.ErrorRecord("时间:[" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "]类名:[" + this.GetType().Name + "],行号:[" + Component.GetLineNum().ToString() + "行],错误信息:[" + ex.Message + "]");
                return string.Empty;
            }
        }
        //
        private string UserLogin(HttpContext context)
        {
            try
            {
                if (dal.ShieldingUsers(Component.GetMac()))
                {
                    return "你的电脑已经被本系统屏蔽，你没有能力登录，怎么样？高兴吧！";
                }
                dynamic adminUser = null;
                string username = context.Request.Form["username"] as string;
                string password = context.Request.Form["password"] as string;
                string randid = context.Request.Form["randid"] as string;
                string CheckCode = context.Session["CheckCode"] as string;
                if (randid.ToUpper().Equals(CheckCode.ToUpper()))
                {
                    if (dal.CheckUserName(username))
                    {
                        adminUser = dal.AdminUserLogin(username, password);
                        if (!string.IsNullOrEmpty(adminUser.AdminLogPass))
                        {
                            if (0 != adminUser.AdminState)
                            {
                                context.Session.Add("SuperAdminUserSession", adminUser);
                                dal.NumberLogin(adminUser.Id);
                                SysLogBll.Create("登陆页面", "登陆成功", adminUser.AdminName);
                                AddCookie(context, adminUser.Id.ToString());
                                return "Y";
                            }
                            else
                            {
                                SysLogBll.Create("登陆页面", "账户禁用", adminUser.AdminName);
                                return "用于登录后台管理的账户已经被禁用！";
                            }
                        }
                        else
                        {
                            SysLogBll.Create("登陆页面", "密码错误", adminUser.AdminName);
                            return "密码不正确请重新输入密码！";
                        }
                    }
                    else
                    {
                        SysLogBll.Create("登陆页面", "用户名错误", adminUser.AdminName);
                        return "用户名不存在请联系上级单位！";
                    }
                }
                else
                {
                    SysLogBll.Create("登陆页面", "验证码错误", adminUser.AdminName);
                    return "验证码错误请重新输入！";
                }
            }
            catch (Exception ex)
            {
                SystemErrorPlug.ErrorRecord("时间:[" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "]类名:[" + this.GetType().Name + "],行号:[" + Component.GetLineNum().ToString() + "行],错误信息:[" + ex.Message + "]");
                return "系统异常错误代码：500 " + ex.Message;
            }
        }
        //
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
