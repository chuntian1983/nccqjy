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
    $("#txtOrganizationId").combotree({
        url: '../Ashx/Org.ashx?action=seltree&level=3601',
        lines: true,
        required: true,
        onSelect: function (rec) { OnSelectClick(rec.id); }
    });

    $("#txtFK_OrganizationId").combotree({
        url: '../Ashx/Org.ashx?action=seltree&level=3601',
        lines: true,
        required: true,
        onSelect: function (rec) { rec.id; }
    });
});
jQuery(function ($) {
    GridView();
    $('#newAdd').window('close');
});
function GridView() {
    $('#tdg').datagrid({
        title: '通讯录信息列表',
        iconCls: 'icon-save',
        nowrap: true,
        striped: true,
        remoteSort: false,
        sortName: 'CreateDate',
        singleSelect: true,
        sortOrder: 'desc',
        fit: true,
        fitColumns: true,
        rownumbers: true,
        frozenColumns: [[
{ field: 'ck', align: 'center', checkbox: true },
{ title: '编号', field: 'Id', width: 50, align: 'left', sortable: true },
{ field: 'OrganizationId', title: '组织单位', width: 100, align: 'left', sortable: true },
{ field: 'ConsContent', title: '职务', width: 100, align: 'left', sortable: true }
]],
        columns: [[
{ field: 'UserName', title: '姓名', width: 100, align: 'left', sortable: true },
{ field: 'UserTel', title: '电话', width: 100, align: 'left', sortable: true },
{ field: 'CreateDate', title: '创建时间', width: 100, align: 'left', sortable: true }
]],
        toolbar: [{
            id: 'btnadd',
            text: '新建',
            iconCls: 'icon-add',
            handler: function () {
                $('#newAdd').window({ title: "添加通讯录信息" });
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
                            $.get("../Ashx/Contacts.ashx?action=del", { id: rows[0].Id }, function (data) {
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
                    $('#newAdd').window({ title: "修改通讯录信息" });
                    $('#newAdd').window('open');
                    EmptyTextClick();
                    $.get("../Ashx/Contacts.ashx?action=by", { Id: rows[0].Id }, function (data) {
                        $("#txtFK_OrganizationId").combotree('setValue', data.FK_OrganizationId);
                        $("#txtConsContent").val(data.ConsContent);
                        $("#txtUserName").val(data.UserName);
                        $("#txtUserTel").val(data.UserTel);
                        /**/
                        $("#txtId").val(data.Id);
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
function OnSelectClick(par) {
    var url = '../Ashx/Contacts.ashx?' + $.param({ action: "paging", OrgCode: par });
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
    $("#txtFK_OrganizationId").combotree('setValue', "");
    $("#txtConsContent").val("");
    $("#txtUserName").val("");
    $("#txtUserTel").val("");
    /**/
    $("#txtId").val("0");
};
jQuery(function ($) {
    $("#btnEdit").click(function () { OnUpdateClick(); });
});
function OnUpdateClick() {
    $('#forms').form('submit', {
        url: '../Ashx/Contacts.ashx?action=up',
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
};
jQuery(function ($) {
    $("#btnAdd").click(function () { OnCreateClick(); });
});
function OnCreateClick() {
    $('#forms').form('submit', {
        url: '../Ashx/Contacts.ashx?action=add',
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
};