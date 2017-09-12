<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserMain.aspx.cs" Inherits="Web.User.UserMain" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head runat="server">
    <title>
        <% =Application["OrgShortName"] %><%= Application["AllTitle"]%></title>
    <meta name="keywords" content="<% =Application["OrgShortName"] %>农村综合产权交易网,土地流转" />
    <meta name="description" content="<% =Application["OrgShortName"] %>产权交易、土地流转、交易流转" />
    <link rel="stylesheet" type="text/css" href="../Styles/base.css" />
    <link rel="stylesheet" type="text/css" href="../Styles/user.css" />
    <link href="../super/Styles/tbcss.css" rel="stylesheet" type="text/css" />
    <link href="../super/Scripts/easyUI/themes/default/easyui.css" rel="stylesheet" type="text/css" />
    <link href="../super/Styles/default.css" rel="stylesheet" type="text/css" />
    <link href="../super/Scripts/easyUI/themes/icon.css" rel="stylesheet" type="text/css" />
    <script src="../super/Scripts/easyUI/jquery.min.js" type="text/javascript" language="javascript"></script>
    <script src="../super/Scripts/easyUI/jquery.easyui.min.js" type="text/javascript"
        language="javascript"></script>
    <script src="../super/Scripts/easyUI/locale/easyui-lang-zh_CN.js" type="text/javascript"
        language="javascript"></script>
    <script src="../Scripts/UserMain.js" type="text/javascript" language="javascript"></script>
</head>
<body class="easyui-layout" style="overflow-y: hidden" scroll="no" oncontextmenu="return false"
    onselectstart="return false">
    <div region="north" split="false" style="overflow: hidden; height: 85px;">
        <div class="usertop">
            <strong>
                <% =Application["OrgShortName"] %><%= Application["AllTitle"]%></strong> <a href="../Default.aspx">网站首页</a>
            <span style="color: Yellow;">欢迎您
                <%=UserName %>
            </span><a id="TheirDestruction" href="#">注销</a>
        </div>
    </div>
    <div id="mainPanle" region="center">
        <%=Menus%>
        <div id="winao" class="easyui-window" title="基本信息" style="width: 530px; height: 200px;"
            data-options="iconCls:'icon-save',modal:true" minimizable="false" modal="false">
        </div>
        <div id="winat" class="easyui-window" title="我要认证" style="width: 650px; height: 350px;"
            data-options="iconCls:'icon-save',modal:true" minimizable="false" modal="false">
        </div>
        <div id="winbo" class="easyui-window" title="出让方/受让方信息" style="width: 800px; height: 600px"
            data-options="iconCls:'icon-save',modal:true" minimizable="false" modal="false">
            <iframe id="imbo" scrolling="no" frameborder="0" style="width: 100%; height: 100%;">
            </iframe>
        </div>
        <div id="winco" class="easyui-window" title="出让标信息" style="width: 800px; height: 600px"
            data-options="iconCls:'icon-save',modal:true" minimizable="false" modal="false">
            <iframe id="imco" scrolling="no" frameborder="0" style="width: 100%; height: 100%;">
            </iframe>
        </div>
        <div id="winct" class="easyui-window" title="意向受让标信息" style="width: 800px; height: 600px"
            data-options="iconCls:'icon-save',modal:true" minimizable="false" modal="false">
            <iframe id="imct" scrolling="no" frameborder="0" style="width: 100%; height: 100%;">
            </iframe>
        </div>
        <div id="wincs" class="easyui-window" title="进度查看" style="width: 800px; height: 600px"
            data-options="iconCls:'icon-save',modal:true" minimizable="false" modal="false">
            <iframe id="imcs" scrolling="no" frameborder="0" style="width: 100%; height: 100%;">
            </iframe>
        </div>
        <div id="windo" class="easyui-window" title="意向受让/转让/抵押融资信息" style="width: 800px;
            height: 600px" data-options="iconCls:'icon-save',modal:true" minimizable="false"
            modal="false">
            <iframe id="imdo" scrolling="no" frameborder="0" style="width: 100%; height: 100%;">
            </iframe>
        </div>
    </div>
</body>
</html>
