<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WebFoot.ascx.cs" Inherits="Web.Controls.WebFoot" %>
<div class="top">
    <a href="../Default.aspx">首页</a> &nbsp;|&nbsp; <a href="../NewsList.aspx?ntid=7">关于我们</a>
    &nbsp;|&nbsp; <a href="../NewsList.aspx?ntid=6">帮助中心</a> &nbsp;|&nbsp; <a href="../NewsList.aspx?ntid=8">
        资料下载</a>
</div>
<div class="main">
    <div class="bquan_left">
        主办：<asp:Label ID="lblHost" runat="server"></asp:Label><%= Application["AllTitle"]%>&nbsp;&nbsp;
        版权所有 地址：<asp:Label ID="lblAdd" runat="server"></asp:Label>&nbsp;&nbsp; 电话：<asp:Label
            ID="lblTel" runat="server"></asp:Label><br />
        备案号：<asp:Label ID="lblFiling" runat="server"></asp:Label>&nbsp;&nbsp;<a href="javascript:void(0);"
            onclick="window.open('../Super/Default.aspx');">管理登陆</a>&nbsp;&nbsp;您是本网站第&nbsp;&nbsp;<asp:Label
                ID="lblNumber" runat="server" BackColor="Yellow" ForeColor="Red"></asp:Label>&nbsp;&nbsp;位访问者
    </div>
    <div class="bquan_right">
        <ul>
            <li class="ewm">二维码</li>
           
            <li class="wx">微信号</li>
        </ul>
    </div>
</div>
