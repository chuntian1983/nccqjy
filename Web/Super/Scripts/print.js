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
    LODOP.PREVIEW();
    //LODOP.PRINT();
};
function btnPrintClick2() {
    CreateOneFormPage2();

    LODOP.PRINT();
};
function CreateOneFormPage() {
var strBodyStyle = "<style>" + document.getElementById("style1").innerHTML + "</style>";
    var strFormHtml =strBodyStyle + "<body>" + document.getElementById("showPage").innerHTML + "</body>";
    LODOP.SET_PRINT_PAGESIZE(0, 3700, 2600, "");
    LODOP.ADD_PRINT_HTM(0, 0, 3700, 2600, strFormHtml);
};
function CreateOneFormPage2() {
var strBodyStyle = "<style>" + document.getElementById("style1").innerHTML + "</style>";
    var strFormHtml =strBodyStyle + "<body>" + document.getElementById("showPage2").innerHTML + "</body>";
    LODOP.SET_PRINT_PAGESIZE(0, 3700, 2600, "");
    LODOP.ADD_PRINT_HTM(0, 0, 3700, 2600, strFormHtml);
};
Request = {
    QueryString: function (item) {
        var svalue = location.search.match(new RegExp("[\?\&]" + item + "=([^\&]*)(\&?)", "i"));
        return svalue ? svalue[1] : svalue;
    }
};
$(document).ready(function () {
var nian = <%=nian %>;   
        var yue = <%=yue %>;   
        var ri= <%=ri %>;  
        $("#txtnian").text(nian);//年
        $("#txtyue").text(yue);//月
        $("#txtri").text(ri);//日
        alert('dddd');});
jQuery(function ($) {
 
    $.get("../Ashx/BidH.ashx?action=print", { Id: Request.QueryString("id") }, function (data) {
    //2016-10-13 wh添加注释修改赋值代码本来bug都默认赋值同一个字段
        $("#txtnjz").text("HJNJ");//农鉴字
        $("#txtxmbh").text("HJNS" + data.T[0].Admissibility);//项目编号
        $("#txtdjh").text(data.T[0].NoAssurance);//项目第几号
        $("#txtjycp").text(data.T[0].BidName);//交易产品
        $("#txtsyqr").text(data.T[0].Owner);//所有权人
        $("#txtzcf").text(data.T[0].LName);//转出方
        $("#txtzcxwpzjg").text(data.T[0].TradingCenterName); //转出批准机构
        $("#txtzcfdb").text(data.T[0].LName);//转出方代表
        $("#txtzcsfz").text(data.T[0].IDCard); //转出方身份证
        $("#txtsrf").text(data.T[0].Name);//受让方
        $("#txtsrfddb").text(data.T[0].Name); //法定代表人
        $("#txtgsxz").text(data.T[0].TypeCertificationName); //公司性质
        $("#txtzczb").text(data.T[0].Capital); //注册资本
        $("#txtsrsfz").text(data.T[0].BidName);//注册号身份证
        $("#txtbdjbqk").text(data.T[0].BidBasic);//标的基本情况
        $("#txtzcqx").text("自" + data.T[0].StartDate.substring(0, 10) + "起 至" + data.T[0].EndDate.substring(0, 10) + "止");//转出期限
        $("#txtqqjg").text(data.T[0].RightsBodies);//确权机构
        $("#txtqzbh").text(data.T[0].WarrantNumber);//权证编号
        $("#txtzcfs").text(data.T[0].TurnOut);//转出方式
        $("#txtjyfs").text(data.T[0].StandardMode);//交易方式
        $("#txtjydj").text(data.T[0].LowTransaction);//交易底价
        $("#txtcjje").text(data.T[0].Turnover);//成交金额
        $("#txthtqsrq").text(data.T[0].ContractDate);//合同签署日期
        $("#txthtbh").text(data.T[0].ContractNo);//合同编号
        $("#txtbeizhu").text("");//备注
        
        
        
    }, "json");
});