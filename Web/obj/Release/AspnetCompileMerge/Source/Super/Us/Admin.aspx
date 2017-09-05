<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="Web.Super.Us.Admin" %>

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
   
    <script src="../Scripts/admin.js" type="text/javascript" language="javascript"></script>
</head>
<body class="easyui-layout" style="overflow-y: hidden" scroll="no">
    <div region="north" title="管理员信息搜索" split="true" style="height: 65px; overflow: hidden;
        border: 0px;" border="false">
        &nbsp;&nbsp;登录账号：
        <input type="text" id="txt_AdminLogName" class="easyui-textbox" style="width: 300px;"
            required="true" />
        <a href="javascript:void(0)" id="btnQuery" class="easyui-linkbutton" iconcls="icon-search">
            管理员账号搜索</a>
    </div>
    <div region="center">
        <table id="tdg">
        </table>
    </div>
    <div id="newAdd" class="easyui-window" modal="true" collapsible="false" minimizable="false"
        maximizable="false" icon="icon-save" style="width: 400px; height: 500px; padding: 5px;
        background: #fafafa;">
        <form id="forms" runat="server">
        <table class="tb" border="0px" cellpadding="0" cellspacing="0">
            <tr>
                <td style="width: 80px" height="43">
                    登录账号<span style="color: Red;">*</span>
                </td>
                <td>
                    <input type="text" name="AdminLogName" id="txtAdminLogName" maxlength="100" class="easyui-validatebox"
                        style="width: 200px;" missingmessage="登录账号必须填写" data-options="required:true,validType:'length[4,10]'" />
                </td>
            </tr>
            <tr>
                <td style="width: 80px" height="43">
                    登录密码<span style="color: Red;">*</span>
                </td>
                <td>
                    <input id="txtAdminLogPass" type="password" name="AdminLogPass" style="width: 200px;"
                        class="easyui-validatebox" missingmessage="登录密码必须填写" data-options="required:true,validType:'length[6,20]'" />
                </td>
            </tr>
            <tr>
                <td height="43">
                    职务<span style="color: Red;">*</span>
                </td>
                <td>
                    <select id="txtJobId" name="JobId" class="easyui-combobox" style="width: 200px;"
                        missingmessage="职务必须选择填写" required="true">
                    </select>
                </td>
            </tr>
            <tr>
                <td height="43">
                    管理员类型<span style="color: Red;">*</span>
                </td>
                <td>
                    <select id="txtAdminTypeId" name="AdminTypeId" class="easyui-combobox" style="width: 200px;"
                        missingmessage="管理员类型必须选择填写" required="true">
                    </select>
                </td>
            </tr>
            <tr>
                <td height="43">
                    单位代码<span style="color: Red;">*</span>
                </td>
                <td>
                    <select id="txtOrgCode" name="OrgCode" class="easyui-combobox" style="width: 200px;"
                        missingmessage="单位代码必须选择填写" required="true">
                    </select>
                </td>
            </tr>
            <tr>
                <td style="width: 80px" height="43">
                    姓名
                </td>
                <td>
                    <input id="txtAdminName" name="AdminName" class="easyui-textbox" style="width: 200px;"  missingmessage="必须填写" required="true"/>
                </td>
            </tr>
            <tr>
                <td height="43">
                    电话
                </td>
                <td>
                    <input type="text" name="AdminTel" id="txtAdminTel" class="easyui-textbox" style="width: 200px;"  missingmessage="必须填写" required="true"/>
                </td>
            </tr>
            <tr>
                <td height="43">
                    登录状态
                </td>
                <td>
                    <select name="AdminState" id="txtAdminState" class="easyui-combobox" style="width: 200px;">
                        <option value="1">正常使用</option>
                        <option value="0">禁止登录</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td height="43">
                    审核权限
                </td>
                <td>
                    <select name="IsCheck" id="txtIsCheck" class="easyui-combobox" style="width: 200px;">
                        <option value="0">平级审核</option>
                        <option value="1">越级审核</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td colspan="2" height="43">
                    <div style="text-align: left; padding-left: 100px; height: 30px; line-height: 30px;">
                        <a id="btnAdd" class="easyui-linkbutton" icon="icon-ok" href="javascript:void(0)">添加</a>
                        <a id="btnEdit" class="easyui-linkbutton" icon="icon-ok" href="javascript:void(0)"
                            style="display: none">修改</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a id="btnCancel"
                                class="easyui-linkbutton" icon="icon-cancel" href="javascript:void(0)">取消</a>
                    </div>
                </td>
            </tr>
        </table>
        <input id="txtId" name="Id" type="hidden" value="0" />
        <input id="txtAdminLogNum" name="AdminLogNum" type="hidden" value="0" />
        <input id="txtEndDate" name="EndDate" type="hidden" value="0" />
        <input id="txtEditor" name="Editor" type="hidden" value="0" />
        <input id="txtCreateDate" name="CreateDate" type="hidden" value="0" />
        </form>
    </div>
</body>
</html>
