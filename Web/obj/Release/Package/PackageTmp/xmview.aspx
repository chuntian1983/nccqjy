<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="xmview.aspx.cs" Inherits="Web.xmview" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="list_wz top">
        位置：<a href="../Default.aspx">首页</a> >> 项目公告 >
    </div>
    <div class="list top">
         <h1 class="list_c_h1">
        <span id="lblTitle" runat="server"></span>
             </h1>
       
        <div class="list_c_fz">
            项目名称：<span id="lblBidName" runat="server"></span> 时间：<span id="lblReleaseTime" runat="server"></span></div>
        <div class="list_content">
            <span id="lblBidPlacardContent" runat="server"></span>
        </div>
    </div>
</asp:Content>
