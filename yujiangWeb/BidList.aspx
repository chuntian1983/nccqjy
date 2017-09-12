<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="BidList.aspx.cs" Inherits="Web.BidList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link type="text/css" href="Styles/pagination.css" rel="stylesheet" />
    <script src="Scripts/jquery.pagination.js" type="text/javascript" language="javascript"></script>
    <script src="Scripts/BidList.js" type="text/javascript" language="javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div id="showLoad" style="display: none; position: absolute; top: 0%; left: 0%; width: 100%;
        height: 100%; background-color: #F6F6F6; z-index: 1001; -moz-opacity: 0.8; opacity: 0.8;
        filter: alpha(opacity=80);">
        <div style="top: 50%; right: 40%; position: absolute; padding: 0px; margin: 0px;
            z-index: 999; border-color: #94BEE7; border-style: solid; border-width: 2px;">
            <img src="Images/ajax_loading.gif" alt="正在加载" align="middle" /><span style="color: Red;
                font-size: 16px; font-weight: bold;">正在加载数据中。。。。。。</span>
        </div>
    </div>
    <div class="tz wz">
        位置：<a href="../Default.aspx">首页</a> >> 交易项目
    </div>
    <div class="list">
        <div class="guapai_list_c1 clearfix">
            <ul>
                <li>项目编号</li>
                <li>标的名称</li>
                <li>项目类型</li>
                <li>挂牌时间</li>
                <li>价格公告</li>
                <li>截止时间</li>
            </ul>
            <span id="lblBidList"></span>
        </div>
    <div>
        <div id="Pagination" class="flickr">
        </div>
    </div>
    </div>
</asp:Content>
