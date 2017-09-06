<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="jbtwo-overtwo.aspx.cs" Inherits="Web.Super.DZJJ.jbtwo_overtwo" %>

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
    <script charset="utf-8" src="../Scripts/kindeditor/kindeditor-min.js" type="text/javascript"
        language="javascript"></script>
        <script src="../../My97DatePicker/WdatePicker.js" type="text/javascript"
        language="javascript"></script>
 <link href="../../Styles/listnew.css" rel="stylesheet" type="text/css" />
 <script type="text/javascript">
   
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
    <div region="center" title="竞标结果信息列表" style=" padding-top:10px; padding-left:10px;">

         
		
		<asp:Button ID="btnshenhe" runat="server" Text="竞标结果选择" 
                onclick="btnshenhe_Click" />
                &nbsp;<asp:Button ID="btnedit" runat="server" Text="返回"  
                onclick="btnedit_Click" />
      
                

<div class="t_title">
	<table  border="0" cellpadding="0" cellspacing="0" id="dataTab">
		<tr>

			<th class="t_cow4">
                        </th>
			<th class="t_cow1">编号</th>
			<th>竞标用户</th>
			<th>竞标价格</th>
			<th>竞标底价</th>
			
			
		</tr>
        <asp:Repeater ID="rep" runat="server" onitemdatabound="rep_ItemDataBound" >
                    <ItemTemplate>
                        <tr>
                            <td align="center">
                            <asp:Label ID="lbid" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"sid")%>' Visible="false" ></asp:Label>
                                
                                    <asp:CheckBox ID="cbx" runat="server"  />
                            </td>
                            <td>
                                <%# Eval("sid")%>
                            </td>
                            <td>
                                <asp:Label ID="lbzzdw" runat="server" Text='<%# Eval("jbyhm")%>'></asp:Label>
                            </td>
                            <td>
                               
                                <asp:Label ID="lbcrfxm" runat="server" Text='<%# Eval("jbjg")%>'></asp:Label>
                            </td>
                            <td>
                               
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("jbdj")%>'></asp:Label>
                            </td>
                            
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
		


	</table>

</div>

        </div>
</form>
</body>
</html>
