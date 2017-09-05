<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="Web.Super.Index" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Scripts/easyUI/themes/default/easyui.css" rel="stylesheet" type="text/css" />
    <link href="Styles/default.css" rel="stylesheet" type="text/css" />
    <link href="Styles/tbcss.css" rel="stylesheet" type="text/css" />
    <link href="Scripts/easyUI/themes/icon.css" rel="stylesheet" type="text/css" />
    <script src="Scripts/easyUI/jquery.min.js" type="text/javascript" language="javascript"></script>
    <script src="Scripts/easyUI/jquery.easyui.min.js" type="text/javascript" language="javascript"></script>
    <script src="Scripts/easyUI/locale/easyui-lang-zh_CN.js" type="text/javascript" language="javascript"></script>
    <script src="Scripts/Index.js" type="text/javascript" language="javascript"></script>
</head>
<body class="easyui-layout" scroll="no">
    <div region="north" style="height: 150px; overflow: hidden; border: 0px;" border="false">
        <ul>
            待办事项:</ul>
        <ul>
            等待审核信息：0条</ul>
    </div>
    <div region="center" title="通知公告" style="width: 60%;">
        <table id="pla">
        </table>
    </div>
    <div region="east" title="通讯录信息列表" style="width: 40%;">
        <div id="tb" style="padding: 5px; height: auto">
            组织单位：
            <select class="easyui-combotree" id="txtOrganization" style="width: 150px;">
            </select></div>
        <table id="tdg" toolbar="#tb">
        </table>
    </div>
    <div region="south" style="height: 40px">
        <ul>
            ※ 系统信息： .NET 版本：<%=string.Concat(new object[] { Environment.Version.Major, ".", Environment.Version.Minor, Environment.Version.Build, ".", Environment.Version.Revision }) %>
            &nbsp;&nbsp;※&nbsp;&nbsp;服务器运行时间：<%= ((Environment.TickCount / 0x3e8) / 60).ToString() + "分钟 / 约" + string.Format("{0:0.0}", (float.Parse((Environment.TickCount / 0x3e8).ToString()) / 60 / 60)) + "小时"%>
            &nbsp;&nbsp;※&nbsp;&nbsp;客户端操作系统：<%= Request.Browser.Platform%>
            &nbsp;&nbsp;※&nbsp;&nbsp;平台占用内存：<%= ((Double)GC.GetTotalMemory(false) / 1048576).ToString("N2") + "M"%>
            &nbsp;&nbsp;※&nbsp;&nbsp;当前缓存数量：<%= Cache.Count.ToString()%></ul>
    </div>
    <div id="news" class="easyui-window" collapsible="false" minimizable="false" maximizable="false"
        icon="icon-save" style="width: 560px; height: 500px; padding: 5px; background: #fafafa;">
        <table width="100%" border="0">
            <tr>
                <td height="25" align="center">
                    <h1>
                        <span id="lblPlacardTitle" style="font-size: x-large;"></span>
                    </h1>
                </td>
            </tr>
            <tr>
                <td height="20" align="center">
                    部门：<span id="lblDepName"></span>&nbsp;&nbsp;&nbsp;&nbsp;时间：<span id="lblReleaseTime"></span>&nbsp;&nbsp;&nbsp;&nbsp;发布人：<span
                        id="lblPublisher"></span>
                    <hr style="background-color: Red;" />
                </td>
            </tr>
            <tr>
                <td height="400" align="left" valign="top">
                    &nbsp;&nbsp;&nbsp;&nbsp;<span id="lblPlacardContent"></span>
                </td>
            </tr>
        </table>
    </div>
</body>
</html>
