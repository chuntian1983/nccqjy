$(document).ready(function () {
    var arry = [
            { "name": "njz", "top": "45", "left": "272" },
            { "name": "djh", "top": "45", "left": "504" },
            { "name": "jycp", "top": "108", "left": "173" },
            { "name": "xmbh", "top": "108", "left": "495" },
            { "name": "syqr", "top": "152", "left": "223" },
            { "name": "zcf", "top": "190", "left": "223" },
            { "name": "zcxwpzjg", "top": "190", "left": "495" },
            { "name": "zcfdb", "top": "242", "left": "223" },
            { "name": "zcsfz", "top": "242", "left": "495" },
            { "name": "srf", "top": "288", "left": "223" },
            { "name": "srfddb", "top": "325", "left": "223" },
            { "name": "gsxz", "top": "325", "left": "495" },
            { "name": "zczb", "top": "370", "left": "223" },
            { "name": "srsfz", "top": "370", "left": "495" },
            { "name": "bdjbqk", "top": "417", "left": "223" },
            { "name": "zcqx", "top": "725", "left": "223" },
            { "name": "qqjg", "top": "760", "left": "223" },
            { "name": "qzbh", "top": "760", "left": "495" },
            { "name": "zcfs", "top": "795", "left": "223" },
            { "name": "jyfs", "top": "795", "left": "495" },
            { "name": "jydj", "top": "835", "left": "223" },
            { "name": "cjje", "top": "835", "left": "495" },
            { "name": "htqsrq", "top": "875", "left": "223" },
            { "name": "htbh", "top": "875", "left": "495" },
            { "name": "beizhu", "top": "104", "left": "784" },
            { "name": "nian", "top": "808", "left": "1109" },
            { "name": "yue", "top": "808", "left": "1198" },
            { "name": "ri", "top": "808", "left": "1252" }
            ];
    $.each(arry, function (i, n) {
        $.offsets(n.name, n.top, n.left);
    });
});
var LODOP = document.getElementById("LODOP");
function btnPrintClick() {
    CreateOneFormPage();
    LODOP.PRINT();
};
function CreateOneFormPage() {
    var strFormHtml = "<body>" + document.getElementById("showPage").innerHTML + "</body>";
    LODOP.SET_PRINT_PAGESIZE(0, 3700, 2600, "");
    LODOP.ADD_PRINT_HTM(0, 0, 3700, 2600, strFormHtml);
};
Request = {
    QueryString: function (item) {
        var svalue = location.search.match(new RegExp("[\?\&]" + item + "=([^\&]*)(\&?)", "i"));
        return svalue ? svalue[1] : svalue;
    }
};
jQuery(function ($) {
    $.get("../Ashx/BidH.ashx?action=print", { Id: Request.QueryString("id") }, function (data) {
        $("#txtnjz").text("HJNJ");
        $("#txtxmbh").text("HJNS" + data.T[0].Admissibility);
        $("#txtdjh").text(data.T[0].NoAssurance);
        $("#txtjycp").text(data.T[0].BidName);
        //-------------------------------------------------------------------------
        $("#txtsyqr").text(data.T[0].Owner);
        $("#txtzcf").text(data.T[0].BidName);
        $("#txtzcxwpzjg").text(data.T[0].FeedingMechanism);
        $("#txtzcfdb").text(data.T[0].BidName);
        $("#txtzcsfz").text(data.T[0].BidName);
        $("#txtsrf").text(data.T[0].BidName);
        $("#txtsrfddb").text(data.T[0].BidName);
        $("#txtgsxz").text(data.T[0].BidName);
        $("#txtzczb").text(data.T[0].BidName);
        $("#txtsrsfz").text(data.T[0].BidName);
        $("#txtbdjbqk").text(data.T[0].BidBasic);
        $("#txtzcqx").text("自" + data.T[0].StartDate.substring(0, 10) + "起 至" + data.T[0].EndDate.substring(0, 10) + "止");
        $("#txtqqjg").text(data.T[0].RightsBodies);
        $("#txtqzbh").text(data.T[0].WarrantNumber);
        $("#txtzcfs").text(data.T[0].TurnOut);
        $("#txtjyfs").text(data.T[0].StandardMode);
        $("#txtjydj").text(data.T[0].LowTransaction);
        $("#txtcjje").text(data.T[0].Turnover);
        $("#txthtqsrq").text(data.T[0].ContractDate);
        $("#txthtbh").text(data.T[0].ContractNo);
        $("#txtbeizhu").text("");
        var _date = new Date();
        $("#txtnian").text(_date.getYear());
        $("#txtyue").text(_date.getMonth()+1);
        $("#txtri").text(_date.getDay());
        //-----------------------------------------------------------------------------
    }, "json");
});