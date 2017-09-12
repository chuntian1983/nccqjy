<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Arbi.aspx.cs" Inherits="Web.Super.Zc.Arbi" %>

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
    <script src="../Scripts/Arbi.js" type="text/javascript" language="javascript"></script>
    <style type="text/css">
        .tbtd
        {
            border-bottom: 1px solid #000;
        }
    </style>
</head>
<body class="easyui-layout" style="overflow-y: hidden" scroll="no">
    <div region="center">
        <table id="tdg">
        </table>
    </div>
    <div id="newAdd" class="easyui-window" modal="true" collapsible="false" minimizable="false"
        maximizable="false" icon="icon-save" style="width: 700px; height: 550px; padding: 5px;
        background: #fafafa;">
        <form id="forms" runat="server">
        <table width="600" border="0" cellpadding="0" cellspacing="0" align="center" class="contentText">
            <tr>
                <td>
                    标的名称：<select id="txtBidName" class="easyui-combotree" style="width: 200px;"></select>
                </td>
            </tr>
            <tr>
                <td height="25">
                    <strong>申请人</strong>
                </td>
            </tr>
            <tr>
                <td>
                    <table class="tb">
                        <tr>
                            <td width="100" height="25">
                                经济类型:
                            </td>
                            <td width="200">
                                <span id="lblAMemberTypeId"></span>
                            </td>
                            <td width="100">
                                姓名:
                            </td>
                            <td width="200">
                                <span id="lblAName"></span>
                            </td>
                        </tr>
                        <tr>
                            <td height="25">
                                住址:
                            </td>
                            <td>
                                <span id="lblAAddr"></span>
                            </td>
                            <td>
                                联系人:
                            </td>
                            <td>
                                <span id="lblAContact"></span>
                            </td>
                        </tr>
                        <tr>
                            <td height="25">
                                法人代表:
                            </td>
                            <td>
                                <span id="lblACorporate"></span>
                            </td>
                            <td>
                                身份证号码:
                            </td>
                            <td>
                                <span id="lblAIDCard"></span>
                            </td>
                        </tr>
                        <tr>
                            <td height="25">
                                联系电话:
                            </td>
                            <td>
                                <span id="lblATel"></span>
                            </td>
                            <td>
                                所有权人:
                            </td>
                            <td>
                                <span id="lblAOwner"></span>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <strong>被申请人</strong>
                </td>
            </tr>
            <tr>
                <td>
                    <table class="tb">
                        <tr>
                            <td width="100" height="25">
                                经济类型:
                            </td>
                            <td width="200">
                                <span id="lblBMemberTypeId"></span>
                            </td>
                            <td width="100">
                                姓名:
                            </td>
                            <td width="200">
                                <span id="lblBName"></span>
                            </td>
                        </tr>
                        <tr>
                            <td height="25">
                                住址:
                            </td>
                            <td>
                                <span id="lblBAddr"></span>
                            </td>
                            <td>
                                联系人:
                            </td>
                            <td>
                                <span id="lblBContact"></span>
                            </td>
                        </tr>
                        <tr>
                            <td height="25">
                                法人代表:
                            </td>
                            <td>
                                <span id="lblBCorporate"></span>
                            </td>
                            <td>
                                身份证号码:
                            </td>
                            <td>
                                <span id="lblBIDCard"></span>
                            </td>
                        </tr>
                        <tr>
                            <td height="25">
                                联系电话:
                            </td>
                            <td>
                                <span id="lblBTel"></span>
                            </td>
                            <td>
                                所有权人:
                            </td>
                            <td>
                                <span id="lblBOwner"></span>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <strong>事实和理由:</strong><br />
                    <textarea cols="90" rows="6" class="textbox" id="txtFact" name="Fact"></textarea>
                </td>
            </tr>
            <tr>
                <td>
                    <strong>仲裁请求:</strong>
                    <br />
                    <textarea cols="90" rows="6" class="textbox" name="Grounds" id="txtGrounds"></textarea><br />
                </td>
            </tr>
            <tr>
                <td>
                    <strong>处理结果:</strong>
                    <br />
                    <textarea cols="90" rows="6" name="Results" class="textbox" id="txtResults"></textarea><br />
                </td>
            </tr>
            <tr align="center">
                <td colspan="5" height="35">
                    <a id="btnAdd" class="easyui-linkbutton" icon="icon-ok" href="javascript:void(0)">添加</a>
                    <a id="btnEdit" class="easyui-linkbutton" icon="icon-ok" href="javascript:void(0)"
                        style="display: none">修改</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a id="btnCancel"
                            class="easyui-linkbutton" icon="icon-cancel" href="javascript:void(0)">取消</a>
                </td>
            </tr>
        </table>
        <input type="hidden" name="Id" id="txtId" />
        <input type="hidden" name="FK_BidId" id="txtFK_BidId" />
        <input type="hidden" name="FK_LiceId" id="txtFK_LiceId" />
        <input type="hidden" name="FK_TranId" id="txtFK_TranId" />
        </form>
    </div>
</body>
</html>
