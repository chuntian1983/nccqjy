<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="JbOne.aspx.cs" Inherits="Web.Super.DZJJ.JbOne" %>
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
<%-- <div region="north" title="新闻信息搜索" split="true" style="height: 65px; overflow: hidden;
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
            <asp:Button ID="Button5" runat="server" Text="搜索" onclick="Button5_Click" />
        </div>
    </div>--%>
    <div region="center" title="出让标信息列表" style=" padding-top:10px; padding-left:10px;">

          <asp:Button ID="Button1" runat="server" Text="新建"  Visible="false"
                CausesValidation="False" onclick="Button1_Click" />
		 <asp:Button ID="btndel" Visible="false" runat="server" Text="删除"  OnClientClick="return confirm('你确认要删除所选项，删除后不可恢复！')"
                onclick="btndel_Click" />
		<asp:Button ID="btnedit" runat="server" Text="竞价开始"  
                onclick="btnedit_Click" />
		&nbsp;<asp:Button ID="btnshenhe" runat="server" Text="竞标结果选择" 
                onclick="btnshenhe_Click" />
       &nbsp;<asp:Button ID="btnview" runat="server" Text="查看竞价结果" 
                onclick="btnview_Click" />

<div class="t_title">
	<table  border="0" cellpadding="0" cellspacing="0" id="dataTab">
		<tr>

			<th class="t_cow4">
                        <input type="checkbox" name="cboxGroup" id="cboxnb" value="0"   onclick="OnCheckBoxClick();" /></th>
			<th class="t_cow1">编号</th>
			<th>组织单位</th>
			<th>出让方姓名</th>
			<th>标的名称</th>
			
			<th>竞价状态</th>
			<th>竞价起拍价格</th>
			<th>竞标截止时间</th>
			<th>交易方式</th>
			<th>权属</th>
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
                                <asp:Label ID="lbzzdw" runat="server" Text='<%# Eval("OrgCode")%>'></asp:Label>
                            </td>
                            <td>
                               
                                <asp:Label ID="lbcrfxm" runat="server" Text='<%# Eval("FK_LiceTranId")%>'></asp:Label>
                            </td>
                            <td>
                                <%# Eval("BidName")%>
                            </td>
                            <td>
                             
                                <asp:Label ID="lbjbzt" runat="server" Text='<%# Eval("Jbzt")%>'></asp:Label>
                            </td>
                            <td>
                                <%# Eval("Jbqbj")%>
                            </td>
                            <td>
                                <asp:Label ID="lbshzt" runat="server" Text='<%# Eval("Jbjzsj")%>'></asp:Label> 
                            </td>
                            <td>
                                一次竞价
                            </td>
                            <td>
                                <%#Eval("Ownership")%>
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
