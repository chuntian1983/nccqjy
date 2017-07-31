<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IndRel.aspx.cs" Inherits="Web.Super.Dic.IndRel" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../Scripts/easyUI/themes/default/easyui.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/default.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/tbcss.css" rel="stylesheet" type="text/css" />
    <link href="../Scripts/easyUI/themes/icon.css" rel="stylesheet" type="text/css" />
    <script src="../Scripts/easyUI/jquery.min.js" type="text/javascript" language="javascript"></script>
    <script src="../Scripts/easyUI/jquery.easyui.min.js" type="text/javascript" language="javascript"></script>
    <script src="../Scripts/easyUI/locale/easyui-lang-zh_CN.js" type="text/javascript"
        language="javascript"></script>
   
    <script src="../Scripts/IndRel.js" type="text/javascript" language="javascript"></script>
</head>
<body class="easyui-layout" style="overflow-y: hidden" scroll="no">
    <div region="north" title="指标对应关系" split="true" style="height: 85px; overflow: hidden;
        border: 0px;" border="false">
        <div style="padding-top: 15px; padding-left: 20px;">
       
            申请类型：
            <select class="easyui-combobox" id="txtFK_MemberTypeCertificationId" style="width: 150px;">
            </select>
            流转类型：
            <select id="txtApplicationType" class="easyui-combobox">
                <option value=""></option>
                <option value="1">出让方备案</option>
                <option value="3">出让方申请</option>
                <option value="2">受让方备案</option>
                <option value="4">意向受让方申请</option>
            </select>
            <a href="javascript:void(0)" id="btnQuery" class="easyui-linkbutton" iconcls="icon-search">
                查看</a>
        </div>
    </div>
    <div region="center">
        <table id="tdg">
        </table>
    </div>
    <div id="newAdd" class="easyui-window" modal="true" collapsible="false" minimizable="false" maximizable="false"
        icon="icon-save" style="width: 600px; height: 550px; padding: 5px; background: #fafafa;">
        <form id="forms" runat="server">
        <div class="easyui-panel">
            <a href="javascript:void(0)" id="btnAdd" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-lock'">
                建立对应关系</a>
        </div>
        <ul id="funIndicator" class="easyui-tree">
        </ul>
        </form>
    </div>
</body>
</html>
