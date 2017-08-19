<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="News.aspx.cs" Inherits="Web.Super.WebMana.News" ValidateRequest="false" %>

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
        <script src="../../My97DatePicker/WdatePicker.js" type="text/javascript"
        language="javascript"></script>
   
    <script src="../Scripts/news.js" type="text/javascript" language="javascript"></script>
</head>
<body class="easyui-layout" style="overflow-y: hidden" scroll="no">

    <div region="north" title="新闻信息搜索" split="true" style="height: 65px; overflow: hidden;
        border: 0px;" border="false">
        <div style="padding-top: 5px; padding-left: 10px;">
            新闻类型：
            <select class="easyui-combobox" id="selNewsTypeId" style="width: 80px;">
            </select>
            新闻标题：
            <input type="text" id="selNewsTitle" class="easyui-textbox" style="width: 200px;"
                required="true" />
            审核状态：
            <select id="selIsCheck" class="easyui-combobox">
                <option value=""></option>
                <option value="0">未审核</option>
                <option value="1">审核通过</option>
            </select>
            <a href="javascript:void(0)" id="btnQuery" class="easyui-linkbutton" iconcls="icon-search">
                新闻搜索</a>
        </div>
    </div>
    <div region="center">
        <table id="tdg">
        </table>
    </div>
    <div id="newAdd" class="easyui-window" collapsible="false" minimizable="false" maximizable="false"
        icon="icon-save" style="width: 900px; height: 550px; padding: 5px; background: #fafafa;">
        <form id="forms" runat="server">
        <table class="table" border="0px" cellpadding="0" cellspacing="0">
            <tr>
                <td style="width: 200px" height="43">
                    新闻标题<span style="color: Red;">**</span>
                </td>
                <td>
                    <input type="text" name="NewsTitle" id="txtNewsTitle" maxlength="100" class="easyui-validatebox"
                        style="width: 500px;" required="true" />
                </td>
            </tr>
            <tr>
                <td height="43">
                    新闻类型<span style="color: Red;">**</span>
                </td>
                <td>
                    <select id="txtNewsTypeId" name="NewsTypeId" class="easyui-combobox" style="width: 200px;"
                        required="true">
                    </select>
                </td>
            </tr>
            <tr>
                <td height="43">
                    新闻副标题
                </td>
                <td>
                    <input type="text" name="NewsSubheading" id="txtNewsSubheading" class="txt" style="width: 500px;" />
                </td>
            </tr>
            <tr>
                <td height="43">
                    新闻来源
                </td>
                <td>
                    <input type="text" id="txtNewsSource" name="NewsSource" maxlength="50" value="" class="txt"
                        style="width: 500px;" />
                </td>
            </tr>
            <tr>
                <td height="43">
                    摘要
                </td>
                <td>
                    <input name="Content" type="text" id="txtContent" maxlength="50" class="txt" style="width: 500px;" />
                </td>
            </tr>
            <tr>
<td height="43">
                    时间
                </td>
                <td>
                    <input name="txtshijian" type="text" id="txtsj"  class="Wdate"  onClick="WdatePicker()" style="width: 180px;" />
                </td>
           
            </tr>
            <tr>
                <td height="43">
                    关键字
                </td>
                <td>
                    <input name="Keyword" type="text" id="txtKeyword" maxlength="50" class="txt" style="width: 500px;" />
                </td>
            </tr>
            <tr>
                <td height="43">
                    新闻图片
                </td>
                <td>
                    <input name="NewsImg" type="file" id="fileNewsImg" onchange="OnCheckImg('fileNewsImg');"
                        runat="server" style="width: 450px;" class="txt" />&nbsp;&nbsp;&nbsp;&nbsp;<a id="aNewsImg"
                            target="_blank"><span id="lblNewsImg"></span></a>
                </td>
            </tr>
            <tr>
                <td height="43">
                    新闻附件
                </td>
                <td>
                    <input name="NewsFile" type="file" id="fileNewsFile" onchange="OnCheckFile('fileNewsFile');"
                        runat="server" style="width: 450px;" class="txt" />&nbsp;&nbsp;&nbsp;&nbsp;<a id="aNewsFile"
                            target="_blank"><span id="lblNewsFile"></span></a>
                </td>
            </tr>
            <tr>
                <td>
                    新闻内容<span style="color: Red;">**</span>
                </td>
                <td>
                    <!--开始HTML编辑器-->
                    <textarea name="NewsContent" id="txtNewsContent" cols="10" rows="30" style="width: 700px;
                        visibility: hidden;"></textarea>
                    <!--结束-->
                </td>
            </tr>
            <tr>
                <td colspan="2" height="43">
                    <div style="text-align: left; padding-left: 30%; height: 30px; line-height: 30px;">
                        
                        <a id="btnAdd" class="easyui-linkbutton" icon="icon-ok" href="javascript:void(0)">添加</a>
                        <a id="btnEdit" class="easyui-linkbutton" icon="icon-ok" href="javascript:void(0)"
                            style="display: none">修改</a>&nbsp;&nbsp;&nbsp;&nbsp;<a id="btnCancel" class="easyui-linkbutton"
                                icon="icon-cancel" href="javascript:void(0)">取消</a>
                    </div>
                </td>
            </tr>
        </table>
        <input id="txtNewsImg" name="NewsImg" type="hidden" />
        <input id="txtNewsFile" name="NewsFile" type="hidden" />
        <input id="txtId" name="Id" type="hidden" value="0" />
        <input id="txtNumClicks" name="NumClicks" type="hidden" value="0" />       
       
    </div>
         </form>
    <div id="showById" class="easyui-window" title="查看详情" collapsible="false" minimizable="false"
        maximizable="false" icon="icon-save" style="width: 700px; height: 500px; padding: 5px;
        background: #fafafa;">
        <div id="lbltitle" style="text-align: center; font-size: 30px;">
        </div>
        <div id="lblnews">
        </div>
        <img id="imgImg" style="display: none;" />
    </div>

</body>
</html>
