jQuery(function ($) {
    GridView('', '');
    $("#orgTree").tree({
        url: '../Ashx/Org.ashx?action=tree',
        lines: true,
        onClick: function (node) {
            GridView(node.id, node.text);
        }
    });
});

function GridView(orgcode, t) {
    $('#tdg').datagrid({
        title: t + "产权交易汇总",
        nowrap: true,
        striped: true,
        url: '../Ashx/AttAuRep.ashx?' + $.param({ action: "sum", OrgCode: orgcode }),
        remoteSort: false,
        sortName: 'StartDate',
        singleSelect: true,
        sortOrder: 'desc',
        fitColumns: false,
        rownumbers: true,
        fit: true,
        frozenColumns: [[
        { field: 'BidName', title: '产权名称', width: 100, align: 'left', sortable: true },
{ field: 'OrgName', title: '组织单位', width: 150, align: 'left', sortable: true },
{ field: 'PropertyTypeName', title: '产权类型', width: 100, align: 'left', sortable: true },
{ field: 'guimo', title: '规模', width: 80, align: 'left', sortable: true },
{ field: 'danwei', title: '单位', width: 80, align: 'left', sortable: true },
{ field: 'Ownership', title: '产权权属', width: 100, align: 'left', sortable: true }

]], columns: [[
{ field: 'LName', title: '出让方', width: 120, align: 'left', sortable: true },
{ field: 'TypeCertificationName', title: '出让方性质', width: 80, align: 'left', sortable: true },

{ field: 'Name', title: '受让方', width: 120, align: 'left', sortable: true },
{ field: 'TypeCertificationName', title: '受让方性质', width: 80, align: 'left', sortable: true },

{ field: 'StandardModeName', title: '交易方式', width: 80, align: 'left', sortable: true },

{ field: 'EndDate', title: '合同起始日期', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) { return row.EndDate.substring(0, 10); } },
{ field: 'StartDate', title: '合同结束日期', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) { return row.StartDate.substring(0, 10); } },
{ field: 'LowTransaction', title: '成交单价', width: 80, align: 'left', sortable: true },
{ field: 'Turnover', title: '成交总价', width: 80, align: 'left', sortable: true },

{ field: 'dsfds', title: '备注', width: 150, align: 'left', sortable: true, formatter: function (value, row, index) { return ""; } }
]],
        pagination: false
    });
    var p = $('#tdg').datagrid('getPager');
    $(p).pagination({
        onBeforeRefresh: function () {
        }
    });
};
function ConvertDateTime(start, end) {
    var startDate = new Date(start.substring(0, 4), start.substring(5, 7), start.substring(8, 10));
    var endDate = new Date(end.substring(0, 4), end.substring(5, 7), end.substring(8, 10));
    var result = endDate.getTime() - startDate.getTime();
    var day = (result / (24 * 3600 * 1000))
    var year = (day / 365);
    return parseFloat(year).toFixed(1);
};