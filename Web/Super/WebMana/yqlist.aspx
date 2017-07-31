<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="yqlist.aspx.cs" Inherits="Web.Super.WebMana.yqlist" %>
<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<!DOCTYPE html>

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
            友情链接类型：<asp:DropDownList ID="ddlxwlx" runat="server">
                <asp:ListItem>请选择</asp:ListItem>
                <asp:ListItem>各省政府网站</asp:ListItem>
                        <asp:ListItem>省会城市网站</asp:ListItem>
                        <asp:ListItem>市值部门网站</asp:ListItem>
                        <asp:ListItem>市区县网站</asp:ListItem>
                        <asp:ListItem>其他推荐网站</asp:ListItem>
            </asp:DropDownList>
            
            友情链接名称：<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            
            
            <asp:Button ID="Button5" runat="server" Text="搜索" onclick="Button5_Click" />
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
		
	</ul>	
</div>
<div class="t_title">
	<table  border="0" cellpadding="0" cellspacing="0" id="dataTab">
		<tr>

			<th  style="width:15px;">
                        <input type="checkbox" name="cboxGroup" id="cboxnb" value="0"   onclick="OnCheckBoxClick();" /></th>
			<th  style="width:25px;">编号</th>
			<th style="width:100px;">友情链接类型</th>
			<th class="t_cow2">友情链接名称</th>
            <th class="t_cow2" style="width: 300px">友情链接地址</th>
			
			
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
                                <asp:Label ID="lbxwlx" runat="server" Text='<%# Eval("yqleixing")%>'></asp:Label>
                            </td>
                            <td>
                                <%# Eval("yqname")%>
                            </td>
                            <td>
                                <%# Eval("yqlianjie")%>
                            </td>
                            
                            
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
		


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
