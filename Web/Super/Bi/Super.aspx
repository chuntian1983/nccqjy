<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Super.aspx.cs" Inherits="Web.Super.Bi.Super" %>

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
<%--    <script src="../Scripts/Super.js" type="text/javascript" language="javascript"></script>--%>
    <script type="text/javascript">
        function msgShow(title, msgString, msgType) {
            $.messager.alert(title, msgString, msgType);
        };

        function slide(_title, _msg) {
            $.messager.show({
                title: _title,
                msg: _msg,
                timeout: 3500,
                showType: 'slide'
            });
        };
        jQuery(function ($) {
            GridView();
            $('#newAdd').window('close');
            $('#addCheck').window('close');
            $('#ReturnInfo').window('close');
        });
        function GridView() {
            $('#tdg').datagrid({
                height: 350,
                nowrap: true,
                striped: true,
                url: '../Ashx/BidH.ashx?' + $.param({ action: "super", DepaStatus: 6 }),
                remoteSort: false,
                sortName: 'Id',
                singleSelect: true,
                sortOrder: 'desc',
                fitColumns: false,
                rownumbers: true,
                fit: false,
                onDblClickRow: function (rowIndex, rowData) {
                    OnProcessClick(rowData.Id);
                    OnBidInfoGridView(rowData.Id);
                },
                frozenColumns: [[
{ field: 'Id', title: '序号', width: 50, align: 'left', sortable: true },
{ field: 'OrgCode', title: '组织单位', width: 80, align: 'left', sortable: true },
{ field: 'oCode', title: '组织单位代码', width: 80, align: 'left', sortable: true, hidden: true },
{ field: 'FK_LiceTranId', title: '编号', width: 80, align: 'left', sortable: true, hidden: true },
{ field: 'LiceTran', title: '出让方姓名', width: 80, align: 'left', sortable: true },
{ field: 'BidName', title: '标的名称', width: 80, align: 'left', sortable: true },
{ field: 'ReturnStatus', title: '状态', width: 80, align: 'left', sortable: true, formatter: function (value, row, index) { return row.ReturnStatus == 0 ? "<span style='color:blue;'>正常</span>" : "<span style='color:red;'>撤回<span>"; } }
]], columns: [[
{ field: 'ListingPrice', title: '挂牌价格', width: 80, align: 'left', sortable: true },
{ field: 'StartDate', title: '转出开始时间', width: 80, align: 'left', sortable: true },
{ field: 'EndDate', title: '转出结束时间', width: 80, align: 'left', sortable: true },
{ field: 'Ownership', title: '权属', width: 80, align: 'left', sortable: true },
{ field: 'Properties', title: '性质', width: 50, align: 'left', sortable: true },
{ field: 'TurnOut', title: '转出方式', width: 50, align: 'left', sortable: true },
{ field: 'RightsBodies', title: '确权机构', width: 50, align: 'left', sortable: true },
{ field: 'FeedingMechanism', title: '转出批准机构', width: 80, align: 'left', sortable: true },
{ field: 'WarrantNumber', title: '权证编号', width: 80, align: 'left', sortable: true },
{ field: 'StandardMode', title: '交易方式', width: 80, align: 'left', sortable: true },
{ field: 'TradingCenterName', title: '交易中心名称', width: 80, align: 'left', sortable: true },
{ field: 'RelatesNum', title: '涉及农户数', width: 80, align: 'left', sortable: true },
{ field: 'Publicity', title: '公示期', width: 80, align: 'left', sortable: true },
{ field: 'UpManager', title: '上级审核', width: 80, align: 'left', sortable: true, hidden: true },
{ field: 'DepaStatusId', title: '分管部门编号', width: 80, align: 'left', sortable: true, hidden: true },
{ field: 'DepaStatus', title: '分管部门', width: 80, align: 'left', sortable: true }
]],
                toolbar: [{
                    id: 'btnundo',
                    text: '退回审核',
                    iconCls: 'icon-undo',
                    handler: function () {
                        $('#ReturnInfo').window('open');
                    }
                }, '-', {
                    id: 'btnstate',
                    text: '通过审核',
                    iconCls: 'icon-filter',
                    handler: function () {
                        var rows = $('#tdg').datagrid('getSelections');
                        if (rows.length > 0) {
                            $('#addCheck').window('open');
                            $("#txtSay").val("审核通过");
                        }
                        else {
                            msgShow("提示", "您还没有选中要更改的列信息？", "question");
                        }
                    }
                }, '-', {
                    id: 'btnok',
                    text: '详细信息',
                    iconCls: 'icon-ok',
                    handler: function () {
                        var rows = $('#tdg').datagrid('getSelections');
                        if (rows.length > 0) {
                            $('#newAdd').window('open');
                            $.get("../Ashx/BidH.ashx?action=byId", { Id: rows[0].Id }, function (data) {
                                $("#lblAddr").text(data.T[0].Addr);
                                $("#lblMemberTypeId").text(data.T[0].TypeCertificationName);
                                $("#lblCorporate").text(data.T[0].Corporate);
                                $("#lblTel").text(data.T[0].Tel);
                                $("#lblContact").text(data.T[0].Contact);
                                $("#lblOwner").text(data.T[0].Owner);
                                $("#lblCapital").text(data.T[0].Capital);
                                $("#lblOrganizationCode").text(data.T[0].OrganizationCode);
                                $("#lblIDCard").text(data.T[0].IDCard);
                                $("#txtFK_LiceTranId").text(data.T[0].Name);
                                $("#txtOrgCode").text(data.T[0].OrgCode);
                                $("#txtBidName").text(data.T[0].BidName);
                                $("#lblAdmissibility").text(data.T[0].Admissibility);
                                $("#txtListingPrice").text(data.T[0].ListingPrice);
                                $("#txtStartDate").text(data.T[0].StartDate.substring(0, 10));
                                $("#txtEndDate").text(data.T[0].EndDate.substring(0, 10));
                                $("#txtProperties").text(data.T[0].Properties);
                                $("#txtOwnership").text(data.T[0].Ownership);
                                $("#txtBidBasic").text(data.T[0].BidBasic);
                                $("#txtTurnOut").text(data.T[0].TurnOut);
                                $("#txtWarrantNumber").text(data.T[0].WarrantNumber);
                                $("#txtRightsBodies").text(data.T[0].RightsBodies);
                                $("#txtFeedingMechanism").text(data.T[0].FeedingMechanism);
                                $("#txtStandardMode").text(data.T[0].StandardMode);
                                $("#txtRelatesNum").text(data.T[0].RelatesNum);
                                $("#txtStandardType").text(data.T[0].StandardType);
                                $("#txtPublicity").text(data.T[0].Publicity);
                                $("#txtTradingCenterName").text(data.T[0].TradingCenterName);
                            }, "json");
                        } else {
                            msgShow("提示", "您还没有选中要查看的列信息？", "question");
                        }
                    }
                }, '-'
],
                pagination: true,
                pageSize: 10
            });
            var p = $('#tdg').datagrid('getPager');
            $(p).pagination({
                onBeforeRefresh: function () {
                }
            });
        };
        jQuery(function ($) {
            $("#btnCheckAdd").click(function () {
                if ("" != $("#txtSay").val()) {
                    $.get("../Ashx/TranPro.ashx?action=add", { AcceptSay: $("#txtSay").val(), BidId: $('#tdg').datagrid('getSelections')[0].Id, UpManager: $('#tdg').datagrid('getSelections')[0].UpManager, OrgCode: $('#tdg').datagrid('getSelections')[0].oCode, DepaStatusId: $('#tdg').datagrid('getSelections')[0].DepaStatusId }, function (data) {
                        msgShow("提示", data, "info");
                        $('#addCheck').window('close');
                        $("#txtSay").val("");
                        $('#tdg').datagrid('reload');
                        $('#tdg').datagrid('clearSelections');
                    }, "text");
                }
                else {
                    msgShow("提示", "审核意见还没有填写！", "info");
                }
            });
        });
        jQuery(function ($) {
            $("#btnQuery").click(function () {
                var tBidName = $("#tBidName").textbox('getValue');
                var url = '../Ashx/BidH.ashx?' + $.param({ action: "pagingA", BidName: tBidName, DepaStatus: 1, StandardMode: 1 });
                $('#tdg').datagrid({ url: url });
                $('#tdg').datagrid('reload');
            });
        });
        function OnProcessClick(par) {
            $.get("../Ashx/TranPro.ashx?action=by", { BidId: par }, function (data) {
                var vt = "";
                data.AcceptDate != null ? vt += "<p style=''>受理时间：" + data.AcceptDate.replace('T', ' ') + "&nbsp;&nbsp;<br/>" : vt += "<p>受理时间：&nbsp;&nbsp;<br/>";
                vt += "受理人姓名：" + data.AcceptName + "&nbsp;&nbsp;<br/>";
                vt += "受理意见：" + data.AcceptSay + "&nbsp;&nbsp;<br/>";
                data.AcceptSayDate != null ? vt += "受理意见时间：" + data.AcceptSayDate.replace('T', ' ') + "<hr/></p>" : vt += "受理意见时间：<hr/></p>";
                data.AuditDate != null ? vt += "<p>审核受理时间：" + data.AuditDate.replace('T', ' ') + "&nbsp;&nbsp;<br/>" : vt += "<p>审核受理时间：&nbsp;&nbsp;<br/>";
                vt += "审核人姓名：" + data.AuditName + "&nbsp;&nbsp;<br/>";
                vt += "审核挂牌意见：" + data.AuditSay + "&nbsp;&nbsp;<br/>";
                data.AuditSayDate != null ? vt += "审核意见时间：" + data.AuditSayDate.replace('T', ' ') + "<hr/></p>" : vt += "审核意见时间：<hr/></p>";
                data.TradingDate != null ? vt += "<p>交易受理时间：" + data.TradingDate.replace('T', ' ') + "&nbsp;&nbsp;<br/>" : vt += "<p>交易受理时间：&nbsp;&nbsp;<br/>";
                vt += "交易受理姓名：" + data.TradingName + "&nbsp;&nbsp;<br/>";
                vt += "交易受理意见：" + data.TradingSay + "&nbsp;&nbsp;<br/>";
                data.TradingSayDate != null ? vt += "交易意见时间：" + data.TradingSayDate.replace('T', ' ') + "<hr/></p>" : vt += "交易意见时间：<hr/></p>";

                data.AttestationDate != null ? vt += "<p>鉴证受理时间：" + data.AttestationDate.replace('T', ' ') + "&nbsp;&nbsp;<br/>" : vt += "<p>鉴证受理时间：&nbsp;&nbsp;<br/>";
                vt += "鉴证受理姓名：" + data.AttestationName + "&nbsp;&nbsp;<br/>";
                vt += "鉴证受理意见：" + data.AttestationSay + "&nbsp;&nbsp;<br/>";
                data.AttestationSayDate != null ? vt += "鉴证意见时间：" + data.AttestationSayDate.replace('T', ' ') + "<hr/></p>" : vt += "鉴证意见时间：<hr/></p>";
                data.HeadDate != null ? vt += "<p>分管受理时间：" + data.HeadDate.replace('T', ' ') + "&nbsp;&nbsp;<br/>" : vt += "<p>分管受理时间：&nbsp;&nbsp;<br/>"
                vt += "分管受理姓名：" + data.HeadName + "&nbsp;&nbsp;<br/>";
                vt += "分管受理意见：" + data.HeadSay + "&nbsp;&nbsp;<br/>";
                data.HeadSayDate != null ?
        vt += "分管意见时间：" + data.HeadSayDate.replace('T', ' ') + "<hr/></p>" : vt += "分管意见时间：<hr/></p>";
                data.SuperDate != null ?
        vt += "<p>主管受理时间：" + data.SuperDate.replace('T', ' ') + "&nbsp;&nbsp;<br/>" : vt += "<p>主管受理时间：&nbsp;&nbsp;<br/>";
                vt += "主管受理姓名：" + data.SuperName + "&nbsp;&nbsp;<br/>";
                vt += "主管受理意见：" + data.SuperSay + "&nbsp;&nbsp;<br/>";
                data.SuperSayDate != null ?
        vt += "主管意见时间：" + data.SuperSayDate.replace('T', ' ') + "</p>" : vt += "主管意见时间：</p>";
                $("#lblProcess").html(vt);
            }, "json");
        };
        jQuery(function ($) {
            $("#btnRetuen").click(function () {
                if ("" != $("#txtReturnDepaSay").val()) {
                    $.get("../Ashx/BidInfo.ashx?action=add", { ReturnDepaSay: $("#txtReturnDepaSay").val(), FK_BidId: $('#tdg').datagrid('getSelections')[0].Id, UpManager: $('#tdg').datagrid('getSelections')[0].UpManager, OrgCode: $('#tdg').datagrid('getSelections')[0].oCode, DepaStatusId: $('#tdg').datagrid('getSelections')[0].DepaStatusId }, function (data) {
                        msgShow("提示", data, "info");
                        $('#ReturnInfo').window('close');
                        $("#txtReturnDepaSay").val("");
                        $('#tdg').datagrid('reload');
                        $('#tdg').datagrid('clearSelections');
                    }, "text");
                }
                else {
                    msgShow("提示", "审核意见还没有填写！", "info");
                }
            });
        });
        function OnBidInfoGridView(par) {
            $('#BidInfo').datagrid({
                nowrap: true,
                striped: true,
                url: '../Ashx/BidInfo.ashx?' + $.param({ action: "paging", BidId: par }),
                remoteSort: false,
                sortName: 'Id',
                singleSelect: true,
                sortOrder: 'desc',
                fit: true,
                fitColumns: true,
                rownumbers: true,
                columns: [[
            { field: 'Id', title: '编号', width: 30, align: 'left', sortable: true },
            { field: 'FK_JobId', title: '部门名称', width: 80, align: 'left', sortable: true },
            { field: 'ReturnDepaName', title: '撤回人', width: 80, align: 'left', sortable: true },
            { field: 'ReturnDepaSay', title: '撤回意见', width: 150, align: 'left', sortable: true },
            { field: 'ReturnDate', title: '撤回时间', width: 80, align: 'left', sortable: true }
        ]]
            });
            var p = $('#BidInfo').datagrid('getPager');
            $(p).pagination({
                onBeforeRefresh: function () {
                }
            });
        };
    </script>
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
    <div id="west" region="west" title="退回审核信息" style="width: 50%;">
        <table id="BidInfo">
        </table>
    </div>
    <div id="center" region="center" title="审核意见" style="width: 50%;">
        <span id="lblProcess"></span>
    </div>
    <div id="addCheck" title="审核意见" class="easyui-window" collapsible="false" minimizable="false"
        maximizable="false" icon="icon-save" modal="true" closable="true" style="width: 400px;
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
</body>
</html>

