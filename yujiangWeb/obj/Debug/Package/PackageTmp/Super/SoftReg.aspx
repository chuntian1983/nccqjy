<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SoftReg.aspx.cs" Inherits="Web.Super.SoftReg" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head id="Head1" runat="server">
    <title>软件注册</title>
    <script src="Scripts/easyUI/jquery.min.js" type="text/javascript" language="javascript"></script>
    <script src="Scripts/SoftReg.js" type="text/javascript" language="javascript"></script>
    <style type="text/css">
        #login_div
        {
            width: 100%;
            height: 420px;
            margin: 10% auto;
            background-image: url(../super/images/login_bg.jpg);
            background-repeat: repeat-x;
            text-align: center;
        }
    </style>
</head>
<body style="background-color: #018edd;" scroll="no">
    <noscript>
        <iframe scr="*.htm"></iframe>
    </noscript>
    <div id="login_div">
        <br />
        <div style="padding-left: 20%; text-align: left;">
            <fieldset style="width: 700px; font-size: 15px; font-family: 黑体;">
                <legend><strong>&nbsp;&nbsp;软件注册电话&nbsp;&nbsp;</strong></legend>
                <p style="line-height: 150%;">
                    &nbsp;&nbsp;&nbsp;欢迎您成为我公司的正式软件用户！请将您的软件序列号通告我公司客户服务中心（工作日）进行备案登记，索取软件注册号，进行登记确认，已确保我公司能够向您提供及时的售后服务以及软件升级服务。
                </p>
                <p>
                    &nbsp;&nbsp;&nbsp;注册电话：0631 — 5626001 / 5626002
                </p>
                <p>
                    &nbsp;&nbsp;&nbsp;注册时间：上午8:00至下午17:30（周一至周五）<br />
                    <br />
                </p>
            </fieldset>
            <br />
            <fieldset style="width: 700px; font-size: 15px; font-family: 黑体; text-align: center;">
                <legend><strong>&nbsp;&nbsp;软件注册信息&nbsp;&nbsp;</strong></legend>
                <p>
                </p>
                序列号：<input type="text" id="txtSerialNumber" style="width: 600px;" />
                <br />
                <br />
                注册号：<input type="text" id="txtRegistration" style="width: 600px" />
                <br />
                <br />
                <input type="button" value=" 注 册 " id="btnReg" />
            </fieldset>
        </div>
    </div>
</body>
</html>
