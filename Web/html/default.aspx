<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="Web.html._default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
	<head>

		<title>威海市优秀农村新型主体分布图</title>
		<link rel="stylesheet" type="text/css" href="css/style.css"/>
        <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=06b1b3f1be14f6edb14eb5ca683413f4"></script>
        <script type="text/javascript">
            function fun() {

                __doPostBack('LinkButton1', '');
            }
        </script>
        <style type="text/css">
		body, html,#allmap {width: 100%;height: 100%;overflow: hidden;margin:0;font-family:"微软雅黑";}
		 #allmap
        {
            float: left;
	width: 74%;
	height: 800px;
            }
	</style>
	</head>
	<body>
    
		<div class="header">
			<div class="header_top">
				
			</div>
			<div class="header_bottom">
				<div class="header_bottom_l">
					<a href="default.aspx">返回首页</a>
				</div>
				<div class="header_bottom_r">
					<p>技术支持：山东农友软件有限公司 &nbsp;&nbsp;电话：5626025</p>
				</div>
			</div>
		</div>
        
		<div class="content">
        <form runat="server" id="form1">
			<div class="content_l">
				
                <asp:DropDownList ID="seldq" runat="server">
                    <asp:ListItem>威海市</asp:ListItem>
                    <asp:ListItem>文登</asp:ListItem>
                    <asp:ListItem>荣成</asp:ListItem>
                    <asp:ListItem>乳山</asp:ListItem>
                    <asp:ListItem>环翠</asp:ListItem>
                    <asp:ListItem>高区</asp:ListItem>
                    <asp:ListItem>经区</asp:ListItem>
                    <asp:ListItem>临港</asp:ListItem>
                </asp:DropDownList>
                <asp:DropDownList ID="sellb" runat="server">
                    <asp:ListItem>合作社</asp:ListItem>
                    <asp:ListItem>家庭农场</asp:ListItem>
               
                </asp:DropDownList>
				<input type="text" name="txthzs" id="txthzs" runat="server" value="" />
				<span>
					<img src="img/sreach.png" alt="检索" onclick="fun();"/>
                    <asp:LinkButton ID="LinkButton1" runat="server" onclick="LinkButton1_Click"></asp:LinkButton>
				</span>
				
				<p>在当前地图找到<%=jieguo %>个结果</p>
                <div style=" overflow:auto; width:355px; height:440px;">
				<asp:Repeater ID="repjg" runat="server"><ItemTemplate>
				<div class="content_l_b">
					<h3 onclick='javascript:dingwei(<%#Container.ItemIndex%>)'><%#Eval("mingcheng") %></h3>
					<p><%#Eval("dizhi") %></p>
				</div>
                </ItemTemplate></asp:Repeater>
				</div>
			</div>
        <input id="hdzuobiao" type="hidden" value="1" runat="server" />
        <input id="hdneirong" type="hidden" value="1" runat="server" />
            		</form>
			<!--<div style="clear: both;">-->
			<div id="allmap"></div>
			<div class="content_r" style=" display:none;">
			
				<div class="content_r_b">
					<div class="content_r_b_top">
						<p>荣成振业农机合作社</p>
						<span>详细&nbsp;&nbsp;>></span>
					</div>
					<div class="content_r_b_m">
						<div class="content_r_b_m_l">
							
						</div>
						<div class="content_r_b_m_r">
							<p>农机化服务器农民专业合作社2012年3月由郯城三农农业装备有限公司法人高永和杨集镇南湖里村农机大户、村书记朱武松等七人发起......</p>
						</div>
						
					</div>
					<div class="content_r_d">
							<p>山东省威海市荣成市901省道西50米</p>
							<ul>
								<li>王荣成</li>
								<li style="background: url(img/anniu.png) no-repeat 50px -79px;">156562568565</li>
								<li style="background: url(img/anniu.png) no-repeat 50px -118px;">zhenxin@126.com</li>
							</ul>
					</div>
				</div>
				
			</div>
		</div>

	</body>
</html>
<script type="text/javascript">
    // 百度地图API功能
    var map = new BMap.Map("allmap");
//    map.centerAndZoom("威海", 12);
    map.enableScrollWheelZoom();   //启用滚轮放大缩小，默认禁用
    map.enableContinuousZoom();    //启用地图惯性拖拽，默认禁用

    
    //ceshi
    var vaneirong=document.getElementById("hdneirong").value;
    var vajg = document.getElementById("hdzuobiao").value;
    if (vajg != "1") {
        var szjg = vajg.split("|");
        var vanr2 = vaneirong.split("|"); var content2;
        var infowindow2;
        for (var i = 0; i < szjg.length; i++) {
            var zbjg = szjg[i].split(",");
            var vanrxx2 = vanr2[i].split(",");
            var spoint = "point" + i;
//            alert(zbjg[0]);
            spoint = new BMap.Point(zbjg[0], zbjg[1]);
            //最后结果值
            point = new BMap.Point(zbjg[0], zbjg[1]);
            var smarker = "marker" + i;
            smarker = new BMap.Marker(spoint);
            map.addOverlay(smarker);
            // 单击事件
            smarker.addEventListener('click', function () {
                 content2 = "<table>";
                content2 = content2 + "<tr><td> 名称：" + vanrxx2[0] + "</td></tr>";
                content2 = content2 + "<tr><td> 地址：" + vanrxx2[1] + "</td></tr>";
                content2 = content2 + "<tr><td> 联系人：" + vanrxx2[2] + "</td></tr>";
                content2 = content2 + "<tr><td> 联系电话：" + vanrxx2[3] + "</td></tr>";
                content2 += "</table>";
                 infowindow2 = new BMap.InfoWindow(content2);

                smarkerw.openInfoWindow(infowindow2);
            });
        }

    }
    //121.786616,37.226431
    point = new BMap.Point(121.786616, 37.226431);

    map.centerAndZoom(point, 10);

    function dingwei(w) {
        if (vajg != "1") {
            var szjg = vajg.split("|");
            var vanr = vaneirong.split("|");
            var zbjg = szjg[w].split(",");
            var vanrxx = vanr[w].split(",");
                var spointw = new BMap.Point(zbjg[0], zbjg[1]);

                var smarkerw = new BMap.Marker(spointw);
                map.removeOverlay(smarkerw);
                map.addOverlay(smarkerw);
                map.panTo(spointw);
                //smarkerw.setAnimation(BMAP_ANIMATION_BOUNCE); //跳动的动画
                var label = new BMap.Label("dafsa", { offset: new BMap.Size(20, -10) });
                var content = "<table>";
                content = content + "<tr><td> 名称：" + vanrxx[0] + "</td></tr>";
                content = content + "<tr><td> 地址：" + vanrxx[1] + "</td></tr>";
                content = content + "<tr><td> 联系人：" + vanrxx[2] + "</td></tr>";
                content = content + "<tr><td> 联系电话：" + vanrxx[3] + "</td></tr>";
                content += "</table>";
                var infowindow = new BMap.InfoWindow(content);

                smarkerw.openInfoWindow(infowindow);
               
//                smarkerw.setLabel(label);


        }
    }

//    var point2 = new BMap.Point(115.834693, 28.753568);
//    var marker2 = new BMap.Marker(point2);
//    map.addOverlay(marker2);
//    marker2.setAnimation(BMAP_ANIMATION_BOUNCE); //跳动的动画

//    var marker = new BMap.Marker(point);  // 创建标注
//    map.addOverlay(marker);               // 将标注添加到地图中
//    marker.setAnimation(BMAP_ANIMATION_BOUNCE); //跳动的动画
//    var label = new BMap.Label("南昌市农村综合产权交易管理中心", { offset: new BMap.Size(20, -10) });
//    marker.setLabel(label);
//    //地图搜索
//    var local = new BMap.LocalSearch(map, {
//        renderOptions: { map: map }
//    });
//    local.search("荣成");

//    //单击获取点击的经纬度
//    map.addEventListener("click", function (e) {
//        alert('你确定设置这里的坐标' + e.point.lng + "," + e.point.lat);
//        document.write('你确定设置这里的坐标' + e.point.lng + "," + e.point.lat);
//    });
</script>
