<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="User.aspx.cs" Inherits="Web.Super.WebMana.User" %>

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
    <script src="../Scripts/User.js" type="text/javascript" language="javascript"></script>
</head>
<body class="easyui-layout">
    <div region="north" title="会员信息列表" split="true" style="height: 58px; border: 0px;"
        border="false">
        &nbsp;&nbsp;姓名：
        <input type="text" id="txt_UserName" class="easyui-textbox" style="width: 300px;"
            required="true" />
        <a href="javascript:void(0)" id="btnQuery" class="easyui-linkbutton" iconcls="icon-search">
            搜索</a>&nbsp;&nbsp;&nbsp;&nbsp;<span style="color: Blue;">(支持模糊查询)</span>
    </div>
    <div region="center">
        <table id="tdg">
        </table>
    </div>
    <div id="newAdd" class="easyui-window" modal="true" collapsible="false" minimizable="false"
        maximizable="false" icon="icon-save" style="width: 530px; height: 200px; padding: 5px;
        background: #fafafa;">
        <form id="forms" runat="server">
        <table class="tb" border="0px" cellpadding="0" cellspacing="0">
            <tr>
                <td width="90" height="35" align="center">
                    用户名<span style="color: Red;">**</span>
                </td>
                <td width="163">
                    <input type="text" name="LoginName" id="txtLoginName" maxlength="100" class="easyui-validatebox"
                        style="width: 150px;" missingmessage="必须填写" data-options="required:true,validType:'length[1,20]'" />
                </td>
                <td width="90" align="center">
                    密码<span style="color: Red;">**</span>
                </td>
                <td width="201">
                    <input type="password" name="LoginPass" id="txtLoginPass" maxlength="100" class="easyui-validatebox"
                        style="width: 150px;" missingmessage="必须填写" data-options="required:true,validType:'length[1,30]'" />
                </td>
            </tr>
            <tr>
                <td height="35" align="center">
                    姓名<span style="color: Red;">**</span>
                </td>
                <td>
                    <input type="text" name="UserName" id="txtUserName" maxlength="100" class="easyui-validatebox"
                        style="width: 150px;" missingmessage="必须填写" data-options="required:true" />
                </td>
                <td align="center">
                    电话<span style="color: Red;">**</span>
                </td>
                <td>
                    <input type="text" name="UserTel" id="txtUserTel" maxlength="100" class="easyui-validatebox"
                        style="width: 150px;" missingmessage="必须填写" data-options="required:true" />
                </td>
            </tr>
            <tr>
                <td height="35" align="center">
                    邮箱
                </td>
                <td>
                    <input type="text" name="UserEmail" id="txtUserEmail" maxlength="100" class="easyui-textbox"
                        style="width: 150px;" />
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr align="center">
                <td colspan="4" height="40">
                    <a id="btnAdd" class="easyui-linkbutton" icon="icon-ok" href="javascript:void(0)">添加</a>
                    <a id="btnEdit" class="easyui-linkbutton" icon="icon-ok" href="javascript:void(0)"
                        style="display: none">修改</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a id="btnCancel"
                            class="easyui-linkbutton" icon="icon-cancel" href="javascript:void(0)">取消</a>
                </td>
            </tr>
        </table>
        <input id="txtId" name="Id" type="hidden" value="0" />
        <input id="txtVeri" name="Veri" type="hidden" value="0" />
        <input id="txtUserStatus" name="UserStatus" type="hidden" value="" />
        <input id="txtLoginDate" name="LoginDate" type="hidden" value="" />
        <input id="txtLoginnNum" name="LoginnNum" type="hidden" value="" />
        <input id="txtOutDate" name="OutDate" type="hidden" value="" />
        </form>
    </div>
</body>
</html>
