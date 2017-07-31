<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="Web.LED._default" %>

<!DOCTYPE html>

<html>
<head>
<meta  charset="UTF-8"/>
<title>南昌农村产权交易公告</title>
<meta name="keywords" content="产权，产权交易公告"/>
<meta name="description" content="产权"/>
<style type="text/css">
*{padding: 0;margin:0;}
body{font-family: "微软雅黑";font-size: 18px;background: url(images/bg.jpg) no-repeat center top; color: #363636;}
.main{ width: 1356px; margin: 0 auto;}
.time{color: #fff; text-align: right; padding-right: 15px; line-height: 30px; margin-bottom: 50px;}
.tit{background: url(images/ad.png) no-repeat center center; height: 65px;}
.tit1{background: url(images/over.png) no-repeat center center; height: 65px;}
.tit_list{padding: 0 20px; }
.tit_list table{width: 100%; border-collapse:collapse;border:1px solid #9c9c9c; text-align: left; background-color: #fff;}
.tit_list table td,.tit_list table th{padding-left: 8px; height: 38px;empty-cells:show; border-bottom: 1px solid #bebebe;}
.tit_list table th{background-color: #90d4ff; font-weight: 400;}
.ad_red{color:#c92828;}
.ad_green{color:#167809;}
.ad_yellow{color:#8b4c0f;}
.w1{width: 160px;}
.w2{width:230px;}
.w3{}
</style>
  <script>
function showtime()
{
var today,hour,second,minute,year,month,date;
var strDate ;
today=new Date();
var n_day = today.getDay();
switch (n_day)
{
    case 0:{
      strDate = "星期日"
    }break;
    case 1:{
      strDate = "星期一"
    }break;
    case 2:{
      strDate ="星期二"
    }break;
    case 3:{
      strDate = "星期三"
    }break;
    case 4:{
      strDate = "星期四"
    }break;
    case 5:{
      strDate = "星期五"
    }break;
    case 6:{
      strDate = "星期六"
    }break;
    case 7:{
      strDate = "星期日"
    }break;
}
year = today.getFullYear();
month = today.getMonth()+1;
date = today.getDate();
hour = today.getHours();
minute =today.getMinutes();
second = today.getSeconds();
document.getElementById("divtime").innerHTML = year + "年" + month + "月" + date + "日" + strDate + " " + hour + ":" + minute + ":" + second; //显示时间

setTimeout("showtime();", 1000); //设定函数自动执行时间为 1000 ms(1 s)
}
</script>
</head>
<body>
	<div class="main">
		<div class="time" id="divtime"><script> showtime();</script></div>
		<div class="tit"></div>
        <div class="tit_list">
            <table>
                <colgroup>
                    <col class="w2">
                    <col class="">
                    <col class="w2">
                    <col class="w1">
                    <col class="w1">
                </colgroup>
                <tr>
                    <th>项目编号</th>
                    <th>标的名称</th>
                    <th>项目类型</th>
                    <th>公告价格</th>
                    <th>截止时间</th>
                </tr>
                </table>
            <div id="showdiv" style="overflow:scroll; height: 235px;">
                <table style="height:235px; width:100%">
                    <tbody>
                        <asp:Repeater ID="repgp" runat="server">
                            <ItemTemplate>
                                <tr>
                        <td style="width:230px;">HJNJ<%#Eval("Admissibility") %></td>
                        <td style="width:490px;" class="ad_red"><%#Eval("bidname") %></td>
                        <td style="width:245px;"><%#Eval("Properties") %></td>
                        <td><%#Eval("ListingPrice") %></td>
                        <td><%#DateTime.Parse(Eval("EndDate").ToString()).ToString("yyyy-MM-dd") %></td>
                    </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                    
                       
                    </tbody>
                </table>
            </div>
            <script>
                function marques(lh, speed, delay) {
                    var intervalFunction;
                    var oHeight = 235; /** div的高度 **/
                    var scrollDiv = document.getElementById("showdiv");
                    var preTop = 0;
                   
                    scrollDiv.scrollTop = 0;
                    //var p=false;   

                    function start() {
                        
                        intervalFunction = setInterval(scrolling, speed);
                    };

                    function scrolling() {
                        
                        if (scrollDiv.scrollHeight - scrollDiv.offsetHeight < scrollDiv.scrollTop) {
                            preTop = scrollDiv.scrollTop;
                            scrollDiv.scrollTop += 1;
                            if (preTop >= scrollDiv.scrollHeight || preTop == scrollDiv.scrollTop) {
                                scrollDiv.scrollTop = 0;
                            }
                        } else {
                            // clearInterval(intervalFunction);    清除定时器
                            // setTimeout(start,delay);    继续定时器
                        }
                        scrollDiv.scrollTop += 1;
                        //mouse事件只有写在方法内才能保证over和out的scrollTop高度一致性
                        scrollDiv.onmouseover = function () { clearInterval(intervalFunction) };
                        scrollDiv.onmouseout = function () { intervalFunction = setInterval(scrolling, speed) };
                    };

                    setTimeout(start, delay);
                };
                marques(20, 120, 50);
                /**marquees(一次滚动高度,速度,停留时间);**/
            </script>  
        </div>
		<div class="tit1"></div>
				<div class="tit_list">
			<table>
				 <colgroup>
                 <col class="w2">
                 <col class="">
                 <col class="w2">
                 <col class="w1">
                 <col class="w1">
                </colgroup>
				<tr>
					<th>鉴证书号</th>
					<th>标的名称</th>
					<th>项目类型</th>
					<th>成交价格</th>
					<th>交易完成</th>
				</tr>
                </table>
                    <div id="showdiv2" style="overflow:scroll; height: 235px;">
                <table style="height:235px; width:100%">
                    <tbody>
                        <asp:Repeater ID="repwc" runat="server">
                            <ItemTemplate>
                                <tr>
                        <td style="width:230px;">HJNJ<%#Eval("NoAssurance") %></td>
                        <td style="width:490px;" class="ad_green"><%#Eval("bidname") %></td>
                        <td style="width:245px;"><%#Eval("Properties") %></td>
                        <td><%#Eval("ListingPrice") %></td>
                        <td class="ad_yellow">交易完成</td>
                    </tr>
                            </ItemTemplate>
                        </asp:Repeater>
				
                        </tbody>
			</table>
                        </div>
                     <script>
                function marques2(lh, speed, delay) {
                    var intervalFunction;
                    var oHeight = 235; /** div的高度 **/
                    var scrollDiv = document.getElementById("showdiv2");
                    var preTop = 0;
                   
                    scrollDiv.scrollTop = 0;
                    //var p=false;   

                    function start() {
                        
                        intervalFunction = setInterval(scrolling, speed);
                    };

                    function scrolling() {
                        
                        if (scrollDiv.scrollHeight - scrollDiv.offsetHeight < scrollDiv.scrollTop) {
                            preTop = scrollDiv.scrollTop;
                            scrollDiv.scrollTop += 1;
                            if (preTop >= scrollDiv.scrollHeight || preTop == scrollDiv.scrollTop) {
                                scrollDiv.scrollTop = 0;
                            }
                        } else {
                            // clearInterval(intervalFunction);    清除定时器
                            // setTimeout(start,delay);    继续定时器
                        }
                        scrollDiv.scrollTop += 1;
                        //mouse事件只有写在方法内才能保证over和out的scrollTop高度一致性
                        scrollDiv.onmouseover = function () { clearInterval(intervalFunction) };
                        scrollDiv.onmouseout = function () { intervalFunction = setInterval(scrolling, speed) };
                    };

                    setTimeout(start, delay);
                };
                marques2(20, 120, 500);
                /**marquees(一次滚动高度,速度,停留时间);**/
            </script>  
		</div>
	</div>
</body>
</html>
