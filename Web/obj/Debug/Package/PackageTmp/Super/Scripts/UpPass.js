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
    $.get("../Ashx/Admin.ashx?action=logname", {}, function (data) {
        if (null != data) {
            $("#txtAdminLogName").text(data);
        }
    }, "text");
});
jQuery(function ($) {
    $("#btnEdit").click(function () {
        $.get("../Ashx/Admin.ashx?action=uppass", { Pass: $("#txtAdminLogPass").val() }, function (data) {
            msgShow("提示", data+"", "info");
            if ("密码更新成功" == data) {
                parent.location.replace("/Super/");
            }
        }, "text");
    });
});