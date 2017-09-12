jQuery(function ($) {
    OnClockClick();
});

function OnClockClick() {
    var now = new Date();
    var year = now.getFullYear();
    var month = now.getMonth();
    var date = now.getDate();
    var day = now.getDay();
    var hour = now.getHours();
    var minu = now.getMinutes();
    var sec = now.getSeconds();
    var week;
    month = month + 1;
    if (month < 10) month = "0" + month;
    if (date < 10) date = "0" + date;
    if (hour < 10) hour = "0" + hour;
    if (minu < 10) minu = "0" + minu;
    if (sec < 10) sec = "0" + sec;
    var arr_week = new Array("星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六");
    week = arr_week[day];
    var time = "";
    time = year + "年" + month + "月" + date + "日" + " " + hour + ":" + minu + ":" + sec + " " + week;
    $("#lblclock").html(time);
    var timer = setTimeout("OnClockClick()", 200);
};
jQuery(function ($) {
    $.get("/Handler/WebSite.ashx?action=link", {}, function (data) {
        var nullImgUrl = "../images/nojpg.jpg";
        var newImgUrl = "../linkImg/";
        var link = "";
        for (var i = 0; i < data.Link.length; i++) {
            var imgUrl = data.Link[i].LinkImgUrl != "" ? newImgUrl + data.Link[i].LinkImgUrl : nullImgUrl;
            link += "<a href=\"" + data.Link[i].LinkUrl + "\" target=\"_blank\"><img style=' width:150px; height:40px;'  src='" + imgUrl + "'/></a>";
        }
        $("#lblLinks").html(link);
    }, "json");
});