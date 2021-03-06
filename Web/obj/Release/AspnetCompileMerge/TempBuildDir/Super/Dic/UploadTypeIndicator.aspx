﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UploadTypeIndicator.aspx.cs" Inherits="Web.Super.Dic.UploadTypeIndicator" %>


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
   
   
    <script src="../Scripts/UploadTypeIndicator.js" type="text/javascript" language="javascript"></script>
</head>
<body class="easyui-layout" style="overflow-y: hidden" scroll="no">
    <div region="center">
    <div id="mainCenter" style="width: 100%; height: 100%;">
        <table id="tdg">
        </table>
        </div>
    </div>
    <div id="newAdd" class="easyui-window" modal="true" collapsible="false" minimizable="false" maximizable="false"
        icon="icon-save" style="width: 500px; height: 150px; padding: 5px; background: #fafafa;">
        <form id="forms" runat="server">
        <table class="tb" border="0px" cellpadding="0" cellspacing="0">
            <tr>
                <td style="width: 150px" height="43">
                     上传指标类型名称<span style="color: Red;">*</span>
                </td>
                <td>
                    <input type="text" name="TypeIndicatorName" id="txtTypeIndicatorName" maxlength="100" class="easyui-validatebox"
                        style="width: 300px;" missingmessage="上传指标类型名称必须填写" data-options="required:true,validType:'length[2,100]'" />
                </td>
            </tr>
            <tr>
                <td colspan="2" height="43">
                    <div style="text-align: left; padding-left: 100px; height: 30px; line-height: 30px;">
                        <a id="btnAdd" class="easyui-linkbutton" icon="icon-ok" href="javascript:void(0)">添加</a>
                        <a id="btnEdit" class="easyui-linkbutton" icon="icon-ok" href="javascript:void(0)"
                            style="display: none">修改</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a id="btnCancel"
                                class="easyui-linkbutton" icon="icon-cancel" href="javascript:void(0)">取消</a>
                    </div>
                </td>
            </tr>
        </table>
        <input id="txtId" name="Id" type="hidden" value="0" />
        </form>
    </div>
</body>
</html>