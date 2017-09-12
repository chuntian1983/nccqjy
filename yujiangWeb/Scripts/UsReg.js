function OnCheckLogNameClick() {
    $.get("../Handler/WebSite.ashx?action=CheckUser", { LoginName: $("#txtLoginName").val() }, function (data) {
        if ("Yes" == data || $("#txtLoginName").val() == "") {
            $("#txtLoginName").focus();
            $("#lblLoginName").text("登录用户名已经存在！");
            $("#imgLoginName").attr("src", "../Images/no.jpg");
        }
        else {
            $("#imgLoginName").attr("src", "../Images/yes.jpg");
            $("#lblLoginName").text("");
        }
    }, "text");
};

function OnGetTelCodeClick() {
    $("#TelCode").attr('disabled', "disabled");
    $.get("../Handler/WebSite.ashx?action=send", { Tel: $("#txtUserTel").val() }, function (data) {
        var mess = data.split("|");
        slide("提示", mess[0]);
        if (mess[0] != "短信发送成功") {
            $("#TelCode").attr('disabled', false);
            $("#TelCode").val('点击获得手机验证码');
        }
        $("#txttCheckTelCode").val(mess[1]);
    }, "text");
    OnStartTelCodeClick($("#TelCode"));
};
function OnCheckTextClick(c) {
    if ($("#txt" + c).val() == "") {
        $("#txt" + c).focus();
        $("#img" + c).attr("src", "../Images/no.jpg");
    }
    else {
        $("#img" + c).attr("src", "../Images/yes.jpg");
    }
};
function OnComparisonClick(p1, p2, m) {
    if ($("#txt" + p1).val() != $("#txt" + p2).val()) {
        $("#txt" + p2).focus();
        $("#img" + p2).attr("src", "../Images/no.jpg");
        $("#lbl" + p2).text(m);
    }
    else {
        $("#img" + p2).attr("src", "../Images/yes.jpg");
        $("#lbl" + p2).text("");
    }
};
jQuery(function ($) {
    $("#btnAdd").click(function () {
        $('#forms').form('submit', {
            url: '../Handler/WebSite.ashx?action=add',
            async: false,
            onSubmit: function () {
                return OnVerificationClick();
            },
            success: function (data) {
                OnEliminateClick();
                alert(data);
            }
        });
    });
});
function OnEliminateClick() {
    $("#txtLoginName").val("");
    $("#txtLoginPass").val("");
    $("#txttLoginPass").val("");
    $("#txtUserName").val("");
    $("#txtUserEmail").val("");
    $("#txtUserTel").val("");
    $("#txtCheckTelCode").val("");
    $("#txttCheckTelCode").val("");
};
function OnVerificationClick() {
    if ($("#txtLoginName").val() == "")
    { return false; }
    if ($("#txtLoginPass").val() == "")
    { return false; }
    if ($("#txttLoginPass").val() == "")
    { return false; }
    if ($("#txtUserName").val() == "")
    { return false; }
    if ($("#txtUserEmail").val() == "")
    { return false; }
    if ($("#txtUserTel").val() == "")
    { return false; }
    if ($("#txtCheckTelCode").val() == "")
    { return false; }
    return true;
};
function OnStartTelCodeClick(obj) {
    var count = 1;
    var sum = 60;
    var i = setInterval(function () {
        if (count > 60) {
            obj.attr('disabled', false);
            obj.val('点击获得手机验证码');
            clearInterval(i);
        } else {
            obj.val('剩余 ' + parseInt(sum - count) + ' 秒');
        }
        count++;
    }, 1000);
};