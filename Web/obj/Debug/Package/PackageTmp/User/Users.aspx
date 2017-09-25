<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Users.aspx.cs" Inherits="Web.User.Users" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="userform" runat="server">
    <script src="../Scripts/Users.js" type="text/javascript" language="javascript"></script>
    <table class="table" border="0px" cellpadding="0" cellspacing="0">
        <tr>
            <td width="90" height="35" align="center">
                用户名<span style="color: Red;">**</span>
            </td>
            <td width="163">
                <input type="text" name="LoginName" id="utxtLoginName" maxlength="100" class="easyui-validatebox"
                    style="width: 150px;" missingmessage="必须填写" data-options="required:true,validType:'length[1,20]'" />
            </td>
            <td width="90" align="center">
                密码<span style="color: Red;">**</span>
            </td>
            <td width="201">
                <input type="text" name="LoginPass" id="utxtLoginPass" maxlength="100" class="easyui-validatebox"
                    style="width: 150px;" missingmessage="必须填写" data-options="required:true,validType:'length[1,30]'" />
            </td>
        </tr>
        <tr>
            <td height="35" align="center">
                姓名<span style="color: Red;">**</span>
            </td>
            <td>
                <input type="text" name="UserName" id="utxtUserName" maxlength="100" class="easyui-validatebox"
                    style="width: 150px;" missingmessage="必须填写" data-options="required:true" />
            </td>
            <td align="center">
                电话<span style="color: Red;">**</span>
            </td>
            <td>
                <input type="text" name="UserTel" id="utxtUserTel" maxlength="100" class="easyui-validatebox"
                    style="width: 150px;" missingmessage="必须填写" data-options="required:true" />
            </td>
        </tr>
        <tr>
            <td height="35" align="center">
                邮箱
            </td>
            <td>
                <input type="text" name="UserEmail" id="utxtUserEmail" maxlength="100" class="easyui-textbox"
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
                <a id="btnEdit" class="easyui-linkbutton" icon="icon-ok" href="javascript:void(0)">修改</a>
            </td>
        </tr>
    </table>
    <input id="utxtId" name="Id" type="hidden" value="0" />
    <input id="utxtVeri" name="Veri" type="hidden" value="0" />
    <input id="utxtUserStatus" name="UserStatus" type="hidden" value="" />
    <input id="utxtLoginDate" name="LoginDate" type="hidden" value="" />
    <input id="utxtLoginnNum" name="LoginnNum" type="hidden" value="" />
    <input id="utxtOutDate" name="OutDate" type="hidden" value="" />
    </form>
</body>
</html>
