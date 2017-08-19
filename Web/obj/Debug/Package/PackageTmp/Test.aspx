<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Test.aspx.cs" Inherits="Web.Test" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>项目测试专用窗口</title>
    <SCRIPT src="齐鲁农村产权交易中心_files/sohuflash_1.js" type="text/javascript"></SCRIPT>
      		 
<SCRIPT src="齐鲁农村产权交易中心_files/jquery-1.8.3.min.js" type="text/javascript"></SCRIPT>
      		 
<SCRIPT src="齐鲁农村产权交易中心_files/tab.js" type="text/javascript"></SCRIPT>
      		 
<SCRIPT src="齐鲁农村产权交易中心_files/scroll.js" type="text/javascript"></SCRIPT>
      		 
<SCRIPT type="text/javascript">
    $(function () {
        $('.myscroll1').myScroll({
            speed: 40, //数值越大，速度越慢
            rowHeight: 26 //li的高度
        });
        $('.myscroll2').myScroll({
            speed: 40, //数值越大，速度越慢
            rowHeight: 26 //li的高度
        });
        $('.myscroll3').myScroll({
            speed: 40, //数值越大，速度越慢
            rowHeight: 26 //li的高度
        });
        $('.myscroll4').myScroll({
            speed: 40, //数值越大，速度越慢
            rowHeight: 26 //li的高度
        });
    });
    function myscrollbyOut(i) {
        $(".myscroll" + i).mouseover();
        $(".myscroll" + i).mouseout();
    } 
</SCRIPT>
       
<STYLE>
.myscroll1 ,.myscroll2 ,.myscroll3 ,.myscroll4 { background-color: #001824; width: 700px; height: 220px; margin: 0 auto; line-height: 26px; font-size: 12px; overflow: hidden;}
.myscroll1 li ,.myscroll2 li ,.myscroll3 li ,.myscroll4 li { height: 26px; border-bottom: 1px #666 solid; }
.myscroll1 a ,.myscroll2 a ,.myscroll3 a ,.myscroll4 a { display: block; width: 350px; float: left; text-align:left; color: #fff; padding-left: 10px; }
.myscroll1 a span ,.myscroll2 a span ,.myscroll3 a span ,.myscroll4 a span { color: #fff; }
.add-fuwudl { display: block; width: 220px; float: left; text-align: center; color: #fff; }
.add-time { display: block; width: 120px; text-align: center; float: left; color: #fff;}
.tab-gai .liz1 { background-image: url(images/e.jpg); }
</STYLE>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <%
            int DepaStatus = 2;
            Response.Write(DepaStatus <= 0);        
        
        %>
    </div>
    </form>
</body>
</html>
