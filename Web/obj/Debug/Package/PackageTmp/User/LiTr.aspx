<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LiTr.aspx.cs" Inherits="Web.User.LiTr" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../Super/Scripts/easyUI/themes/default/easyui.css" rel="stylesheet" type="text/css" />
    <link href="../Super/Styles/default.css" rel="stylesheet" type="text/css" />
    <link href="../Super/Styles/tbcss.css" rel="stylesheet" type="text/css" />
    <link href="../Super/Scripts/easyUI/themes/icon.css" rel="stylesheet" type="text/css" />
    <script src="../Super/Scripts/easyUI/jquery.min.js" type="text/javascript" language="javascript"></script>
    <script src="../Super/Scripts/easyUI/jquery.easyui.min.js" type="text/javascript"
        language="javascript"></script>
    <script src="../Super/Scripts/easyUI/locale/easyui-lang-zh_CN.js" type="text/javascript"
        language="javascript"></script>
    <script src="../Scripts/LiTr.js" type="text/javascript" language="javascript"></script>
    <style type="text/css">
        .divhide
        {
            display: none;
        }
    </style>
</head>
<body class="easyui-layout">
    <div region="north" split="true" style="height: 370px; overflow: hidden; border: 0px;"
        border="false">
        <div id="tool">
            <a id="btnAdd" class="easyui-linkbutton" icon="icon-add" href="javascript:void(0)">新建</a>
            <a id="btnDel" class="easyui-linkbutton" icon="icon-no" href="javascript:void(0)">删除</a>
            <a id="btnCut" class="easyui-linkbutton" icon="icon-cut" href="javascript:void(0)">修改</a>
            &nbsp;&nbsp;&nbsp;&nbsp; 类型：
            <select name="tLiceTranType" class="easyui-combotree" id="tLiceTranType" style="width: 120px;">
            </select>&nbsp;&nbsp;&nbsp;&nbsp;<span style="color: Blue;">双击单行数据显示审核/附件信息</span>
        </div>
        <table id="tdg" toolbar="#tool">
        </table>
    </div>
    <div id="center" region="center" title="审核意见" style="width: 50%;">
        <table id="ltCheck">
        </table>
    </div>
    <div id="east" region="east" title="附件信息" style="width: 50%;">
        <table id="ltScan">
        </table>
    </div>
    <div id="newAdd" class="easyui-window" modal="true" collapsible="false" minimizable="false"
        maximizable="false" icon="icon-save" style="width: 660px; height: 320px; padding: 5px;
        background: #fafafa;">
        <form id="forms" runat="server">
        <table width="640" class="tb" border="0px" cellpadding="0" cellspacing="0">
            <tr>
                <td height="35">
                    组织单位<span style="color: Red;">**</span>
                </td>
                <td>
                    <select name="OrgCode" id="txtOrgCode" class="easyui-combotree" style="width: 150px;">
                    </select>
                </td>
                <td>
                    出让方,受让<span style="color: Red;">**</span>
                </td>
                <td>
                    <select name="LiceTranType" id="txtLiceTranType" class="easyui-combotree" style="width: 150px;">
                    </select>
                </td>
            </tr>
            <tr>
                <td height="35">
                    经济类型<span style="color: Red;">**</span>
                </td>
                <td>
                    <select name="MemberTypeId" id="txtMemberTypeId" class="easyui-combotree" style="width: 150px;">
                    </select>
                </td>
                <td>
                    姓名<span style="color: Red;">**</span>
                </td>
                <td>
                    <input type="text" name="Name" id="txtName" maxlength="100" class="easyui-textbox"
                        style="width: 150px;" missingmessage="必须填写" data-options="required:true" />
                </td>
            </tr>
            <tr>
                <td>
                    住址<span style="color: Red;">**</span>
                </td>
                <td>
                    <input type="text" name="Addr" id="txtAddr" maxlength="100" class="easyui-textbox"
                        style="width: 150px;" missingmessage="必须填写" data-options="required:true" />
                </td>
                <td height="35">
                    联系人<span style="color: Red;">**</span>
                </td>
                <td>
                    <input type="text" name="Contact" id="txtContact" class="easyui-textbox" style="width: 150px;"
                        missingmessage="必须填写" data-options="required:true" />
                </td>
            </tr>
            <tr>
                <td>
                    法人代表<span style="color: Red;">**</span>
                </td>
                <td>
                    <input type="text" name="Corporate" id="txtCorporate" maxlength="100" class="easyui-textbox"
                        style="width: 150px;" />
                </td>
                <td height="35">
                    身份证号码<span style="color: Red;">**</span>
                </td>
                <td>
                    <input type="text" name="IDCard" id="txtIDCard" maxlength="100" class="easyui-textbox"
                        style="width: 150px;" missingmessage="必须填写" data-options="required:true" />
                </td>
            </tr>
            <tr>
                <td height="35">
                    联系电话<span style="color: Red;">**</span>
                </td>
                <td>
                    <input type="text" name="Tel" id="txtTel" maxlength="100" class="easyui-textbox"
                        style="width: 150px;" missingmessage="必须填写" data-options="required:true,validType:'length[6,13]'" />
                </td>
                <td>
                    所有权人<span style="color: Red;">**</span>
                </td>
                <td>
                    <input type="text" name="Owner" id="txtOwner" maxlength="100" class="easyui-textbox"
                        style="width: 150px;" missingmessage="必须填写" data-options="required:true,validType:'length[1,10]'" />
                </td>
            </tr>
            <span id="show3" style="display: none;">
                <tr>
                    <td height="35">
                        组织机构代码<span style="color: Red;">**</span>
                    </td>
                    <td>
                        <input type="text" name="OrganizationCode" id="txtOrganizationCode" maxlength="100"
                            class="easyui-textbox" style="width: 150px;" />
                    </td>
                    <td>
                        注册资本<span style="color: Red;">**</span>
                    </td>
                    <td>
                        <input type="text" name="Capital" id="txtCapital" maxlength="100" class="easyui-textbox"
                            style="width: 150px;" />
                    </td>
                </tr>
            </span>
            <tr align="center">
                <td colspan="4" height="40">
                    <a id="btnCreate" class="easyui-linkbutton" icon="icon-ok" href="javascript:void(0)">
                        添加</a> <a id="btnEdit" class="easyui-linkbutton" icon="icon-ok" href="javascript:void(0)"
                            style="display: none">修改</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a id="btnCancel"
                                class="easyui-linkbutton" icon="icon-cancel" href="javascript:void(0)">取消</a>
                </td>
            </tr>
        </table>
        <input id="txtId" name="Id" type="hidden" value="0" />
        <input id="txtApplyDate" name="ApplyDate" type="hidden" value="" />
        <input id="txtAuditType" name="AuditType" type="hidden" value="" />
        <input id="txtFK_WebUserVeriId" name="FK_WebUserVeriId" type="hidden" value="0" />
        </form>
    </div>
    <div id="ScanImg" class="easyui-window" modal="true" collapsible="false" minimizable="false"
        maximizable="false" icon="icon-save" style="width: 700px; height: 480px; padding: 5px;
        background: #fafafa;">
        <iframe id="showScanImg" scrolling="no" frameborder="0" style="width: 100%; height: 100%;">
        </iframe>
    </div>
    <div id="ScanFile" title="附件上传" class="easyui-window" collapsible="false" minimizable="false"
        maximizable="false" icon="icon-save" modal="true" style="width: 650px; height: 200px;
        padding: 5px; background: #fafafa;">
        <iframe id="ScanUpload" scrolling="no" frameborder="0" style="width: 100%; height: 100%;">
        </iframe>
    </div>
</body>
</html>
