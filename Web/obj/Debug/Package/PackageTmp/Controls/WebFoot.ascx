<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WebFoot.ascx.cs" Inherits="Web.Controls.WebFoot" %>
<div class="bo">
    主办：<asp:Label ID="lblHost" runat="server"></asp:Label>版权所有<br />
    地址：<asp:Label ID="lblAdd" runat="server"></asp:Label><br />
    电话：<asp:Label ID="lblTel" runat="server"></asp:Label><br />
    备案号：<asp:Label ID="lblFiling" runat="server"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;<a
        href="javascript:void(0);" onclick="window.open('../Super/Default.aspx');">管理登陆</a>
    <br />
    您是本网站第&nbsp;<asp:Label ID="lblNumber" runat="server" BackColor="Yellow" ForeColor="Red"></asp:Label>&nbsp;位访问者
</div>
