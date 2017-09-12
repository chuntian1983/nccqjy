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
{ field: 'OrgName', title: '组织单位', width: 150, align: 'left', sortable: true },
{ field: 'BidName', title: '标的名称', width: 100, align: 'left', sortable: true },
{ field: 'CreateDate', title: '流转日期', width: 100, align: 'left', sortable: true },
{ field: 'LName', title: '出让方', width: 120, align: 'left', sortable: true }
]], columns: [[
{ field: 'PropertyTypeName', title: '产权类型', width: 100, align: 'left', sortable: true },
{ field: 'LTel', title: '出让方联系电话', width: 120, align: 'left', sortable: true },
{ field: 'RelatesNum', title: '涉及农户数', width: 80, align: 'left', sortable: true },
{ field: 'Name', title: '受让方', width: 120, align: 'left', sortable: true },
{ field: 'TypeCertificationName', title: '受让方类型', width: 100, align: 'left', sortable: true },
{ field: 'Tel', title: '受让方联系电话', width: 120, align: 'left', sortable: true },
{ field: 'TurnOutTypeName', title: '流转类型', width: 80, align: 'left', sortable: true },
{ field: 'StandardModeName', title: '交易方式', width: 80, align: 'left', sortable: true },
{ field: 'ListingPrice', title: '流转价格', width: 150, align: 'left', sortable: true },
{ field: 'EndDate', title: '流转期限', width: 250, align: 'left', sortable: true, hidden: true },
{ field: 'StartDate', title: '流转期限（年）', width: 80, align: 'left', sortable: true, formatter: function (value, row, index) { return ConvertDateTime(row.StartDate, row.EndDate); } },
{ field: 'AreContract', title: '是否确定合同', width: 80, align: 'left', sortable: true, formatter: function (value, row, index) { return row.AreContract == 1 ? "是" : "否"; } },
{ field: 'TradingCenterName', title: '交易中心名称', width: 150, align: 'left', sortable: true }
]], toolbar: [
{
    id: 'btnprint',
    text: '打印',
    iconCls: 'icon-print',
    handler: function () {

    }
}, '-'
], pagination: false
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