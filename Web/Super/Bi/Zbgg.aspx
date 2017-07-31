<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Zbgg.aspx.cs" Inherits="Web.Super.Bi.Zbgg" %>

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
   
   
</head>
<body>
    <form id="form1" runat="server">
    <div>
     <table>
            <tr>
                <td>
                    公告名称
                </td>
                <td>
                    <input type="text" runat="server" id="txtBidPlacardTitle" name="BidPlacardTitle" class="easyui-validatebox"
                        missingmessage="必须填写" required="true" style="width: 500px;"  />
                </td>
            </tr>
            <tr>
                <td>
                    公告内容
                </td>
                <td>
                    <textarea id="txtBidPlacardContent" runat="server" name="BidPlacardContent" style="width: 500px;
                        height: 250px;" class="easyui-validatebox" missingmessage="必须填写" required="true"></textarea>
                </td>
            </tr>
            <tr>
                <td>
                    上传附件
                </td>
                <td>
                    <asp:FileUpload ID="FileUpload1" runat="server" />
                </td>
            </tr>
            <tr align="center">
                <td colspan="2">
                    <asp:LinkButton ID="LinkButton1" class="easyui-linkbutton" icon="icon-ok" 
                        runat="server" onclick="LinkButton1_Click">添加</asp:LinkButton>
                    <asp:LinkButton ID="LinkButton2" class="easyui-linkbutton" icon="icon-ok" 
                        runat="server" onclick="LinkButton2_Click">修改</asp:LinkButton>
                    <asp:HiddenField ID="hidid" runat="server" />
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
