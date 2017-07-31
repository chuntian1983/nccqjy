<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BidContrScan.aspx.cs" Inherits="Web.Super.Bi.BidContrScan" %>

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
   
    <script src="../Scripts/BidContrScan.js" type="text/javascript" language="javascript"></script>
</head>
<body class="easyui-layout">
    <div id="center" region="center">
        <table id="tdg">
        </table>
    </div>
    <div id="newAdd" class="easyui-window" modal="true" collapsible="false" minimizable="false"
        maximizable="false" icon="icon-save" style="width: 480px; height: 150px; padding: 5px;
        background: #fafafa;">
        <form id="forms" runat="server">
        <table border="0" class="table" cellpadding="0" cellspacing="0" width="100%">
            <tr>
                <td height="35" align="center">
                    合同附件名称
                </td>
                <td>
                    <input type="text" name="ScanName" id="txtScanName" maxlength="100" class="easyui-textbox"
                        style="width: 250px;" />
                </td>
            </tr>
            <tr>
                <td align="center">
                    上传附件文件
                </td>
                <td>
                    <input name="FScanUrl" type="file" id="FScanUrl" onchange="OnCheckImg('FScanUrl');"
                        runat="server" style="width: 250px;" class="txt" />
                </td>
            </tr>
            <tr align="center">
                <td colspan="5" height="35">
                    <a id="btnAdd" class="easyui-linkbutton" icon="icon-ok" href="javascript:void(0)">添加</a>
                    <a id="btnEdit" class="easyui-linkbutton" icon="icon-ok" href="javascript:void(0)"
                        style="display: none">修改</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a id="btnCancel"
                            class="easyui-linkbutton" icon="icon-cancel" href="javascript:void(0)">取消</a>
                </td>
            </tr>
        </table>
        <input type="hidden" id="txtId" name="Id" />
        <input type="text" id="txtFK_BidId" name="FK_BidId" />
        <input type="hidden" id="txtScanUrl" name="ScanUrl" />
        </form>
    </div>
</body>
</html>

