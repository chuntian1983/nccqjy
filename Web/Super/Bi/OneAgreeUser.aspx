<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OneAgreeUser.aspx.cs" Inherits="Web.Super.Bi.OneAgreeUser" %>
<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
<title></title>
<link href="../Scripts/easyUI/themes/default/easyui.css" rel="stylesheet" type="text/css" />
   
    <link href="../../css/bootstrap.min.css" rel="stylesheet" />
    <script src="../Scripts/easyUI/jquery.min.js" type="text/javascript" language="javascript"></script>
    <script src="../Scripts/easyUI/jquery.easyui.min.js" type="text/javascript" language="javascript"></script>
    <script src="../Scripts/easyUI/locale/easyui-lang-zh_CN.js" type="text/javascript"
        language="javascript"></script>
    <script charset="utf-8" src="../Scripts/kindeditor/kindeditor-min.js" type="text/javascript"
        language="javascript"></script>
        <script src="../../My97DatePicker/WdatePicker.js" type="text/javascript"
        language="javascript"></script>

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
 
<div class="panel panel-default">
  <div class="panel-heading">竞价项目信息搜索</div>
  <div class="panel-body">
    
            竞价项目信息标题：<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            
            
            <asp:Button ID="Button5" CssClass="btn btn-primary "  runat="server" Text="搜  索" onclick="Button5_Click" />
  </div>
</div>

<div class="panel panel-default">
  <div class="panel-heading">
    <h3 class="panel-title">竞价项目信息列表</h3>
  </div>
  <div class="panel-body">
   <div class="btn-group">
	
          <asp:Button ID="Button1" runat="server" Text="新建" CssClass="btn btn-primary"  Visible="false"
                CausesValidation="False" onclick="Button1_Click" />
                <asp:Button ID="btnedit" runat="server" Text="竞  价" CssClass="btn btn-primary" 
                onclick="btnedit_Click" />
		 <asp:Button ID="btndel" runat="server" Text="删除" Visible="false" CssClass="btn btn-primary"  OnClientClick="return confirm('你确认要删除所选项，删除后不可恢复！')"
                onclick="btndel_Click" />
		
		
        <asp:Button ID="btnview" runat="server" Text="查  看" CssClass="btn btn-primary" 
                onclick="btnview_Click" />
                <asp:Button ID="btnnotice" runat="server" Text="设置首页显示" Visible="false"  CssClass="btn btn-primary"  onclick="btnnotice_Click" 
                 />
                 <asp:Button ID="btnquxiao" runat="server"  Visible="false"
                         Text="取消首页显示" CssClass="btn btn-primary"  onclick="btnquxiao_Click" 
                 />
		
</div>
<div class="t_title">
	<table class="table table-bordered"  border="0" cellpadding="0" cellspacing="0" id="dataTab">
		  <thead>
              <tr>

			<th style=" text-align:center;"><input type="checkbox" name="cboxGroup" id="cboxnb" value="0"   onclick="OnCheckBoxClick();" /></th>
			<th class="t_cow1">编号</th>
			<th>项目名称</th>
			<th class="t_cow2">权属</th>
			<th class="t_cow2">竞价起价</th>
			<th >竞价状态</th>
			<th class="t_cow3">竞价截止时间</th>
			</tr>
		</thead>
        <tbody>
        <asp:Repeater ID="rep" runat="server" onitemdatabound="rep_ItemDataBound" >
                    <ItemTemplate>
                        <tr>
                            <td  style="text-align:center;">
                            <asp:Label ID="lbid" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"id")%>' Visible="false" ></asp:Label>
                                
                                    <asp:CheckBox ID="cbx" runat="server"  />
                            </td>
                            <td>
                                <%# Eval("id")%>
                            </td>
                            <td>
                                <%# Eval("bidname")%>
                            </td>
                            <td>
                                <asp:Label ID="lbxwlx" runat="server" Text='<%# Eval("Ownership")%>'></asp:Label>
                            </td>
                            <td>
                                <%# Eval("Jbqbj")%>
                            </td>
                            
                            <td>
                                <asp:Label ID="lbxmzt" runat="server" Text='<%# Eval("Jbzt")%>'></asp:Label>
                            </td>
                           
                            <td>
                                <%#DateTime.Parse(Eval("Jbjzsj").ToString()).ToString("yyyy-MM-dd HH:mm:ss")%>
                            </td>
                            
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
		
        </tbody>

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
</div>
</form>
   
    <!-- jQuery (Bootstrap 的 JavaScript 插件需要引入 jQuery) -->
     <!--  <script src="https://code.jquery.com/jquery.js"></script>-->
      <!-- 包括所有已编译的插件 -->
      <script src="../../js/bootstrap.min.js" type="text/javascript"></script>
</body>
</html>
