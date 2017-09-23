<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="daoru.aspx.cs" Inherits="Web.Super.hzs.daoru" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
<title></title>
<link href="../Scripts/easyUI/themes/default/easyui.css" rel="stylesheet" type="text/css" />
    <link href="../../css/bootstrap.min.css" rel="stylesheet" />
        <script src="../../js/jquery.js" type="text/javascript"></script>
<script src="../../js/bootstrap.min.js" type="text/javascript"></script>

</head>
<body class="easyui-layout" style="overflow-y: hidden" scroll="no">
<form runat="server" id="form1">
 
<div class="panel panel-default">
  <div class="panel-heading">竞价项目信息</div>
  <div class="panel-body panel-fit">
   <table class="table table-bordered">
	
	<tbody>
		<tr>
			<td style=" width:30%">合作社</td>
			<td>
                <asp:FileUpload ID="fuhzs" runat="server" /></td>
			
		</tr>
        <tr>
			<td>家庭农场</td>
			<td>
                <asp:FileUpload ID="fujtnc" runat="server" /></td>
			
		</tr>
		
        <tr>
			<td colspan=2>
                <asp:Button ID="btnsave" runat="server" CssClass="btn btn-primary"  
                    Text="数据导入" onclick="btnsave_Click"  />
                &nbsp;
            </td>
			
		</tr>
	</tbody>
</table>
  </div>
</div>

</form>

</body>
</html>
