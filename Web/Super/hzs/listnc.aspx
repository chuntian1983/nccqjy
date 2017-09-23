<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="listnc.aspx.cs" Inherits="Web.Super.hzs.listnc" %>
<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
<title></title>
    <script src="../Scripts/easyUI/jquery.min.js" type="text/javascript" language="javascript"></script>
    <link href="../../css/bootstrap.min.css" rel="stylesheet" />
     <script src="../../js/bootstrap.min.js" type="text/javascript"></script>
       

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
<body class="easyui-layout">
<form runat="server" id="form1">
 
<div class="panel panel-default">
  <div class="panel-heading">家庭农场信息搜索</div>
  <div class="panel-body">
    
            家庭农场信息标题：<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            
            
            <asp:Button ID="Button5" CssClass="btn btn-primary "  runat="server" Text="搜  索" onclick="Button5_Click" />
  </div>
</div>

<div class="panel panel-default">
  <div class="panel-heading">
    <h3 class="panel-title">家庭农场信息列表</h3>
  </div>
  <div class="panel-body" style=" overflow:auto;">
   <div class="btn-group">
	
          <asp:Button ID="Button1" runat="server" Text="新建" CssClass="btn btn-primary"  Visible="false"
                CausesValidation="False" onclick="Button1_Click" />
                <asp:Button ID="btnedit" runat="server" Text="修改" CssClass="btn btn-primary" 
                onclick="btnedit_Click" />
		 <asp:Button ID="btndel" runat="server" Text="删除" Visible="false" CssClass="btn btn-primary"  OnClientClick="return confirm('你确认要删除所选项，删除后不可恢复！')"
                onclick="btndel_Click" />
		
		
                <asp:Button ID="btnjieguo" runat="server" Text="查看" 
              CssClass="btn btn-primary" onclick="btnjieguo_Click" 
               />
               <asp:Button ID="btnmap" runat="server" Text="设置地图位置" CssClass="btn btn-primary"  
                CausesValidation="False" onclick="btnmap_Click"  />
		
</div>
<div class="t_title">
	<table class="table table-bordered"  border="0" cellpadding="0" cellspacing="0" id="dataTab">
		  <thead>
              <tr>

			<th style=" text-align:center;"><input type="checkbox" name="cboxGroup" id="cboxnb" value="0"   onclick="OnCheckBoxClick();" /></th>
			<th class="t_cow1">序号</th>
			<th>区市</th>
			<th class="t_cow2">名称</th>
			<th class="t_cow2">地址</th>
			<th >注册时间</th>
			<th class="t_cow3">经营范围</th>
            <th >经营面积</th>
            <th >年经营收入</th>
            <th >农场主姓名</th>
            <th >联系电话</th>
            <th >品牌建设</th>
            <th >示范场年度级别</th>
            <th >x坐标</th>
            <th >y坐标</th>
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
                                <%# Eval("xh")%>
                            </td>
                            <td>
                                <%# Eval("quyu")%>
                            </td>
                            <td>
                                <asp:Label ID="lbxwlx" runat="server" Text='<%# Eval("mingcheng")%>'></asp:Label>
                            </td>
                            <td>
                                <%# Eval("dizhi")%>
                            </td>
                            
                            
                           
                            <td>
                                <%#DateTime.Parse(Eval("zhuceshijian").ToString()).ToString("yyyy-MM-dd")%>
                            </td>
                            <td><%# Eval("jingyingfanwei")%></td>
                            <td><%# Eval("chengyuanshu")%></td>
                            <td><%# Eval("nianshouru")%></td>
<td><%# Eval("lishizhang")%></td>
<td><%# Eval("lianxidianhua")%></td>
                            <td><%# Eval("pinpaiqingkuang")%></td>
                            <td><%# Eval("niandujibie")%></td>
                            <td><%# Eval("zuobiaox")%></td>
                            <td><%# Eval("zuobiaoy")%></td>
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
    
</body>
</html>
