$(document).ready(function () {
    $.get("../Handler/UserManager.ashx?action=UsById", {}, function (data) {
        $("#utxtId").val(data.Id);
        $("#utxtVeri").val(data.Veri);
        $("#utxtUserStatus").val(data.UserStatus);
        $("#utxtLoginDate").val(data.LoginDate);
        $("#utxtLoginnNum").val(data.LoginnNum);
        $("#utxtOutDate").val(data.OutDate);
        $("#utxtUserEmail").textbox('setValue', data.UserEmail);
        $("#utxtLoginName").val(data.LoginName);
        $("#utxtLoginPass").val(data.LoginPass);
        $("#utxtUserName").val(data.UserName);
        $("#utxtUserTel").val(data.UserTel);
    }, "json");
});

jQuery(function ($) {
    $("#btnEdit").click(function () {
        $('#userform').form('submit', {
            url: '../Handler/UserManager.ashx?action=userup',
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