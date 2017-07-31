function onCloseClick() {
$("#username").val("");
$("#password").val("");
$("#randid").val("");
};
function msgShow(title, msgString, msgType) {
    $.messager.alert(title, msgString, msgType);
};
function onSubmitClick() {
if (CheckUserInfo()) {
    $.ajax({
        url: "Ashx/Login.ashx?action=login",
        data: "username=" + escape($("#username").val()) + "&password=" + $("#password").val() + "&randid=" + $("#randid").val(),
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
                window.location.replace("Main.aspx");
            }
        }
    });
}
};
function CheckUserInfo() {
if ("" == $("#username").val()) {
slide("错误提示", "<span style='color:red;font-size:16px;font-weight:bold;'>登陆名不能为空，请输入登录名称！</span>");
$("#username").focus();
return false;
}
if ("" == $("#password").val()) {
slide("错误提示", "<span style='color:red;font-size:16px;font-weight:bold;'>密码不能为空，请输入密码！</span>");
$("#password").focus();
return false;
}
if ("" == $("#randid").val()) {
slide("错误提示", "<span style='color:red;font-size:16px;font-weight:bold;'>验证码不能为空，请输入验证码！</span>");
$("#randid").focus();
return false;
}
return true;
};
function keyLogin() {
if (event.keyCode == 13) {
onSubmitClick();
}
};