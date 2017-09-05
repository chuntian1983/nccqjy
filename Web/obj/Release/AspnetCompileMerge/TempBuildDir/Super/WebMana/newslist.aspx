<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="newslist.aspx.cs" Inherits="Web.Super.WebMana.newslist" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title></title>
<link href="../Scripts/easyUI/themes/default/easyui.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/default.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/tbcss.css" rel="stylesheet" type="text/css" />
    <link href="../Scripts/easyUI/themes/icon.css" rel="stylesheet" type="text/css" />
    <script src="../Scripts/easyUI/jquery.min.js" type="text/javascript" language="javascript"></script>
    <script src="../Scripts/easyUI/jquery.easyui.min.js" type="text/javascript" language="javascript"></script>
    <script src="../Scripts/easyUI/locale/easyui-lang-zh_CN.js" type="text/javascript"
        language="javascript"></script>
    <script charset="utf-8" src="../Scripts/kindeditor/kindeditor-min.js" type="text/javascript"
        language="javascript"></script>
        <script src="../../My97DatePicker/WdatePicker.js" type="text/javascript"
        language="javascript"></script>
 <link href="../../Styles/listnew.css" rel="stylesheet" type="text/css" />
 <script type="text/javascript">
//     function OnCheckBoxClick() {
//         if ($("#cboxnb").attr("checked") == true) {
//                $("#dataTab input:checkbox").each(function () { this.checked = true; });
//            }
//            else {
//                alert('ddd');
//                $("#dataTab input:checkbox").each(function () { this.checked = false; });
//            }
//        }
        function OnCheckBoxClick() {
            var checkbox = document.getElementById('cboxnb'); //
            
            if (checkbox.checked) {
                $("#dataTab input:checkbox").each(function () { this.checked = true; });
            } else {
                $("#dataTab input:checkbox").each(function () { this.checked = false; });
            }
            
        }       
 </script>
</head>
<body class="easyui-layout" style="overflow-y: hidden" scroll="no">
<form runat="server" id="form1">
 <div region="north" title="新闻信息搜索" split="true" style="height: 65px; overflow: hidden;
        border: 0px;" border="false">
        <div style="padding-top: 5px; padding-left: 10px;">
            新闻类型：<asp:DropDownList ID="ddlxwlx" runat="server">
            </asp:DropDownList>
            
            新闻标题：<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            
            审核状态：
            <asp:DropDownList ID="DropDownList2" runat="server">
                <asp:ListItem>全部</asp:ListItem>
                <asp:ListItem Value="0">未审核</asp:ListItem>
                <asp:ListItem Value="1">审核通过</asp:ListItem>
            </asp:DropDownList>
            <asp:Button ID="Button5" runat="server" Text="新闻搜索" onclick="Button5_Click" />
        </div>
    </div>
    <div region="center" title="新闻信息列表">
<div class="t_work">
	<ul>
		<li> 
          <asp:Button ID="Button1" runat="server" Text="新建" CssClass="t_news" 
                CausesValidation="False" onclick="Button1_Click" /></li>
		<li> <asp:Button ID="btndel" runat="server" Text="删除" CssClass="t_del"  OnClientClick="return confirm('你确认要删除所选项，删除后不可恢复！')"
                onclick="btndel_Click" /></li>
		<li><asp:Button ID="btnedit" runat="server" Text="修改" CssClass="t_cut" 
                onclick="btnedit_Click" /></li>
		<li><asp:Button ID="btnshenhe" runat="server" Text="审核" CssClass="t_col" 
                onclick="btnshenhe_Click" /></li>
        <li><asp:Button ID="btnview" runat="server" Text="查看" CssClass="t_view" 
                onclick="btnview_Click" /></li>
                <li style=" width:180px;" id="liset"><asp:Button ID="btnnotice" runat="server" Text="设置首页滚动通知公告" CssClass="t_set" onclick="btnnotice_Click" 
                 /></li>
                 <li style=" width:180px;" id="liset2"><asp:Button ID="btnquxiao" runat="server" 
                         Text="取消首页滚动通知公告" CssClass="t_set" onclick="btnquxiao_Click" 
                 /></li>
	</ul>	
</div>
<div class="t_title">
	<table  border="0" cellpadding="0" cellspacing="0" id="dataTab">
		<tr>

			<th class="t_cow4">
                        <input type="checkbox" name="cboxGroup" id="cboxnb" value="0"   onclick="OnCheckBoxClick();" /></th>
			<th class="t_cow1">编号</th>
			<th>新闻类型</th>
			<th class="t_cow2">新闻主标题</th>
			<th class="t_cow2">新闻副标题</th>
			
			<th class="t_cow3">新闻图片</th>
			<th>点击数</th>
			<th>审核状态</th>
			<th>发布人</th>
			<th>创建时间</th>
		</tr>
        <asp:Repeater ID="rep" runat="server" onitemdatabound="rep_ItemDataBound" >
                    <ItemTemplate>
                        <tr>
                            <td align="center">
                            <asp:Label ID="lbid" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"id")%>' Visible="false" ></asp:Label>
                                
                                    <asp:CheckBox ID="cbx" runat="server"  />
                            </td>
                            <td>
                                <%# Eval("id")%>
                            </td>
                            <td>
                                <asp:Label ID="lbxwlx" runat="server" Text='<%# Eval("NewsTypeId")%>'></asp:Label>
                            </td>
                            <td>
                                <%# Eval("NewsTitle")%>
                            </td>
                            <td>
                                <%# Eval("NewsSubheading")%>
                            </td>
                            <td>
                                <%# Eval("NewsImg")%>
                            </td>
                            <td>
                                <%# Eval("NumClicks")%>
                            </td>
                            <td>
                                <asp:Label ID="lbshzt" runat="server" Text='<%# Eval("IsCheck")%>'></asp:Label> 
                            </td>
                            <td>
                                <%# Eval("Editor")%>
                            </td>
                            <td>
                                <%#DateTime.Parse(Eval("CreateDate").ToString()).ToString("yyyy-MM-dd")%>
                            </td>
                            
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
		<%--<tr>
			
			<td><input name="" type="checkbox" value=""></td>
			<td>1</td>
			<td>国内新闻</td>
			<td>关于批年四川大地震灾后重建工作总结</td>
			<td>山东省灾后办公室</td>
			<td><a href="" class="t_more">查看详情</a></td>
			<td>01245683558752.png</td>
			<td>235</td>
			<td><span class="t_wtg">未通过</span></td>
			<td>系统管理员</td>
			<td>2016-08-11</td>
		</tr>
				<tr>
			<td>1</td>
			<td><input name="" type="checkbox" value=""></td>
			<td>1</td>
			<td>国内新闻</td>
			<td>关于批年四川大地震灾后重建工作总结</td>
			<td>山东省灾后办公室</td>
			<td><a href="" class="t_more">查看详情</a></td>
			<td>01245683558752.png</td>
			<td>235</td>
			<td><span class="t_wtg">未通过</span></td>
			<td>系统管理员</td>
			<td>2016-08-11</td>
		</tr>

		<tr>
			<td>1</td>
			<td><input name="" type="checkbox" value=""></td>
			<td>1</td>
			<td>国内新闻</td>
			<td>关于批年四川大地震灾后重建工作总结</td>
			<td>山东省灾后办公室</td>
			<td><a href="" class="t_more">查看详情</a></td>
			<td>01245683558752.png</td>
			<td>235</td>
			<td><span class="t_tg">通过</span></td>
			<td>系统管理员</td>
			<td>2016-08-11</td>
		</tr>--%>


	</table>

</div>
<div class="panelBar pager">
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
