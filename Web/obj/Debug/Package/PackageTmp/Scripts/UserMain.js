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
    $("#TheirDestruction").click(function () {
        $.get("../Handler/UserManager.ashx?action=out", {}, function (data) {
            if ("Y" == data) {
                window.location.replace("../Default.aspx");
            }
        }, "text");
    });
});
jQuery(function ($) {
    $('#winao').window('close');
    $('#winat').window('close');
    $('#winbo').window('close');

    $('#winco').window('close');
    $('#winct').window('close');
    $('#wincs').window('close');
    $('#windo').window('close');
});
jQuery(function ($) {
    $("#lnkao").click(function () {
        $('#winao').window('open');
        $('#winao').window('refresh', 'Users.aspx');
    });
    $("#lnkat").click(function () {
        $('#winat').window('open');
        $('#winat').window('refresh', 'VeriUser.aspx');
    });
    $("#lnkbo").click(function () {
        $('#winbo').window('open');
        $("#imbo").attr("src", "LiTr.aspx");
    });
    $("#lnkco").click(function () {
        $('#winco').window('open');
        $("#imco").attr("src", "WebBid.aspx");
    });
    $("#lnkct").click(function () {
        $('#winct').window('open');
        $("#imct").attr("src", "WebBTrans.aspx");
    });
    $("#lnkcs").click(function () {
        $('#wincs').window('open');
        $("#imcs").attr("src", "WebBProgress.aspx");
    });
    $("#lnkdo").click(function () {
        $('#windo').window('open');
        $("#imdo").attr("src", "Intention.aspx?flag=" + Math.random());
    });
});
$.ajaxSetup({
    global: false,
    cache: false
});
