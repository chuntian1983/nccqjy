<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Main.aspx.cs" Inherits="Web.Super.Main" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>
        <% =Application["OrgShortName"] %><%= Application["AllTitle"]%></title>
    <meta name="description" content="<% =Application["OrgShortName"] %><%= Application["AllTitle"]%> N=ZW²" />
    <meta name="keywords" content="<% =Application["OrgShortName"] %><%= Application["AllTitle"]%> N=ZW²" />
    <link href="Scripts/easyUI/themes/default/easyui.css" rel="stylesheet" type="text/css" />
    <link href="Styles/default.css" rel="stylesheet" type="text/css" />
    <link href="Scripts/easyUI/themes/icon.css" rel="stylesheet" type="text/css" />
    <script src="Scripts/easyUI/jquery.min.js" type="text/javascript" language="javascript"></script>
    <script src="Scripts/easyUI/jquery.easyui.min.js" type="text/javascript" language="javascript"></script>
    <script src="Scripts/easyUI/locale/easyui-lang-zh_CN.js" type="text/javascript" language="javascript"></script>
    <script src="Scripts/Main.js" type="text/javascript" language="javascript"></script>
</head>
<body class="easyui-layout" style="overflow-y: hidden" scroll="no" oncontextmenu="return false"
    onselectstart="return false">
    <noscript>
        <iframe scr="*.htm"></iframe>
    </noscript>
    <div region="north" split="false" border="false" style="overflow: hidden; height: 85px;
        background-image: url(images/bg.jpg); line-height: 20px; color: #fff;">
        <div class="topbg1">
            <div class="topleft1">
                <% =Application["OrgShortName"] %><%= Application["AllTitle"]%></div>
            <div class="topright1">
                <span id="v" runat="server"></span>&nbsp;&nbsp;
                欢迎您 <span id="lblUserName" style="color: Yellow;"></span>&nbsp;&nbsp;&nbsp;&nbsp;<a
                    href="javascript:void(0)" id="loginOut" style="color: Red; text-decoration: none;">[安全退出]</a>
            </div>
        </div>
    </div>
    <div region="south" split="true" style="height: 27px; background: #D2E0F2;">
        <div class="footer">
            <%=Application["OrgShortName"] %><%= Application["AllTitle"]%> © 电话:<%= NCPEP.Bll.Component.ReadXml("GovTel").InnerText%>
        </div>
    </div>
    <div region="west" split="true" title="菜单列表" style="width: 180px;" id="west">
        <div class="easyui-accordion1" fit="true" border="false">
        </div>
    </div>
    <div id="mainPanle" region="center" style="background: #eee; overflow-y: hidden">
        <div id="tabs" class="easyui-tabs" fit="true" border="false">
            <div title="首页" style="padding: 0px; overflow: hidden; background-image: url(images/adminstart.jpg)">
                <iframe id="home" scrolling="auto" frameborder="0" style="width: 100%; height: 100%;">
                </iframe>
            </div>
        </div>
    </div>
    <!--右键菜单-->
    <div id="mm" class="easyui-menu" style="width: 150px; display: none;">
        <div id="mm-tabclose">
            关闭</div>
        <div id="mm-tabcloseall">
            全部关闭</div>
        <div id="mm-tabcloseother">
            除此之外全部关闭</div>
        <div class="menu-sep">
        </div>
        <div id="mm-tabcloseright">
            当前页右侧全部关闭</div>
        <div id="mm-tabcloseleft">
            当前页左侧全部关闭</div>
        <div class="menu-sep">
        </div>
        <div id="mm-exit">
            退出</div>
    </div>
</body>
</html>
