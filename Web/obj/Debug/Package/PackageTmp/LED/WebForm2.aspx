<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="Web.LED.WebForm2" %>

<!DOCTYPE html>

<html>
 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title></title>
<link rel="stylesheet" type="text/css" href="style/main.css" />
<style type="text/css">
body
{
    margin:0px;
    padding:0px;
    font-size:9pt;
    color:#000000;
}
 
a:link
{
    font-size: 9pt;
    color:#000000;
    text-decoration: none;
}
 
a:visited
{
    color:#000000;
    text-decoration:none;
}
 
a:hover
{
    color:#ff0000;
    text-decoration:none;
}
 
td
{
    text-align:center;
    font-size:9pt;
}
 
#demo
{
    overflow:hidden;
    width:100%;
    height:120px;
}
</style>
</head>
 
<body>
<center>
<br><br><br><br>
<table cellpadding="2" width="500" style="border-style:dotted; border-width:1px; border-collapse: collapse" border="0" cellspacing="2">
  <thead>
    <tr bgcolor="#F8BE4F">
      <td colspan="4" align="center">菜市场价格滚动条</td>
    </tr>
    <tr bgcolor="#F8BE4F">
      <td width="10%" bgcolor="#D8D8D8" height="22">品种</td>
      <td width="30%" bgcolor="#D8D8D8" height="22">最低价（ 元/公斤)</td>
      <td width="30%" bgcolor="#D8D8D8" height="22">最高价（ 元/公斤)</td>
      <td width="30%" bgcolor="#D8D8D8" height="22">平均价（ 元/公斤)</td>
    </tr>
  </thead>
</table>
<div id="demo" style="width:500px; height: 100px">
  <div id="demo1">
<table width="100%" border="1" bordercolor="#EBEBEB" cellpadding="2" style="border-style: dotted; border-width: 1px">
  <tr>
    <td width="10%">尖椒</td>
    <td width="30%">0.80</td>
    <td width="30%">1.00</td>
    <td width="30%">0.90</td>
  </tr>
  <tr>
    <td width="10%">尖椒</td>
    <td width="30%">0.80</td>
    <td width="30%">1.00</td>
    <td width="30%">0.90</td>
  </tr>
  <tr>
    <td width="10%">尖椒</td>
    <td width="30%">0.80</td>
    <td width="30%">1.00</td>
    <td width="30%">0.90</td>
  </tr>
  <tr>
    <td width="10%">尖椒</td>
    <td width="30%">0.80</td>
    <td width="30%">1.00</td>
    <td width="30%">0.90</td>
  </tr>
  <tr>
    <td width="10%">尖椒</td>
    <td width="30%">0.80</td>
    <td width="30%">1.00</td>
    <td width="30%">0.90</td>
  </tr>
</table>
  </div>
  <div id="demo2"></div>
</div>
<script type="text/javascript">
<!--
demo2.innerHTML = demo1.innerHTML;
var speed = 100;
function Marquee()
{
    if (demo2.offsetTop <= demo.scrollTop)
    {
        demo.scrollTop -= demo1.offsetHeight;
    }
    else
    {
        demo.scrollTop++;
    }
}
var myInterval = setInterval(Marquee, speed);
demo.onmouseover = function() {clearInterval(myInterval);};
demo.onmouseout = function() {myInterval = setInterval(Marquee,speed);};
-->
</script>
</center>
    <div>
        <script>
            var va=<%=fileToDelete%>;
            alert(va);
        </script>
    </div>
</body>
</html>

