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
jQuery(function ($) {
    $('#txtJobId').combotree({
        url: '../ashx/JobType.ashx?action=combo',
        required: true
    });
});
function GridView() {
    $('#tdg').datagrid({
        title: '管理员信息列表',
        iconCls: 'icon-save',
        nowrap: true,
        striped: true,
        url: '../Ashx/Admin.ashx?action=paging',
        remoteSort: false,
        sortName: 'CreateDate',
        singleSelect: false,
        sortOrder: 'desc',
        fit: true,
        fitColumns: true,
        rownumbers: true,
        frozenColumns: [[
{ field: 'ck', align: 'center', checkbox: true },
{ title: '编号', field: 'Id', width: 50, align: 'left', sortable: true },
{ field: 'AdminLogName', title: '登录账号', width: 80, align: 'left', sortable: true },
{ field: 'AdminLogPass', title: '登录密码', width: 80, align: 'left', sortable: true, formatter: function (value, row, index) { return "******"; } }
]],
        columns: [[
{ field: 'AdminName', title: '管理员姓名', width: 80, align: 'left', sortable: true },
{ field: 'JobId', title: '职务', width: 80, align: 'left', sortable: true },
{ field: 'AdminTel', title: '管理员电话', width: 80, align: 'left', sortable: true },
{ field: 'OrgShortName', title: '组织单位', width: 80, align: 'left', sortable: true },
{ field: 'AdminTypeId', title: '管理员类型', width: 80, align: 'left', sortable: true },
{ field: 'AdminState', title: '管理员状态', width: 50, align: 'left', sortable: true, formatter: function (value, row, index) { return row.AdminState == 0 ? "<span style='color:red;'>禁用</span>" : "<span style='color:blue;'>正常<span>"; } },
{ field: 'AdminLogNum', title: '登录次数', width: 50, align: 'left', sortable: true },
{ field: 'IsCheck', title: '越级审核权限', width: 50, align: 'left', sortable: true, formatter: function (value, row, index) { return row.IsCheck == 0 ? "否" : "是"; } },
{ field: 'EndDate', title: '最后登录时间', width: 80, align: 'left', sortable: true },
{ field: 'CreateDate', title: '创建时间', width: 80, align: 'left', sortable: true }
]],
        toolbar: [{
            id: 'btnadd',
            text: '新建',
            iconCls: 'icon-add',
            handler: function () {
                $('#newAdd').window({ title: "添加管理员账户信息" });
                $("#newAdd").window("open");
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
                    var idList = "";
                    for (var i = 0; i < rows.length; i++) {
                        idList += rows[i].Id;
                        if (i < rows.length - 1) { idList += ","; }
                    }
                    $.messager.confirm('询问提示', '您确定要删除选中的编号为 [' + idList + '] 的管理员信息吗？', function (data) {
                        if (data) {
                            $.get("../Ashx/Admin.ashx?action=del", { id: idList }, function (data) {
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
                    $('#newAdd').window({ title: "修改管理员账户信息" });
                    $('#newAdd').window('open');
                    OnEmptyTextClick();
                    $.get("../Ashx/Admin.ashx?action=by", { Id: rows[0].Id }, function (data) {
                        $("#txtAdminLogName").val(data.AdminLogName);
                        $("#txtAdminLogPass").val(data.AdminLogPass);
                        $("#txtOrgCode").combobox('setValue', data.OrgCode);
                        $("#txtJobId").combobox('setValue', data.JobId);
                        $("#txtAdminName").textbox('setValue', data.AdminName);
                        $("#txtAdminTel").textbox('setValue', data.AdminTel);
                        $("#txtAdminState").combobox('setValue', data.AdminState);
                        $("#txtIsCheck").combobox('setValue', data.IsCheck);
                        $("#txtId").val(data.Id);
                        $("#txtAdminTypeId").combobox('setValue', data.AdminTypeId);
                        $("#txtAdminLogNum").val(data.AdminLogNum);
                    }, "json");
                    $("#btnAdd").hide();
                    $("#btnEdit").show();
                } else {
                    msgShow("提示", "您还没有选中要修改的列信息？", "warning");
                }
            }
        }, '-', {
            id: 'btnstate',
            text: '更改状态',
            iconCls: 'icon-filter',
            handler: function () {
                var rows = $('#tdg').datagrid('getSelections');
                if (rows.length > 0) {
                    $.messager.confirm('询问提示', '您确定要更改选中的管理员的登录状态吗？', function (data) {
                        if (data) {
                            for (var i = 0; i < rows.length; i++) {
                                $.get("../Ashx/Admin.ashx?action=rs", { id: rows[i].Id, Rows: "AdminState", Vale: rows[i].AdminState }, function (data) {
                                    slide("提示", data);
                                }, "text");
                            }
                            $('#tdg').datagrid('clearSelections');
                            $('#tdg').datagrid('reload');
                        }
                    });
                }
                else {
                    msgShow("提示", "您还没有选中要更改的列信息？", "question");
                }
            }
        }, '-', {
            id: 'btnlock',
            text: '审核权限',
            iconCls: 'icon-lock',
            handler: function () {
                var rows = $('#tdg').datagrid('getSelections');
                if (rows.length > 0) {
                    $.messager.confirm('询问提示', '您确定要更改选中的管理员的审核权限吗？', function (data) {
                        if (data) {
                            for (var i = 0; i < rows.length; i++) {
                                $.get("../Ashx/Admin.ashx?action=rs", { id: rows[i].Id, Rows: "IsCheck", Vale: rows[i].IsCheck }, function (data) {
                                    slide("提示", data);
                                }, "text");
                            }
                            $('#tdg').datagrid('clearSelections');
                            $('#tdg').datagrid('reload');
                        }
                    });
                }
                else {
                    msgShow("提示", "您还没有选中要更改的列信息？", "question");
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
    var adminLogName = $("#txt_AdminLogName").textbox('getValue');
    var url = '../Ashx/Admin.ashx?' + $.param({ action: "paging", AdminLogName: adminLogName });
    $('#tdg').datagrid({ url: url });
    $('#tdg').datagrid('reload');
};
function OnEmptyTextClick() {
    $("#txtAdminLogName").val("");
    $("#txtAdminLogPass").val("");
    $("#txtOrgCode").combobox('setValue', "");
    $("#txtAdminName").textbox('setValue', "");
    $("#txtAdminTel").textbox('setValue', "");
    $("#txtAdminState").combobox('setValue', "0");
    $("#txtIsCheck").combobox('setValue', "0");
    $("#txtJobId").combobox('setValue', "");
    $("#txtId").val("0");
    $("#txtAdminTypeId").combobox("setValue", "");
    $("#txtAdminLogNum").val("0");
    $("#txtEndDate").val("")
};
jQuery(function ($) {
    $("#btnCancel").click(function () {
        OnEmptyTextClick();
        $('#newAdd').window('close');
        $('#tdg').datagrid('reload');
    });
});
jQuery(function ($) {
    $('#txtAdminTypeId').combobox({
        url: '../Ashx/AdminType.ashx?action=combo',
        valueField: 'id',
        textField: 'text',
        onSelect: function (rec) { rec.id; }
    });
});
jQuery(function ($) {
    $("#txtOrgCode").combotree({
        url: '../Ashx/Org.ashx?action=seltree',
        lines: true,
        required: true,
        onSelect: function (rec) { rec.id; }
    });
});
jQuery(function ($) {
    $("#btnEdit").click(function () {
        $('#forms').form('submit', {
            url: '../Ashx/Admin.ashx?action=up',
            async: false,
            onSubmit: function () {
                return $(this).form('validate');
            },
            success: function (data) {
                msgShow("提示", data, "info");
                OnEmptyTextClick();
                $('#newAdd').window('close');
                $('#tdg').datagrid('reload');
            }
        });
    });
});
jQuery(function ($) {
    $("#btnAdd").click(function () {
        $('#forms').form('submit', {
            url: '../Ashx/Admin.ashx?action=add',
            async: false,
            onSubmit: function () {
                return $(this).form('validate');
            },
            success: function (data) {
                msgShow("提示", data, "info");
                OnEmptyTextClick();
                $('#newAdd').window('close');
                $('#tdg').datagrid('reload');
            }
        });
    });
});