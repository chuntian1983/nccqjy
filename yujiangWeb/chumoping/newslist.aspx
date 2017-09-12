<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="newslist.aspx.cs" Inherits="Web.chumoping.newslist" %>
<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>余江县农村产权信息查询系统</title>
<meta name="keywords" content="触摸屏"/>
<meta name="description" content="余江触摸屏"/>
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
		<a href="index.html"><img src="images/fh.png"></a>
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
		位置：首页 >> 
                    <asp:Label ID="lbtype" runat="server" Text="信息列表"></asp:Label>
	</div>
	<table class="t_list n_list" cellspacing="0" cellpadding="0" >

		<asp:Repeater runat="server" ID="repnews">
        <ItemTemplate>
        

		<tr>
			<td><a href='view.aspx?id=<%#Eval("id") %>&type=<%#Eval("NewsTypeId")%>'><span class="jy_ing">▪</span><%#Eval("NewsTitle").ToString().Length > 200 ? Eval("NewsTitle").ToString().Substring(0, 200) + "..." : Eval("NewsTitle")%></a></td>
			<td><span><%#DateTime.Parse(Eval("CreateDate").ToString()).ToString("yyyy-MM-dd")%></span></td>

		</tr>
        </ItemTemplate>
        </asp:Repeater>
		
	</table>
    <webdiyer:AspNetPager ID="pg" runat="server" ShowBoxThreshold="5" ShowCustomInfoSection="Left"
                HorizontalAlign="Right" OnPageChanged="Pager_PageChanged" CustomInfoClass="pager-1"
                CustomInfoTextAlign="Left" FirstPageText="首页" LastPageText="尾页" NextPageText="下一页"
                PrevPageText="上一页" CustomInfoHTML="数据：%RecordCount%条  第%CurrentPageIndex%/%PageCount%页 "
                AlwaysShow="true" PageIndexBoxClass="homeLogin" PageSize="20" PageIndexBoxStyle="pagerindexbox"
                PageIndexBoxType="TextBox" ShowPageIndexBox="Always" SubmitButtonText="Go">
            </webdiyer:AspNetPager>
            <asp:HiddenField ID="hdpage" runat="server" Value="1" />
    </div>
			
		</div>

</form>
</body>
</html>
