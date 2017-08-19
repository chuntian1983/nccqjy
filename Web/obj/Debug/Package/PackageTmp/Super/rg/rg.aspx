<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="rg.aspx.cs" Inherits="Web.Super.rg.rg" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    机器码：<asp:TextBox ID="TextBox1" runat="server" Width="658px"></asp:TextBox>
        <br />
        <br />
        时间格式为例如2016-02-15
        <br />
        <br />
        开始时间：<asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
        <br />
        <br />
        截止时间：<asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
        <br />
        <br />
        注册码：<asp:TextBox ID="TextBox4" runat="server" Width="653px"></asp:TextBox>
        <br />
        <br />
        超级码：<asp:TextBox ID="TextBox5" runat="server" Width="653px" TextMode="Password"></asp:TextBox>
        <br />
        <br />
        <asp:Button ID="Button2" runat="server" Text="请输入超级码" OnClick="Button2_Click" />
        <asp:Button ID="Button1" runat="server" Text="注  册" onclick="Button1_Click" />
    </div>
    </form>
</body>
</html>
