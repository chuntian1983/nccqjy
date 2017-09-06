<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="jbtwo-addtwo.aspx.cs" Inherits="Web.Super.DZJJ.jbtwo_addtwo" %>

<!DOCTYPE html>

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

        
        <script src="../../My97DatePicker/WdatePicker.js" type="text/javascript"
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
    <div region="center" title="二次竞价信息设置" style=" overflow:auto;">
        
        <div id="newAdd" style="display:block; width: 100%; height: 100%; overflow: auto;">
       
        <table class="table" border="0px" cellpadding="0" cellspacing="0">
            <tr>
                <td style="width: 200px" height="43">
                    二次竞价底价（元）<span style="color: Red;">**</span>
                </td>
                <td>
                    <asp:TextBox ID="txtjjdj" runat="server" Width="500px"></asp:TextBox>
                    
                </td>
            </tr>
            <tr>
                <td height="43">
                    二次竞价时间<span style="color: Red;">**</span>
                </td>
                <td>
                    <asp:DropDownList ID="ddljjsj" runat="server">
                        <asp:ListItem Value="5">5分钟</asp:ListItem>
                        <asp:ListItem Value="10">10分钟</asp:ListItem>
                        <asp:ListItem Value="15">15分钟</asp:ListItem>
                    </asp:DropDownList>
                    
                </td>
            </tr>
            
            <tr>
                <td colspan="2" height="43">
                    <div style="text-align: left; padding-left: 30%; height: 30px; line-height: 30px;">
                        <asp:Button ID="Button1" runat="server"  Text="保    存" onclick="Button1_Click" />
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