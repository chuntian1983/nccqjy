jQuery(function ($) {
    GridView();
    $('#newAdd').window('close');
    $('#addOpinion').window('close');
    $('#ScanImg').window('close');
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
function GridView() {
    $('#tdg').datagrid({
        nowrap: true,
        striped: true,
        url: '../Ashx/BidH.ashx?' + $.param({ action: "paging", DepaStatus: 1 }),
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
            OnltScanGridView(rowData.FK_LiceTranId);
        },
        frozenColumns: [[
{ field: 'Id', title: '序号', width: 50, align: 'left', sortable: true },
{ field: 'OrgCode', title: '组织单位', width: 80, align: 'left', sortable: true },
{ field: 'oCode', title: '组织单位代码', width: 80, align: 'left', sortable: true, hidden: true },
{ field: 'FK_LiceTranId', title: '编号', width: 80, align: 'left', sortable: true, hidden: true },
{ field: 'LiceTran', title: '出让方姓名', width: 80, align: 'left', sortable: true },
{ field: 'BidName', title: '标的名称', width: 80, align: 'left', sortable: true },
{ field: 'ReturnStatus', title: '状态', width: 80, align: 'left', sortable: true, formatter: function (value, row, index) { return row.ReturnStatus == 0 ? "<span style='color:blue;'>正常</span>" : "<span style='color:red;'>撤回<span>"; }
}
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
            id: 'btnadd',
            text: '新建',
            iconCls: 'icon-add',
            handler: function () {
                $('#newAdd').window({ title: "添加出让标信息" });
                $("#newAdd").window("open");
                $("#btnAdd").show();
                $("#btnEdit").hide();
                $.get("../Ashx/BidH.ashx?action=max", function (data) {
                    $("#lblAdmissibility").text(data.N);
                    $("#txtAdmissibility").val(data.N);
                    $("#txtTradingCenterName").textbox("setValue", data.O + "农村综合产权交易中心");
                }, "json");
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
                            $.get("../Ashx/BidH.ashx?action=del", { id: rows[0].Id, UpManager: rows[0].UpManager, OrgCode: rows[0].oCode }, function (data) {
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
                    $.get("../Ashx/BidH.ashx?action=by", { Id: rows[0].Id }, function (data) {
                        $("#lblAdmissibility").text(data.Admissibility);
                        $("#txtAdmissibility").val(data.Admissibility);
                        $("#txtOrgCode").combotree("setValue", data.OrgCode);
                        OnLoadLiceOrTran(data.OrgCode);
                        $("#txtFK_LiceTranId").combotree("setValue", data.FK_LiceTranId);
                        OnShowLiceTran(data.FK_LiceTranId);
                        $("#txtBidName").textbox("setValue", data.BidName);
                        $("#txtListingPrice").textbox("setValue", data.ListingPrice);
                        $("#txtStartDate").datebox("setValue", data.StartDate);
                        $("#txtEndDate").datebox("setValue", data.EndDate);
                        $("#txtBidBasic").val(data.BidBasic);
                        $("#txtProperties").combotree("setValue", data.Properties);
                        $("#txtTurnOut").combotree("setValue", data.TurnOut);
                        $("#txtWarrantNumber").textbox("setValue", data.WarrantNumber);
                        $("#txtRightsBodies").textbox("setValue", data.RightsBodies);
                        $("#txtFeedingMechanism").textbox("setValue", data.FeedingMechanism);
                        $("#txtStandardMode").combotree("setValue", data.StandardMode);
                        $("#txtLowTransaction").textbox("setValue", data.LowTransaction);
                        $("#txtTurnover").textbox("setValue", data.Turnover);
                        $("#txtRelatesNum").textbox("setValue", data.RelatesNum);
                        $("#txtStandardType").combotree("setValue", data.StandardType);
                        $("#txtPublicity").textbox("setValue", data.Publicity);
                        $("#txtUpManager").combobox("setValue", data.UpManager);
                        $("#txtTradingCenterName").textbox("setValue", data.TradingCenterName);
                        $("#txtLost").val(data.Lost);
                        $("#txtId").val(data.Id);
                        $("#txtCancel").val(data.Cancel);
                        $("#txtChange").val(data.Change);
                        $("#txtReturnStatus").val(data.ReturnStatus);
                        $("#txtDepaStatus").val(data.DepaStatus);
                        $("#txtAreContract").val(data.AreContract);
                        $("#txtNoAssurance").val(data.NoAssurance);
                        $("#txtContractNo").val(data.ContractNo);
                        $("#txtContractDate").val(data.ContractDate);
                    }, "json");
                    $("#btnAdd").hide();
                    $("#btnEdit").show();
                } else {
                    msgShow("提示", "您还没有选中要修改的列信息？", "warning");
                }
            }
        }, '-'
],
        pagination: true,
        pageSize: 30
    });
    var p = $('#tdg').datagrid('getPager');
    $(p).pagination({
        onBeforeRefresh: function () {
        }
    });
};