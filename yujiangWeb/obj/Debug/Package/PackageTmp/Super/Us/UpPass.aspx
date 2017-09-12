<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UpPass.aspx.cs" Inherits="Web.Super.Us.UpPass" %>

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
    <script src="../Scripts/UpPass.js" type="text/javascript" language="javascript"></script>
</head>
<body class="easyui-layout">
    <noscript>
        <iframe scr="*.htm"></iframe>
    </noscript>
    <div id="center" region="center" title="用户修改密码" style="width: 45%; background-image: url(../Images/adminstart.jpg);">
        <form id="forms" runat="server">
        <table class="tb" border="0px" cellpadding="0" cellspacing="0" style="padding-left: 80px;
            padding-top: 40px;">
            <tr>
                <td style="width: 80px" height="40">
                    登录名：
                </td>
                <td>
                    <span name="AdminLogName" id="txtAdminLogName" style="font-size: 20px;"></span>
                </td>
            </tr>
            <tr>
                <td style="width: 80px" height="40">
                    密 码：<span style="color: Red;">*</span>
                </td>
                <td>
                    <input type="text" name="AdminLogPass" id="txtAdminLogPass" maxlength="100" class="easyui-validatebox"
                        style="width: 200px;" missingmessage="必须填写" data-options="required:true,validType:'length[6,20]'" />
                </td>
            </tr>
            <tr>
                <td colspan="2" height="40">
                    <div style="text-align: left; padding-left: 100px; height: 30px; line-height: 30px;">
                        <a id="btnEdit" class="easyui-linkbutton" icon="icon-ok" href="javascript:void(0)">修改</a>
                    </div>
                </td>
            </tr>
        </table>
        </form>
    </div>
</body>
</html>
