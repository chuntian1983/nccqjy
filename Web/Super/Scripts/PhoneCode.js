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
    $.get("../Ashx/PhoneCode.ashx?action=by", {}, function (data) {
        if (null != data) {
            $("#txtUid").val(data.Uid);
            $("#txtKey").val(data.Key);
            $("#btnAdd").hide();
            $("#btnEdit").show();
        }
        else {
            $("#btnAdd").show();
            $("#btnEdit").hide();
        }
    }, "json");
});
jQuery(function ($) {
    $("#btnEdit").click(function () {
        $('#forms').form('submit', {
            url: '../Ashx/PhoneCode.ashx?action=up',
            async: false,
            onSubmit: function () {
                return $(this).form('validate');
            },
            success: function (data) {
                msgShow("提示", data, "info");
            }
        });
    });
});
jQuery(function ($) {
    $("#btnAdd").click(function () {
        $('#forms').form('submit', {
            url: '../Ashx/PhoneCode.ashx?action=add',
            async: false,
            onSubmit: function () {
                return $(this).form('validate');
            },
            success: function (data) {
                msgShow("提示", data, "info");
            }
        });
    });
});