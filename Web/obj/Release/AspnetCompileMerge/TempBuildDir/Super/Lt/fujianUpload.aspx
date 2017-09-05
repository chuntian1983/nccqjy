<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="fujianUpload.aspx.cs" Inherits="Web.Super.Lt.fujianUpload" %>

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
<body class="easyui-layout" style="overflow-y: hidden" scroll="no">
    <form id="forms" runat="server">
    <table width="100%" border="0px" cellpadding="0" cellspacing="0" style="position: absolute;
        padding-left: 30px; padding-top: 10px;">
        <tr>
            <td height="35">
                上传附件名称：
               
                <asp:DropDownList ID="txtFK_UploadTypeIndicatorId" Width="350px" runat="server">
                </asp:DropDownList>

            </td>
        </tr>
        <tr>
            <td height="35">
                浏览上传附件：<asp:FileUpload ID="FileUpload1" runat="server" />
                    <br />
                    
            </td>
        </tr>
        <tr align="center">
            <td height="35">
                <asp:Button ID="Button1" runat="server" Text="上  传" onclick="Button1_Click" />
                
            </td>
        </tr>
    </table>
    <input type="hidden" id="txtFK_LiceTranId" name="FK_LiceTranId" />
    <input type="hidden" id="txtId" name="Id" />
    </form>
</body>
</html>
