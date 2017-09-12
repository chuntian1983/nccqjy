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
                    alert(json);
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
        alert("登陆名不能为空，请输入登录名称！");
        $("#txtLoginName").focus();
        return false;
    }
    if ("" == $("#txtLoginPass").val()) {
        alert("密码不能为空，请输入密码！");
        $("#txtLoginPass").focus();
        return false;
    }
    if ("" == $("#txtCheckImg").val()) {
        alert(">验证码不能为空，请输入验证码！");
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