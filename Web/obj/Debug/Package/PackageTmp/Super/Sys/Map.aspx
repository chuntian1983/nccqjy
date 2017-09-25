<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Map.aspx.cs" Inherits="Web.Super.Sys.Map" %>

<html>
<head>
    <title>地图追踪</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
    <style type="text/css">
        body, html
        {
            width: 100%;
            height: 100%;
            margin: 0;
            font-family: "微软雅黑";
        }
        #allmap
        {
            height: 500px;
            width: 100%;
        }
        #r-result
        {
            width: 100%;
            font-size: 14px;
        }
    </style>
</head>
<body onload="OnLoadMap();">
    <div id="allmap">
    </div>
</body>
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=QfZbXflq6oUoyM35ujXFlGTZWEskl7LW"></script>
<script type="text/javascript">
    var map = new BMap.Map("allmap");
    map.centerAndZoom(new BMap.Point(116.404, 39.915), 18);
    map.enableScrollWheelZoom(true);
    function OnLoadMap() {
        map.clearOverlays();
        var new_point = new BMap.Point(Request.QueryString("lng"), Request.QueryString("lat"));
        var marker = new BMap.Marker(new_point);
        map.addOverlay(marker);
        map.panTo(new_point);
    }
    Request = {
        QueryString: function (item) {
            var svalue = location.search.match(new RegExp("[\?\&]" + item + "=([^\&]*)(\&?)", "i"));
            return svalue ? svalue[1] : svalue;
        }
    }
</script>
</html>
