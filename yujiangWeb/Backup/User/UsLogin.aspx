<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="UsLogin.aspx.cs" Inherits="Web.User.UsLogin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <script src="../super/Scripts/easyUI/jquery.min.js" type="text/javascript" language="javascript"></script>
    <script src="../Scripts/UsLogin.js" type="text/javascript" language="javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div id="divload" style="display: none; position: absolute; top: 0%; left: 0%; width: 100%;
        height: 100%; background-color: #F6F6F6; z-index: 1001; -moz-opacity: 0.8; opacity: 0.8;
        filter: alpha(opacity=80);">
        <div style="height: 30px; top: 50%; right: 40%; position: absolute; padding: 0px;
            margin: 0px; z-index: 999; border-color: #94BEE7; border-style: solid; border-width: 2px;">
            <img src="../Super/Images/loading.gif" alt="正在加载" align="middle" /><span style="font-size: 12pt;">正在加载数据，请稍后......</span>
        </div>
    </div>
    <div class="wz">
        位置：<a href="../Default.aspx">首页</a> >>用户登录
    </div>
    <div class="zhuce1">
        <div class="zhuce zhuce3">
            <h2>
                用户登陆</h2>
            <ul>
                <li class="zc1">用户名：</li>
                <li class="zc2">
                    <input type="text" id="txtLoginName" name="LoginName" /></li>
            </ul>
            <ul>
                <li class="zc1">密 码：</li>
                <li class="zc2">
                    <input type="password" id="txtLoginPass" name="LoginPass" /></li>
            </ul>
            <ul>
                <li class="zc1">验证码：</li>
                <li class="zc2">
                    <input type="text" id="txtCheckImg" name="CheckImg" style="width: 80px;" />&nbsp;&nbsp;<img
                        width="77" id="imgcheck" src="../Controls/ValidateCode.aspx" title="看不清，请点击！"
                        alt="看不清，请点击！" onclick="this.src = '../Controls/ValidateCode.aspx?flag=' + Math.random();document.getElementById('txtCheckImg').value='';"
                        border="0" align="middle" /></li>
            </ul>
            <ul>
                <li class="zc1">&nbsp;</li>
                <li class="zc2">
                    <input type="button" id="btnLogin" onclick="onSubmitClick();" class="tijiao" value="登 录" /></li>
            </ul>
        </div>
        <div class="zhuceright">
            <a href="UsReg.aspx">免费注册</a>
        </div>
    </div>
</asp:Content>
