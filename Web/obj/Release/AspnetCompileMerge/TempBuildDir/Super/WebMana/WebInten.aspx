<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebInten.aspx.cs" Inherits="Web.Super.WebMana.WebInten" ValidateRequest="false" %>

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
    <script charset="utf-8" src="../Scripts/kindeditor/kindeditor-min.js" type="text/javascript"
        language="javascript"></script>
    <script src="../Scripts/WebInten.js" type="text/javascript" language="javascript"></script>
</head>
<body class="easyui-layout" style="overflow-y: hidden" scroll="no">
    <div region="north" title=" 意向转出/转入信息搜索" split="true" style="height: 65px; overflow: hidden;
        border: 0px;" border="false">
        <div style="padding-top: 5px; padding-left: 10px;">
            意向转出/转入类型：
            <select class="easyui-combobox" id="IntentionType" style="width: 100px;">
                <option value="1">意向受让信息</option>
                <option value="2">意向转让信息</option>
                <option value="3">抵押融资信息</option>
            </select>
            意向转出/转入标题：
            <input type="text" id="Title" class="easyui-textbox" style="width: 200px;" required="true" />
            <a href="javascript:void(0)" id="btnQuery" class="easyui-linkbutton" iconcls="icon-search">
                搜索</a>
        </div>
    </div>
    <div region="center">
        <table id="tdg">
        </table>
    </div>
    <div id="newAdd" class="easyui-window" collapsible="false" minimizable="false" maximizable="false"
        icon="icon-save" style="width: 750px; height: 500px; padding: 5px; background: #fafafa;">
        <form id="forms" runat="server">
        <table class="table" border="0px" cellpadding="0" cellspacing="0">
            <tr>
                <td style="width: 150px" height="35">
                    意向转出/转入标题<span style="color: Red;">**</span>
                </td>
                <td>
                    <input type="text" name="Title" id="txtTitle" maxlength="100" class="easyui-validatebox"
                        style="width: 500px;" required="true" />
                </td>
            </tr>
            <tr>
                <td height="35">
                    意向转出/转入类型<span style="color: Red;">**</span>
                </td>
                <td>
                    <select class="easyui-combobox" id="txtIntentionType" name="IntentionType" style="width: 120px;">
                        <option value="1">意向受让信息</option>
                        <option value="2">意向转让信息</option>
                        <option value="3">抵押融资信息</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td height="35">
                    开始时间<span style="color: Red;">**</span>
                </td>
                <td>
                    <input type="text" name="RegDate" id="txtRegDate" maxlength="100" class="easyui-datebox"
                        style="width: 100px;" required="true" />
                </td>
            </tr>
            <tr>
                <td height="35">
                    截止时间<span style="color: Red;">**</span>
                </td>
                <td>
                    <input type="text" name="EndDte" id="txtEndDte" maxlength="100" class="easyui-datebox"
                        style="width: 100px;" required="true" />
                </td>
            </tr>
            <tr>
                <td>
                    意向转出/转入内容<span style="color: Red;">**</span>
                </td>
                <td>
                    <!--开始HTML编辑器-->
                    <textarea name="Content" id="txtContent" cols="10" rows="15" style="width: 500px;
                        visibility: hidden;"></textarea>
                    <!--结束-->
                </td>
            </tr>
            <tr>
                <td colspan="2" height="35">
                    <div style="text-align: left; padding-left: 30%; height: 30px; line-height: 30px;">
                        <a id="btnEdit" class="easyui-linkbutton" icon="icon-ok" href="javascript:void(0)">修改</a>&nbsp;&nbsp;&nbsp;&nbsp;<a
                            id="btnCancel" class="easyui-linkbutton" icon="icon-cancel" href="javascript:void(0)">取消</a>
                    </div>
                </td>
            </tr>
        </table>
         <input id="txtId" name="Id" type="hidden" />
        <input id="txtClickNum" name="ClickNum" type="hidden" />
        <input id="txtCheckStatus" name="CheckStatus" type="hidden" />
        <input id="txtFK_WebUserVeriId" name="FK_WebUserVeriId" type="hidden" value="0" />
        </form>
    </div>
    <div id="showById" class="easyui-window" title="查看详情" collapsible="false" minimizable="false"
        maximizable="false" icon="icon-save" style="width: 700px; height: 500px; padding: 5px;
        background: #fafafa;">
        <div id="lbltitle" style="text-align: center; font-size: 30px;">
        </div>
        <div id="lblnews">
        </div>
    </div>
</body>
</html>
