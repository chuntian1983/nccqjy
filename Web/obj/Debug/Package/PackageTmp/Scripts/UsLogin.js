function slide(_title, _msg) {
    $.messager.show({
        title: _title,
        msg: _msg,
        timeout: 3500,
        showType: 'slide'
    });
};
function msgShow(title, msgString, msgType) {
    $.messager.alert(title, msgString, msgType);
};
function onSubmitClick() {
    if (CheckUserInfo()) {
        $.ajax({
            url: "../Handler/WebSite.ashx?action=Login",
            data: "LoginName=" + escape($("#txtLoginName").val()) + "&LoginPass=" + $("#txtLoginPass").val() + "&CheckImg=" + $("#txtCheckImg").val(),
            type: "post",
            cache: "false",
            dataType: "text",
            beforeSend: function () { $("#divload").show(); },
            complete: function () { $("#divload").hide(); },
            error: function (XMLHttpRequest, textStatus, errorThrown) { $("#divload").hide(); alert(errorThrown); },
            success: function (json) {
                if (json != "Y") {
                    msgShow("登陆提示", json, "error");
                    $("#imgcheck").attr("src", "../Controls/ValidateCode.aspx?flag=" + Math.random());
                }
                else {
                    window.location.replace("UserMain.aspx");
                }
            }
        });
    }
};
function CheckUserInfo() {
    if ("" == $("#txtLoginName").val()) {
        slide("错误提示", "<span style='color:red;font-weight:bold;'>登陆名不能为空，请输入登录名称！</span>");
        $("#txtLoginName").focus();
        return false;
    }
    if ("" == $("#txtLoginPass").val()) {
        slide("错误提示", "<span style='color:red;font-weight:bold;'>密码不能为空，请输入密码！</span>");
        $("#txtLoginPass").focus();
        return false;
    }
    if ("" == $("#txtCheckImg").val()) {
        slide("错误提示", "<span style='color:red;font-weight:bold;'>验证码不能为空，请输入验证码！</span>");
        $("#txtCheckImg").focus();
        return false;
    }
    return true;
};
function keyLogin() {
    if (event.keyCode == 13) {
        onSubmitClick();
    }
};