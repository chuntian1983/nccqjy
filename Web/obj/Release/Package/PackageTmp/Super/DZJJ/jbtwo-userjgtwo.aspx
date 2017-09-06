<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="jbtwo-userjgtwo.aspx.cs" Inherits="Web.Super.DZJJ.jbtwo_userjgtwo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
<title></title>
<link href="../Scripts/easyUI/themes/default/easyui.css" rel="stylesheet" type="text/css" />
   
    <link href="../../css/bootstrap.min.css" rel="stylesheet" />
    <script charset="utf-8" src="../Scripts/kindeditor/kindeditor-min.js" type="text/javascript"
        language="javascript"></script>
        <script src="../../My97DatePicker/WdatePicker.js" type="text/javascript"
        language="javascript"></script>
        <script src="../../js/jquery.js" type="text/javascript"></script>
<script src="../../js/bootstrap.min.js" type="text/javascript"></script>

</head>
<body class="easyui-layout" style="overflow-y: hidden" scroll="no">
<form runat="server" id="form1">
 
<div class="panel panel-default">
  <div class="panel-heading">一次竞价项目信息</div>
  <div class="panel-body panel-fit">
   <table class="table table-bordered">
	
	<tbody>
		<tr>
			<td>项目名称</td>
			<td>
                <asp:Label ID="lbxmmc" runat="server" Text=""></asp:Label></td>
			<td>竞价底价(元)</td>
			<td>
                <asp:Label ID="lbdijia" runat="server" Text=""></asp:Label></td>
		</tr>
		<tr>
			<td>竞价价格(元)</td>
			<td>
                <asp:Label ID="txtjingjiajg" runat="server" Text=""></asp:Label>
                </td>
			<td>竞价截止时间</td>
			<td>
                <asp:Label ID="lbjzsj" runat="server" Text=""></asp:Label></td>
		</tr>
		<tr>
			<td colspan=4>
                <asp:Label ID="lbscjg" runat="server" Text=""></asp:Label>
                <br />注意：您如果进行多次竞价提交，系统将以您最后一次竞价价格为准，请考虑清楚之后进行竞价！
            </td>
			
		</tr>
        <tr>
			<td colspan=4>
                <asp:Button ID="btnsave" runat="server" CssClass="btn btn-primary"  
                    Text="保    存" onclick="btnsave_Click" Visible="false" />
                &nbsp;<asp:Button ID="Button1" runat="server" Text="返回列表" CssClass="btn btn-primary" 
                    onclick="Button1_Click" />
            </td>
			
		</tr>
	</tbody>
</table>
  </div>
</div>


</form>
   
  
      
</body>
</html>
