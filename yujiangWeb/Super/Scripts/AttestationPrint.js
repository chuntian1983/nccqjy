jQuery(function ($) {
    GridView();
    $('#addPrint').window('close');
});

function GridView() {
    $('#tdg').datagrid({
        title: '产权交易鉴证书打印',
        iconCls: 'icon-save',
        nowrap: true,
        striped: true,
        url: '../Ashx/BidH.ashx?' + $.param({ action: "pagingA", DepaStatus: 7, StandardMode: 1 }),
        remoteSort: false,
        sortName: 'Id',
        singleSelect: true,
        sortOrder: 'desc',
        fitColumns: false,
        rownumbers: true,
        fit: true,
        frozenColumns: [[
{ field: 'Id', title: '序号', width: 50, align: 'left', sortable: true },
{ field: 'OrgCode', title: '组织单位', width: 80, align: 'left', sortable: true },
{ field: 'oCode', title: '组织单位代码', width: 80, align: 'left', sortable: true, hidden: true },
{ field: 'FK_LiceTranId', title: '编号', width: 80, align: 'left', sortable: true, hidden: true },
{ field: 'LiceTran', title: '出让方姓名', width: 80, align: 'left', sortable: true },
{ field: 'ReturnStatus', title: '状态', width: 80, align: 'left', sortable: true, formatter: function (value, row, index) { return row.ReturnStatus == 0 ? "<span style='color:blue;'>正常</span>" : "<span style='color:red;'>撤回<span>"; } }
]], columns: [[
{ field: 'BidName', title: '标的名称', width: 80, align: 'left', sortable: true },
{ field: 'NoAssurance', title: '鉴证号', width: 80, align: 'left', sortable: true, formatter: function (value, row, index) { return "HJNJ" + row.NoAssurance; } },
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
            id: 'btnprint',
            text: '打印',
            iconCls: 'icon-print',
            handler: function () {
                var rows = $('#tdg').datagrid('getSelections');
                if (rows.length > 0) {
                    $('#addPrint').window('open');
                    $("#txtFK_BidId").val(rows[0].Id);
                    $("#txtReason").val("正常打印鉴证书");
                }
                else {
                    msgShow("提示", "您还没有选中要更改的列信息？", "question");
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
function msgShow(title, msgString, msgType) {
    $.messager.alert(title, msgString, msgType);
};
jQuery(function ($) {
    $("#btnPrintAdd").click(function () {
        $('#forms').form('submit', {
            url: '../Ashx/BidPrint.ashx?action=add',
            async: false,
            onSubmit: function () {
                return $(this).form('validate');
            },
            success: function (data) {
                if ("OK" == data) {
                window.showModelessDialog('attPrint.aspx?id=3','鉴证书打印','dialogWidth:1200px;dialogHeight:800px;dialogLeft:20px;dialogTop:15px;center:yes;resizable:yes;status:yes');
                } else {
                    msgShow("提示", data, "info");
                }
                $('#addPrint').window('close');
            }
        });
    });
});