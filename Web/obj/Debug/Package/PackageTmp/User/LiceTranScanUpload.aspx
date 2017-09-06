<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LiceTranScanUpload.aspx.cs"
    Inherits="Web.User.LiceTranScanUpload" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../super/Scripts/easyUI/themes/default/easyui.css" rel="stylesheet" type="text/css" />
    <link href="../super/Styles/default.css" rel="stylesheet" type="text/css" />
    <link href="../super/Styles/tbcss.css" rel="stylesheet" type="text/css" />
    <link href="../super/Scripts/easyUI/themes/icon.css" rel="stylesheet" type="text/css" />
    <script src="../super/Scripts/easyUI/jquery.min.js" type="text/javascript" language="javascript"></script>
    <script src="../super/Scripts/easyUI/jquery.easyui.min.js" type="text/javascript"
        language="javascript"></script>
    <script src="../super/Scripts/easyUI/locale/easyui-lang-zh_CN.js" type="text/javascript"
        language="javascript"></script>
    <script src="../Scripts/LiceTranScanUpload.js" type="text/javascript" language="javascript"></script>
</head>
<body class="easyui-layout" style="overflow-y: hidden" scroll="no">
    <form id="forms" runat="server">
    <table width="100%" border="0px" cellpadding="0" cellspacing="0" style="position: absolute;
        padding-left: 30px; padding-top: 10px;">
        <tr>
            <td height="35">
                上传附件名称：
                <select name="FK_UploadTypeIndicatorId" class="easyui-combotree" id="txtFK_UploadTypeIndicatorId"
                    style="width: 350px;" missingmessage="必须填写" data-options="required:true">
                </select>
            </td>
        </tr>
        <tr>
            <td height="35">
                浏览上传附件：<input name="ScanUrl" type="file" id="txtScanUrl" onchange="OnCheckImg('txtScanUrl');"
                    runat="server" style="width: 350px;" class="txt" missingmessage="必须填写" data-options="required:true" />
            </td>
        </tr>
        <tr align="center">
            <td height="35">
                <a id="btnAdd" class="easyui-linkbutton" icon="icon-ok" href="javascript:void(0)">上传</a>
            </td>
        </tr>
    </table>
    <input type="hidden" id="txtFK_LiceTranId" name="FK_LiceTranId" />
    <input type="hidden" id="txtId" name="Id" />
    </form>
</body>
</html>
