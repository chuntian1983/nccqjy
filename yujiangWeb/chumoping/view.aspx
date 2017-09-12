<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="view.aspx.cs" Inherits="Web.chumoping.view" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>余江县农村产权信息查询系统</title>

<LINK rel="stylesheet" href="style/main.css">
</head>
<body>
<form runat="server" id="form1">
<div class="main1">
<!--首页、返回按钮-->
	<div class="an_index">
		<a href="index.html"><img src="images/sy.png"></a>
	</div>
	<div class="an_fh">
		<a href="newslist.aspx?type=<%=strid %>" ><img src="images/fh.png"></a>
	</div>
<!--结束-->
	<div class="main1_1">
		<div class="top clearfix">
			<div class="top_l">
				<img src="images/log.png">
			</div>
			<div class="top_r">
				<img src="images/ban.jpg">
			</div>
 		</div>

				<div class="wz">
		位置：首页 >> 详细信息
	</div>
	<div class="c_content" >        
        <asp:Label ID="lbtitle" runat="server" Text=""></asp:Label></div>
		

		<div class="cont_c" >
            <asp:Label ID="lbneirong" runat="server" Text=""></asp:Label></div>

    </div>
	

</div>	
</form>
</body>
</html>
