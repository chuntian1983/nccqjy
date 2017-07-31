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
    $("#funTree").tree({
        url: '../Ashx/SysFun.ashx?action=tree',
        lines: true,
        onClick: function (node) {
            onSel(node.id);
        }
    });
});
function onSel(p) {
    $.get("../Ashx/SysFun.ashx?action=by", { NodeId: p }, function (data) {
        $("#txtParentNodeId").combobox('setValue', data.ParentNodeId);
        $("#txtDisplayName").val(data.DisplayName);
        $("#txtNodeURL").val(data.NodeURL);
        $("#txtDisplayOrder").val(data.DisplayOrder);
        $("#txtNodeId").val(data.NodeId);
    }, "json");
};
jQuery(function ($) {
    $("#txtParentNodeId").combobox({
        url: '../Ashx/SysFun.ashx?action=combo',
        valueField: 'id',
        textField: 'text'
    });
});
jQuery(function ($) {
    $("#btnAdd").click(function () {
        if ("" == $("#txtNodeId").val() || "" != $("#txtDisplayName").val() || "" != $("#txtUpOrgCode").val()) {
            $('#forms').form('submit', {
                url: '../Ashx/SysFun.ashx?action=add',
                async: false,
                onSubmit: function () {
                    return $(this).form('validate');
                },
                success: function (data) {
                    msgShow("提示", data, "info");
                    $("#funTree").tree("reload");
                    $('#txtParentNodeId').combobox('reload');
                    $("#btnAdd").hide();
                }
            });
        } else {
            if ("" == $("#txtUpOrgCode").val()) {
                msgShow("提示", "<span style='color:red;'>上级代码不能为空！</span>", "info");
            }
            if ("" == $("#txtDisplayName").val()) {
                msgShow("提示", "<span style='color:red;'>菜单名称！</span>", "info");
            }
        }
    });
});
jQuery(function ($) {
    $("#btnUp").click(function () {
        if ("" != $("#txtUpOrgCode").val() || "" != $("#txtNodeId").val()) {
            $('#forms').form('submit', {
                url: '../Ashx/SysFun.ashx?action=up',
                async: false,
                onSubmit: function () {
                    return $(this).form('validate');
                },
                success: function (data) {
                    msgShow("提示", data, "info");
                    $("#funTree").tree("reload");
                    $('#txtParentNodeId').combobox('reload');
                }
            });
        } else {
            if ("" == $("#txtUpOrgCode").val()) {
                msgShow("提示", "<span style='color:red;'>上级代码不能为空！</span>", "info");
            }
            if ("" == $("#txtNodeId").val()) {
                msgShow("提示", "<span style='color:red;'>您还没有选择要更新的列表项！</span>", "info");
            }
        }
    });
});
jQuery(function ($) {
    $("#btnNew").click(function () {
        $("#txtDisplayName").val("");
        $("#txtNodeURL").val("");
        $("#txtDisplayOrder").val("1");
        $("#txtNodeId").val("");
        $("#btnAdd").show();
    });
});
jQuery(function ($) {
    $("#btnDel").click(function () {
        slide("提示", "系统菜单不能任意删除操作！");
    });
});