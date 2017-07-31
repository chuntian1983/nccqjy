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
    $('#roleWin').window('close');
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
        singleSelect: true,
        sortOrder: 'desc',
        fit: true,
        fitColumns: true,
        rownumbers: true,
        frozenColumns: [[
{ field: 'ck', align: 'center', checkbox: true },
{ field: 'Id', title: '编号', width: 50, align: 'left', sortable: true },
{ field: 'AdminLogName', title: '登录账号', width: 80, align: 'left', sortable: true },
{ field: 'AdminLogPass', title: '登录密码', width: 80, align: 'left', sortable: true, formatter: function (value, row, index) { return "******"; } }
]],
        columns: [[
{ field: 'AdminName', title: '管理员姓名', width: 80, align: 'left', sortable: true },
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
            text: '系统菜单授权',
            iconCls: 'icon-lock',
            handler: function () {
                var rows = $('#tdg').datagrid('getSelections');
                if (rows.length > 0) {
                    var nodes = $('#funTree').tree('getChecked');
                    if ("" != nodes) {
                        for (var i = 0; i < nodes.length; i++) {
                            $('#funTree').tree("uncheck", nodes[i].target);
                        }
                    }
                    $.get("../Ashx/RolePermiss.ashx?action=list&flag=" + Math.random(), { AdminUserId: rows[0].Id }, function (data) {
                        var dt = data.T;
                        if ("" != dt) {
                            for (var i = 0; i < dt.length; i++) {
                                var node = $('#funTree').tree('find', dt[i].NodeId); 
                                $('#funTree').tree('check', node.target);
                            }
                        }
                    }, "json");
                    $("#txtAdminUserId").val(rows[0].Id);
                    $("#roleWin").window("open");
                } else {
                    msgShow("提示", "您还没有选中要授权的用户列信息？", "question");
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
    $("#funTree").tree({
        url: '../Ashx/SysFun.ashx?action=tree',
        lines: true,
        checkbox: true,
        cascadeCheck: false
    });
});
jQuery(function ($) {
    $("#btnAdd").click(function () {
        var funList = "";
        var selected = $('#funTree').tree('getChecked');
        if ("" != selected) {
            for (var i = 0; i < selected.length; i++) {
                funList += selected[i].id + "|";
            }
            $.get("../Ashx/RolePermiss.ashx?action=add", { SysFunId: funList, AdminUserId: $("#txtAdminUserId").val() }, function (data) {
                slide("提示", data);
                $("#roleWin").window("close");
            }, "text");
        } else {
            slide("提示", "您还没有选择授权的系统菜单选项！");
        }
    });
});
