<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="jbtwo-useryiciview.aspx.cs" Inherits="Web.Super.DZJJ.jbtwo_useryiciview" %>

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
  <div class="panel-heading">
    <h3 class="panel-title">竞价项目信息列表</h3>
  </div>
  <div class="panel-body">
   <div class="btn-group">
	
          <asp:Button ID="Button1" runat="server" Text="返回列表" CssClass="btn btn-primary"  
                CausesValidation="False" onclick="Button1_Click" />
              
		
</div>
<div class="t_title">
	<table class="table table-bordered"  border="0" cellpadding="0" cellspacing="0" id="dataTab">
		  <thead>
              <tr>

			
			<th class="t_cow1">编号</th>
			<th>竞标用户</th>
			<th class="t_cow2">竞标价格</th>
			<th class="t_cow2">竞价底价</th>
			<th >中标结果</th>
		
			</tr>
		</thead>
        <tbody>
        <asp:Repeater ID="rep" runat="server" onitemdatabound="rep_ItemDataBound" >
                    <ItemTemplate>
                        <tr>
                            
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
                            <td>
                               
                                <asp:Label ID="lbzbzt" runat="server" Text='<%# Eval("zbzt")%>'></asp:Label>
                            </td>
                           
                            
                            
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
		
        </tbody>

	</table>

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
