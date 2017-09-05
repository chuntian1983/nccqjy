jQuery(function ($) {
    GridView();
    $('#newAdd').window('close');
    $('#ScanImg').window('close');
    $('#BidAuct').window('close');
});
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
    $("#txtOrgCode").combotree({
        url: '../Handler/CommH.ashx?action=tree',
        lines: true,
        required: true,
        onSelect: function (rec) {
            OnLoadLiceOrTran(rec.id);
            OnLoadBid(rec.id);
        }
    });
});
function OnLoadLiceOrTran(par) {
    $("#txtFK_LiceTranId").combotree({
        url: '../Handler/WebLiTrH.ashx?' + $.param({ action: "ltcombo", LiceTranId: 2 }),
        lines: true,
        required: true,
        onSelect: function (rec) {
            OnShowLiceTran(rec.id);
        }
    });
};
function OnShowLiceTran(par) {
    $.get("../Handler/WebLiTrH.ashx?action=byId", { Id: par }, function (data) {
        $("#lblAddr").text(data.T[0].Addr);
        $("#lblMemberTypeId").text(data.T[0].MemberTypeId);
        $("#lblCorporate").text(data.T[0].Corporate);
        $("#lblTel").text(data.T[0].Tel);
        $("#lblIDCard").text(data.T[0].IDCard);
        $("#lblCapital").text(data.T[0].Capital);
        $("#lblContact").text(data.T[0].Contact);
        $("#lblOwner").text(data.T[0].Owner);
        $("#lblOrganizationCode").text(data.T[0].OrganizationCode);
    }, "json");
};
function OnLoadBid(par) {
    $("#txtFK_BidId").combotree({
        url: '../Handler/WebBidH.ashx?' + $.param({ action: "combo", OrgCode: par }),
        lines: true,
        required: true,
        onSelect: function (rec) {
            OnShowBid(rec.id);
        }
    });
};
function OnShowBid(id) {
    $.get("../Handler/WebBidH.ashx?action=byId", { Id: id }, function (data) {      
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
};
jQuery(function ($) {
    $("#btnEdit").click(function () {
        $('#forms').form('submit', {
            url: '../Handler/WebBTransH.ashx?action=up',
            async: false,
            onSubmit: function () {
                return $(this).form('validate');
            },
            success: function (data) {
                msgShow("提示", data, "info");
            }
        });
        OnEmptyTextClick();
        $('#newAdd').window('close');
        $('#tdg').datagrid('reload');
    });
});
jQuery(function ($) {
    $("#btnAdd").click(function () {
        $('#forms').form('submit', {
            url: '../Handler/WebBTransH.ashx?action=add',
            async: false,
            onSubmit: function () {
                return $(this).form('validate');
            },
            success: function (data) {
                msgShow("提示", data, "info");
            }
        });
        OnEmptyTextClick();
        $('#newAdd').window('close');
        $('#tdg').datagrid('reload');
    });
});
jQuery(function ($) {
    $("#btnCancel").click(function () {
        OnEmptyTextClick();
        $('#newAdd').window('close');
        $('#tdg').datagrid('reload');
    });
});
function OnEmptyTextClick() {
    $("#txtId").val("");
    $("#txtTradingStatus").val("");
    $("#lblAddr").text("");
    $("#lblMemberTypeId").text("");
    $("#lblCorporate").text("");
    $("#lblTel").text("");
    $("#lblIDCard").text("");
    $("#lblCapital").text("");
    $("#lblOrganizationCode").text("");
    $("#txtListingPrice").text("");
    $("#txtStartDate").text("");
    $("#txtEndDate").text("");
    $("#txtBidBasic").text("");
    $("#txtProperties").text("");
    $("#txtOwnership").text("");
    $("#txtTurnOut").text("");
    $("#txtWarrantNumber").text("");
    $("#txtRightsBodies").text("");
    $("#txtFeedingMechanism").text("");
    $("#txtStandardMode").text("");
    $("#txtRelatesNum").text("");
    $("#txtStandardType").text("");
    $("#txtPublicity").text("");
    $("#txtTradingCenterName").text("");
    $("#lblContact").text("");
    $("#lblOwner").text("");
};
var iCount;
function GridView() {
    $('#tdg').datagrid({
        nowrap: true,
        striped: true,
        url: '../Handler/WebBTransH.ashx?' + $.param({ action: "paging" }),
        remoteSort: false,
        sortName: 'Id',
        singleSelect: true,
        sortOrder: 'desc',
        fitColumns: false,
        rownumbers: true,
        fit: true,
        onDblClickRow: function (rowIndex, rowData) {
            OnTranScanScanGridView(rowData.TranId);
            OnLiceScanScanGridView(rowData.LiceId);
        },
        frozenColumns: [[
{ field: 'Id', title: '序号', width: 50, align: 'left', sortable: true },
{ field: 'OrgCode', title: '组织单位', width: 80, align: 'left', sortable: true },
{ field: 'LiceId', title: '出让方编号', width: 80, align: 'left', sortable: true, hidden: true },
{ field: 'TranId', title: '受让方编号', width: 80, align: 'left', sortable: true, hidden: true },
{ field: 'BidId', title: 'BidId', width: 80, align: 'left', sortable: true, hidden: true },
{ field: 'Name', title: '意向受让方姓名', width: 100, align: 'left', sortable: true }
]], columns: [[
{ field: 'BidName', title: '标的名称', width: 200, align: 'left', sortable: true },
{ field: 'ListingPrice', title: '挂牌价格', width: 100, align: 'left', sortable: true },
{ field: 'StartDate', title: '转出开始时间', width: 80, align: 'left', sortable: true },
{ field: 'EndDate', title: '转出结束时间', width: 80, align: 'left', sortable: true },
{ field: 'Ownership', title: '权属', width: 80, align: 'left', sortable: true },
{ field: 'Properties', title: '性质', width: 80, align: 'left', sortable: true },
{ field: 'TurnOut', title: '转出方式', width: 80, align: 'left', sortable: true },
{ field: 'RightsBodies', title: '确权机构', width: 150, align: 'left', sortable: true },
{ field: 'FeedingMechanism', title: '转出批准机构', width: 150, align: 'left', sortable: true },
{ field: 'WarrantNumber', title: '权证编号', width: 150, align: 'left', sortable: true },
{ field: 'StandardMode', title: '交易方式', width: 80, align: 'left', sortable: true },
{ field: 'RelatesNum', title: '涉及农户数', width: 80, align: 'left', sortable: true },
{ field: 'Publicity', title: '公示期', width: 80, align: 'left', sortable: true },
{ field: 'TradingCenterName', title: '交易中心名称', width: 180, align: 'left', sortable: true }
]],
        toolbar: [{
            id: 'btnadd',
            text: '新建',
            iconCls: 'icon-add',
            handler: function () {
                $('#newAdd').window({ title: "添加意向受让标信息" });
                $("#newAdd").window("open");
                $("#btnAdd").show();
                $("#btnEdit").hide();
                OnEmptyTextClick();
            }
        }, '-', {
            id: 'btndel',
            text: '删除',
            iconCls: 'icon-no',
            handler: function () {
                var rows = $('#tdg').datagrid('getSelections');
                if (rows.length > 0) {
                    $.messager.confirm('询问提示', '您确定要删除选中的编号为 [' + rows[0].Id + '] 的信息吗？', function (data) {
                        if (data) {
                            $.get("../Handler/WebBTransH.ashx?action=del", { id: rows[0].Id }, function (data) {
                                slide("提示", data);
                                $('#tdg').datagrid('reload');
                                $('#tdg').datagrid('clearSelections');
                            }, "text");
                        }
                    });
                }
                else {
                    msgShow("提示", "您还没有选中要删除的列信息？", "question");
                }
            }
        }, '-', {
            id: 'btncut',
            text: '修改',
            iconCls: 'icon-cut',
            handler: function () {
                var rows = $('#tdg').datagrid('getSelections');
                if (rows.length > 0) {
                    if (rows.length > 1) {
                        msgShow("提示", "修改信息只能选中一条！", "warning");
                        return;
                    }
                    $('#newAdd').window({ title: "修改出让标信息" });
                    $('#newAdd').window('open');
                    OnEmptyTextClick();
                    $.get("../Handler/WebBTransH.ashx?action=by", { Id: rows[0].Id }, function (data) {
                        OnLoadLiceOrTran(data.T[0].OrgCode);
                        OnLoadBid(data.T[0].OrgCode);
                        OnShowLiceTran(data.T[0].FK_LiceTranId);
                        OnShowBid(data.T[0].FK_BidId);
                        $("#txtOrgCode").combotree('setValue', data.T[0].OrgCode);
                        $("#FK_LiceTranId").combotree('setValue', data.T[0].FK_LiceTranId);
                        $("#txtFK_BidId").combotree('setValue', data.T[0].FK_BidId);
                        $("#txtId").val(data.T[0].Id);
                        $("#txtTradingStatus").val(data.T[0].TradingStatus);
                    }, "json");
                    $("#btnAdd").hide();
                    $("#btnEdit").show();
                } else {
                    msgShow("提示", "您还没有选中要修改的列信息？", "warning");
                }
            }
        }, '-', {
            id: 'btncut',
            text: '投标',
            iconCls: 'icon-edit',
            handler: function () {
                clearInterval(iCount);
                var rows = $('#tdg').datagrid('getSelections');
                if (rows.length > 0) {
                    $('#BidAuct').window('open');
                    $("#tPrice").textbox('setValue', "");
                    $("#tFK_BidId").textbox('setValue', rows[0].BidName);
                    $("#tLiceTranId").textbox('setValue', rows[0].Name);
                    $("#tSeveralBid").textbox('setValue', rows[0].StandardMode);
                    $("#tFK_BidId").textbox("textbox").attr("readonly", "readonly");
                    $("#tLiceTranId").textbox("textbox").attr("readonly", "readonly");
                    $("#tSeveralBid").textbox("textbox").attr("readonly", "readonly");
                    OnBidAuctionList(rows[0].BidId);
                    iCount = setInterval(function () { OnBidAuctionList(rows[0].BidId); }, 5000);
                } else {
                    msgShow("提示", "您还没有选中要投标的列信息？", "warning");
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
function OnBidAuctionList(id) {
    $.get("../Handler/WebUserBidCar.ashx?action=list", { Id: id }, function (data) {
        $("#BidAuctList tr").remove();
        var t = "";
        var productData = data.T;
        if (null == productData) { t = "<tr><td>暂未开标</td></tr>"; } else { t = ""; }
        $.each(productData, function (i, n) {
            t += "<tr><td height=\"30\" colspan=\"4\" align=\"center\">&nbsp;[" + n.BidName + "]标第[" + n.SeveralBid + "]次竞价单</td></tr><tr><td width=\"83\" align=\"center\" height=\"30\">标的名称</td><td width=\"151\">&nbsp;" + n.BidName + "</td><td width=\"80\" align=\"center\">竞价方名称</td><td width=\"158\">&nbsp;" + n.Name + "</td></tr><tr><td align=\"center\" height=\"30\">几次竞价</td><td>&nbsp;" + n.SeveralBid + "</td><td align=\"center\">价格</td><td>&nbsp;" + n.Price + "元</td></tr><tr><td align=\"center\" height=\"30\">竞价时间</td><td>&nbsp;" + n.AuctionDate + "</td><td align=\"center\">操作人</td><td>&nbsp;WebUser</td></tr>";
        });
        $("#BidAuctList").append(t);
    }, "json");
};
function OnLiceScanScanGridView(par) {
    $('#LiceScan').datagrid({
        nowrap: true,
        striped: true,
        url: '../Handler/LiTrScanH.ashx?' + $.param({ action: "LiTrScanpaging", LiceTranId: par }),
        remoteSort: false,
        sortName: 'Id',
        singleSelect: true,
        sortOrder: 'desc',
        fit: true,
        fitColumns: true,
        rownumbers: true,
        onDblClickRow: function (rowIndex, rowData) {
            $('#ScanImg').window('open');
            $('#ScanImg').window({ title: rowData.FK_UploadTypeIndicatorId });
            $("#showScanImg").attr("src", "../Scan/lt/" + rowData.FK_LiceTranId + "/" + rowData.ScanUrl);
        },
        columns: [[
        { title: '编号', field: 'Id', width: 30, align: 'left', sortable: true },
        { field: 'FK_LiceTranId', title: '附件编号', width: 40, align: 'left', sortable: true, hidden: true },
{ field: 'FK_UploadTypeIndicatorId', title: '附件名称', width: 150, align: 'left', sortable: true },
{ field: 'ScanUrl', title: '文件路径', width: 80, align: 'left', sortable: true, hidden: true },
{ field: 'UploadDate', title: '上传时间', width: 80, align: 'left', sortable: true }
]]
    });
    var p = $('#LiceScan').datagrid('getPager');
    $(p).pagination({
        onBeforeRefresh: function () {
        }
    });
};
function OnTranScanScanGridView(par) {
    $('#TranScan').datagrid({
        nowrap: true,
        striped: true,
        url: '../Handler/LiTrScanH.ashx?' + $.param({ action: "LiTrScanpaging", LiceTranId: par }),
        remoteSort: false,
        sortName: 'Id',
        singleSelect: true,
        sortOrder: 'desc',
        fit: true,
        fitColumns: true,
        rownumbers: true,
        onDblClickRow: function (rowIndex, rowData) {
            $('#ScanImg').window('open');
            $('#ScanImg').window({ title: rowData.FK_UploadTypeIndicatorId });
            $("#showScanImg").attr("src", "../Scan/lt/" + rowData.FK_LiceTranId + "/" + rowData.ScanUrl);
        },
        columns: [[
        { title: '编号', field: 'Id', width: 30, align: 'left', sortable: true },
        { field: 'FK_LiceTranId', title: '附件编号', width: 40, align: 'left', sortable: true, hidden: true },
{ field: 'FK_UploadTypeIndicatorId', title: '附件名称', width: 150, align: 'left', sortable: true },
{ field: 'ScanUrl', title: '文件路径', width: 80, align: 'left', sortable: true, hidden: true },
{ field: 'UploadDate', title: '上传时间', width: 80, align: 'left', sortable: true }
]]
    });
    var p = $('#TranScan').datagrid('getPager');
    $(p).pagination({
        onBeforeRefresh: function () {
        }
    });
};
jQuery(function ($) {
    $("#btnAuctAdd").click(function () {
        var rows = $('#tdg').datagrid('getSelections');
        $.get("../Handler/WebUserBidCar.ashx?action=one", { BidName: rows[0].BidName, BidId: rows[0].BidId, LiceTranId: rows[0].TranId, SeveralBid: 1, Price: $("#tPrice").textbox('getValue'), Name: rows[0].Name}, function (data) {
            slide("提示", data);
            OnBidAuctionList(rows[0].BidId);
        }, "text");
    });
});