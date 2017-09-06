<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="daying.aspx.cs" Inherits="Web.Super.Bi.daying" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>打印页</title>
    <script src="../Scripts/easyUI/jquery.min.js" type="text/javascript" ></script>
    <script src="../Scripts/print/CheckActivX.js" type="text/javascript"></script>
   <script type="text/javascript">
       $(document).ready(function () {
          
    var arry = [
            { "name": "njz", "top": "75", "left": "119" },
            { "name": "djh", "top": "75", "left": "354" },
            { "name": "jycp", "top": "128", "left": "23" },
            { "name": "xmbh", "top": "128", "left": "335" },
            { "name": "syqr", "top": "172", "left": "73" },
            { "name": "zcf", "top": "210", "left": "73" },
            { "name": "zcxwpzjg", "top": "200", "left": "335" },
            { "name": "zcfdb", "top": "260", "left": "73" },
            { "name": "zcsfz", "top": "260", "left": "335" },
            { "name": "srf", "top": "308", "left": "73" },
            { "name": "srfddb", "top": "340", "left": "73" },
            { "name": "gsxz", "top": "345", "left": "335" },
            { "name": "zczb", "top": "390", "left": "73" },
            { "name": "srsfz", "top": "390", "left": "335" },
            { "name": "bdjbqk", "top": "437", "left": "73" },
            { "name": "zcqx", "top": "745", "left": "73" },
            { "name": "qqjg", "top": "780", "left": "73" },
            { "name": "qzbh", "top": "780", "left": "345" },
            { "name": "zcfs", "top": "815", "left": "73" },
            { "name": "jyfs", "top": "815", "left": "345" },
            { "name": "jydj", "top": "855", "left": "73" },
            { "name": "cjje", "top": "855", "left": "345" },
            { "name": "htqsrq", "top": "895", "left": "73" },
            { "name": "htbh", "top": "895", "left": "345" },
            { "name": "beizhu", "top": "104", "left": "584" },
            { "name": "nian", "top": "840", "left": "880" },
            { "name": "yue", "top": "840", "left": "970" },
            { "name": "ri", "top": "840", "left": "1030" }
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
    LODOP.SET_PRINT_PAGESIZE(0, 2700, 2600, "");
    LODOP.ADD_PRINT_HTM(0, 0, 2700, 2600, strFormHtml);
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
        });
jQuery(function ($) {
    $.get("../Ashx/BidH.ashx?action=print", { Id: Request.QueryString("id") }, function (data) {
    //2016-10-13 wh添加注释修改赋值代码本来bug都默认赋值同一个字段
        $("#txtnjz").text("2017");//农鉴字
        $("#txtxmbh").text(data.T[0].Properties);//产权类型
        $("#txtdjh").text(data.T[0].NoAssurance);//项目第几号
        $("#txtjycp").text(data.T[0].BidName);//交易产品
        $("#txtsyqr").text(data.T[0].Owner);//所有权人
        $("#txtzcf").text(data.T[0].LName);//转出方
        $("#txtcrfxz").text(data.T[0].TypeCertificationName);//出让方性质
        $("#txtzcxwpzjg").text(data.T[0].TradingCenterName); //转出批准机构
        $("#txtzcfdb").text(data.T[0].LName);//转出方代表
        $("#txtzcsfz").text(data.T[0].IDCard); //转出方身份证
        $("#txtsrf").text(data.T[0].Name);//受让方
        $("#txtsrfddb").text(data.T[0].Name); //法定代表人
        $("#txtgsxz").text(data.T[0].TypeCertificationName); //公司性质
        $("#txtzczb").text(data.T[0].Capital); //注册资本
        $("#txtsrsfz").text(data.T[0].BidName);//注册号身份证
        $("#txtbdjbqk").text(data.T[0].BidBasic);//标的基本情况
//        $("#txtzcqx").text("自" + data.T[0].StartDate.substring(0, 10) + "起 至" + data.T[0].EndDate.substring(0, 10) + "止");//转出期限
        $("#txtqqjg").text(data.T[0].RightsBodies);//确权机构
        $("#txtqzbh").text(data.T[0].WarrantNumber);//权证编号
        $("#txtzcfs").text(data.T[0].TurnOut);//转出方式
        $("#txtjyfs").text(data.T[0].StandardMode);//交易方式
        $("#txtjydj").text(data.T[0].LowTransaction);//交易底价
//        $("#txtcjje").text(data.T[0].Turnover);//成交金额
        $("#txtcjje").text(data.T[0].cjje);//成交金额
        $("#txthtqsrq").text(data.T[0].ContractDate);//合同签署日期
//        $("#txthtbh").text(data.T[0].ContractNo);//合同编号
//        $("#txtbeizhu").text("");//备注
        
        
        
    }, "json");
});
   </script>
     <style type="text/css" id="style1">
            .fnt
            {
                position: absolute;
                border-width: 0px;
                border-style: solid;
                width: 130px;
                height: 35px;
            }
            .fnt0
            {
                position: absolute;
                border-width: 0px;
                border-style: solid;
                width: 170px;
                height: 35px;
            }
            .fnt1
            {
                position: absolute;
                border-width: 0px;
                border-style: solid;
                width: 400px;
            }
            .fnt2
            {
                position: absolute;
                border-width: 0px;
                border-style: solid;
                height: 450px;
                width: 540px;
            }
            .fnt3
            {
                position: absolute;
                border-width: 0px;
                border-style: solid;
                width: 130px;
                font-size: 28px;
                height: 35px;
            }
        </style>
</head>
<body>
    <form id="form1" runat="server">
    <div style="position: absolute; left: 300px; ">注意：推荐使用EPSON LQ-790K打印机，边距-10
        <input type="button" value="打印" id="btnprint" onclick="btnPrintClick();" />
        <input type="button" value="打印第二页" id="btnprint2" onclick="btnPrintClick2();" style=" display:none;" />
    </div>
    <div id="showPage" style="width: 1480px; float:left;">
      
        <div id="njz" class="fnt3">
            <span id="txtnjz">测试</span>
        </div>
        <div id="djh" class="fnt3">
            <span id="txtdjh"></span>
        </div>
        <div id="jycp" class="fnt0">
            <span id="txtjycp">测试</span>
        </div>
        <div id="xmbh" class="fnt">
            <span id="txtxmbh">测试</span>
        </div>
        <div id="syqr" class="fnt">
            <span id="txtsyqr">测试</span>
        </div>
        <div id="zcf" class="fnt">
            <span id="txtzcf">测试</span>
        </div>
        <div id="zcxwpzjg" class="fnt">
        <span id="txtcrfxz"></span>
           <%-- <span id="txtzcxwpzjg"></span>--%>
        </div>
        <div id="zcfdb" class="fnt">
            <span id="txtzcfdb">测试</span>
        </div>
        <div id="zcsfz" class="fnt">
            <span id="txtzcsfz">测试</span>
        </div>
        <div id="srf" class="fnt">
            <span id="txtsrf">测试</span>
        </div>
        <div id="srfddb" class="fnt">
            <span id="txtsrfddb">测试</span>
        </div>
        <div id="gsxz" class="fnt">
            <span id="txtgsxz">测试</span>
        </div>
        <div id="zczb" class="fnt">
            <span id="txtzczb">测试</span>
        </div>
        <div id="srsfz" class="fnt">
            <span id="txtsrsfz">测试</span>
        </div>
        <div id="bdjbqk" class="fnt1">
            <span id="txtbdjbqk">测试</span>
        </div>
        <div id="zcqx" class="fnt2">
          <%--  <span id="txtzcqx">测试</span>--%>
            <asp:Label ID="lbzcqx" runat="server" Text=""></asp:Label>
        </div>
        <div id="qqjg" class="fnt">
            <span id="txtqqjg">测试</span>
        </div>
        <div id="qzbh" class="fnt">
            <span id="txtqzbh">测试</span>
        </div>
        <div id="zcfs" class="fnt">
            <span id="txtzcfs">测试</span>
        </div>
        <div id="jyfs" class="fnt">
            <span id="txtjyfs">测试</span>
        </div>
        <div id="jydj" class="fnt">
            <span id="txtjydj">测试</span>
        </div>
        <div id="cjje" class="fnt">
         
            <asp:Label ID="lbcjje" runat="server" Text=""></asp:Label>
        </div>
        <div id="htqsrq" class="fnt">
            <span id="txthtqsrq">测试</span>
        </div>
        <div id="htbh" class="fnt">
           
            <asp:Label ID="lbhtbh" runat="server" Text=""></asp:Label>
        </div>
        <div id="beizhu" class="fnt2">
          
            <asp:Label ID="lbbeizhu" runat="server" Text="的撒范德萨范德萨范德萨"></asp:Label>
        </div>
        <div id="nian" class="fnt">
            <span id="txtnian"></span>
        </div>
        <div id="yue" class="fnt">
            <span id="txtyue"></span>
        </div>
        <div id="ri" class="fnt">
            <span id="txtri"></span>
        </div>
    </div>
    
    </form>
</body>
</html>
