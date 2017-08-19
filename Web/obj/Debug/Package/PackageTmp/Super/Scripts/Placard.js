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
});
function GridView() {
    $('#tdg').datagrid({
        title: '通知公告信息列表',
        iconCls: 'icon-save',
        nowrap: true,
        url: '../Ashx/Placard.ashx?action=paging',
        striped: true,
        remoteSort: false,
        sortName: 'ReleaseTime',
        singleSelect: true,
        sortOrder: 'desc',
        fit: true,
        fitColumns: true,
        rownumbers: true,
        frozenColumns: [[
{ field: 'ck', align: 'center', checkbox: true },
{ title: '编号', field: 'Id', width: 50, align: 'left', sortable: true },
{ field: 'PlacardTitle', title: '通知名称', width: 300, align: 'left', sortable: true },
{ field: 'DepName', title: '部门名称', width: 180, align: 'left', sortable: true }
]],
        columns: [[
{ field: 'Publisher', title: '发布人', width: 100, align: 'left', sortable: true },
{ field: 'ReleaseTime', title: '发布时间', width: 150, align: 'left', sortable: true },
{ field: 'NumClicks', title: '点击数', width: 80, align: 'left', sortable: true }
]],
        toolbar: [{
            id: 'btnadd',
            text: '新建',
            iconCls: 'icon-add',
            handler: function () {
                $('#newAdd').window({ title: "添加通知公告信息" });
                $("#newAdd").window("open");
                $("#btnAdd").show();
                $("#btnEdit").hide();
                EmptyTextClick();
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
                            $.get("../Ashx/Placard.ashx?action=del", { id: rows[0].Id }, function (data) {
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
                    $('#newAdd').window({ title: "修改通知公告信息" });
                    $('#newAdd').window('open');
                    EmptyTextClick();
                    $.get("../Ashx/Placard.ashx?action=by", { Id: rows[0].Id }, function (data) {
                        $("#txtDepName").val(data.DepName);
                        $("#txtReleaseTime").datetimebox("setValue", data.ReleaseTime);
                        $("#txtPlacardContent").val(data.PlacardContent);
                        $("#txtPlacardTitle").val(data.PlacardTitle);
                     
                        $("#txtId").val(data.Id);
                        $("#txtNumClicks").val(data.NumClicks);
                    }, "json");                    
                    $("#btnAdd").hide();
                    $("#btnEdit").show();
                } else {
                    msgShow("提示", "您还没有选中要修改的列信息？", "warning");
                }
            }
        }
],
        pagination: true,
        pageSize: 20

    });
    var p = $('#tdg').datagrid('getPager');
    $(p).pagination({
        onBeforeRefresh: function () {
        }
    });
};
jQuery(function ($) {
    $("#btnQuery").click(function () { OnSelectClick(); });
});
function OnSelectClick() {
    var tPlacardTitle = $("#tPlacardTitle").val();
    var url = '../Ashx/Placard.ashx?' + $.param({ action: "paging", PlacardTitle: escape(tPlacardTitle) });
    $('#tdg').datagrid({ url: url });
    $('#tdg').datagrid('reload');
};
jQuery(function ($) {
    $("#btnCancel").click(function () {
        EmptyTextClick();
        $('#newAdd').window('close');
        $('#tdg').datagrid('reload');
    });
});
function EmptyTextClick() {
    $("#txtPlacardTitle").val("");
    $("#txtPlacardContent").val("");
    $("#txtReleaseTime").datetimebox('setValue', '');
    $("#txtDepName").val("南昌市农村综合产权交易中心");
    $("#txtId").val("0");
    $("#txtNumClicks").val("0");
};
jQuery(function ($) {
    $("#btnEdit").click(function () { OnUpdateClick(); });
});
function OnUpdateClick() {
    $('#forms').form('submit', {
        url: '../Ashx/Placard.ashx?action=up',
        async: false,
        onSubmit: function () {
            return $(this).form('validate');
        },
        success: function (data) {
            msgShow("提示", data, "info");
        }
    });
    EmptyTextClick();
    $('#newAdd').window('close');
    $('#tdg').datagrid('reload');
}
jQuery(function ($) {
    $("#btnAdd").click(function () { OnCreateClick(); });
});
function OnCreateClick() {
    $('#forms').form('submit', {
        url: '../Ashx/Placard.ashx?action=add',
        async: false,
        onSubmit: function () {
            return $(this).form('validate');
        },
        success: function (data) {
            msgShow("提示", data, "info");
        }
    });
    EmptyTextClick();
    $('#newAdd').window('close');
    $('#tdg').datagrid('reload');
}
