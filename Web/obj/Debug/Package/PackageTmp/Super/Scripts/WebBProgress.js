jQuery(function ($) {
    GridView();
});

function GridView() {
    $('#tdg').datagrid({
        nowrap: true,
        striped: true,
        url: '../Handler/WebBidH.ashx?' + $.param({ action: "list" }),
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
{ field: 'LiceTran', title: '出让方姓名', width: 100, align: 'left', sortable: true },
{ field: 'BidName', title: '标的名称', width: 150, align: 'left', sortable: true }
]], columns: [[
{ field: 'A', title: '申请', width: 120, align: 'center', sortable: true, styler: function (value, row, index) { if (row.A > 1) { return 'background-color:#00FF00;'; } else { return 'background-color:#FF0000;'; } }, formatter: function (value, row, index) { return ''; } },
{ field: 'B', title: '挂牌', width: 120, align: 'center', sortable: true, styler: function (value, row, index) { if (row.B > 2) { return 'background-color:#00FF00;'; } else { return 'background-color:#FF0000;'; } }, formatter: function (value, row, index) { return ''; } },
{ field: 'C', title: '交易', width: 120, align: 'center', sortable: true, styler: function (value, row, index) { if (row.C > 3) { return 'background-color:#00FF00;'; } else { return 'background-color:#FF0000;'; } }, formatter: function (value, row, index) { return ''; } },
{ field: 'D', title: '鉴证', width: 120, align: 'center', sortable: true, styler: function (value, row, index) { if (row.D > 4) { return 'background-color:#00FF00;'; } else { return 'background-color:#FF0000;'; } }, formatter: function (value, row, index) { return ''; } },
{ field: 'E', title: '', width: 120, align: 'left', sortable: true, styler: function (value, row, index) { if (row.E > 5) { return 'background-color:#00FF00;'; } else { return 'background-color:#FF0000;'; } }, formatter: function (value, row, index) { return ''; }, hidden: true },
{ field: 'F', title: '', width: 120, align: 'left', sortable: true, styler: function (value, row, index) { if (row.F > 6) { return 'background-color:#00FF00;'; } else { return 'background-color:#FF0000;'; } }, formatter: function (value, row, index) { return ''; },hidden: true }
]],
        pagination: true,
        pageSize: 20
    });
    var p = $('#tdg').datagrid('getPager');
    $(p).pagination({
        onBeforeRefresh: function () {
        }
    });
};