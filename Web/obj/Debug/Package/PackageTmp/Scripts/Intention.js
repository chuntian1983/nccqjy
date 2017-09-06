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
    $("#showById").window('close');
});
var editor1;
KindEditor.ready(function (K) {
    editor1 = K.create('textarea[name="Content"]', {
        cssPath: '../super/Scripts/kindeditor/plugins/code/prettify.css',
        uploadJson: '../super/ashx/upload_json.ashx',
        fileManagerJson: '../super/ashx/file_manager_json.ashx',
        afterBlur: function () { editor1.sync(); },
        allowFileManager: true,
        items: ['fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold', 'italic', 'underline', 'removeformat', '|', 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist', 'insertunorderedlist', '|', 'image', 'link']
    });
});
function GridView() {
    $('#tdg').datagrid({       
        iconCls: 'icon-save',
        nowrap: true,
        striped: true,
        url: '../Handler/IntentionH.ashx?action=paging',
        remoteSort: false,
        sortName: 'Id',
        singleSelect: false,
        sortOrder: 'desc',
        fit: true,
        fitColumns: true,
        rownumbers: true,
        frozenColumns: [[
{ field: 'ck', align: 'center', checkbox: true },
{ title: '编号', field: 'Id', width: 50, align: 'left', sortable: true },
{ field: 'WebUser', title: '发布人姓名', width: 100, align: 'left', sortable: true },
{ field: 'Title', title: '信息标题', width: 280, align: 'left', sortable: true }
]],
        columns: [[
{ field: 'Content', title: '新闻内容', width: 80, align: 'left', sortable: true, formatter: function (value, row, index) { return "<span class='icon icon-edit' onclick='OnShowNews(" + row.Id + ");'>&nbsp;&nbsp;&nbsp;&nbsp;查看详情</span>"; } },
{ field: 'RegDate', title: '发布时间', width: 150, align: 'left', sortable: true },
{ field: 'EndDte', title: '截止时间', width: 150, align: 'left', sortable: true },
{ field: 'CheckStatus', title: '审核状态', width: 50, align: 'left', sortable: true, formatter: function (value, row, index) { return row.CheckStatus == 0 ? "<span style='color:red;'>未审核</span>" : "<span style='color:blue;'>通过</span>"; } },
{ field: 'ClickNum', title: '点击次数', width: 25, align: 'left', sortable: true }
]],
        toolbar: [{
            id: 'btnadd',
            text: '新建',
            iconCls: 'icon-add',
            handler: function () {
                $('#newAdd').window({ title: "修改意向转出/转入信息" });
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
                    $.messager.confirm('询问提示', '您确定要删除选中的编号为 [' + idList + '] 的信息吗？', function (data) {
                        if (data) {
                            $.get("../Handler/IntentionH.ashx?action=del", { idList: idList }, function (data) {
                                msgShow("提示", data, "warning");
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
                    $('#newAdd').window({ title: "修改意向转出/转入信息" });
                    $('#newAdd').window('open');
                    OnEmptyTextClick();
                    $.get("../Handler/IntentionH.ashx?action=by", { id: rows[0].Id }, function (data) {
                        $("#txtTitle").val(data.Title);
                        editor1.html(data.Content);
                        $("#txtId").val(data.Id);
                        $("#txtIntentionType").combobox('setValue', data.IntentionType);
                        $("#txtRegDate").datebox('setValue', data.RegDate);
                        $("#txtEndDte").datebox('setValue', data.EndDte);
                        $("#txtClickNum").val(data.ClickNum);
                        $("#txtCheckStatus").val(data.CheckStatus);
                        $("#txtCheckName").val(data.CheckName);
                    }, "json");
                    $("#btnAdd").hide();
                    $("#btnEdit").show();
                } else {
                    msgShow("提示", "您还没有选中要修改的列信息？", "warning");
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
function OnEmptyTextClick() {
    $("#txtTitle").val("");
    editor1.html("");
    $("#txtId").val("");
    $("#txtIntentionType").combobox('setValue', "1");
    $("#txtRegDate").datebox('setValue', "");
    $("#txtEndDte").datebox('setValue', "");
    $("#txtClickNum").val("");
    $("#txtCheckStatus").val("");
    $("#txtCheckName").val("");
};
jQuery(function ($) {
    $("#btnQuery").click(function () {
        var Title = $("#Title").textbox('getValue');
        if ("" != selNewsTitle) {
            var url = '../Handler/IntentionH.ashx?' + $.param({ action: "paging", Title: $("#Title").textbox('getValue') });
            $('#tdg').datagrid({ url: url });
            $('#tdg').datagrid('reload');
        } else {
            msgShow("提示", "您还没有输入要搜索的信息标题？", "question");
        }
    });
});
jQuery(function ($) {
    $("#btnCancel").click(function () {
        OnEmptyTextClick();
        $('#newAdd').window('close');
        $('#tdg').datagrid('reload');
    });
});
jQuery(function ($) {
    $("#btnEdit").click(function () {
        $('#Intentionforms').form('submit', {
            url: '../Handler/IntentionH.ashx?action=up',
            async: false,
            onSubmit: function () {
                return $(this).form('validate');
            },
            success: function (data) {
                msgShow("提示", data, "info");
                $('#tdg').datagrid('reload');
                OnEmptyTextClick();
                $('#newAdd').window('close');
            }
        });
    });
});
function OnShowNews(id) {
    $.get("../Handler/IntentionH.ashx?action=by", { id: id }, function (data) {
        $("#lbltitle").html(data.Title);
        $("#lblnews").html(data.Content);
        $("#showById").window('open');
    }, "json");
};
jQuery(function ($) {
    $("#btnAdd").click(function () {
        $('#Intentionforms').form('submit', {
            url: '../Handler/IntentionH.ashx?action=add',
            async: false,
            onSubmit: function () {
                return $(this).form('validate');
            },
            success: function (data) {
                msgShow("提示", data, "info");
                $('#tdg').datagrid('reload');
                OnEmptyTextClick();
                $('#newAdd').window('close');
            }
        });
    });
});