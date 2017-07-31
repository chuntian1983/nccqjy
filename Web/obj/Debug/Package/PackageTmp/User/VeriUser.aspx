<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VeriUser.aspx.cs" Inherits="Web.User.VeriUser" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="VeriUserForms" runat="server">
    <script src="../Scripts/VeriUser.js" type="text/javascript" language="javascript"></script>
    <table class="table" border="0px" cellpadding="0" cellspacing="0">
        <tr>
            <td height="35">
                用户名<span style="color: Red;">**</span>
            </td>
            <td>
                <input type="text" name="LoginName" id="txtLoginName" maxlength="100" class="easyui-validatebox"
                    style="width: 150px;" missingmessage="必须填写" data-options="required:true,validType:'length[1,20]'" />
            </td>
            <td>
                密码<span style="color: Red;">**</span>
            </td>
            <td>
                <input type="password" name="LoginPass" id="txtLoginPass" maxlength="100" class="easyui-validatebox"
                    style="width: 150px;" missingmessage="必须填写" data-options="required:true,validType:'length[1,30]'" />
            </td>
        </tr>
        <tr>
            <td height="35">
                会员类型<span style="color: Red;">**</span>
            </td>
            <td>
                <select name="MemberTypeId" id="txtMemberTypeId" class="easyui-combotree" style="width: 150px;">
                </select>
            </td>
            <span id="gr1">
                <td>
                    姓名<span style="color: Red;">**</span>
                </td>
                <td>
                    <input type="text" name="VeriName" id="txtVeriName" maxlength="100" class="easyui-validatebox"
                        style="width: 150px;" missingmessage="必须填写" data-options="required:true" />
                </td>
            </span><span id="gs1" class="divhide">
                <td>
                    法人代表<span style="color: Red;">**</span>
                </td>
                <td>
                    <input type="text" name="VeriCorporate" id="txtVeriCorporate" maxlength="100" class="easyui-textbox"
                        style="width: 150px;" />
                </td>
            </span>
        </tr>
        <tr>
            <td height="35">
                性别<span style="color: Red;">**</span>
            </td>
            <td>
                <select name="VeriSex" id="txtVeriSex" class="easyui-combobox" style="width: 150px;">
                    <option value="男">男</option>
                    <option value="女">女</option>
                </select>
            </td>
            <span id="gr2">
                <td>
                    身份证号码<span style="color: Red;">**</span>
                </td>
                <td>
                    <input type="text" name="VeriIDCard" id="txtVeriIDCard" maxlength="100" class="easyui-validatebox"
                        style="width: 150px;" missingmessage="必须填写" data-options="required:true,validType:'length[1,18]'" />
                </td>
            </span><span id="gs2" class="divhide">
                <td height="35">
                    法人身份证号码<span style="color: Red;">**</span>
                </td>
                <td>
                    <input type="text" name="VeriCorporateIDCard" id="txtVeriCorporateIDCard" maxlength="100"
                        class="easyui-textbox" style="width: 150px;" />
                </td>
            </span>
        </tr>
        <tr>
            <td height="35">
                组织单位<span style="color: Red;">**</span>
            </td>
            <td>
                <select name="OrgCode" id="txtOrgCode" class="easyui-combotree" style="width: 150px;">
                </select>
            </td>
            <td>
                地址<span style="color: Red;">**</span>
            </td>
            <td>
                <input type="text" name="VeriAddress" id="txtVeriAddress" maxlength="100" class="easyui-validatebox"
                    style="width: 150px;" missingmessage="必须填写" data-options="required:true,validType:'length[1,30]'" />
            </td>
        </tr>
        <tr>
            <td height="35">
                联系电话<span style="color: Red;">**</span>
            </td>
            <td>
                <input type="text" name="VeriTel" id="txtVeriTel" maxlength="100" class="easyui-validatebox"
                    style="width: 150px;" missingmessage="必须填写" data-options="required:true,validType:'length[1,13]'" />
            </td>
            <span id="gr3">
                <td>
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
            </span><span id="gs3" class="divhide">
                <td>
                    社会信用代码<span style="color: Red;">**</span>
                </td>
                <td>
                    <input type="text" name="VeriCreditCode" id="txtVeriCreditCode" maxlength="100" class="easyui-textbox"
                        style="width: 150px;" />
                </td>
            </span>
        </tr>
        <span id="gr4">
            <tr>
                <td height="35">
                    身份证附件上传<span style="color: Red;">**</span>
                </td>
                <td colspan="3">
                    <input name="VeriIDCardScan" type="file" id="txtVeriIDCardScan" onchange="OnCheckImg('txtVeriIDCardScan');"
                        runat="server" style="width: 450px;" class="txt" />
                </td>
            </tr>
        </span><span id="gs4" class="divhide">
            <tr>
                <td height="35">
                    法人身份证附件上传<span style="color: Red;">**</span>
                </td>
                <td colspan="3">
                    <input name="VeriCorporateIDCardScan" type="file" id="txtVeriCorporateIDCardScan"
                        onchange="OnCheckImg('txtVeriCorporateIDCardScan');" runat="server" style="width: 450px;"
                        class="txt" />
                </td>
            </tr>
            <tr>
                <td height="35">
                    社会信用代码附件上传<span style="color: Red;">**</span>
                </td>
                <td colspan="3">
                    <input name="VeriCreditCodeScan" type="file" id="txtVeriCreditCodeScan" onchange="OnCheckImg('txtVeriCreditCodeScan');"
                        runat="server" style="width: 450px;" class="txt" />
                </td>
            </tr>
        </span>
        <tr align="center">
            <td colspan="4" height="40">
                <a id="btnVeriEdit" class="easyui-linkbutton" icon="icon-ok" href="javascript:void(0)">
                    提交验证</a>
            </td>
        </tr>
    </table>
    <input id="txtId" name="Id" type="hidden" value="0" />
    <input id="txtUserName" name="UserName" type="hidden" value="" />
    <input id="txtUserTel" name="UserTel" type="hidden" value="" />
    <input id="txtUserEmail" name="UserEmail" type="hidden" value="" />
    <input id="txtUserStatus" name="UserStatus" type="hidden" value="0" />
    <input id="txtLoginDate" name="LoginDate" type="hidden" value="" />
    <input id="txtLoginnNum" name="LoginnNum" type="hidden" value="0" />
    <input id="txtOutDate" name="OutDate" type="hidden" value="" />
    <input id="txtVeri" name="Veri" type="hidden" value="1" />
    <input id="txtVeriStatus" name="VeriStatus" type="hidden" value="0" />
    <input id="txtAuditType" name="AuditType" type="hidden" value="0" />
    <input id="txtVeriCheckName" name="VeriCheckName" type="hidden" value="" />
    <input id="txtVeriApplyDate" name="VeriApplyDate" type="hidden" value="" />
    <input id="txtVeriCheckDate" name="VeriCheckDate" type="hidden" value="" />
    <input id="tVeriIDCardScan" name="tVeriIDCardScan" type="hidden" value="" />
    <input id="tVeriCorporateIDCardScan" name="tVeriCorporateIDCardScan" type="hidden"
        value="" />
    <input id="tVeriCreditCodeScan" name="tVeriCreditCodeScan" type="hidden" value="" />
    </form>
</body>
</html>
