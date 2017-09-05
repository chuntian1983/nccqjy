<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Contacts.aspx.cs" Inherits="Web.Super.Sys.Contacts" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../Scripts/easyUI/themes/default/easyui.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/default.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/tbcss.css" rel="stylesheet" type="text/css" />
    <link href="../Scripts/easyUI/themes/icon.css" rel="stylesheet" type="text/css" />
    <script src="../Scripts/easyUI/jquery.min.js" type="text/javascript" language="javascript"></script>
    <script src="../Scripts/easyUI/jquery.easyui.min.js" type="text/javascript" language="javascript"></script>
    <script src="../Scripts/easyUI/locale/easyui-lang-zh_CN.js" type="text/javascript"
        language="javascript"></script>
    <script src="../Scripts/Contacts.js" type="text/javascript" language="javascript"></script>
</head>
<body class="easyui-layout" scroll="no">
    <div region="north" title="通讯录查询" split="true" style="height: 85px; overflow: hidden;
        border: 0px;" border="false">
        <div style="padding-top: 15px; padding-left: 20px;">
            组织单位：
            <select class="easyui-combotree" id="txtOrganizationId" style="width: 150px;">
            </select>
        </div>
    </div>
    <div region="center">
        <table id="tdg">
        </table>
    </div>
    <div id="newAdd" class="easyui-window" modal="true" collapsible="false" minimizable="false"
        maximizable="false" icon="icon-save" style="width: 400px; height: 280px; padding: 5px;
        background: #fafafa;">
        <form id="forms" runat="server">
        <table class="tb" border="0px" cellpadding="0" cellspacing="0">
            <tr>
                <td style="width: 80px" height="43">
                    组织单位<span style="color: Red;">*</span>
                </td>
                <td>
                    <select name="FK_OrganizationId" id="txtFK_OrganizationId" maxlength="100" class="easyui-combotree"
                        style="width: 200px;" missingmessage="组织单位必须填写" required="true">
                    </select>
                </td>
            </tr>
            <tr>
                <td style="width: 80px" height="43">
                    职务<span style="color: Red;">*</span>
                </td>
                <td>
                    <input type="text" id="txtConsContent" name="ConsContent" style="width: 200px;" class="easyui-validatebox"
                        missingmessage="职务必须填写" required="true" />
                </td>
            </tr>
            <tr>
                <td height="43">
                    姓名<span style="color: Red;">*</span>
                </td>
                <td>
                    <input type="text" id="txtUserName" name="UserName" class="easyui-validatebox" style="width: 200px;"
                        missingmessage="姓名必须选择填写" required="true" />
                </td>
            </tr>
            <tr>
                <td height="43">
                    电话<span style="color: Red;">*</span>
                </td>
                <td>
                    <input type="text" id="txtUserTel" name="UserTel" class="easyui-validatebox" style="width: 200px;"
                        missingmessage="电话必须选择填写" required="true" />
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
        <input id="txtCreateDate" name="CreateDate" type="hidden" value="" />
        </form>
    </div>
</body>
</html>
