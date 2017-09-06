<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="Web.Super.Bi.WebForm1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
 
<head>
    <meta charset="UTF-8" />
    <title>pro.html</title>
    <style type="text/css">
    </style>
    <script>
       
        var x = 1,
            interval;
        window.onload = function () {
            var d = new Date("2017/8/16,0:" + x + ":0");
            interval = setInterval(function () {
                var m = d.getMinutes();
                var s = d.getSeconds();
                m = m < 10 ? "0" + m : m;
                s = s < 10 ? "0" + s : s;
                btn.innerHTML = m + ":" + s;
                if (m == 0 && s == 0) {
                    clearInterval(interval);
                    return;
                }
                d.setSeconds(s - 1);
            }, 1000);
        }
    </script>
</head>
 
<body>
    <div id="btn"></div>
</body>
 
</html>

