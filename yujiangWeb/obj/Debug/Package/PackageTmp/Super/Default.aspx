<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Web.Super.Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head id="Head1" runat="server">
    <title>
        <% =Application["OrgShortName"] %><%= Application["AllTitle"]%> 2025中国制造</title>
    <link href="Styles/login.css" rel="stylesheet" type="text/css" />
    <link href="Scripts/easyUI/themes/default/easyui.css" rel="stylesheet" type="text/css" />
    <link href="Scripts/easyUI/themes/icon.css" rel="stylesheet" type="text/css" />
    <script src="Scripts/easyUI/jquery.min.js" type="text/javascript" language="javascript"></script>
    <script src="Scripts/easyUI/jquery.easyui.min.js" type="text/javascript" language="javascript"></script>
    <script src="Scripts/easyUI/locale/easyui-lang-zh_CN.js" type="text/javascript" language="javascript"></script>
    <script src="Scripts/Login.js" language="javascript" type="text/javascript"></script>
</head>
<body scroll="no" oncontextmenu="return false" onselectstart="return false" onkeydown="keyLogin();">
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
    <div class="login">
        <div class="form">
            <p>
                <% =Application["OrgShortName"] %><%= Application["AllTitle"]%>
            </p>
            <ul>
                <li>用户名：
                    <input type="text" name="username" id="username" maxlength="15" /></li>
                <li>密&nbsp;&nbsp;&nbsp; 码：
                    <input type="password" name="password" id="password" maxlength="20" /></li>
                <li>验证码：
                    <input type="text" name="randid" id="randid" class="s1" maxlength="4" />&nbsp;&nbsp;&nbsp;&nbsp;<img
                        width="77" height="28" id="imgcheck" src="../Controls/ValidateCode.aspx" title="看不清，请点击！"
                        alt="看不清，请点击！" onclick="this.src = '../Controls/ValidateCode.aspx?flag=' + Math.random();document.getElementById('randid').value='';"
                        border="0" /></li>
                <li>
                    <input type="button" class="bu" onclick="onSubmitClick();" /></li>
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
</body>
</html>
