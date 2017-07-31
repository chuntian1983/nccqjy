<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AttPrint.aspx.cs" Inherits="Web.Super.Bi.AttPrint" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>打印页</title>
    <script src="../Scripts/easyUI/jquery.min.js" type="text/javascript" language="javascript"></script>
    <script src="../Scripts/print/CheckActivX.js" type="text/javascript"></script>
   <script type="text/javascript">
   $(document).ready(function () {
    var arry = [
            
            { "name": "djh", "top": "62", "left": "234" },
            { "name": "jycp", "top": "108", "left": "183" },
            { "name": "xmbh", "top": "116", "left": "495" },
            { "name": "syqr", "top": "160", "left": "233" },
            { "name": "zcf", "top": "198", "left": "233" },
            { "name": "zcxwpzjg", "top": "188", "left": "495" },
            { "name": "zcfdb", "top": "248", "left": "233" },
            { "name": "zcsfz", "top": "248", "left": "495" },
            { "name": "srf", "top": "296", "left": "233" },
            { "name": "srfddb", "top": "328", "left": "233" },
            { "name": "gsxz", "top": "333", "left": "495" },
            { "name": "zczb", "top": "378", "left": "233" },
            { "name": "srsfz", "top": "378", "left": "495" },
            { "name": "bdjbqk", "top": "425", "left": "233" },
            { "name": "zcqx", "top": "733", "left": "233" },
            { "name": "qqjg", "top": "763", "left": "233" },
            { "name": "qzbh", "top": "763", "left": "495" },
            { "name": "zcfs", "top": "803", "left": "233" },
            { "name": "jyfs", "top": "803", "left": "495" },
            { "name": "jydj", "top": "843", "left": "233" },
            { "name": "cjje", "top": "843", "left": "495" },
            { "name": "htqsrq", "top": "883", "left": "233" },
            { "name": "htbh", "top": "883", "left": "495" },
            { "name": "beizhu", "top": "112", "left": "784" },
            { "name": "nian", "top": "826", "left": "1118" },
            { "name": "yue", "top": "826", "left": "1194" },
            { "name": "ri", "top": "826", "left": "1254" }
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
    LODOP.SET_PRINT_PAGESIZE(0, 3800, 2600, "");
    LODOP.ADD_PRINT_HTM(0, 0, 3800, 2600, strFormHtml);
};
function CreateOneFormPage2() {
var strBodyStyle = "<style>" + document.getElementById("style1").innerHTML + "</style>";
    var strFormHtml =strBodyStyle + "<body>" + document.getElementById("showPage2").innerHTML + "</body>";
    LODOP.SET_PRINT_PAGESIZE(0, 1900, 2600, "");
    LODOP.ADD_PRINT_HTM(0, 0, 1900, 2600, strFormHtml);
};
Request = {
    QueryString: function (item) {
        var svalue = location.search.match(new RegExp("[\?\&]" + item + "=([^\&]*)(\&?)", "i"));
        return svalue ? svalue[1] : svalue;
    }
};


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
         #showpage {
             font-size:12px;
         }
        </style>
</head>
<body>
    <form id="form1" runat="server">
    <div style="position: absolute; left: 300px;">注意：推荐使用EPSON LQ-790K打印机，边距-10
        <input type="button" value="打印" id="btnprint" onclick="btnPrintClick();" />
        <input type="button" value="打印第二页" id="btnprint2" onclick="btnPrintClick2();" style=" display:none;" />
    </div>
    <div id="showPage" style="width: 1270;">
       
        <div id="njz" class="fnt3" style="display:none;">
            <span id="txtnjz">1</span>
        </div>
        <div id="djh" class="fnt3">
           <asp:Label ID="lbxmbh" 
        runat="server"></asp:Label>
        </div>
        <div id="jycp" class="fnt0">
            <asp:Label ID="lbjycp" 
        runat="server"></asp:Label>
        </div>
        <div id="xmbh" class="fnt">
             <asp:Label ID="lbcqlx" runat="server" ></asp:Label>
        </div>
        <div id="syqr" class="fnt" style="width:400px;">
            <asp:Label ID="lbsyqr" 
        runat="server"></asp:Label>
        </div>
        <div id="zcf" class="fnt">
            <asp:Label ID="lbzcf" 
        runat="server"></asp:Label>
        </div>
        <div id="zcxwpzjg" class="fnt">
        <asp:Label 
            ID="lbzcxwpzjg" runat="server" Font-Size="10pt"></asp:Label>
           <%-- <span id="txtzcxwpzjg"></span>--%>
        </div>
        <div id="zcfdb" class="fnt">
            <asp:Label 
        ID="lbzcfdb" runat="server"></asp:Label>
        </div>
        <div id="zcsfz" class="fnt">
            <asp:Label 
        ID="lbzcfsfz" runat="server" Font-Size="12px"></asp:Label>
        </div>
        <div id="srf" class="fnt" style="width:400px;">
            <asp:Label 
        ID="lbsrf" runat="server"></asp:Label>
        </div>
        <div id="srfddb" class="fnt">
            <asp:Label 
        ID="lbsrffddbr" runat="server"></asp:Label>
        </div>
        <div id="gsxz" class="fnt">
            <asp:Label 
        ID="lbgsxz" runat="server"></asp:Label>
        </div>
        <div id="zczb" class="fnt">
            <asp:Label 
        ID="lbzczb" runat="server" ></asp:Label>
        </div>
        <div id="srsfz" class="fnt">
            <asp:Label 
        ID="lbsrfsfz" runat="server" Font-Size="12px"></asp:Label>
        </div>
        <div id="bdjbqk" class="fnt1">
            <asp:Label 
            ID="lbbdjbqk" runat="server"></asp:Label>
        </div>
        <div id="zcqx" class="fnt2" style="width:450px;">
          <%--  <span id="txtzcqx">测试</span>--%>
            <asp:Label ID="lbzcqx" runat="server" Text=""></asp:Label>
        </div>
        <div id="qqjg" class="fnt">
            <asp:Label ID="lbqqjg" 
            runat="server" ></asp:Label>
        </div>
        <div id="qzbh" class="fnt">
            <asp:Label ID="lbguimo" 
            runat="server"></asp:Label>
        </div>
        <div id="zcfs" class="fnt">
            <asp:Label 
            ID="lbzcfs" runat="server"></asp:Label>
        </div>
        <div id="jyfs" class="fnt">
            <asp:Label ID="lbjyfs" 
            runat="server"></asp:Label>
        </div>
        <div id="jydj" class="fnt">
            <asp:Label ID="lbjydj" 
            runat="server"></asp:Label>
        </div>
        <div id="cjje" class="fnt">
         
            <asp:Label ID="lbcjje" 
            runat="server"></asp:Label>
        </div>
        <div id="htqsrq" class="fnt">
            <asp:Label 
            ID="lbhtqsrq" runat="server"></asp:Label>
        </div>
        <div id="htbh" class="fnt">
           
            <asp:Label ID="lbhtbh" 
            runat="server"></asp:Label>
        </div>
        <div id="beizhu" class="fnt2">
          
            <asp:Label ID="lbbeizhu" runat="server" Text=""></asp:Label>
        </div>
        <div id="nian" class="fnt">
            <asp:Label ID="lbnian" 
               runat="server"></asp:Label>
        </div>
        <div id="yue" class="fnt">
            <asp:Label ID="lbyue" runat="server"></asp:Label>
        </div>
        <div id="ri" class="fnt">
            <asp:Label ID="lbri" runat="server"></asp:Label>
        </div>
    </div>
    <div id="showPage2" style="width: 1270;">

    
    </div>
    </form>
</body>
</html>
