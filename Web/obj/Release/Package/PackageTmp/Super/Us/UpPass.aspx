<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UpPass.aspx.cs" Inherits="Web.Super.Us.UpPass" %>

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
    
    <style type="text/css">
        .auto-style1 {
            width: 208px;
        }
    </style>
    <script>
        function msgShow(title, msgString, msgType) {
            $.messager.alert(title, msgString, msgType);
        };
    </script>
    
</head>
<body class="easyui-layout">
    <noscript>
        <iframe scr="*.htm"></iframe>
    </noscript>
    <div id="center" region="center" title="用户修改密码" style="width: 45%; background-image: url(../Images/adminstart.jpg);">
        <form id="forms" runat="server">
        <table class="tb" border="0px" cellpadding="0" cellspacing="0" style="padding-left: 80px;
            padding-top: 40px;">
            <tr>
                <td style="width: 80px" height="40">
                    登录名：
                </td>
                <td class="auto-style1">
                    <asp:Label ID="lbadminlogname" runat="server" Text=""></asp:Label>
                    <span name="AdminLogName" id="txtAdminLogName" style="font-size: 20px;"></span>
                </td>
            </tr>
            <tr>
                <td style="width: 80px" height="40">
                    原密码：<span style="color: Red;">*</span>
                </td>
                <td class="auto-style1">
                    <asp:TextBox ID="txtoldpass" runat="server" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtoldpass" ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td style="width: 80px" height="40">
                    新密码：<span style="color: Red;">*</span>
                </td>
                <td class="auto-style1">
                    <asp:TextBox ID="TextBox1" runat="server" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox1" ErrorMessage="新密码不能为空"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td colspan="2" height="40">
                    <div style="text-align: left; padding-left: 100px; height: 30px; line-height: 30px;">

                        <asp:Button ID="Button1" runat="server" Text="修  改" OnClick="Button1_Click" />
                    </div>
                </td>
            </tr>
        </table>
        </form>
    </div>
</body>
</html>
