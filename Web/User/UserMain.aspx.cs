using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using NCPEP.Bll;
using NCPEP.Model;

namespace Web.User
{
    public partial class UserMain : System.Web.UI.Page
    {
        public string Menus = string.Empty;
        public string UserName = string.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {
            WebUserVeri user = null;
            try
            {
                user = Session["UserSession"] as WebUserVeri;
                if (null == user)
                {
                    if (!string.IsNullOrEmpty(Request.Cookies["UserCookies"].Value))
                    {
                        user = new GetUserCookiesPlug().GetVeriUserCookies(Request.Cookies["UserCookies"]["UserSession"]);
                        Session["UserSession"] = user;

                    }
                }
                UserName = !string.IsNullOrEmpty(user.UserName) ? user.UserName : user.VeriName;
                if (user.VeriSex.Equals("男")) { UserName += " 先生"; }
                if (user.VeriSex.Equals("女")) { UserName += " 女士"; }
                if (user.Veri == 1) { UserName += " [高级会员]"; }
                else { UserName += " [普通会员]"; }
            }
            catch
            {
                user = null;
            }
            if (null == user)
            {
                Response.Redirect("~/User/UsLogin.aspx", true);
            }
            int aa = user.Veri;
            if (user.Veri == 0)
            {
                Menus = "<div class=\"userright\"><ul class=\"userbg\"><li class=\"a3\">会员信息</li><li><a id=\"lnkao\">基本信息</a></li><li class=\"bg2\"><a id=\"lnkat\">我要认证</a></li></ul><ul><li class=\"a1\">意向信息发布</li><li class=\"bg8\"><a id=\"lnkdo\">受让/转让/抵押融资</a></li></ul></div>";
            }
            else
            {
                Menus = "<div class=\"userright\"><ul class=\"userbg\"><li class=\"a3\">会员信息</li><li><a id=\"lnkao\">基本信息</a></li><li class=\"bg2\"><a id=\"lnkat\">我要认证</a></li></ul><ul><li class=\"a4\">出让/受让方</li><li class=\"bg3\"><a id=\"lnkbo\">出让方/受让方信息</a></li></ul><ul class=\"userbg\"><li class=\"a2\">招/投标</li><li class=\"bg5\"><a id=\"lnkco\">出让标信息</a></li><li class=\"bg6\"><a id=\"lnkct\">受让标信息</a></li><li class=\"bg7\"><a id=\"lnkcs\">进度查看</a></li></ul><ul><li class=\"a1\">意向信息发布</li><li class=\"bg8\"><a id=\"lnkdo\">受让/转让/抵押融资</a></li></ul></div>";
            }
        }
    }
}