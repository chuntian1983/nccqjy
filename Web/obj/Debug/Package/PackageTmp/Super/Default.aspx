<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Web.Super.Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head id="Head1" runat="server">
    <title>
        <% =Application["OrgShortName"] %><%= Application["AllTitle"]%> </title>
    <link href="Styles/login.css" rel="stylesheet" type="text/css" />
    <link href="Scripts/easyUI/themes/default/easyui.css" rel="stylesheet" type="text/css" />
    <link href="Scripts/easyUI/themes/icon.css" rel="stylesheet" type="text/css" />
    <script src="Scripts/easyUI/jquery.min.js" type="text/javascript" language="javascript"></script>
    <script src="Scripts/easyUI/jquery.easyui.min.js" type="text/javascript" language="javascript"></script>
    <script src="Scripts/easyUI/locale/easyui-lang-zh_CN.js" type="text/javascript" language="javascript"></script>
    <%--<script src="Scripts/Login.js" language="javascript" type="text/javascript"></script>--%>
    <script type="text/javascript"> 
if(navigator.appName == "Microsoft Internet Explorer" && navigator.appVersion .split(";")[1].replace(/[ ]/g,"")=="MSIE6.0") 
{ 
alert("对不起您的浏览器版本比较低，为了达到最佳浏览效果请升级您的浏览器！"); 
} 
else if(navigator.appName == "Microsoft Internet Explorer" && navigator.appVersion .split(";")[1].replace(/[ ]/g,"")=="MSIE7.0") 
{ 
    alert("对不起您的浏览器版本比较低，为了达到最佳浏览效果请升级您的浏览器！");
} 
else if(navigator.appName == "Microsoft Internet Explorer" && navigator.appVersion .split(";")[1].replace(/[ ]/g,"")=="MSIE8.0") 
{ 
    alert("对不起您的浏览器版本比较低，为了达到最佳浏览效果请升级您的浏览器！");
} 
else if(navigator.appName == "Microsoft Internet Explorer" && navigator.appVersion .split(";")[1].replace(/[ ]/g,"")=="MSIE9.0") 
{ 
    alert("对不起您的浏览器版本比较低，为了达到最佳浏览效果请升级您的浏览器！");
} 
</script>
</head>
<body scroll="no" oncontextmenu="return false" onselectstart="return false" >
    <noscript>
        <iframe scr="*.htm"></iframe>
    </noscript>
    <div id="divload" style="display: none; position: absolute; top: 0%; left: 0%; width: 100%;
        height: 100%; background-color: #F6F6F6; z-index: 1001; -moz-opacity: 0.8; opacity: 0.8;
        filter: alpha(opacity=80);">
        <div style="height: 25px; top: 30%; right: 45%; position: absolute; padding: 0px;
            margin: 0px; z-index: 999; border-color: #94BEE7; border-style: solid; border-width: 2px;">
            <img src="../Images/ajax_loading.gif" alt="正在加载" align="middle" height="23" /><span
                style="color: Red; font-size: 16px; font-weight: bold;">正在加载数据中。。。。。。</span>
        </div>
    </div>
    <form runat="server">
        <div class="login">
            <div class="form">
                <p>
                    <% =Application["OrgShortName"] %><%= Application["AllTitle"]%>
                </p>
                <ul>
                    <li>用户名：
                    <input type="text" name="username" runat="server" id="username" maxlength="15" /></li>
                    <li style="padding-left: 15px;">密码：
                    <input type="password" name="password" id="password" runat="server" maxlength="20" /></li>
                    <li>验证码：
                    <input type="text" name="randid" id="randid" class="s1" maxlength="4" runat="server" />&nbsp;&nbsp;&nbsp;&nbsp;<img
                        width="77" height="28" id="imgcheck" src="../Controls/ValidateCode.aspx" title="看不清，请点击！"
                        alt="看不清，请点击！" onclick="this.src = '../Controls/ValidateCode.aspx?flag=' + Math.random();document.getElementById('randid').value='';"
                        border="0" /></li>
                    <li>
                        <asp:Button ID="Button1" runat="server" Text="" CssClass="bu"
                            OnClick="Button1_Click" />
                    </li>
                </ul>
                <div class="botom">
                    <span id="v" runat="server"></span>©
                <%=Application["OrgShortName"] %><%= Application["AllTitle"]%>

                    <br />
                    <br />
                    电话：<%= NCPEP.Bll.Component.ReadXml("GovTel").InnerText%>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
