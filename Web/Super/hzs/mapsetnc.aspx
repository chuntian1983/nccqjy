<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="mapsetnc.aspx.cs" Inherits="Web.Super.hzs.mapsetnc" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
	<style type="text/css">
		body, html,#allmap {width: 100%;height: 100%;overflow: hidden;margin:0;font-family:"微软雅黑";}
		
	</style>
        <script src="../Scripts/easyUI/jquery.min.js" type="text/javascript" language="javascript"></script>
    <link href="../../css/bootstrap.min.css" rel="stylesheet" />
     <script src="../../js/bootstrap.min.js" type="text/javascript"></script>
	<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=06b1b3f1be14f6edb14eb5ca683413f4"></script>
    <script type="text/javascript" src="http://api.map.baidu.com/api?v=1.4"></script>
<script type="text/javascript" src="http://api.map.baidu.com/library/SearchControl/1.4/src/SearchControl_min.js"></script>
<%--<link rel="stylesheet" href="http://api.map.baidu.com/library/SearchControl/1.4/src/SearchControl_min.css" />--%>
<link rel="stylesheet" href="mapcss/mapcontrol.css" />
	<title>地图</title>
    <style type="text/css">
        #allmap
        {
            height:350px;
            }
    </style>
</head>
<body>
<div class=" panel panel-default">
<div class=" panel-heading">地图设置位置</div>
<div class=" panel-body">
<form runat="server" id="form1">
<div class="panel-group"><div class=" text-info">当前家庭农场名称：<%=strname %> 地址：<%=this.hdzb.Value %>  注意：请用鼠标点击地图位置选择坐标点进行保存,如果默认没有搜索到位置请自行搜索查询</div><br />
<div class=" text-primary">你选择的坐标点为：X:<asp:TextBox ID="txtx" runat="server"></asp:TextBox>Y:<asp:TextBox ID="txty"
    runat="server"></asp:TextBox></div> 
    <br />
    <asp:Button ID="Button1" runat="server" Text="保存位置坐标" 
        CssClass=" btn btn-primary" onclick="Button1_Click" />
    <asp:Button ID="Button2" runat="server" Text="返回列表" CssClass=" btn btn-primary" 
        onclick="Button2_Click" />
    <asp:HiddenField ID="hdzb" runat="server" Value="" />
</div>
</form>
 <div id="searchBox"></div>
<div id="allmap"></div>
</div>
</div>
</body>
</html>

<script type="text/javascript">
    // 百度地图API功能
    var map = new BMap.Map("allmap");
    map.centerAndZoom("威海", 12);
    map.enableScrollWheelZoom();   //启用滚轮放大缩小，默认禁用
    map.enableContinuousZoom();    //启用地图惯性拖拽，默认禁用

    var point = new BMap.Point(115.826, 28.629);
    //判断是否注册登记过
    var zbx = document.getElementById("txtx").value;
    var zby = document.getElementById("txty").value;

    if (zbx != null) {
        if (zby != null) {
            point = new BMap.Point(zbx, zby);
        }
    }
    map.centerAndZoom(point, 15);
    //    //ceshi
    //    var point2 = new BMap.Point(115.834693, 28.753568);
    //    var marker2 = new BMap.Marker(point2);
    //    map.addOverlay(marker2);
    //    marker2.setAnimation(BMAP_ANIMATION_BOUNCE); //跳动的动画

    var marker = new BMap.Marker(point);  // 创建标注
    map.addOverlay(marker);               // 将标注添加到地图中
    marker.setAnimation(BMAP_ANIMATION_BOUNCE); //跳动的动画
    var label = new BMap.Label("", { offset: new BMap.Size(20, -10) });
    marker.setLabel(label);
    var local = new BMap.LocalSearch(map, {
        renderOptions: { map: map }
    });

    //地图搜索

    var dizhi = document.getElementById("hdzb").value;
    local.search(dizhi);

    //创建检索控件
    var type = "";
    type = TRANSIT_ROUTE; //公交检索
    type = DRIVING_ROUTE; //驾车检索
    type = LOCAL_SEARCH; //本地检索
    var searchControl = new BMapLib.SearchControl({
        container: "searchBox" //存放控件的容器
    , map: map  //关联地图对象
    , type: type  //检索类型
    });
    //单击获取点击的经纬度
    map.addEventListener("click", function (e) {
        // alert('你确定设置这里的坐标' + e.point.lng + "," + e.point.lat);
        document.getElementById("txtx").value = e.point.lng;
        document.getElementById("txty").value = e.point.lat;
        //document.write('你确定设置这里的坐标' + e.point.lng + "," + e.point.lat);
    });
</script>
