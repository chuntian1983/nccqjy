<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AttAuditReport.aspx.cs" Inherits="Web.Super.Bi.AttAuditReport" %>

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
    <script src="../Scripts/AttAuditReport.js" type="text/javascript" language="javascript"></script>
</head>
<body class="easyui-layout">
    <div region="north" title="出让标信息列表" split="true" style="height: 415px; border: 0px;"
        border="false">
        &nbsp;&nbsp;标的名称：
        <input type="text" id="tBidName" class="easyui-textbox" style="width: 300px;" required="true" />
        <a href="javascript:void(0)" id="btnQuery" class="easyui-linkbutton" iconcls="icon-search">
            搜索</a>&nbsp;&nbsp;&nbsp;&nbsp;<span style="color: Blue;">(支持模糊查询)</span>
        <table id="tdg">
        </table>
    </div>
    <div id="west" region="west" title="退回审核信息" style="width: 45%;">
        <table id="BidInfo">
        </table>
    </div>
    <div id="center" region="center" title="审核意见" style="width: 25%;">
        <span id="lblProcess"></span>
    </div>
    <div id="east" region="east" title="附件信息" style="width: 30%;">
        <table id="Scan">
        </table>
    </div>  
    <div id="ScanImg" title="附件查看" class="easyui-window" modal="true" collapsible="false"
        minimizable="false" maximizable="false" icon="icon-save" style="width: 700px;
        height: 480px; padding: 5px; background: #fafafa;">
        <iframe id="showScanImg" scrolling="no" frameborder="0" style="width: 100%; height: 100%;">
        </iframe>
    </div>
    <div id="addCheck" title="审核意见" class="easyui-window" collapsible="false" minimizable="false" closable="true"
        maximizable="false" icon="icon-save" modal="true" closable="false" style="width: 400px;
        height: 160px; padding: 5px; background: #fafafa;">
        <table>
            <tr>
                <td>
                    <textarea id="txtSay" name="Say" style="width: 350px; height: 70px;" class="easyui-validatebox"
                        missingmessage="必须填写" required="true"></textarea>
                </td>
            </tr>
            <tr align="center">
                <td>
                    <a href="javascript:void(0)" id="btnCheckAdd" class="easyui-linkbutton" icon="icon-ok">
                        审核</a>
                </td>
            </tr>
        </table>
    </div>
    <div id="newAdd" title="出让标详细信息" class="easyui-window" modal="true" collapsible="false"
        minimizable="false" maximizable="false" icon="icon-save" style="width: 680px;
        height: 420px; padding: 5px; background: #fafafa;">
        <form id="forms" runat="server">
        <table border="0" class="table" cellpadding="0" cellspacing="0" width="625">
            <tr>
                <td align="right" height="35" colspan="5">
                    项目编号：HJNS<span id="lblAdmissibility"></span>&nbsp;&nbsp;&nbsp;&nbsp;
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center" height="35">
                    组织单位
                </td>
                <td colspan="3">
                    <span id="txtOrgCode"></span>
                </td>
            </tr>
            <tr>
                <td height="132" rowspan="6" width="35" align="center">
                    出<br />
                    让<br />
                    方<br />
                    基<br />
                    本<br />
                    情<br />
                    况
                </td>
                <td width="130" height="35" align="center">
                    出让方名称
                </td>
                <td colspan="3">
                    <span id="txtFK_LiceTranId"></span>
                </td>
            </tr>
            <tr>
                <td height="35" align="center">
                    住址
                </td>
                <td colspan="3">
                    <span id="lblAddr"></span>
                </td>
            </tr>
            <tr>
                <td height="35" align="center">
                    经济类型
                </td>
                <td width="169">
                    <span id="lblMemberTypeId"></span>
                </td>
                <td width="123" align="center">
                    法定代表人
                </td>
                <td width="168">
                    <span id="lblCorporate"></span>
                </td>
            </tr>
            <tr>
                <td height="35" align="center">
                    联系人
                </td>
                <td width="169">
                    <span id="lblContact"></span>
                </td>
                <td width="123" align="center">
                    所有权人
                </td>
                <td width="168">
                    <span id="lblOwner"></span>
                </td>
            </tr>
            <tr>
                <td height="35" align="center">
                    联系电话
                </td>
                <td>
                    <span id="lblTel"></span>
                </td>
                <td align="center">
                    身份证号码
                </td>
                <td>
                    <span id="lblIDCard"></span>
                </td>
            </tr>
            <tr>
                <td height="35" align="center">
                    注册资本
                </td>
                <td>
                    <span id="lblCapital"></span>
                </td>
                <td align="center">
                    组织机构代码
                </td>
                <td>
                    <span id="lblOrganizationCode"></span>
                </td>
            </tr>
            <tr>
                <td height="399" rowspan="10" width="35" align="center">
                    标<br />
                    的<br />
                    基<br />
                    本<br />
                    情<br />
                    况
                </td>
                <td height="35" align="center">
                    转出标的名称
                </td>
                <td colspan="3">
                    <span id="txtBidName"></span>
                </td>
            </tr>
            <tr>
                <td height="35" align="center">
                    挂牌价格
                </td>
                <td colspan="3">
                    <span id="txtListingPrice"></span>
                </td>
            </tr>
            <tr>
                <td height="35" align="center">
                    拟转出期限
                </td>
                <td colspan="3">
                    起 <span id="txtStartDate"></span>至 <span id="txtEndDate"></span>止
                </td>
            </tr>
            <tr>
                <td height="135" width="130" align="center">
                    标&nbsp;&nbsp;的<br />
                    <br />
                    基&nbsp;&nbsp;本<br />
                    <br />
                    情&nbsp;&nbsp;况
                </td>
                <td colspan="3" valign="top">
                    <span id="txtBidBasic"></span>
                </td>
            </tr>
            <tr>
                <td height="35" align="center">
                    产权类型
                </td>
                <td>
                    <span id="txtProperties"></span>
                </td>
                <td align="center">
                    权属
                </td>
                <td>
                    <span id="txtOwnership"></span>
                </td>
            </tr>
            <tr>
                <td height="35" align="center">
                    转出方式
                </td>
                <td>
                    <span id="txtTurnOut"></span>
                </td>
                <td align="center">
                    权证编号
                </td>
                <td>
                    <span id="txtWarrantNumber"></span>
                </td>
            </tr>
            <tr>
                <td height="35" align="center">
                    确权机构
                </td>
                <td>
                    <span id="txtRightsBodies"></span>
                </td>
                <td align="center">
                    转出批准机构
                </td>
                <td>
                    <span id="txtFeedingMechanism"></span>
                </td>
            </tr>
            <tr>
                <td height="35" align="center">
                    交易方式
                </td>
                <td>
                    <span id="txtStandardMode"></span>
                </td>
                <td align="center">
                    交易低价
                </td>
                <td>
                    <span id="txtLowTransaction"></span>
                </td>
            </tr>
            <tr>
                <td height="35" align="center">
                    成交金额
                </td>
                <td>
                    <span id="txtTurnover"></span>
                </td>
                <td align="center">
                    涉及农户数
                </td>
                <td>
                    <span id="txtRelatesNum"></span>
                </td>
            </tr>
            <tr>
                <td height="35" align="center">
                    挂牌方式
                </td>
                <td>
                    <span id="txtStandardType"></span>
                </td>
                <td align="center">
                    公示期
                </td>
                <td>
                    <span id="txtPublicity"></span>天
                </td>
            </tr>
            <tr>
                <td align="center" colspan="2" height="35">
                    交易中心名称
                </td>
                <td colspan="3">
                    <span id="txtTradingCenterName"></span>
                </td>
            </tr>
        </table>
        </form>
    </div>
    <div id="BidPla" title="招标公告" class="easyui-window" modal="true" collapsible="false"
        minimizable="false" maximizable="false" icon="icon-save" style="width: 680px;
        height: 360px; padding: 5px; background: #fafafa;">
        <table>
            <tr>
                <td>
                    公告名称
                </td>
                <td>
                    <input type="text" id="txtBidPlacardTitle" name="BidPlacardTitle" class="easyui-validatebox"
                        missingmessage="必须填写" required="true" style="width: 500px;" />
                </td>
            </tr>
            <tr>
                <td>
                    公告内容
                </td>
                <td>
                    <textarea id="txtBidPlacardContent" name="BidPlacardContent" style="width: 500px;
                        height: 250px;" class="easyui-validatebox" missingmessage="必须填写" required="true"></textarea>
                </td>
            </tr>
            <tr align="center">
                <td colspan="2">
                    <%--<a id="btnAdd" class="easyui-linkbutton" icon="icon-ok" href="javascript:void(0)">添加</a>
                    <a id="btnEdit" class="easyui-linkbutton" icon="icon-ok" href="javascript:void(0)"
                        style="display: none">修改</a>--%>
                </td>
            </tr>
        </table>
        <input type="hidden" id="txtId" name="Id" />
    </div>
    <div id="ReturnInfo" title="退回审核原因" class="easyui-window" collapsible="false" minimizable="false"
        maximizable="false" icon="icon-save" modal="true" closable="true" style="width: 400px;
        height: 160px; padding: 5px; background: #fafafa;">
        <table>
            <tr>
                <td>
                    <textarea id="txtReturnDepaSay" name="ReturnDepaSay" style="width: 350px; height: 70px;"
                        class="easyui-validatebox" missingmessage="必须填写" required="true"></textarea>
                </td>
            </tr>
            <tr align="center">
                <td>
                    <a href="javascript:void(0)" id="btnRetuen" class="easyui-linkbutton" icon="icon-ok">
                        退回</a>
                </td>
            </tr>
        </table>
    </div>
    <div id="BidTrans" title="意向受让方信息" class="easyui-window" collapsible="false" minimizable="false"
        maximizable="false" style="width: 800px; height: 200px; padding: 5px; background: #fafafa;">
        <table id="BidTra">
        </table>
    </div>
    <div id="BidScan" title="标成交附件" class="easyui-window" collapsible="false" minimizable="false"
        maximizable="false" style="width: 500px; height: 400px; padding: 5px; background: #fafafa;">
        <iframe name="BidScanPage" id="BidScanPage" scrolling="no" frameborder="0" style="width: 100%;
            height: 100%;"></iframe>
    </div>
    <div id="BidAuct" title="竞价单" class="easyui-window" collapsible="false" minimizable="false"
        maximizable="false" style="width: 550px; height: 450px; padding: 5px; background: #fafafa;">
        <table id="BidAuctList" border="0" class="table" cellpadding="0" cellspacing="0"
            toolbar="#tb">
        </table>
    </div>
      <div id="WinBidContractScan" title="合同附件" class="easyui-window" collapsible="false" minimizable="false"
        maximizable="false" style="width: 500px; height: 400px; padding: 5px; background: #fafafa;">
        <iframe id="BidContractScanPage" scrolling="no" frameborder="0" style="width: 100%;
            height: 100%;"></iframe>
    </div>
</body>
</html>
