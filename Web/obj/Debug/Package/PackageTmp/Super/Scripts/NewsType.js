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
        title: '管理员类型信息列表',
        iconCls: 'icon-save',
        nowrap: true,
        striped: true,
        url: '../ashx/newsType.ashx?action=paging',
        remoteSort: false,
        sortName: 'Id',
        singleSelect: true,
        sortOrder: 'asc',
        fit: true,
        fitColumns: true,
        rownumbers: true,
        frozenColumns: [[
{ title: '编号', field: 'Id', width: 50, align: 'left', sortable: true },
{ field: 'NewsTypeName', title: '新闻类型名称', width: 150, align: 'left', sortable: true },
{ field: 'CreateDate', title: '创建时间', width: 150, align: 'left', sortable: true }
]],
        toolbar: [{
            id: 'btnadd',
            text: '新建',
            iconCls: 'icon-add',
            handler: function () {
                $('#newAdd').window({ title: "添加新闻类型信息" });
                $("#newAdd").window("open");
                $("#btnAdd").show();
                $("#btnEdit").hide();
                OnEmptyTextClick();
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
                    $('#newAdd').window({ title: "修改新闻类型信息" });
                    $('#newAdd').window('open');
                    OnEmptyTextClick();
                    $.get("../ashx/newsType.ashx?action=by", { Id: rows[0].Id }, function (data) {
                        $("#txtId").val(data.Id);
                        $("#txtNewsTypeName").val(data.NewsTypeName);
                    }, "json");
                    $("#btnAdd").hide();
                    $("#btnEdit").show();
                } else {
                    msgShow("提示", "您还没有选中要修改的列信息？", "warning");
                }               
            }
        }
],
        pagination: false
    });
    var p = $('#tdg').datagrid('getPager');
    $(p).pagination({
        onBeforeRefresh: function () {
        }
    });
};
function OnEmptyTextClick() {
    $("#txtId").val("");
    $("#txtNewsTypeName").val("");
};
jQuery(function ($) {
    $("#btnCancel").click(function () {
        OnEmptyTextClick();
        $("#newAdd").window("close");
    });
});
jQuery(function ($) {
    $("#btnEdit").click(function () {
        $('#forms').form('submit', {
            url: '../ashx/newsType.ashx?action=up',
            async: false,
            onSubmit: function () {
                return $(this).form('validate');
            },
            success: function (data) {
                msgShow("提示", data, "info");
                $('#newAdd').window('close');
                OnEmptyTextClick();
                $('#tdg').datagrid('reload');
            }
        });       
    });
});
jQuery(function ($) {
    $("#btnAdd").click(function () {
        $('#forms').form('submit', {
            url: '../ashx/newsType.ashx?action=add',
            async: false,
            onSubmit: function () {
                return $(this).form('validate');
            },
            success: function (data) {
                msgShow("提示", data, "info");
                $('#newAdd').window('close');
                OnEmptyTextClick();
                $('#tdg').datagrid('reload');
            }
        });       
    });
});