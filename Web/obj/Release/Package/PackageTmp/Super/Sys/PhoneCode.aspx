<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PhoneCode.aspx.cs" Inherits="Web.Super.Sys.PhoneCode" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../Scripts/easyUI/themes/default/easyui.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/default.css" rel="stylesheet" type="text/css" />
    <link href="../Scripts/easyUI/themes/icon.css" rel="stylesheet" type="text/css" />
    <script src="../Scripts/easyUI/jquery.min.js" type="text/javascript" language="javascript"></script>
    <script src="../Scripts/easyUI/jquery.easyui.min.js" type="text/javascript" language="javascript"></script>
    <script src="../Scripts/easyUI/locale/easyui-lang-zh_CN.js" type="text/javascript"
        language="javascript"></script>
   
    <script src="../Scripts/PhoneCode.js" type="text/javascript" language="javascript"></script>
</head>
<body class="easyui-layout">
    <noscript>
        <iframe scr="*.htm"></iframe>
    </noscript>
     <div id="center" region="center" title="短信平台设置" style="width: 45%;">
      
        <form id="forms" runat="server">
        <table class="tb" border="0px" cellpadding="0" cellspacing="0" style="padding-left: 20px; padding-top:20px;">
            <tr>
                <td style="width: 100px" height="43">
                    短信平台用户名<span style="color: Red;">*</span>
                </td>
                <td>
                    <input type="text" name="Uid" id="txtUid" maxlength="100" class="easyui-validatebox"
                        style="width: 200px;" missingmessage="必须填写" />
                </td>
            </tr>
            <tr>
                <td style="width: 100px" height="43">
                    短信平台密码<span style="color: Red;">*</span>
                </td>
                <td>
                    <input type="text" name="Key" id="txtKey" maxlength="100" class="easyui-validatebox"
                        style="width: 200px;" missingmessage="必须填写" />
                </td>
            </tr>
            <tr>
                <td colspan="2" height="43">
                    <div style="text-align: left; padding-left: 100px; height: 30px; line-height: 30px;">
                        <a id="btnAdd" class="easyui-linkbutton" icon="icon-ok" href="javascript:void(0)">添加</a>
                        <a id="btnEdit" class="easyui-linkbutton" icon="icon-ok" href="javascript:void(0)"
                            style="display: none">修改</a>
                    </div>
                </td>
            </tr>
        </table>
        </form>
    </div>
</body>
</html>
