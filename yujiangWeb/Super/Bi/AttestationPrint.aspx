<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AttestationPrint.aspx.cs"
    Inherits="Web.Super.Bi.AttestationPrint" %>

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
    <script src="../Scripts/AttestationPrint.js" type="text/javascript" language="javascript"></script>
</head>
<body class="easyui-layout">
    <div region="north" title=" " split="true" style="height: 65px; border: 0px;" border="false">
        &nbsp;&nbsp;标的名称：
        <input type="text" id="tBidName" class="easyui-textbox" style="width: 300px;" required="true" />
        <a href="javascript:void(0)" id="btnQuery" class="easyui-linkbutton" iconcls="icon-search">
            搜索</a>&nbsp;&nbsp;&nbsp;&nbsp;<span style="color: Blue;">(支持模糊查询)</span>
    </div>
    <div region="center">
        <table id="tdg">
        </table>
    </div>
    <div id="addPrint" title="打印理由" class="easyui-window" collapsible="false" minimizable="false"
        maximizable="false" icon="icon-save" modal="true" closable="true" style="width: 400px;
        height: 160px; padding: 5px; background: #fafafa;">
        <form id="forms" runat="server">
        <table>
            <tr>
                <td>
                    <textarea id="txtReason" name="Reason" style="width: 350px; height: 70px;" class="easyui-validatebox"
                        missingmessage="必须填写" required="true"></textarea>
                </td>
            </tr>
            <tr align="center">
                <td>
                    <a href="javascript:void(0)" id="btnPrintAdd" class="easyui-linkbutton" icon="icon-ok">
                        提交并打印</a>
                </td>
            </tr>
        </table>
        <input type="hidden" id="txtId" name="Id" value="0" />
        <input type="hidden" id="txtFK_BidId" name="FK_BidId" />
        </form>
    </div>
</body>
</html>
