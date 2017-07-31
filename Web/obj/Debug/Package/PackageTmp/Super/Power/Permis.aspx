<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Permis.aspx.cs" Inherits="Web.Super.Power.Permis" %>

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
    <script src="../Scripts/easyUI/locale/easyui-lang-zh_CN.js" type="text/javascript" language="javascript"></script>
   
    <script src="../Scripts/permis.js" type="text/javascript" language="javascript"></script>
</head>
<body class="easyui-layout">
    <div id="mPanle" region="center">
        <table id="tdg">
        </table>
    </div>
    <div id="permisWin" class="easyui-window" modal="true" title="管理类型权限" collapsible="false" style="width: 250px;
        height: 550px;">
     <div class="easyui-panel">
            <a href="javascript:void(0)" id="btnAdd" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-lock'">
                授权</a>
        </div>
        <ul id="funTree" class="easyui-tree">
        </ul>
        <input  type="hidden" id="txtAdminTypeId"/>
    </div>
</body>
</html>