<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="Web._Default" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    <link href="Super/Scripts/easyUI/themes/default/easyui.css" rel="stylesheet" type="text/css" />
<link href="Super/Scripts/easyUI/themes/icon.css" rel="stylesheet" type="text/css" />
    <script src="Scripts/Default.js" type="text/javascript" language="javascript"></script>
    <script src="Super/Scripts/easyUI/jquery.easyui.min.js" type="text/javascript" language="javascript"></script>
    <script src="Super/Scripts/easyUI/jquery.min.js" type="text/javascript" language="javascript"></script>
    <script src="Scripts/gundong.js" type="text/javascript" language="javascript"></script>
    <style>
        #scrollText {
 width: 800px;
 margin-right: auto;
 margin-left: auto;
 display:block;
 float:left;
  
}
.list_lh li{ padding-left:5px; height:32px; width:990px; line-height:35px;}
.list_lh li.lieven{ background:#F0F2F3;}
.sp2{ width:420px; display:inline-block;  text-align:center;}
.sp1{ width:10%; display:inline-block;  text-align:center;}
.sp5{ width:15%;display:inline-block;  text-align:center;}


.floating_ck{position:fixed;right:20px;top:30%;}
.floating_ck dl dd{position:relative;width:80px;height:80px;background-color:#646577;border-bottom:solid 1px #555666;text-align:center;background-repeat:no-repeat;background-position:center 20%;cursor:pointer;}
.floating_ck dl dd:hover{background-color:#e40231;border-bottom:solid 1px #a40324;}
.floating_ck dl dd:hover .floating_left{display:block;}
.consult,.words{background-image:url(images/icon0701/zxicon.png);}
.quote{background-image:url(images/icon0701/kficon.png);}
.qrcord{background-image:url(images/icon0701/erweima.png);}
.return{background-image:url(images/icon0701/fanhui.png);}
.floating_ck dd span{color:#fff;display:block;padding-top:54px;}
.floating_left{position:absolute;left:-160px;top:0px;width:160px;height:80px;background-color:#e40231;border-bottom:solid 1px #a40324;display:none;}
.floating_left a{color:#fff;line-height:80px;}
.floating_ewm{height:260px;top:-180px;}
.floating_ewm i{background-image:url(images/erweima2.jpg);display:block;width:145px;height:145px;margin:auto;margin-top:7px;}
.floating_ewm p{color:#fff;margin-top:5px;}
.floating_ewm .qrcord_p01{font-size:12px;line-height:20px;}
.floating_ewm .qrcord_p02{font-size:18px;}

.demo {width: 655px;height: 400px;font-size: 14px;position:relative;}
.demo a.control {position:absolute;display: block;top: 50%;margin-top: -78px;width: 76px;height: 112px;cursor: pointer;z-index: 2;background: url(../images/buttons.png) no-repeat}
.demo a.prev {left: 0;background-position: 0 0}
.demo a.next {right: 0;background-position: -76px 0}
.demo a.prev:hover {background-position: 0 -112px}
.demo a.next:hover {background-position: -76px -112px}

        #box-1 {
            height:100px;
             display:none;
             background-color:#c40b0c;
        }
        #box-1 li {
            line-height:45px;
             color:white;
              font-size:14px;
              font-weight:bold;
        }
            #box-1 li a {
                 cursor:pointer;
                 color:white;
            }

    </style>
    <script type="text/javascript" src="Scripts/top.js"></script>
    <script type="text/javascript">
        $(document).ready(function (e) {
            ScrollText($('#scrollText'), 33, 800, '<%=tzgg %>', 'left', 1, 20); //滚动字幕
        });
		
function shitabs(fid,sid,num,active,c) {


    for (i = 1; i <= num; i++) {

	if (i==active)
	{
        document.getElementById(fid + i).className = c;
        document.getElementById(sid+ i).style.display = 'block';
		
    }
	else{
    document.getElementById(fid + i).className = "";
    document.getElementById(sid + i).style.display = 'none';
    
	 }
}
}
		
</script>

<script type="text/javascript" src="Scripts/js/jquery.js"></script>
<script type="text/javascript" src="Scripts/js/scroll.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        //$('.list_lh li:even').addClass('lieven');
    })
    $(function () {
        
        $("div.list_lh").myScroll({
            speed: 60, //数值越大，速度越慢
            rowHeight: 40 //li的高度
        });
    });
</script>
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
   
 <!--服务中心-->
    <div class="sv"  id="divfuwu">
    	<div class="sv_fl">
    		<a class="sv_a" href="">业务办理（下载）</a>
    		<ul>
    			<%=zcfg %>
               
    		</ul>
    				
    	</div>
    	<div class="sv_bg"></div>
    	<div class="sv_fl fr">
    		<a class="sv_a" href="">日常工作（下载）</a>
    		<ul>
    			<%=jygz %>
    		</ul>
    		<%--<div class="sv_img"><img src="images/01.jpg"></div>--%>
    	</div>
    </div>
    <!--专题-->
     <div class="sv" style=" display:none;" id="divzhuanti">
    	<div class="zt">
    		<a class="sv_a" href="">最新专题</a>
            <div class="clearfix">
                    <%=zxzt1%>
    		</div>
    		<div>
    				<%=zxzt2%>
    		</div>
    	</div>
		<div class="sv_bg"></div>
        <div class="zt fr zt_old">
    		<a class="sv_a" href="newslist.aspx?ntid=5">往期专题</a>
    		<div class="clearfix">
    				<%=wqzt%>
    		</div>
    		<div>
    				<%=wqzt2%>
    		</div>
    	</div>
    </div> 

    <div class="main" style=" position:relative">
          <div id="box-1"  style="left:260px; top:0px;   width:130px;  z-index:9999;position:absolute; background-font-size:14px; text-align:center;">
		<ul>
			<li><a href="BidList2.aspx?t=4"  target="_blank">挂牌项目</a> </li>
			<li><a href="BidList.aspx?t=4"  target="_blank">成交项目</a></li>
			
		</ul>
	</div>
        <div class="tzhi">
            <a href="NewsList.aspx?ntid=9" style=" display:block; width:150px; float:left;">通知公告</a>
            <div id="scrollText"></div>
        </div>
        <div class="jj1">
        </div>
        <div class="fl">
            <div class="h_new_t">
            </div>
            <div class="h_new_c">
                
                 <div class="demo">
	<a class="control prev"></a><a class="control next abs"></a><!--自定义按钮，移动端可不写-->
	<div class="slider"><!--主体结构，请用此类名调用插件，此类名可自定义-->
		<ul>
			<%=strxw %>
		</ul>
	</div>
</div>
<script src="scripts/jquery.min.js"></script>
<script src="scripts/YuxiSlider.jQuery.min.js"></script>
<script>
$(".slider").YuxiSlider({
	width:655, //容器宽度
	height:400, //容器高度
	control:$('.control'), //绑定控制按钮
	during:4000, //间隔4秒自动滑动
	speed:800, //移动速度0.8秒
	mousewheel:true, //是否开启鼠标滚轮控制
	direkey:true //是否开启左右箭头方向控制
});
</script>
            </div>
            <div class="h_new_b">
            </div>
        </div>
        <div class="new_tab">
            <div class="clearfix new_s">
                <a href="NewsList.aspx?ntid=1" class="new_s1" id="dt1" onmouseover="shitabs('dt','dtcontent','3','1','new_s1')">新闻资讯</a><a href="NewsList.aspx?ntid=9" id="dt2" onmouseover="shitabs('dt','dtcontent','3','2','new_s1')">通知公告</a><a href="PlacardList.aspx?t=5" id="dt3" onmouseover="shitabs('dt','dtcontent','3','3','new_s1')">项目公告</a>
            </div>
            <div class="new_c" id="dtcontent1">
                <span id="lblNewsTop"></span>
                <asp:Repeater ID="repxinwen" runat=server>
                <ItemTemplate>
                <li><a target="_blank" href="NewsDetails.aspx?t=<%#Eval("NewsTypeId") %>&id=<%#Eval("id") %>"><%#Eval("NewsTitle").ToString().Length > 14 ? Eval("NewsTitle").ToString().Substring(0, 14) + ".." : Eval("NewsTitle").ToString()%></a>
                <span>[<%#DateTime.Parse(Eval("CreateDate").ToString()).ToString("yyyy-MM-dd")%>]</span>
                </li>
                </ItemTemplate>
                </asp:Repeater>
            </div>
			   <div class="new_c"  id="dtcontent2" style="display:none;">
                
                <asp:Repeater ID="repnotice" runat=server>
                <ItemTemplate>
                <li><a target="_blank" href="NewsDetails.aspx?t=<%#Eval("NewsTypeId") %>&id=<%#Eval("id") %>"><%#Eval("NewsTitle").ToString().Length > 18 ? Eval("NewsTitle").ToString().Substring(0, 18) + ".." : Eval("NewsTitle").ToString()%></a>
                <span>[<%#DateTime.Parse(Eval("CreateDate").ToString()).ToString("yyyy-MM-dd")%>]</span>
                </li>
                </ItemTemplate>
                </asp:Repeater>
             
            </div>            
            <div class="new_c"  id="dtcontent3" style="display:none;">
              <asp:Repeater ID="repxmgg" runat=server>
                <ItemTemplate>
                <li><a target="_blank" href="xmview.aspx?t=<%#Eval("id") %>&id=<%#Eval("id") %>"><%#Eval("xmtitle").ToString().Length > 14 ? Eval("xmtitle").ToString().Substring(0, 14) + ".." : Eval("xmtitle").ToString()%></a>
                <span>[<%#DateTime.Parse(Eval("xmsj").ToString()).ToString("yyyy-MM-dd")%>]</span>
                </li>
                </ItemTemplate>
                </asp:Repeater>
            </div>
			
        </div>
        <div><img src="images/anniu.jpg" border="0" usemap="#Map">
              <map name="Map" id="Map">
                <area shape="rect" coords="7,8,144,53" href="User/UsLogin.aspx" target="_blank" />
                <area shape="rect" coords="171,8,312,54" href="dzjj.aspx" target="_blank" />
              </map>
			</div>
    </div>
    <div class="jj1">
    </div>
    <div class="main">
        <ul class="sys">


        </ul>
    </div>
    <!--挂牌公示-->

    <div class="main">
        <div class="clearfix">
            <div class="tr_t">
            </div>
            <div class="tr_c">
                挂牌公示  <a href="BidList2.aspx" target="_blank"><span class="span">更多 >></span></a></div>
            <div class="tr_b">
            </div>
        </div>
		<div class="guapai_list">
			<ul class="sys">
				<li onmouseover="shitabs('gp','divOut','5','1','choose')" id="gp1" class="choose"><span class="sys_s1" >土地承包</span></li>
				<li onmouseover="shitabs('gp','divOut','5','2','choose')" id="gp2"><span class="sys_s2">农村集体经营性资产</span></li>
				<li onmouseover="shitabs('gp','divOut','5','3','choose')" id="gp3"><span class="sys_s3">四荒地</span></li>
				<li onmouseover="shitabs('gp','divOut','5','4','choose')" id="gp4"><span class="sys_s4">知识产权</span></li>
				<li onmouseover="shitabs('gp','divOut','5','5','choose')" id="gp5" ><span class="sys_s5">其它</span></li>
	
			</ul>
          
            <table class="tr_list">
                <tr>
                    <th class="th3">
                        项目编号
                    </th>
                    <th class="th2">
                        标的名称
                    </th>
                    <th class="th1">
                        项目类型
                    </th>
                    <th class="th1">
                        挂牌时间
                    </th>
                    <th class="th1">
                        公告价格
                    </th>
                    <th class="th1">
                        截止时间
                    </th>
                </tr>
            </table>
            <div id="divOut1"  class="list_lh" style="height: 200px;  overflow:hidden; width: 990px; border-bottom: 1px solid #d4ecfc">
               
        <ul class="ulneirong"   style=" display:block;">

        </ul>
        
            </div>
             <div id="divOut2"  class="list_lh" style="height: 200px;display:none;  overflow:hidden; width: 990px; border-bottom: 1px solid #d4ecfc">
                
        <ul class="ulneirong1"   >

        </ul>
        
            </div>
            <div id="divOut3"  class="list_lh" style="height: 200px;display:none;  overflow:hidden; width: 990px; border-bottom: 1px solid #d4ecfc">
               
       <ul   class="ulneirong2"></ul>	
        
            </div>
            <div id="divOut4"  class="list_lh" style="height: 200px;display:none;  overflow:hidden; width: 990px; border-bottom: 1px solid #d4ecfc">
               
       <ul  class="ulneirong3"></ul>
        
            </div>
           	<div id="divOut5"  class="list_lh" style="height: 200px;display:none;  overflow:hidden; width: 990px; border-bottom: 1px solid #d4ecfc">
               
       <ul  class="ulneirong4" style="display:none;"></ul>
        
            </div>
					
			
			
        </div>
    </div>
    <div class="jj1">
    </div>
    <div class="main">
        <%=zttp %>
        
    </div>
	<div class="jj1">
    </div>
 
    <div class="main">
        <div class="or">
            <div class="clearfix">
                <div class="tr_t">
                </div>
                <div class="or_c">
                    交易信息</div>
                <div class="tr_b">
                </div>
            </div>
            <div class="or_border">
                <div class="or_tab">
                    <ul>
                        <li onmouseover="tabqh(1)" class="check" id="strli1"><span class="or_tab_s1" id="strsp1"><a id="stra1"  href="../IntenList.aspx?type=1" class="xz01">
                            意向受让信息</a></span>
                            </li>
                        <li onmouseover="tabqh(2)"   id="strli2"><span class="or_tab_s2_1" id="strsp2"><a id="stra2" href="../IntenList.aspx?type=2" >意向转让信息</a></span>
                        </li>
                        <li onmouseover="tabqh(3)" id="strli3"><span class="or_tab_s3_1" id="strsp3"><a id="stra3"  href="../IntenList.aspx?type=3">抵押融资信息</a></span>
                        </li>
                    </ul>
                </div>
                <div class="or_list fl" id="strdiv1">
                    <ul><li class="bgcolor"><span class="Orange">时间</span>标题</li>
                        <div id="lblIntention">
                        </div>
                    </ul>
                </div>
                <div class="or_list fl" id="strdiv2" style=" display:none;">
                    <ul><li class="bgcolor"><span class="Orange">时间</span>标题</li>
                        <div id="lblIntention2">
                        </div>
                    </ul>
                </div>
                <div class="or_list fl" id="strdiv3" style=" display:none;">
                    <ul><li class="bgcolor"><span class="Orange">时间</span>标题</li>
                        <div id="lblIntention3">
                        </div>
                    </ul>
                </div>
            </div>
          
		  
		  <!-- 组织机构 -->
		   <div class="jj1"></div>
            <div class="clearfix">
                    <div class="tr_t"></div>
                    <div class="or_c">
                        <ul>
                        <li class="px16" style="padding-left:1px;">分支机构</li>
                        <li class="frist" id="jg1" onmouseover="shitabs('jg','jgc','3','1','frist')">南昌市</li> 
                        <%=fzjg1 %>
                        <%--<li id="jg2" onmouseover="shitabs('jg','jgc','3','2','frist')">南昌市1</li>
                        <li id="jg3" onmouseover="shitabs('jg','jgc','3','3','frist')">南昌市2</li>--%>
                    </ul></div>
                    <div class="tr_b"></div>
            </div>

                <div class="or_mech_list or_border">
                    <ul id="jgc1">
                    <asp:Repeater ID="repxz" runat=server><ItemTemplate><li><a href=""><%#Eval("OrgShortName")%></a></li></ItemTemplate></asp:Repeater>
                    </ul>
                    <%=fzjg2 %>
								<%--<ul  id="jgc2"  style="display:none; ">
				<li><a href="">余江县</a></li>
				<li><a href="">余江县</a></li>
				<li><a href="">余江县</a></li>
				<li><a href="">余江县</a></li>
				<li><a href="">余江县</a></li>
				<li><a href="">余江县</a></li><li><a href="">余江县</a></li>
				<li><a href="">余江县</a></li>
				<li><a href="">余江县</a></li>
				<li><a href="">余江县</a></li>
				<li><a href="">余江县</a></li>
				<li><a href="">余江县</a></li>
				<li><a href="">余江县</a></li>


			</ul>--%>
			
                </div>
		  
		  <!-- 组织机构结束 -->
		  
		  


        </div>
        <div class="fr">
            <div class="or_Search">
                项目查询</div>
            <div class="or_sreach_c">
           
                <div>
                    <ul>
                
                        <li>项目编号 : 
                            <asp:TextBox ID="txtmj" runat="server" Width="165px"></asp:TextBox></li>
                        <li>鉴证书号 :
                        <asp:TextBox ID="txtje" runat="server" Width="165px"></asp:TextBox>
                        </li>
                        <li class="center">
                            <asp:Button ID="Button1" runat="server" Text="" CssClass="button" 
                                onclick="Button1_Click" />
                                </li>
                            
                    </ul>
                </div>
            </div>
            <div class="anniu">
                <a href="User/UsLogin.aspx">意向转让申请</a></div>
            <div class="anniu">
                <a href="User/UsLogin.aspx">意向受让申请</a></div>
            <div class="anniu">
                <a href="User/UsLogin.aspx">抵押融资申请</a></div>
			<div><a href="map.aspx" target="_blank"><img src="images/map.jpg" /></a> </div>
        </div>


    <div class="main">
               

    </div>


    </div>
    <div class="floating_ck">
	<dl>
    	<dt></dt>
        
        <dd class="qrcord">
        	<span>扫一扫</span>
            <div class="floating_left floating_ewm">
            	<i></i>
                <p class="qrcord_p01">扫一扫</p>
                <p class="qrcord_p02">南昌市农村综合产权交易中心</p>
            </div>
        </dd>
        <dd class="return">
        	<span  onclick="gotoTop();return false;">返回顶部</span>
        </dd>
    </dl>
</div>
    
</asp:Content>
