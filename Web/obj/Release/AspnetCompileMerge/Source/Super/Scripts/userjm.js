function msgShow(a, b, c) {
    $.messager.alert(a, b, c)
}
function slide(a, b) {
    $.messager.show({
        title: a,
        msg: b,
        timeout: 3500,
        showType: "slide"
    })
}
jQuery(function ($) {
    GridView();
    $("#newAdd").window("close")
});

function GridView() {
    $("#tdg").datagrid({
        nowrap: true,
        striped: true,
        url: "../Ashx/User.ashx?action=paging",
        remoteSort: false,
        sortName: "Id",
        singleSelect: true,
        sortOrder: "desc",
        fitColumns: true,
        rownumbers: true,
        fit: true,
        frozenColumns: [
			[{
			    field: "Id",
			    title: "编号",
			    width: 40,
			    align: "left",
			    sortable: true
			}, {
			    field: "LoginName",
			    title: "登录账号",
			    width: 150,
			    align: "left",
			    sortable: true
			}, {
			    field: "UserName",
			    title: "会员姓名",
			    width: 150,
			    align: "left",
			    sortable: true
			}, {
			    field: "UserTel",
			    title: "电话",
			    width: 150,
			    align: "left",
			    sortable: true
			}, {
			    field: "UserStatus",
			    title: "审核状态",
			    width: 70,
			    align: "left",
			    sortable: true,
			    formatter: function (a, c, d) {
			        return 0 == c.UserStatus ? "<span style='color:red;'>等待审核</span>" : "<span style='color:blue;'>审核通过<span>"
			    }
			}]
		],
        columns: [
			[{
			    field: "UserEmail",
			    title: "邮箱",
			    width: 150,
			    align: "left",
			    sortable: true
			}, {
			    field: "LoginDate",
			    title: "注册时间",
			    width: 150,
			    align: "left",
			    sortable: true
			}, {
			    field: "LoginnNum",
			    title: "登录次数",
			    width: 80,
			    align: "left",
			    sortable: true
			}, {
			    field: "OutDate",
			    title: "最后登录时间",
			    width: 150,
			    align: "left",
			    sortable: true
			}]
		],
        toolbar: [{
            id: "btnadd",
            text: "新建",
            iconCls: "icon-add",
            handler: function () {
                $("#newAdd").window({
                    title: "添加会员信息"
                });
                $("#newAdd").window("open");
                $("#btnAdd").show();
                $("#btnEdit").hide();
                OnEmptyTextClick()
            }
        }, "-",
		{
		    id: "btndel",
		    text: "删除",
		    iconCls: "icon-no",
		    handler: function () {
		        var a = $("#tdg").datagrid("getSelections");
		        0 < a.length ? $.messager.confirm("询问提示", "您确定要删除选中的编号为 [" + a[0].Id + "] 的信息吗？", function (c) {
		            c && $.get("../Ashx/User.ashx?action=del", {
		                id: a[0].Id
		            }, function (a) {
		                slide("提示", a);
		                $("#tdg").datagrid("reload");
		                $("#tdg").datagrid("clearSelections")
		            }, "text")
		        }) : msgShow("提示", "您还没有选中要删除的列信息？", "question")
		    }
		}, "-",
		{
		    id: "btncut",
		    text: "修改",
		    iconCls: "icon-cut",
		    handler: function () {
		        var a = $("#tdg").datagrid("getSelections");
		        0 < a.length ? 1 < a.length ? msgShow("提示", "修改信息只能选中一条！", "warning") : ($("#newAdd").window({
		            title: "修改会员信息"
		        }), $("#newAdd").window("open"), OnEmptyTextClick(), $.get("../Ashx/User.ashx?action=by", {
		            Id: a[0].Id
		        }, function (a) {
		            $("#utxtId").val(a.Id);
		            $("#utxtVeri").val(a.Veri);
		            $("#utxtUserStatus").val(a.UserStatus);
		            $("#utxtLoginDate").val(a.LoginDate);
		            $("#utxtLoginnNum").val(a.LoginnNum);
		            $("#utxtOutDate").val(a.OutDate);
		            $("#utxtUserEmail").textbox("setValue", a.UserEmail);
		            $("#utxtLoginName").val(a.LoginName);
		            $("#utxtLoginPass").val(a.LoginPass);
		            $("#utxtUserName").val(a.UserName);
		            $("#utxtUserTel").val(a.UserTel)
		        }, "json"), $("#btnAdd").hide(), $("#btnEdit").show()) : msgShow("提示", "您还没有选中要修改的列信息？", "warning")
		    }
		}, "-",
		{
		    id: "btnlock",
		    text: "审核",
		    iconCls: "icon-lock",
		    handler: function () {
		        var a = $("#tdg").datagrid("getSelections");
		        0 < a.length ? $.messager.confirm("询问提示", "您确定要更改选中的登录状态吗？", function (c) {
		            c && $.get("../Ashx/User.ashx?action=rs", {
		                id: a[0].Id,
		                Rows: "UserStatus",
		                Vale: a[0].UserStatus
		            }, function (a) {
		                slide("提示", a);
		                $("#tdg").datagrid("clearSelections");
		                $("#tdg").datagrid("reload")
		            }, "text")
		        }) : msgShow("提示", "您还没有选中要更改的列信息？", "question")
		    }
		}, "-"],
        pagination: true,
        pageSize: 20
    });
    var a = $("#tdg").datagrid("getPager");
    $(a).pagination({
        onBeforeRefresh: function () { }
    })
}
jQuery(function (a) {
    a("#btnEdit").click(function () {
        a("#forms").form("submit", {
            url: "../Ashx/User.ashx?action=up",
            async: false,
            onSubmit: function () {
                return a(this).form("validate")
            },
            success: function (b) {
                OnEmptyTextClick();
                a("#newAdd").window("close");
                a("#tdg").datagrid("reload");
                msgShow("提示", b, "info")
            }
        })
    })
});
jQuery(function (a) {
    a("#btnAdd").click(function () {
        a("#forms").form("submit", {
            url: "../Ashx/User.ashx?action=add",
            async: false,
            onSubmit: function () {
                return a(this).form("validate")
            },
            success: function (b) {
                msgShow("提示", b, "info");
                OnEmptyTextClick();
                a("#newAdd").window("close");
                a("#tdg").datagrid("reload")
            }
        })
    })
});
jQuery(function (a) {
    a("#btnQuery").click(function () {
        var b = a("#txt_UserName").textbox("getValue"),
			b = "../Ashx/User.ashx?" + a.param({
			    action: "paging",
			    UserName: b
			});
        a("#tdg").datagrid({
            url: b
        });
        a("#tdg").datagrid("reload")
    })
});

function OnEmptyTextClick() {
    $("#txtId").val("");
    $("#txtVeri").val("0");
    $("#txtUserStatus").val("");
    $("#txtLoginDate").val("");
    $("#txtLoginnNum").val("");
    $("#txtOutDate").val("");
    $("#txtUserEmail").textbox("setValue", "");
    $("#txtLoginName").val("");
    $("#txtLoginPass").val("");
    $("#txtUserName").val("");
    $("#txtUserTel").val("")
}
jQuery(function (a) {
    a("#btnCancel").click(function () {
        OnEmptyTextClick();
        a("#newAdd").window("close");
        a("#tdg").datagrid("reload")
    })
});