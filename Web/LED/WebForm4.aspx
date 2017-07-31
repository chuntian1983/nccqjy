<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm4.aspx.cs" Inherits="Web.LED.WebForm4" %>

<!DOCTYPE html>

<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>table在div内自滚动（上下）</title>
    <style>
        #tables tr { height:35px;
        }
    </style>
</head>

<body>
    
    <form id="form1" runat="server">
    
<div id="show" style="overflow:hidden;height:235px;border:1px solid red;">   
  <table id="tables"  width="100%";height=235px; border="1px solid red;" cellspacing="0" style="border-collapse:collapse;">
        	
            <tbody>
				  <tr>
                  	<td>所发生的放松地方三等份1</td>
                  	<td>所发生的放松地方三等份</td>
                  	<td>所发生的放松地方三等份</td>
                  	<td>所发生的放松地方三等份</td>
                  </tr>    
				  <tr>
                  	<td>所发生的放松地方三等份2</td>
                  	<td>所发生的放松地方三等份</td>
                  	<td>所发生的放松地方三等份</td>
                  	<td>所发生的放松地方三等份</td>
                  </tr> 
				  <tr>
                  	<td>所发生的放松地方三等份3</td>
                  	<td>所发生的放松地方三等份</td>
                  	<td>所发生的放松地方三等份</td>
                  	<td>所发生的放松地方三等份</td>
                  </tr> 
				  <tr>
                  	<td>所发生的放松地方三等份4</td>
                  	<td>所发生的放松地方三等份</td>
                  	<td>所发生的放松地方三等份</td>
                  	<td>所发生的放松地方三等份</td>
                  </tr> 
				  <tr>
                  	<td>所发生的放松地方三等份5</td>
                  	<td>所发生的放松地方三等份</td>
                  	<td>所发生的放松地方三等份</td>
                  	<td>所发生的放松地方三等份</td>
                  </tr> 
				  <tr>
                  	<td>所发生的放松地方三等份6</td>
                  	<td>所发生的放松地方三等份</td>
                  	<td>所发生的放松地方三等份</td>
                  	<td>所发生的放松地方三等份</td>
                  </tr> 
				  <tr>
                  	<td>所发生的放松地方三等份7</td>
                  	<td>所发生的放松地方三等份</td>
                  	<td>所发生的放松地方三等份</td>
                  	<td>所发生的放松地方三等份</td>
                  </tr> 
				  <tr>
                  	<td>所发生的放松地方三等份8</td>
                  	<td>所发生的放松地方三等份</td>
                  	<td>所发生的放松地方三等份</td>
                  	<td>所发生的放松地方三等份</td>
                  </tr>   
				  <tr>
                  	<td>所发生的放松地方三等份9</td>
                  	<td>所发生的放松地方三等份</td>
                  	<td>所发生的放松地方三等份</td>
                  	<td>所发生的放松地方三等份</td>
                  </tr>     
				  <tr>
                  	<td>所发生的放松地方三等份10</td>
                  	<td>所发生的放松地方三等份</td>
                  	<td>所发生的放松地方三等份</td>
                  	<td>所发生的放松地方三等份</td>
                  </tr>     
				  <tr>
                  	<td>所发生的放松地方三等份11</td>
                  	<td>所发生的放松地方三等份</td>
                  	<td>所发生的放松地方三等份</td>
                  	<td>所发生的放松地方三等份</td>
                  </tr>     
				  <tr>
                  	<td>所发生的放松地方三等份12</td>
                  	<td>所发生的放松地方三等份</td>
                  	<td>所发生的放松地方三等份</td>
                  	<td>所发生的放松地方三等份</td>
                  </tr>         
            </tbody>
  </table>
</div>   
<script>   
	function marques(lh,speed,delay){    
		var intervalFunction;    
		var oHeight = 210; /** div的高度 **/  
		var scrollDiv=document.getElementById("show");    
		var preTop = 0;   
		scrollDiv.scrollTop = 0;   
		//var p=false;   
		 
		function start(){    
			intervalFunction=setInterval(scrolling,speed);       
		};    
		
		function scrolling(){  
		    if( scrollDiv.scrollHeight-scrollDiv.offsetHeight<scrollDiv.scrollTop){   
				preTop = scrollDiv.scrollTop;   
				scrollDiv.scrollTop+=1;   
				if(preTop >= scrollDiv.scrollHeight || preTop==scrollDiv.scrollTop){   
					scrollDiv.scrollTop = 0;   
				}   
			}else{   
			  // clearInterval(intervalFunction);    清除定时器
			  // setTimeout(start,delay);    继续定时器
			}  
			 scrollDiv.scrollTop+=1; 
			 //mouse事件只有写在方法内才能保证over和out的scrollTop高度一致性
	         scrollDiv.onmouseover=function() {clearInterval(intervalFunction)}; 
	         scrollDiv.onmouseout=function() {intervalFunction=setInterval(scrolling,speed)};  
		};
		    
		setTimeout(start,delay);    
	};
	marques(25,40,500);    
    /**marquees(一次滚动高度,速度,停留时间);**/    
</script> 
    <div id="showdiv3" style="overflow:scroll; height: 235px;border:1px solid red;">
                <table style="height:235px; width:100%" border="1px solid red;" cellspacing="0" style="border-collapse:collapse;">
                    <tbody>
                    <tr>
                        <td>HJNS2017000033</td>
                        <td>南昌市东坡区望山街道办事处民用蒸汽设备转包1</td>
                        <td>农村集体经营性资产</td>
                        <td>289/亩</td>
                        <td>2017-01-12</td>
                    </tr>
                    <tr>
                        <td>HJNS2017000033</td>
                        <td  >南昌市东坡区望山街道办事处民用蒸汽设备转包2</td>
                        <td>农村集体经营性资产</td>
                        <td>289/亩</td>
                        <td>2017-01-12</td>
                    </tr>
                    <tr>
                        <td>HJNS2017000033</td>
                        <td  >南昌市东坡区望山街道办事处民用蒸汽设备转包3</td>
                        <td>农村集体经营性资产</td>
                        <td>289/亩</td>
                        <td>2017-01-12</td>
                    </tr>
                    <tr>
                        <td>HJNS2017000033</td>
                        <td>南昌市东坡区望山街道办事处民用蒸汽设备转包4</td>
                        <td>农村集体经营性资产</td>
                        <td>289/亩</td>
                        <td>2017-01-12</td>
                    </tr>
                    <tr>
                        <td>HJNS2017000033</td>
                        <td  >南昌市东坡区望山街道办事处民用蒸汽设备转包5</td>
                        <td>农村集体经营性资产</td>
                        <td>289/亩</td>
                        <td>2017-01-12</td>
                    </tr>
                    <tr>
                        <td>HJNS2017000033</td>
                        <td  >南昌市东坡区望山街道办事处民用蒸汽设备转包6</td>
                        <td>农村集体经营性资产</td>
                        <td>289/亩</td>
                        <td>2017-01-12</td>
                    </tr>
                        <tr>
                        <td>HJNS2017000033</td>
                        <td>南昌市东坡区望山街道办事处民用蒸汽设备转包7</td>
                        <td>农村集体经营性资产</td>
                        <td>289/亩</td>
                        <td>2017-01-12</td>
                    </tr>
                        <tr>
                        <td>HJNS2017000033</td>
                        <td>南昌市东坡区望山街道办事处民用蒸汽设备转包8</td>
                        <td>农村集体经营性资产</td>
                        <td>289/亩</td>
                        <td>2017-01-12</td>
                    </tr>
                        <tr>
                        <td>HJNS2017000033</td>
                        <td>南昌市东坡区望山街道办事处民用蒸汽设备转包9</td>
                        <td>农村集体经营性资产</td>
                        <td>289/亩</td>
                        <td>2017-01-12</td>
                    </tr>
                        <tr>
                        <td>HJNS2017000033</td>
                        <td>南昌市东坡区望山街道办事处民用蒸汽设备转包10</td>
                        <td>农村集体经营性资产</td>
                        <td>289/亩</td>
                        <td>2017-01-12</td>
                    </tr>
                        <tr>
                        <td>HJNS2017000033</td>
                        <td>南昌市东坡区望山街道办事处民用蒸汽设备转包11</td>
                        <td>农村集体经营性资产</td>
                        <td>289/亩</td>
                        <td>2017-01-12</td>
                    </tr>
                        <tr>
                        <td>HJNS2017000033</td>
                        <td>南昌市东坡区望山街道办事处民用蒸汽设备转包12</td>
                        <td>农村集体经营性资产</td>
                        <td>289/亩</td>
                        <td>2017-01-12</td>
                    </tr>
                        <tr>
                        <td>HJNS2017000033</td>
                        <td>南昌市东坡区望山街道办事处民用蒸汽设备转包13</td>
                        <td>农村集体经营性资产</td>
                        <td>289/亩</td>
                        <td>2017-01-12</td>
                    </tr>
                        <tr>
                        <td>HJNS2017000033</td>
                        <td>南昌市东坡区望山街道办事处民用蒸汽设备转包14</td>
                        <td>农村集体经营性资产</td>
                        <td>289/亩</td>
                        <td>2017-01-12</td>
                    </tr>
                    </tbody>
                </table>
            </div>
            <script>
                function marques2(lh, speed, delay) {
                    var intervalFunction;
                    var oHeight = 235; /** div的高度 **/
                    var scrollDiv = document.getElementById("showdiv3");
                    var preTop = 0;
                    //alert(scrollDiv.innerHTML);
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
                marques2(35, 80, 500);
                /**marquees(一次滚动高度,速度,停留时间);**/
            </script>  
        <asp:Button ID="Button1" runat="server" Text="创建多个Pdf新页" OnClick="Button1_Click" />
        <asp:Button ID="Button2" runat="server" Text="Button" />
        <asp:Button ID="Button3" runat="server" Text="Button" />
        <asp:Button ID="Button4" runat="server" Text="Button" />
        <asp:Button ID="Button5" runat="server" Text="Button" />
    </form>
</body>

</html>
