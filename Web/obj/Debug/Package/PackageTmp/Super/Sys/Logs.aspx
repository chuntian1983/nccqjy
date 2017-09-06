<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Logs.aspx.cs" Inherits="Web.Super.Sys.Logs" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link href="../Scripts/easyUI/themes/default/easyui.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/default.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/tbcss.css" rel="stylesheet" type="text/css" />
    <link href="../Scripts/easyUI/themes/icon.css" rel="stylesheet" type="text/css" />
    <script src="../Scripts/easyUI/jquery.min.js" type="text/javascript" language="javascript"></script>
    <script src="../Scripts/easyUI/jquery.easyui.min.js" type="text/javascript" language="javascript"></script>
    <script src="../Scripts/easyUI/locale/easyui-lang-zh_CN.js" type="text/javascript"
        language="javascript"></script>
    <script src="../Scripts/logs.js" type="text/javascript" language="javascript"></script>
</head>
<body class="easyui-layout" style="overflow-y: hidden" scroll="no" oncontextmenu="return false"
    onselectstart="return false">
    <noscript>
        <iframe scr="*.htm"></iframe>
    </noscript>
    <form id="forms" action="logs.aspx">
    <div region="north" title="日志查询" split="true" style="height: 60px; overflow: hidden;
        border: 0px;" border="false">
        开始时间：
        <input type="text" id="txtstateDate" class="easyui-datebox" required="required" />&nbsp;结束时间：
        <input type="text" id="txtendDate" class="easyui-datebox" required="required" />
        <a href="javascript:void(0)" id="btnQuery" class="easyui-linkbutton" iconcls="icon-search">
            日志搜索</a>
    </div>
    <div region="center">
        <table id="tdg">
        </table>
    </div>
    <div id="logsWin" class="easyui-window" title="IP地址追踪" collapsible="false" maximizable="false"
        minimizable="false" modal="true" resizable="false" draggable="false">
        <table width="300" border="0" class="table">
            <tr>
                <td height="30" colspan="2" align="center">
                    IP地址追踪详细信息
                </td>
            </tr>
            <tr>
                <td width="109" height="30">
                    &nbsp;&nbsp;&nbsp;&nbsp;国家
                </td>
                <td width="334">
                    &nbsp;<span id="lblcountry"></span>
                </td>
            </tr>
            <tr>
                <td width="109" height="30">
                    &nbsp;&nbsp;&nbsp;&nbsp;省份
                </td>
                <td width="334">
                    &nbsp;<span id="lblprovince"></span>
                </td>
            </tr>
            <tr>
                <td height="30">
                    &nbsp;&nbsp;&nbsp;&nbsp;市县
                </td>
                <td>
                    &nbsp;<span id="lblcity"></span>
                </td>
            </tr>
            <tr>
                <td height="30">
                    &nbsp;&nbsp;&nbsp;&nbsp;运营商
                </td>
                <td>
                    &nbsp;<span id="lbloperator"></span>
                </td>
            </tr>
            <tr>
                <td height="30">
                    &nbsp;&nbsp;&nbsp;&nbsp;经度
                </td>
                <td>
                    &nbsp;<span id="lbllng"></span>
                </td>
            </tr>
            <tr>
                <td height="30">
                    &nbsp;&nbsp;&nbsp;&nbsp;纬度
                </td>
                <td>
                    &nbsp;<span id="lbllat"></span>
                </td>
            </tr>
            <tr>
                <td height="30" colspan="2" align="center">
                    <input type="button" id="btnShoeMap" value="地图追踪"/>
                </td>
            </tr>
        </table>
    </div>
    <div id="winMap" class="easyui-window" title=" IP地址追踪地图标注" style="width: 800px; height: 500px"
        data-options="iconCls:'icon-save',modal:true" minimizable="false" modal="false">
        <iframe id="imMap" scrolling="no" frameborder="0" style="width: 100%; height: 100%;">
        </iframe>
    </div>
    </form>
</body>
</html>
