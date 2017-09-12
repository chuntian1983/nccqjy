<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="NewsDetails.aspx.cs" Inherits="Web.NewsDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="wz">
        位置：<a href="Default.aspx">首页</a> >> <span id="lbl_Details_NewsTypeName" runat="server">
        </span>>> <span id="lbl_Details_NewsTitleName" runat="server"></span>
    </div>
    <div class="list">
        <h1 class="list_c_h1" id="lbl_Details_NewsTitle" runat="server">
        </h1>
        <div class="list_c_fz">
            流量：<span id="lbl_Details_NumClicks" runat="server"></span> 时间:<span id="lbl_Details_CreateDate"
                runat="server"></span> 来源：<span id="lbl_Details_NewsSource" runat="server"></span></div>
        <div class="list_content">
            <p>
                <img id="img_Details_NewsImg" runat="server" alt=""/></p>
            <span id="lbl_Details_NewsContent" runat="server"></span>
        </div>
    </div>
</asp:Content>
