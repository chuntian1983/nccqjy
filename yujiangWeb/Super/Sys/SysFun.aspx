<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SysFun.aspx.cs" Inherits="Web.Super.Sys.SysFun" %>

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
   
    <script src="../Scripts/Sysfun.js" type="text/javascript" language="javascript"></script>
</head>
<body class="easyui-layout" scroll="no">
    <div region="west" title="系统菜单信息列表" split="true" style="width: 180px;" id="west">
        <ul id="funTree" class="easyui-tree">
        </ul>
    </div>
    <div region="center" title="系统菜单详细信息">
        <div class="easyui-panel" style="padding: 5px;">
            <a href="javascript:void(0)" id="btnNew" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-add'">
                新建</a> <a href="javascript:void(0)" id="btnUp" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-cut'">
                    修改</a> <a href="javascript:void(0)" id="btnDel" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-no'">
                        删除</a> <a href="javascript:void(0)" id="btnAdd" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-save'"
                            style="display: none;">保存</a>
        </div>
        <form id="forms" runat="server">
        <br />
        <table width="600px" border="1" cellpadding="0" cellspacing="0" class="table">
            <tr>
                <td width="80" align="center" bgcolor="#F1F8FC" height="40">
                    上级菜单
                </td>
                <td colspan="5">
                    <select id="txtParentNodeId" name="ParentNodeId" class="easyui-combobox" style="width: 100px;">
                    </select>
                </td>
            </tr>
            <tr>
                <td align="center" bgcolor="#F1F8FC" height="40">
                    菜单名称<span style="color: Red;">**</span>
                </td>
                <td colspan="5">
                    <input id="txtDisplayName" name="DisplayName" class="txt" type="text" style="width: 450px;" />
                </td>
            </tr>
            <tr>
                <td align="center" bgcolor="#F1F8FC" height="40">
                    菜单连接地址
                </td>
                <td colspan="5">
                    <input id="txtNodeURL" name="NodeURL" class="txt" type="text" style="width: 450px;" />
                </td>
            </tr>
            <tr>
                <td align="center" bgcolor="#F1F8FC" height="40">
                    菜单显示顺序
                </td>
                <td colspan="5">
                    <input id="txtDisplayOrder" name="DisplayOrder" value="1" class="txt" type="text"
                        style="width: 30px;" />
                </td>
            </tr>
        </table>
        <input id="txtNodeId" name="NodeId" type="hidden" />
        </form>
    </div>
    
</body>
</html>
