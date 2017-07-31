<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Placard.aspx.cs" Inherits="Web.Super.Sys.Placard" %>

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
   
    <script src="../Scripts/Placard.js" type="text/javascript" language="javascript"></script>
</head>
<body class="easyui-layout" scroll="no">
    <div region="north" title="通知公告查询" split="true" style="height: 85px; overflow: hidden;
        border: 0px;" border="false">
        <div style="padding-top: 15px; padding-left: 20px;">
            通知名称：
            <input type="text" class="easyui-validatebox" id="tPlacardTitle" style="width: 250px;"  missingmessage="通知名称必须填写" required="true"/>&nbsp;&nbsp;
            <a href="javascript:void(0)" id="btnQuery" class="easyui-linkbutton" iconcls="icon-search">
                搜索</a>&nbsp;&nbsp;&nbsp;&nbsp;<span style=" color:Blue;">(支持模糊查询)</span>
        </div>
    </div>
    <div region="center">
        <table id="tdg">
        </table>
    </div>
    <div id="newAdd" class="easyui-window" modal="true" collapsible="false" minimizable="false" maximizable="false"
        icon="icon-save" style="width: 560px; height: 480px; padding: 5px; background: #fafafa;">
        <form id="forms" runat="server">
        <table class="tb" border="0px" cellpadding="0" cellspacing="0">
            <tr>
                <td style="width: 80px" height="43">
                    通知名称<span style="color: Red;">*</span>
                </td>
                <td>
                    <input type="text" name="PlacardTitle" id="txtPlacardTitle" maxlength="100" class="easyui-validatebox"
                        style="width: 400px;" missingmessage="通知名称必须填写" required="true" />
                  
                </td>
            </tr>
            <tr>
                <td style="width: 80px" height="43">
                    通知内容<span style="color: Red;">*</span>
                </td>
                <td>
                    <textarea  id="txtPlacardContent" name="PlacardContent" 
                        style="width: 400px; height: 240px;" class="easyui-validatebox"
                        missingmessage="通知内容必须填写" required="true"></textarea>
                </td>
            </tr>
            <tr>
                <td height="43">
                    发布时间<span style="color: Red;">*</span>
                </td>
                <td>
                    <input type="text" id="txtReleaseTime" name="ReleaseTime" class="easyui-datetimebox" style="width: 200px;"
                        missingmessage="发布时间必须选择填写" required="required" />
                </td>
            </tr>
            <tr>
                <td height="43">
                    部门名称<span style="color: Red;">*</span>
                </td>
                <td>
                    <input type="text" id="txtDepName" name="DepName" class="easyui-validatebox" style="width: 200px;"
                        missingmessage="部门名称必须选择填写" required="true" value="南昌市农村综合产权中心" />
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
        <input id="txtNumClicks" name="NumClicks" type="hidden" value="0" />
        </form>
    </div>
</body>
</html>
