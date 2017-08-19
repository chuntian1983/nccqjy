jQuery(function ($) {
    $("#txtOrganization").combotree({
        url: 'Ashx/Org.ashx?action=seltree&level=3601',
        lines: true,
        required: true,
        onSelect: function (rec) { OnSelectClick(rec.id); }
    });
});
jQuery(function ($) {
    GridView();
    GridViewPla();
    $('#news').window('close');
});

function GridView() {
    $('#tdg').datagrid({
        sortName: 'Id',
        sortOrder: 'desc',
        fit: true,
        striped: true,
        singleSelect: true,
        columns: [[
        { title: '编号', field: 'Id', width: 50, align: 'left', sortable: true },
{ field: 'UserName', title: '姓名', width: 100, align: 'left', sortable: true },
{ field: 'ConsContent', title: '职务', width: 100, align: 'left', sortable: true },
{ field: 'UserTel', title: '电话', width: 100, align: 'left', sortable: true }
]],
        pagination: true,
        pageSize: 20
    });
    var p = $('#tdg').datagrid('getPager');
    $(p).pagination({
        onBeforeRefresh: function () {
        }
    });
}
function OnSelectClick(par) {
    var url = 'Ashx/Contacts.ashx?' + $.param({ action: "paging", OrgCode: par });
    $('#tdg').datagrid({ url: url });
    $('#tdg').datagrid('reload');
};
function GridViewPla() {
    $('#pla').datagrid({
        url: 'Ashx/Placard.ashx?action=paging',
        sortName: 'ReleaseTime',
        sortOrder: 'desc',
        fit: true,
        singleSelect: true,
        onClickRow: function (rowIndex, rowData) {
            var rows = $('#pla').datagrid('getSelected');
            $('#news').window({ title: "通知公告详细信息" });
            $('#news').window('open');
            OnShowModel(rows.Id);
        },
        frozenColumns: [[
{ title: '编号', field: 'Id', width: 50, align: 'left', sortable: true },
{ field: 'PlacardTitle', title: '通知名称', width: 500, align: 'left', sortable: true },
{ field: 'ReleaseTime', title: '发布时间', width: 150, align: 'left', sortable: true }
]],
        pagination: true,
        pageSize: 20
    });
    var p = $('#pla').datagrid('getPager');
    $(p).pagination({
        onBeforeRefresh: function () {
        }
    });
};
function OnShowModel(Id) {
    $.get("Ashx/Placard.ashx?action=by", { Id: Id }, function (data) {
        $("#lblDepName").html(data.DepName);
        $("#lblReleaseTime").html(data.ReleaseTime.replace("T", " "));
        $("#lblPlacardContent").html(data.PlacardContent);
        $("#lblPlacardTitle").html(data.PlacardTitle);
        $("#lblPublisher").html(data.Publisher);
    }, "json");
};