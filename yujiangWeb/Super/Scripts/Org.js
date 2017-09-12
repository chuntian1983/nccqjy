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
    $("#orgTree").tree({
        url: '../Ashx/Org.ashx?action=tree',
        lines: true,
        onClick: function (node) {
            onSel(node.id);
        }
    });
});
function onSel(p) {
    $("#btnAdd").hide();
    $("#btnLower").show();
    $.get("../Ashx/Org.ashx?action=by", { OrgCode: p }, function (data) {
        $("#txtLevel").val(data.Level);
        $("#txtUpOrgCode").val(data.UpOrgCode);
        $("#txtOrgShortName").val(data.OrgShortName);
        $("#txtOrgName").val(data.OrgName);
        $("#txtShengCode").val(data.ShengCode);
        $("#txtShiCode").val(data.ShiCode);
        $("#txtXianCode").val(data.XianCode);
        $("#txtXiangCode").val(data.XiangCode);
        $("#txtCunCode").val(data.CunCode);
        $("#txtZuCode").val(data.ZuCode);
        $("#txtOrgCode").val(data.OrgCode);
        $("#txtSeq").val(data.Seq);
    }, "json");
};
jQuery(function ($) {
    $("#btnAdd").click(function () {
        if ("" != $("#txtUpOrgCode").val()) {
            $('#forms').form('submit', {
                url: '../Ashx/Org.ashx?action=add',
                async: false,
                onSubmit: function () {
                    return $(this).form('validate');
                },
                success: function (data) {
                    msgShow("提示", data, "info");
                    $("#btnAdd").hide();
                    $("#orgTree").tree("reload");
                    $("#btnLower").show();
                }
            });
        } else {
            msgShow("提示", "<span style='color:red;'>上级代码不能为空！</span>", "info");
        }
    });
});
jQuery(function ($) {
    $("#btnUp").click(function () {
        if ("" != $("#txtUpOrgCode").val()) {
            $('#forms').form('submit', {
                url: '../Ashx/Org.ashx?action=up',
                async: false,
                onSubmit: function () {
                    return $(this).form('validate');
                },
                success: function (data) {
                    msgShow("提示", data, "info");
                    $("#orgTree").tree("reload");
                }
            });
        } else {
            msgShow("提示", "<span style='color:red;'>上级代码不能为空！</span>", "info");
        }
    });
});
jQuery(function ($) {
    $("#btnDel").click(function () {
        $.messager.confirm('询问提示', '您确定要删除选中的单位为 [' + $("#txtOrgName").val() + '] 的组织单位信息吗？', function (data) {
            if (data) {
                if ("" != $("#txtOrgCode").val()) {
                    $.get("../Ashx/Org.ashx?action=del", { OrgCode: $("#txtOrgCode").val() }, function (data) {
                        slide("提示", data);
                        $("#orgTree").tree("reload");
                    }, "text");
                } else {
                    msgShow("错误提示", "<span style='color:red;'>你还没有选择组织单位名称！</span>", "info");
                }
            }
        });
    });
});
jQuery(function ($) {
    $("#btnLower").click(function () {
        if ("" == $("#txtUpOrgCode").val()) {
            msgShow("错误提示", "<span style='color:red;'>你还没有选择组织单位名称！</span>", "info");
            return;
        }
        $.get("../Ashx/Org.ashx?action=lower", { OrgCode: $("#txtOrgCode").val() }, function (data) {
            $("#btnAdd").show();
            $("#txtUpOrgCode").val($("#txtOrgCode").val());
            $("#txtLevel").val($("#txtLevel").val() - 1);
            $("#txtShengCode").val(data.substring(0, 2));
            $("#txtShiCode").val(data.substring(2, 4));
            $("#txtXianCode").val(data.substring(4, 6));
            $("#txtXiangCode").val(data.substring(6, 9));
            $("#txtCunCode").val(data.substring(9, 12));
            $("#txtZuCode").val(data.substring(12, 14));
            $("#txtOrgShortName").val("");
            $("#txtOrgCode").val(data);
            $("#txtSeq").val(data.substring(data.length - 1, data.length));
            $("#btnLower").hide();
        }, "text");
    });
});
function onCombinClick() {
    $("#txtOrgName").val($("#txtOrgName").val() + $("#txtOrgShortName").val());
};
