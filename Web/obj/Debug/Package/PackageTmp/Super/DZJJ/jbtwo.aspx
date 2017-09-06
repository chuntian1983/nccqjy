<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="jbtwo.aspx.cs" Inherits="Web.Super.DZJJ.jbtwo" %>
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
   <script type="text/javascript">


       var tt = 0;
       $(function () {
           function show() {
               tt = tt + 1;
               for (var i = 0; i < $('tr').length; i++) {
                   //var starttime = new Date($('tr').eq(i).find('td').eq(0).text()).getTime();
                   var str = '0分0秒';
                   var starttime = new Date();
                   var endtime = new Date($('tr').eq(i).find('td').eq(7).text()).getTime();

                   var overtime = endtime - starttime - tt * 1000;
                   // var overtime = endtime - starttime;  
                   var fz = parseInt(overtime / 60000);
                   var mz = parseInt((overtime - (fz * 60000)) / 1000);

                   var str1 = fz + '分' + mz + '秒';
                  
                   if (overtime <= 0||overtime=='NaN') {
                       $('tr').eq(i).find('td').eq(8).html("<span style='color:red'>" + str + "</span>");
                   }
                   else {
                       $('tr').eq(i).find('td').eq(8).html("<span style='color:red'>" + str1 + "</span>");
                   }


               }


           }
           setInterval(show, 1000); // 注意函数名没有引号和括弧！  
           // 使用setInterval("show()",3000);会报“缺少对象”  


       });  
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
    <div region="center" title="二次竞标信息列表" style=" padding-top:10px; padding-left:10px;">

          <asp:Button ID="Button1" runat="server" Text="新建"  Visible="false"
                CausesValidation="False" onclick="Button1_Click" />
		 <asp:Button ID="btndel" Visible="false" runat="server" Text="删除"  OnClientClick="return confirm('你确认要删除所选项，删除后不可恢复！')"
                onclick="btndel_Click" />
		<asp:Button ID="btnedit" runat="server" Text="一次竞价开始设置"  
                onclick="btnedit_Click" />
		&nbsp;<asp:Button ID="btnshenhe" runat="server" Text="一次竞标结果选择" 
                onclick="btnshenhe_Click" />
       &nbsp;<asp:Button ID="btnview" runat="server" Text="查看一次竞价结果" 
                onclick="btnview_Click" />
        <asp:Button ID="btnerci" runat="server" Text="二次竞标开始设置" OnClick="btnerci_Click" />
        <asp:Button ID="btntwoview" runat="server" Text="二次竞标结果选择" OnClick="btntwoview_Click" />
        <asp:Button ID="btntwojg" runat="server" Text="查看二次竞价结果" OnClick="btntwojg_Click" />

<div class="t_title">
	<table  border="0" cellpadding="0" cellspacing="0" id="dataTab">
		<tr>

			<th class="t_cow4" style=" text-align:center;">
                        <input type="checkbox" name="cboxGroup" id="cboxnb" value="0"   onclick="OnCheckBoxClick();" /></th>
			<th class="t_cow1">编号</th>
			<th>组织单位</th>
			<th>出让方姓名</th>
			<th>标的名称</th>
			
			<th>竞价状态</th>
			<th>竞价起拍价格</th>
			<th style=" width:100px;">竞标截止时间</th>
            <th>竞价倒计时</th>
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
                                <asp:Label ID="lbshzt" runat="server" Text='<%#DateTime.Parse( Eval("Jbjzsj").ToString()).ToString("yyyy-MM-dd HH:mm:ss")%>'></asp:Label> 
                            </td>
                            <td>
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
