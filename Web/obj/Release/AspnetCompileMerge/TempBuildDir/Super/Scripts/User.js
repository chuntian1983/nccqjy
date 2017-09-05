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
        nowrap: true,
        striped: true,
        url: '../Ashx/User.ashx?action=paging',
        remoteSort: false,
        sortName: 'Id',
        singleSelect: true,
        sortOrder: 'desc',
        fitColumns: true,
        rownumbers: true,
        fit: true,
        frozenColumns: [[
{ field: 'Id', title: '编号', width: 40, align: 'left', sortable: true },
{ field: 'LoginName', title: '登录账号', width: 150, align: 'left', sortable: true },
{ field: 'UserName', title: '会员姓名', width: 150, align: 'left', sortable: true },
{ field: 'UserTel', title: '电话', width: 150, align: 'left', sortable: true },
{ field: 'UserStatus', title: '审核状态', width: 70, align: 'left', sortable: true, formatter: function (value, row, index) { return row.UserStatus == 0 ? "<span style='color:red;'>等待审核</span>" : "<span style='color:blue;'>审核通过<span>"; } }
]],
        columns: [[
{ field: 'UserEmail', title: '邮箱', width: 150, align: 'left', sortable: true },
{ field: 'LoginDate', title: '注册时间', width: 150, align: 'left', sortable: true },
{ field: 'LoginnNum', title: '登录次数', width: 80, align: 'left', sortable: true },
{ field: 'OutDate', title: '最后登录时间', width: 150, align: 'left', sortable: true }
]],
        toolbar: [{
            id: 'btnadd',
            text: '新建',
            iconCls: 'icon-add',
            handler: function () {
                $('#newAdd').window({ title: "添加会员信息" });
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
                    $.messager.confirm('询问提示', '您确定要删除选中的编号为 [' + rows[0].Id + '] 的信息吗？', function (data) {
                        if (data) {
                            $.get("../Ashx/User.ashx?action=del", { id: rows[0].Id }, function (data) {
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
                    $('#newAdd').window({ title: "修改会员信息" });
                    $('#newAdd').window('open');
                    OnEmptyTextClick();
                    $.get("../Ashx/User.ashx?action=by", { Id: rows[0].Id }, function (data) {
                        $("#utxtId").val(data.Id);
                        $("#utxtVeri").val(data.Veri);
                        $("#utxtUserStatus").val(data.UserStatus);
                        $("#utxtLoginDate").val(data.LoginDate);
                        $("#utxtLoginnNum").val(data.LoginnNum);
                        $("#utxtOutDate").val(data.OutDate);
                        $("#utxtUserEmail").textbox('setValue', data.UserEmail);
                        $("#utxtLoginName").val(data.LoginName);
                        $("#utxtLoginPass").val(data.LoginPass);
                        $("#utxtUserName").val(data.UserName);
                        $("#utxtUserTel").val(data.UserTel);
                    }, "json");
                    $("#btnAdd").hide();
                    $("#btnEdit").show();
                } else {
                    msgShow("提示", "您还没有选中要修改的列信息？", "warning");
                }

            }
        }, '-', {
            id: 'btnlock',
            text: '审核',
            iconCls: 'icon-lock',
            handler: function () {
                var rows = $('#tdg').datagrid('getSelections');
                if (rows.length > 0) {
                    $.messager.confirm('询问提示', '您确定要更改选中的登录状态吗？', function (data) {
                        if (data) {
                            $.get("../Ashx/User.ashx?action=rs", { id: rows[0].Id, Rows: "UserStatus", Vale: rows[0].UserStatus }, function (data) {
                                slide("提示", data);
                                $('#tdg').datagrid('clearSelections');
                                $('#tdg').datagrid('reload');
                            }, "text");
                        }
                    });
                }
                else {
                    msgShow("提示", "您还没有选中要更改的列信息？", "question");
                }
            }
        }, '-'
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
    $("#btnEdit").click(function () {
        $('#forms').form('submit', {
            url: '../Ashx/User.ashx?action=up',
            async: false,
            onSubmit: function () {
                return $(this).form('validate');
            },
            success: function (data) {
                OnEmptyTextClick();
                $('#newAdd').window('close');
                $('#tdg').datagrid('reload');
                msgShow("提示", data, "info");
            }
        });
    });
});
jQuery(function ($) {
    $("#btnAdd").click(function () {
        $('#forms').form('submit', {
            url: '../Ashx/User.ashx?action=add',
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
    $("#btnQuery").click(function () {
        var txt_UserName = $("#txt_UserName").textbox('getValue');
        var url = '../Ashx/User.ashx?' + $.param({ action: "paging", UserName: txt_UserName });
        $('#tdg').datagrid({ url: url });
        $('#tdg').datagrid('reload');
    });
});
function OnEmptyTextClick() {
    $("#txtId").val("");
    $("#txtVeri").val("0");
    $("#txtUserStatus").val("");
    $("#txtLoginDate").val("");
    $("#txtLoginnNum").val("");
    $("#txtOutDate").val("");
    $("#txtUserEmail").textbox('setValue', "");
    $("#txtLoginName").val("");
    $("#txtLoginPass").val("");
    $("#txtUserName").val("");
    $("#txtUserTel").val("");
};
jQuery(function ($) {
    $("#btnCancel").click(function () {
        OnEmptyTextClick();
        $('#newAdd').window('close');
        $('#tdg').datagrid('reload');
    });
});