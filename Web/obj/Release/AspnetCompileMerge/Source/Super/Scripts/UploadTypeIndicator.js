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
        title: '上传指标类型信息列表',
        iconCls: 'icon-save',
        pagination: false,
        nowrap: true,
        striped: true,
        url: '../ashx/UploadTypeIndicator.ashx?action=paging',
        remoteSort: false,
        sortName: 'Id',
        singleSelect: true,
        sortOrder: 'asc',
        fit: true,
        fitColumns: true,
        rownumbers: true,
        frozenColumns: [[
{ title: '编号', field: 'Id', width: 50, align: 'left', sortable: true },
{ field: 'TypeIndicatorName', title: '上传指标类型名称', width: 450, align: 'left', sortable: true }

]],
        columns: [[
                    { field: 'CreateDate', title: '创建时间', width: 150, align: 'left', sortable: true }
				]],
        toolbar: [{
            id: 'btnadd',
            text: '新建',
            iconCls: 'icon-add',
            handler: function () {
                $('#newAdd').window({ title: "添加上传指标类型信息" });
                $("#newAdd").window("open");
                $("#btnAdd").show();
                $("#btnEdit").hide();
                EmptyTextClick();
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
                    $('#newAdd').window({ title: "修改上传指标类型信息" });
                    $('#newAdd').window('open');
                    EmptyTextClick();
                    $.get("../ashx/UploadTypeIndicator.ashx?action=by", { Id: rows[0].Id }, function (data) {
                        $("#txtId").val(data.Id);
                        $("#txtTypeIndicatorName").val(data.TypeIndicatorName);
                    }, "json");
                    $("#btnAdd").hide();
                    $("#btnEdit").show();
                } else {
                    msgShow("提示", "您还没有选中要修改的列信息？", "warning");
                }
            }
        }, '-', {
            id: 'btndel',
            text: '删除',
            iconCls: 'icon-no',
            handler: function () {
                var rows = $('#tdg').datagrid('getSelections');
                if (rows.length > 0) {
                    var idList = "";
                    for (var i = 0; i < rows.length; i++) {
                        idList += rows[i].Id;
                        if (i < rows.length - 1) { idList += ","; }
                    }
                    $.messager.confirm('询问提示', '您确定要删除选中的编号为 [' + idList + '] 的信息吗？', function (data) {
                        if (data) {
                            $.get("../ashx/UploadTypeIndicator.ashx?action=del", { idList: idList }, function (data) {
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
function EmptyTextClick() {
    $("#txtId").val("");
    $("#txtTypeIndicatorName").val("");
};
jQuery(function ($) {
    $("#btnCancel").click(function () {
        EmptyTextClick();
        $('#newAdd').window('close');
    });
});
jQuery(function ($) {
    $("#btnEdit").click(function () { OnUpdateClick(); });
});
function OnUpdateClick() {
    $('#forms').form('submit', {
        url: '../ashx/UploadTypeIndicator.ashx?action=up',
        async: false,
        onSubmit: function () {
            return $(this).form('validate');
        },
        success: function (data) {
            EmptyTextClick();
            $('#newAdd').window('close');
            msgShow("提示", data, "info");
            $('#tdg').datagrid('reload');
        }
    });
   
};
jQuery(function ($) {
    $("#btnAdd").click(function () { OnCreateClick(); });
});
function OnCreateClick() {
    $('#forms').form('submit', {
        url: '../ashx/UploadTypeIndicator.ashx?action=add',
        async: false,
        onSubmit: function () {
            return $(this).form('validate');
        },
        success: function (data) {

            EmptyTextClick();
            $('#newAdd').window('close');
            msgShow("提示", data, "info");
            $('#tdg').datagrid('reload');
        }
    });
    
};