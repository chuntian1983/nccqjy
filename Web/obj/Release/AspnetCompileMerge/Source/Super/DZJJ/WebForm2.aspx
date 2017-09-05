<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="Web.Super.DZJJ.WebForm2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>  
<head>  
    <meta charset="utf-8">  
    <title>倒计时</title>  
    <script type="text/javascript" src="../../Scripts/jquery-1.4.1.min.js"></script>  
    <script type="text/javascript">


        var tt = 0;
        $(function () {
            function show() {
                tt = tt + 1;
                for (var i = 0; i < $('tr').length; i++) {
                    var starttime = new Date($('tr').eq(i).find('td').eq(0).text()).getTime();
                    var endtime = new Date($('tr').eq(i).find('td').eq(2).text()).getTime()
                    var overtime = endtime - starttime - tt * 1000;
                    // var overtime = endtime - starttime;  
                    var fz = parseInt(overtime / 60000);
                    var mz = (overtime - (fz * 60000)) / 1000;
                    var str = '0分0秒';
                    var str1 = fz + '分' + mz + '秒';
                    if (overtime <= 0) {
                        $('tr').eq(i).find('td').eq(1).html(str);
                    }
                    else {
                        $('tr').eq(i).find('td').eq(1).html(str1);
                    }


                }


            }
            setInterval(show, 1000); // 注意函数名没有引号和括弧！  
            // 使用setInterval("show()",3000);会报“缺少对象”  


        });  
  
  
  
  
  
  
    
</script>  
</head>  
<body>  
    <table>  
        <tr>  
            <td>2017-08-28 08:21:51</td>  
            <td>时间</td>  
            <td>2017-08-28 09:00:00</td>  
        </tr>  
        <tr>  
            <td>2017-08-27 08:21:00</td>  
            <td>时间</td>  
            <td>2017-08-27 09:00:00</td>  
        </tr>  
        <tr>  
            <td>2017-08-26 08:21:00</td>  
            <td>时间</td>  
            <td>2017-08-26 09:00:00</td>  
        </tr>  
        <tr>  
            <td>2017-08-25 08:21:00</td>  
            <td>时间</td>  
            <td>2017-08-25 09:00:00</td>  
        </tr>  
        <tr>  
            <td>2017-08-24 08:21:00</td>  
            <td>时间</td>  
            <td>2017-08-24 09:00:00</td>  
        </tr>  
    </table>  
</body>  
</html>  
