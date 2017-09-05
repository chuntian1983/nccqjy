<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Links.aspx.cs" Inherits="Web.Super.Sys.Links" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link href="../scripts/easyUI/themes/default/easyui.css" rel="stylesheet" type="text/css" />
    <link href="../styles/default.css" rel="stylesheet" type="text/css" />
    <link href="../styles/tbcss.css" rel="stylesheet" type="text/css" />
    <link href="../scripts/easyUI/themes/icon.css" rel="stylesheet" type="text/css" />
    <script src="../scripts/easyUI/jquery.min.js" type="text/javascript" language="javascript"></script>
    <script src="../scripts/easyUI/jquery.easyui.min.js" type="text/javascript" language="javascript"></script>
    <script src="../scripts/easyUI/locale/easyui-lang-zh_CN.js" type="text/javascript"
        language="javascript"></script>
    <script src="../scripts/link.js" type="text/javascript" language="javascript"></script>
</head>
<body class="easyui-layout">
    <div id="mPanle" region="center">
        <table id="tdg">
        </table>
    </div>
    <div id="fileWin" class="easyui-window" title="友情链接" collapsible="false">
        <form id="form1" runat="server">
        <table class="table" border="0px" cellpadding="0" cellspacing="0">
            <tr>
                <td style="width: 100px" height="43">
                    链接名称<span style="color: Red;">**</span>
                </td>
                <td>
                    <input type="text" name="LinkName" id="txtLinkName" maxlength="100" class="easyui-validatebox"
                        style="width: 250px;" required="true" />
                </td>
            </tr>
            <tr>
                <td style="width: 100px" height="43">
                    链接网址<span style="color: Red;">**</span>
                </td>
                <td>
                    <input type="text" name="LinkUrl" id="txtLinkUrl" maxlength="100" class="easyui-validatebox"
                        style="width: 250px;" required="true" />
                </td>
            </tr>
            <tr>
                <td style="width: 100px" height="43">
                    链接图片<span style="color: Red;">**</span>
                </td>
                <td>
                    <input type="file" name="file" id="fLinkImgurl" runat="server" onchange="OnCheckImg('fTitleImg');"
                        style="width: 250px;" />
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <div style="text-align: left; padding-left: 100px; height: 30px; line-height: 30px;">
                        <a id="btnAdd" class="easyui-linkbutton" icon="icon-ok" href="javascript:void(0)">添加</a>
                        <a id="btnEdit" class="easyui-linkbutton" icon="icon-ok" href="javascript:void(0)"
                            style="display: none">修改</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a id="btnCancel"
                                class="easyui-linkbutton" icon="icon-cancel" href="javascript:void(0)">取消</a>
                    </div>
                </td>
            </tr>
        </table>
        <input type="hidden" id="txtLinkImgUrl" name="LinkImgUrl" />
        <input type="hidden" id="txtId" name="Id" />
        </form>
    </div>
</body>
</html>
