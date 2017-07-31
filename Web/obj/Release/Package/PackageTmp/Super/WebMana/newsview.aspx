<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="newsview.aspx.cs" Inherits="Web.Super.WebMana.newsview" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link href="../Scripts/easyUI/themes/default/easyui.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/default.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/tbcss.css" rel="stylesheet" type="text/css" />
    <link href="../Scripts/easyUI/themes/icon.css" rel="stylesheet" type="text/css" />
    <script src="../Scripts/easyUI/jquery.min.js" type="text/javascript" language="javascript"></script>
    <script src="../Scripts/easyUI/jquery.easyui.min.js" type="text/javascript" language="javascript"></script>
    <script src="../Scripts/easyUI/locale/easyui-lang-zh_CN.js" type="text/javascript"
        language="javascript"></script>

  
        <style>
            body{font-size:12px; font-family:微软雅黑;}
    #custom-demo .uploadifyQueueItem {
      background-color: #FFFFFF;
      border: none;
      border-bottom: 1px solid #E5E5E5;
      font: 11px Verdana, Geneva, sans-serif;
      height: 20px;
      margin-top: 0;
      padding: 10px;
      width: 350px;
    }
    #custom-demo #custom-queue {
      border: 1px solid #E5E5E5;
      margin-bottom: 10px;
      width: 370px;
    }
        </style>
       

  
</head>
<body class="easyui-layout" style="overflow-y: hidden" scroll="no">
 <form  runat="server" id="form1">
    <input id="hdfile" type="hidden" runat="server" />
        <input id="hdfilename" type="hidden" runat="server" />
        <input id="hdfile2" type="hidden" runat="server" />
        <input id="hdfilename2" type="hidden" runat="server" />
    <div region="center" title="新闻信息" style=" overflow:auto;">
        
        <div id="newAdd" style="display:block; width: 100%; height: 100%; overflow: auto;">
       
        <table class="table" border="0px" cellpadding="0" cellspacing="0" style=" width:925px;">
            <tr>
                <td style="width: 200px" height="43">
                    新闻标题<span style="color: Red;">**</span>
                </td>
                <td>
                    <asp:Label ID="txtNewsTitle" runat="server" Text=""></asp:Label>
                    
                    
                </td>
            </tr>
            <tr>
                <td height="43">
                    新闻类型<span style="color: Red;">**</span>
                </td>
                <td>
                    
                    <asp:Label ID="txtNewsTypeId" runat="server" Text=""></asp:Label>
                </td>
            </tr>
            <tr>
                <td height="43">
                    新闻副标题
                </td>
                <td>
                   
                    <asp:Label ID="txtNewsSubheading" runat="server" Text=""></asp:Label>
                    
                </td>
            </tr>
            <tr>
                <td height="43">
                    新闻来源
                </td>
                <td>
                    
                    <asp:Label ID="txtNewsSource" runat="server" Text=""></asp:Label>
                   
                </td>
            </tr>
            <tr>
                <td height="43">
                    摘要
                </td>
                <td>
                    <asp:Label ID="txtContent" runat="server" Text=""></asp:Label>
                    
                </td>
            </tr>
            <tr>
<td height="43">
                    时间
                </td>
                <td>
                    
                    <asp:Label ID="txtsj" runat="server" Text=""></asp:Label>
                    
                </td>
           
            </tr>
            <tr>
                <td height="43">
                    关键字
                </td>
                <td>
                    
                    <asp:Label ID="txtKeyword" runat="server" Text=""></asp:Label>
                </td>
            </tr>
            <tr>
                <td height="43">
                    新闻图片
                </td>
                <td>
                    <asp:Image ID="fileNewsImg" runat="server"  Width=700px />
                    
                </td>
            </tr>
            <tr>
                <td height="43">
                    新闻附件
                </td>
                <td>
                   <asp:Repeater ID="repfujian" runat=server  Visible=false >
                   <ItemTemplate>
                   <a href="../../newsfile/<%#Eval("fjpath")%>"  target="_blank"><%#Eval("fjname") %></a><br />
                   </ItemTemplate>
                   </asp:Repeater>
                </td>
            </tr>
            <tr>
                <td>
                    新闻内容<span style="color: Red;">**</span>
                </td>
                <td>
                    <!--开始HTML编辑器-->
                    
                    <asp:Label ID="content1" runat="server" Text=""></asp:Label>
                    <!--结束-->
                </td>
            </tr>
            <tr>
                <td colspan="2" height="43">
                    <div style="text-align: left; padding-left: 30%; height: 30px; line-height: 30px;">
                        
                        <asp:Button ID="btncanel" runat="server" Text="返回列表" CausesValidation="False" 
                            onclick="btncanel_Click" />
                    </div>
                </td>
            </tr>
        </table>
        <input id="txtNewsImg" name="NewsImg" type="hidden" />
        <input id="txtNewsFile" name="NewsFile" type="hidden" />
        <input id="txtId" name="Id" type="hidden" value="0" />
        <input id="txtNumClicks" name="NumClicks" type="hidden" value="0" />       
       
    </div>
    </div>
    
    
     </form>
</body>
</html>
