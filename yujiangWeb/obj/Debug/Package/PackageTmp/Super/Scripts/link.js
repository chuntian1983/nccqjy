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
    $("#fileWin").window("close");
});
function GridView() {
    $('#tdg').datagrid({
        title: '友情链接信息列表',
        iconCls: 'icon-save',
        nowrap: true,
        striped: true,
        url: '../ashx/link.ashx?action=paging',
        remoteSort: false,
        sortName: 'Id',
        singleSelect: true,
        sortOrder: 'desc',
        fit: true,
        fitColumns: true,
        rownumbers: true,
        frozenColumns: [[
{ field: 'Id', title: '编号', width: 50, align: 'left', sortable: true },
{ field: 'LinkName', title: '友情链接名称', width: 180, align: 'left', sortable: true },
{ field: 'LinkUrl', title: '友情链接网址', width: 180, align: 'left', sortable: true },
{ field: 'LinkImgUrl', title: '友情链接图片', align: 'left', sortable: true, formatter: function (value, row, index) { return "" == value ? " <img src='../../images/nojpg.jpg'  style='height: 40px; width: 150px'/>" : " <img src='../../linkImg/" + value + "'  style='height: 40px; width: 150px'/>"; } }
]],
        toolbar: [{
            id: 'btnadd',
            text: '新建',
            iconCls: 'icon-add',
            handler: function () {
                $('#fileWin').window({ title: "添加友情链接信息" });
                $("#fileWin").window("open");
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
                            $.get("../ashx/link.ashx?action=del", { Id: rows[0].Id }, function (data) {
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
                    $('#fileWin').window({ title: "修改友情链接信息" });
                    $('#fileWin').window('open');
                    OnEmptyTextClick();
                    $.get("../ashx/link.ashx?action=by", { Id: rows[0].Id }, function (data) {
                        $("#txtLinkName").val(data.LinkName);
                        $("#txtLinkUrl").val(data.LinkUrl);
                        $("#txtLinkImgUrl").val(data.LinkImgUrl);
                        $("#txtId").val(data.Id);
                    }, "json");
                    $("#btnAdd").hide();
                    $("#btnEdit").show();
                } else {
                    msgShow("提示", "您还没有选中要修改的列信息？", "warning");
                }
            }
        }, '-'
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
    $("#txtLinkName").val("");
    $("#txtLinkUrl").val("");
    $("#txtLinkImgUrl").val("");
    $("#txtId").val("0");
};
jQuery(function ($) {
    $("#btnCancel").click(function () {
        OnEmptyTextClick();
        $('#fileWin').window('close');
        $('#tdg').datagrid('reload');
    });
});
jQuery(function ($) {
    $("#btnAdd").click(function () {
        $('#form1').form('submit', {
            url: '../ashx/link.ashx?action=add',
            async: false,
            onSubmit: function () {
                return $(this).form('validate');
            },
            success: function (data) {
                msgShow("提示", data, "info");
                $('#tdg').datagrid('reload');
                OnEmptyTextClick();
                $('#fileWin').window('close');
            }
        });       
    });
});
jQuery(function ($) {
    $("#btnEdit").click(function () {
        if ("0" != $("#txtId").val() && "" != $("#txtId").val()) {
            $('#form1').form('submit', {
                url: '../ashx/link.ashx?action=up',
                async: false,
                onSubmit: function () {
                    return $(this).form('validate');
                },
                success: function (data) {
                    msgShow("提示", data, "info");
                    $('#tdg').datagrid('reload');
                }
            });
            OnEmptyTextClick();
            $('#fileWin').window('close');
        } else {
            msgShow("提示", "您还没有选择要修改的信息内容！", "info");
        }
    });
});